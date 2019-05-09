---
title: "【投手指標】プロ野球個人成績からセイバーメトリクス投手指標を算出する②"
date: 2019-05-09T10:19:58+09:00
draft: false
comments: true
categories: ["野球"]
tags: ["投手指標", "Python", "セイバーメトリクス", "リーグ合計成績"]
---

リーグ合計成績を算出して、投手指標FIPを算出してみる。

<!--more-->

---

{{< ad/a8/skyperfect>}}

---

{{< ad/con/wide/purosupi2019>}}

---

- [[参考記事]Pythonでプロ野球の個人成績一覧をJSONにして取得する](https://www.ted027.com/post/python-personal-records)

- [[参考記事]【投手指標】プロ野球個人成績からセイバーメトリクス投手指標を算出する①](https://www.ted027.com/post/sabr-1)

- [[参考記事]【打者総合指標-2】プロ野球個人成績からセイバーメトリクス打者指標を算出する④](https://www.ted027.com/post/sabr-5)

---

### リーグ合計成績との比較

セイバーメトリクスの指標には、リーグ平均成績との差を利用して算出するものがいくつか存在する。

利点としては、一番は投高/打高といった傾向に左右されにくいことが考えられる。

また指標によっては、「この選手にはこれだけの価値がある」よりも、「この選手には、リーグ平均と比べてこれだけの価値がある」の方が、数値の持つ意味がわかりやすいという側面もあるかもしれない。

---

### DIPSという概念

今回追加する指標`FIP`のことを書く前に、少しだけ`DIPS`という考え方に触れる。

`DIPS (Defense Independent Pitching Statistics)`とは、明らかに投手の責任が明確な項目だけで投手の実力を評価しよう、という考え方。

- 勝利、敗戦
    - 援護やリリーフ次第で左右される
- 被安打、自責点
    - 味方の守備力に左右される

上に上げたような項目は無視 or リーグ平均を使う。

1つ目はともかく、2つ目はかなり刺激的な考え方。これは、「守備力に左右されるから無意味」ではなく「どこまでが守備の責任か算出が難しい、それなら無視したほうがまし」くらいの考え方みたい。

では何をもって投手を評価するのかというと、

- 被本塁打
- 与四死球（故意四球を除く）
- 奪三振
- ゴロアウト割合/フライアウト割合

当然、被本塁打と与四球死はペナルティ、奪三振は報酬となる。

ゴロアウト割合/フライアウト割合を利用した指標もあるが、このあたりの数値を取るのは難しい。

今回は、上3つの項目だけで算出できる`FIP`を計算してみます。

---

### 追加する指標

#### FIP (Fielding Independent Pitching)

- 擬似的な防御率
- 長期（例えば通算）でみれば防御率とFIPは近い値になるといわれている
- リーグ平均防御率のうち、被本塁打、与四死球、奪三振で構成される(と思われる)部分だけ個人の数値に置き換える

`被本塁打、与四死球、奪三振で構成される(と思われる)部分`

この部分をEFIRA(Earned Fielding Independent Run Average)とする（正式名称は知りません、今僕が名付けました）。

年ごとの振れ幅が小さく、翌年の防御率の予測に使われることもあるとのこと。

##### 計算式

$リーグ平均防御率 - リーグ平均EFIRA + EFIRA$

$EFIRA = (3 * (与四球 + 与死球 - 故意四球)\\\\\\ + 13 * 被本塁打 - 2 * 奪三振)\\\\\ / 投球回
$

---

### 実装

#### リーグ合計成績の算出

とりあえず、成績取得のところで所属リーグも追加することにした。

チームから判断してもいいが、いちいちそのロジックを挟むのが面倒なので。

```py:records.py
...
if team in CENTRAL_LIST:
        league = 'Central'
    elif team in PACIFIC_LIST:
        league = 'Pacific'
    else:
        raise BaseException('String of Team Name is invalid.')
    return {'Name': name, 'Team': team, 'League': league}
...
```

次に、個人成績からリーグ合計成績を算出する。

listを走査し、dictを走査し、同じ項目を足し合わせる。

```py:league.py
import json
from decimal import Decimal

def sum_deep_dict(league_dic, player):
    for key, value in player.items():
        if isinstance(value, dict):
            league_dic[key] = league_dic.get(key, {})
            sum_deep_dict(league_dic[key], value)
        else:
            decimal_league_value = Decimal(league_dic.get(
                key, '0')) + Decimal(value)
            league_dic[key] = str(decimal_league_value)


def sum_league_records(player_list):
    league_player_dic = {'Central': {}, 'Pacific': {}}
    for player in player_list:
        league_dic = league_player_dic[player['League']]
        sum_deep_dict(league_dic, player)
    return league_player_dic


def write_league_records():
    with open('pitchers.json', 'r') as pf:
        pitcher_list = json.load(pf)['Pitcher']

    with open('hitters.json', 'r') as hf:
        hitter_list = json.load(hf)['Hitter']

    league_pitcher_dic = sum_league_records(pitcher_list)
    league_hitter_dic = sum_league_records(hitter_list)

    with open('league_pitchers.json', 'w') as pf:
        json.dump(league_pitcher_dic, pf, indent=2, ensure_ascii=False)

    with open('league_hitters.json', 'w') as hf:
        json.dump(league_hitter_dic, hf, indent=2, ensure_ascii=False)
```

打率や防御率のような割合指標は、当然足し合わせると意味不明な値になるので、後から計算して更新。

```py:league.py
...
from common import digits_under_one, return_outcounts, FULL_OUTCOUNTS, ZERO_VALUE, IGNORE_VALUE

def fix_rate_common(dic, decimal_nume, decimal_deno):
    if not decimal_deno:
        return ZERO_VALUE
    return decimal_nume / decimal_deno


def fix_rate_records(dic):
    for key, value in dic.items():
        if isinstance(value, dict):
            fix_rate_records(value)
        elif key == '打率':
            fix_value = fix_rate_common(dic, Decimal(dic['安打']),
                                        Decimal(dic['打数']))
            dic[key] = str(digit_under_one(fix_value, 3))
        ...

def sum_league_records(player_list):
    league_player_dic = {'Central': {}, 'Pacific': {}}
    for player in player_list:
        league_dic = league_player_dic[player['League']]
        sum_deep_dict(league_dic, player)
    fix_rate_records(league_player_dic)
    return league_player_dic
...
```

ついでに、セイバー計算部分と共通で使う関数やらは`common.py`に移植しました。

---

#### FIPの算出

個人成績のdictと、リーグ合計成績のdictを使って算出する。

```py:sabr.py
def _fip_efira(pitcher):
    innings = Decimal(pitcher['投球回'])
    outcounts = return_outcounts(innings)
    if not outcounts:
        fip_efira = ZERO_VALUE
    else:
        fip_efira = (Decimal('13') * Decimal(pitcher['被本塁打']) + Decimal('3') *
                    (Decimal(pitcher['与四球']) + Decimal(pitcher['与死球']) -
                     Decimal(pitcher['故意四球'])) -
                    Decimal('2') * Decimal(pitcher['奪三振'])) * 3 / outcounts
    return fip_efira


def fip(pitcher, league):
    pit_fip = _fip_efira(pitcher)
    lg_fip = _fip_efira(league)
    raw_fip = pit_fip + Decimal(league['防御率']) - lg_fip
    fip = digits_under_one(raw_fip, 2)
    pitcher['FIP'] = fip
```

---

### おわり

他のDIPS系指標を出そうとすると、フライボール数やフェアフライ、ファールフライ、ライナーなんかの値が必要になってくる。

気が遠くなりそう。

---

{{< ad/con/wide/sabr>}}

---

{{< ad/a8/skyperfect>}}

---