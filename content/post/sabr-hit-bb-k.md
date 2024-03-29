---
title: "【BB/K, BB%, IsoD】NPB(2019)セイバーメトリクス野手指標の算出③"
date: 2019-05-06T14:38:38+09:00
draft: false
comments: true
categories: ["野球"]
tags: ["野手指標", "Python", "セイバーメトリクス", "選球眼"]
---

打者の選球眼を表すとされるBB/K, BB%, IsoDを追加。

<!--more-->

---

{{< ad/moshimo/skyperfect >}}

---

{{< ad/con/wide/pawapuro2022_ps4 >}}

---

### 追加する指標

`四球を選ぶ能力はプレート・ディシプリン（plate discipline：打席自制心）」「三振数と四球数のバランスを保つ能力はストライクゾーン管理能力」であると見なしており...`

(Aaron Gleeman/Wikipediaより引用)

#### BB/K

- ストライクゾーン管理能力

$\frac{四球}{三振}$

---

#### BB% (Walk rate)

- 打席自制心
- 選球眼が良い選手が高くなる傾向
- 早打ちの選手は低くなる傾向
- 長打力も関係するため、必ずしも選球眼と比例するわけではない

$\frac{四球}{打席}$

---

#### K% (K rate)

- ミート力 + 選球眼
- 早打ちの選手は低くなる傾向

$\frac{三振}{打席}$

---

#### IsoD (Isolated Discipline)

- 打席自制心
- 四死球だけでどの程度出塁したか
- 考え方としては[`IsoP`(長打力)](https://www.ted027.com/post/sabr-hit-isop#isop-iso-isolated-power)と同じ
- 故意四球や死球も含むため、`BB%`の下位互換との声も

$出塁率 - 打率$

---

### 実装

```py:sabr.py
def bb_per_k(hitter):
    bb = Decimal(hitter['四球'])
    k = Decimal(hitter['三振'])
    if not bb:
        return '0'
    elif not k:
        return '99.99'
    bb_per_k = bb / k
    return str(bb_per_k)


def bb_percent(hitter):
    apperance = Decimal(hitter['打席'])
    if not apperance:
        return '0'
    bb_percent = Decimal(hitter['四球']) / apperance
    return str(bb_percent)


def k_percent(hitter):
    apperance = Decimal(hitter['打席'])
    if not apperance:
        return '0'
    k_percent = Decimal(hitter['三振']) / apperance
    return str(k_percent)


def iso_d(hitter):
    iso_d = Decimal(hitter['出塁率']) - Decimal(hitter['打率'])
    return str(iso_d)
```

---

### おわり

本当はゾーンスイング率、ボールスイング率、`P/PA`(打席あたり投球数)なんかも出せるといいんですが、データを取るのが大変。

---

- [[参考記事]Pythonでプロ野球の個人成績一覧をJSONにして取得する](https://www.ted027.com/post/python-personal-records)

- [[参考記事]【IsoP】NPB(2019)セイバーメトリクス野手指標の算出②](https://www.ted027.com/post/sabr-hit-isop)

- [[参考記事]【RC, RC27, XR, XR27】NPB(2019)セイバーメトリクス野手指標の算出④](https://www.ted027.com/post/sabr-hit-rc)

---

{{< ad/con/wide/sabr_omata >}}

---

{{< ad/a8/dazn >}}

---
