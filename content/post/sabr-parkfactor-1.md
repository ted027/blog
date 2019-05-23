---
title: "【前半】パークファクターの算出で大いに躓く①"
date: 2019-05-22T11:46:00+09:00
draft: false
comments: true
categories: ["野球"]
tags: ["Python", "セイバーメトリクス", "パークファクター"]
---

「東京ドームは本塁打が出やすい」「ナゴヤドームは点が入りにくい」を数値化したものがパークファクター。

<!--more-->

---

{{< ad/a8/techacademy>}}

---

{{< ad/con/wide/pawapuro_switch>}}

---

絶妙なデータ不足などに悩まされた末、かなりの妥協込みではあるものの、Pythonで参考値が算出できた。

---

### 追加する指標

#### パークファクター (Park Factor)

ある球場を本拠地とするチームが、本拠地で一試合あたりに「打った+打たれた」〇〇の数が、本拠地以外で一試合あたりに「打った+打たれた」〇〇の数の何倍であるかを計算したもの。

調べる前は、チーム関係なく該当球場での成績と、該当でない球場での成績を比較するものだと思っていた。しかしそれでは、チーム打撃力の差が影響を与えてしまう。

---

#### 得点パークファクター

上でも書いたように、ある球場のパークファクターを算出する際は、その球場を本拠地とするチームの成績を用います。

東京ドームのパークファクターであれば、巨人の東京ドームでの成績、及び東京ドーム以外での成績、を用いて計算します。（ホームでの成績、ビジターでの成績ではない）

$\frac{本拠地での得点 + 失点 \div 本拠地での試合数}{本拠地以外での得点 + 失点 \div 本拠地以外での試合数}$

---

#### 本塁打パークファクター

$\frac{本拠地での本塁打 + 被本塁打 \div 本拠地での試合数}{本拠地以外での本塁打 + 被本塁打 \div 本拠地以外での試合数}$

---

### 実装で躓く

#### 問題

各人の球場ごとでの打撃成績は取得できたのでさほど困らないかと思っていたものの、実装するうちに「チームの球場ごとの試合数」が分からないことに思い至り困惑。ホーム/ビジターの試合数は分かるけど、例えば新潟や長野といったでの試合数も含むことになってしまう。

#### 妥協

結局、取れないものは仕方ないので、

`そのチームで一番試合に出ている人の球場ごとの出場試合数を、そのチームの球場ごとの試合数とみなす`

で妥協することに。つまり、全試合出場している選手がチームに一人でもいれば問題ないものの、一人もいないチームがあった場合、パークファクターの計算に微妙なズレが生じることになります。

---

### 実装

```py
TEAM_LIST = [
    '西武', 'ソフトバンク', '日本ハム', 'オリックス', 'ロッテ', '楽天', '広島', '読売', 'ヤクルト', 'ＤｅＮＡ',
    '中日', '阪神'
]

PARK_LIST = [
    "メットライフ", "ヤフオクドーム", "札幌ドーム", "京セラＤ大阪", "ＺＯＺＯマリン", "楽天生命パーク", "マツダスタジアム",
    "神宮", "東京ドーム", "横浜", "ナゴヤドーム", "甲子園"
]

HOME_DIC = dict(zip(TEAM_LIST, PARK_LIST))

def sum_park_dick(team_park_dic, player_park_dic):
    for key, value in player_park_dic.items():
        if isinstance(value, dict):
            team_park_dic[key] = team_park_dic.get(key, {})
            sum_park_dick(team_park_dic[key], value)
        else:
            decimal_team_value = Decimal(team_park_dic.get(
                key, '0')) + Decimal(value)
            team_park_dic[key] = str(decimal_team_value)


def sum_visitor_park_dick(sum_visitor_dic, team_parks_dic, team):
    for key, value in team_parks_dic.items():
        if key == HOME_DIC[team]:
            continue
        elif isinstance(value, dict):
            sum_visitor_park_dick(sum_visitor_dic, value, team)
        else:
            sum_visitor_dic[key] = sum_visitor_dic.get(key, '0')
            decimal_visitor_value = Decimal(
                sum_visitor_dic[key]) + Decimal(value)
            sum_visitor_dic[key] = str(decimal_visitor_value)


def update_team_park_records():
    ...
    park_dic = {}
    for pitcher in pitcher_list:
        if not pitcher.get('球場', 0):
            continue
        team = pitcher['Team']
        park_dic[team] = park_dic.get(team, {})
        sum_park_dick(park_dic[team], pitcher['球場'])

    def tmp_regular_dic(regular_dic, team, hitter):
        regular_dic[team] = regular_dic.get(team, {})
        regular_dic[team]['試合'] = regular_dic[team].get('試合', '0')
        if Decimal(hitter['試合']) > Decimal(regular_dic[team]['試合']):
            regular_dic[team]['試合'] = hitter['試合']
            regular_dic[team]['球場'] = regular_dic[team].get('球場', {})
            for key, value in hitter['球場'].items():
                regular_dic[team]['球場'][key] = {'試合': value['試合']}

    regular_dic = {}
    for hitter in hitter_list:
        if not hitter.get('球場', 0):
            continue
        team = hitter['Team']
        park_dic[team] = park_dic.get(team, {})
        sum_park_dick(park_dic[team], hitter['球場'])

        tmp_regular_dic(regular_dic, team, hitter)

    for team in TEAM_LIST:
        for key, value in regular_dic[team]['球場'].items():
            park_dic[team][key]['試合'] = value['試合']

    for team_dic in team_list:
        team = team_dic['チーム']
        team_dic['本拠地'] = park_dic[team][HOME_DIC[team]]
        sum_visitor_dic = {}
        sum_visitor_park_dick(sum_visitor_dic, park_dic[team], team)
        team_dic['非本拠地'] = sum_visitor_dic

        fix_rate_records(team_dic)
```

とりあえずこれで、regular_dicにチーム一出場している選手の球場ごと試合出場数を格納し、team_dicにチームの球場ごと試合数と成績を格納することができた。

ちなみに`fix_rate_records`は、[【FIP】NPB(2019)セイバーメトリクス投手指標の算出②](https://www.ted027.com/post/sabr-pitch-fip)でちょっと書いた関数で、単純な足し算でおかしくなった打率や防御率といった割合系成績の値を計算し直すもの。

あとは…せめてもの慰めとして、チーム一出場している選手の試合数とチーム試合数が異なる場合に
Warningを出すくらいの処理は入れようかと思う。いつか。

[【後半】パークファクターの算出で大いに躓く②](https://www.ted027.com/post/sabr-parkfactor-2)へ続く。

---

{{< ad/con/wide/python_analytics>}}

---

{{< ad/a8/dazn>}}

---
