---
title: "BABIPは本当に運を表す指標なのか？"
date: 2019-05-14T17:24:52+09:00
draft: false
comments: true
categories: ["野球"]
tags: ["Python", "セイバーメトリクス", "BABIP"]
---

<!--more-->

---

{{< ad/a8/skyperfect>}}

---

{{< ad/con/wide/pawapuro2018>}}

---

### BABIP (Batting Average on Balls In Play)

`BABIP`は、フェアグラウンド内に飛んだ打球が安打になる確率を表す指標。

$\frac{安打 - 本塁打}{打数 - 奪三振 - 本塁打 + 犠飛}$

他の指標が選手の実力を表すために用いられるのに対し、この指標はしばしば、選手の実力でないことを示すために用いられる。

具体的には、選手が頭角を現した際、その活躍が幸運のためであるかどうか。「`BABIP`は.300程度に収束する」といわれており、すなわち、これを大きく上回る場合、この選手は幸運のために多くのヒットを打っている、ということになる。

とはいえ、`BABIP`は運が全てではないことも明言されている。

---

### BABIPの収束を阻害する要因

本当に`BABIP`が.300に収束するものなら、明確に幸運をはかる指標になる。

しかし、以下に挙げるような要因が収束を阻害する要因となる。

#### 走力

一塁に到達するスピードが速ければ、フェアグラウンド内打球の安打率は上がる。

#### 守備力

当然、守っているチームの守備力が高ければ、フェアグラウンド内に飛んだ打球をアウトにする確率は高くなり、`BABIP`は低くなる。ある意味投手の幸運かもしれないが。

#### 守備シフト

打球方向に偏りのある打者の場合、シフトを敷くことで`BABIP`を低く抑えることができる。

#### フライ率、ゴロ率

一般的にフライのほうがゴロよりもアウトになりやすいといわれている。そのため、フライ率の多い選手は`BABIP`が低くなりやすい。

ただし、統計的には、フライボールのうち本塁打になる割合もある一定の範囲に収束するという考え方もある（フライボール・レボリューション）。`BABIP`に本塁打は含まれないため、フライ率が高く`BABIP`が低い投手が、必ずしもよいとは限らない。

---

### 総じて

投手の`BABIP`は、長期的には.300程度に収束することが多いようだ。とはいえ、値が.300から乖離したとしても運は一要素に過ぎず、投手の能力や上記要素も加味して考える必要がある。

打者の`BABIP`は、走力や打球傾向といったものは選手特有の性質であるため、決まった値に収束するものではない。よって他者との比較にあまり意味はないが、その選手の例年の値と大きく乖離する場合、特徴の変化や相手の対策、もしくは幸運/不運が要因であると考えられる。

---

### 実装

例によって、以下の記事で取得した個人成績から算出する。

ただし、投手の被犠飛数が取得できなかったため、今回は無視して算出している。

```py:sabr.py
def babip(pitcher):
    # denominator = Decimal(pitcher['被打数']) - Decimal(pitcher['奪三振']) - Decimal(
    #     pitcher['被本塁打']) + Decimal(pitcher['犠飛'])
    denominator = Decimal(pitcher['被打数']) - Decimal(pitcher['奪三振']) - Decimal(
        pitcher['被本塁打'])
    if not denominator:
        babip = Decimal('0')
    else:
        numerator = Decimal(pitcher['被安打']) - Decimal(pitcher['被本塁打'])
        raw_babip = numerator / denominator
        babip = digits_under_one(raw_babip, 3)
    return str(babip)


def babip(hitter):
    denominator = Decimal(hitter['打数']) - Decimal(hitter['三振']) - Decimal(
        hitter['本塁打']) + Decimal(hitter['犠飛'])
    if not denominator:
        babip = Decimal('0')
    else:
        numerator = Decimal(hitter['安打']) - Decimal(hitter['本塁打'])
        raw_babip = numerator / denominator
        babip = digits_under_one(raw_babip, 3)
    return str(babip)
```

---

### おわり

フェアグラウンド内に飛んだらあとは運（が絡むから無視）、という考え方が`BABIP`や[`DIPS`](https://www.ted027.com/post/sabr-pitch-fip#dipsという概念)に通じている。

自分がプレイヤーだったら複雑だろうけど、統計学的に見たらそうなんだろうな、とも思う。

---

{{< ad/con/wide/sabr_omata>}}

---

{{< ad/afb/codecamp>}}

---
