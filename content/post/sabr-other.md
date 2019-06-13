---
title: "ワンナウツ契約年俸、小松式ドネーション、アダム・ダン率の算出"
date: 2019-06-13T08:24:43+09:00
draft: true
comments: true
toc: true
categories: ["野球"]
tags: ["ネタ指標", "Python"]
---

<!--more-->

---

{{< ad/ >}}

---

成績表で野手の`BABIP`をどう扱うか迷い、結局「その他」の表に入れておくことにした。

とはいえ、項目一つでは寂しいので、この機会に変な指標をいくつか計算し、一緒に出しておくことに。

---

### ワンナウツ契約年俸

LIER GAMEでも知られる〇〇さんの漫画「ONE OUTS」が元ネタ。アニメ化もされたので知っている方は多いかと思います。

沖縄で一打席勝負の賭け野球「ONE OUTS」で無敗の名投手・渡久地東亜が、極悪オーナー率いる埼玉リカオンズと

`アウト1つでプラス500万、失点1でマイナス5000万`

の契約を結び、知恵と技術で相手打者やオーナーをキリキリ舞いに…というストーリー。

巨人の投手陣で起きた例の事件後だったらアニメ化厳しかったですかね。

一番の魅力は、野球作品ならではの特徴的な対戦相手に加え、「オーナーも敵」な点でしょうか。オーナーの鶴の一声により失点しそうな場面で渡久地が登板、そこを切り抜け出し抜いてオーナーをギャフンと言わせる様はまさに「ライアーゲーム」です。

#### 計算式

$投球回 \div 3 \times 500 - 失点 \times 5000$

野手に対しては、途中の展開から一部味方野手に対して適用された

`アウト3つでマイナス5000万、打点1でプラス5000万`

から算出。ただしアウト÷3の余りは無視する。

$打点 \times 5000 -\\\\\\ (打数 - 安打 + 盗塁死 + 併殺) \div 3 \times 5000$

#### 実装

```py
def one_outs_p(pitcher):
    raw_oo = Decimal(pitcher['アウト']) * Decimal('500') - Decimal(pitcher['失点']) * Decimal('5000')
    oo = digits_under_one(raw_oo, 0)
    return str(oo)

def one_outs_h(hitter):
    outs = Decimal(hitter['打数']) - Decimal(hitter['安打']) + Decimal(
        hitter['盗塁死']) + Decimal(hitter['併殺打'])
    outs_per_3 = int(outs / 3)
    raw_oo = Decimal(
        hitter['打点']) * Decimal('5000') - Decimal(outs_per_3) * Decimal('5000')
    oo = digits_under_one(raw_oo, 0)
    return str(oo)
```

---

### 小松式ドネーション金額

元オリックスの小松聖投手が、

`1アウト1,000円、1勝利/ホールド/セーブにつき10,000円、優勝/日本一/タイトル獲得で100,000円`

を動物保護団体へ寄付していたことが元ネタ。

小松投手の起用が流動的だったこともあって設定された計算方法が「簡単な計算の割にそこそこ納得いく形で先発・リリーフ投手を同列に評価できる」と一部で話題に。

`なお、（中略）ほかの投手がどれだけのドネーション金額をたたき出しても、実際にドネーションして犬を救っていたのは小松だけであったことを忘れてはならない。`

([ニコニコ大百科](https://dic.nicovideo.jp/a/%E5%B0%8F%E6%9D%BE%E5%BC%8F%E3%83%89%E3%83%8D%E3%83%BC%E3%82%B7%E3%83%A7%E3%83%B3)より)

#### 計算式

$KD = 投球回 \times 3 + (勝利 + ホールド + セーブ) \times 10$
$ドネーション金額 = KD \times 1000$

指標として使うときは、優勝/日本一/タイトル獲得の分は無視するのが一般的（そもそもこの指標が一般的ではないが）。

#### 実装

```py
def komatsu(pitcher):
    kd_point = Decimal(pitcher['アウト']) + (Decimal(pitcher['勝利']) + Decimal(
        pitcher['ホールド']) + Decimal(pitcher['セーブ'])) * Decimal('10')
    raw_kd = kd_point * Decimal('1000')
    kd = digits_under_one(raw_kd, 0)
    return str(kd)
```

---

### アダム・ダン率

MLBで活躍したアダム・ダン選手が「三振・四球・本塁打が多い」ことから生まれたネタ指標で、「三振・四球・本塁打の割合」を表す。

ちなみにただのネタ指標というだけではなく、TTO(Three True Outcomes)率というれっきとした指標がある。

Three True Outcomesは三振・四球・本塁打のことを表す。投手と打者の間で完結するこれらの結果は、セイバーメトリクス上、運に左右されず実力を強く反映する結果と考えられている。

TTO率が高いから優秀というわけではないが、これが高い選手は翌年以降の成績も安定すると想定でき、選手獲得の参考に使われている。

#### 計算式

$(三振 + 四球 + 本塁打) \div 打席$

#### 実装

```py
def dan_percent(hitter):
    if not Decimal(hitter['打席']):
        return '0.0'
    raw_dan_percent = (Decimal(hitter['本塁打']) + Decimal(hitter['三振']) +
                       Decimal(hitter['四球'])) / Decimal(
                           hitter['打席']) * Decimal('100')
    dan_percent = digits_under_one(raw_dan_percent, 1)
    return str(dan_percent)
```

---

### 結果

計算して、成績表に表示するようにした。

- [プロ野球成績表 - 行けたら行く](https://www.ted027.com/records/)

この記事を書いた6/13時点では以下のような感じ。

---

{{< ad/ >}}

---
