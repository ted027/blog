---
title: "【選球眼:BB/K,BB%,IsoD】NPB個人成績からセイバーメトリクス打者指標を算出する③"
date: 2019-05-06T14:38:38+09:00
draft: false
comments: true
categories: ["野球"]
tags: ["打者指標", "Python", "セイバーメトリクス", "選球眼"]
---

打者の選球眼を表すとされるBB/K, BB%, IsoDを追加。

<!--more-->

---

{{< ad/a8/skyperfect>}}

---

{{< ad/con/wide/pawapuro2018>}}

---

- [[参考記事]Pythonでプロ野球の個人成績一覧をJSONにして取得する](https://www.ted027.com/post/python-personal-records)

- [[参考記事]【長打力】プロ野球個人成績からセイバーメトリクス打者指標を算出する②](https://www.ted027.com/post/sabr-3)

- [[参考記事]【打者総合指標-2】プロ野球個人成績からセイバーメトリクス打者指標を算出する④](https://www.ted027.com/post/sabr-5)

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
- 長打力も関係するため、必ずしも選球眼と比例するわけではない

$\frac{四球}{打数}$

---

#### IsoD (Isolated Discipline)

- 打席自制心
- 四死球だけでどの程度出塁したか
- 考え方としては[`IsoP`(長打力)](https://www.ted027.com/post/sabr-3)と同じ
- 選球眼の評価指標としては、`BB%`のほうが主流らしい

$出塁率 - 打率$

---

### 実装

```py:sabr.py
def bb_per_k(hitter):
    k = Decimal(hitter['三振'])
    if not k:
        bb_per_k = Decimal('0')
    else:
        raw_bb_per_k = Decimal(hitter['四球']) / k
        bb_per_k = _digits_under_one(raw_bb_per_k, 2)
    hitter['BB/K'] = str(bb_per_k)


def bb_percent(hitter):
    apperance = Decimal(hitter['打席'])
    if not apperance:
        bb_percent = Decimal('0')
    else:
        raw_bb_percent = Decimal(hitter['四球']) / apperance
        bb_percent = _digits_under_one(raw_bb_percent, 3)
    hitter['BB%'] = str(bb_percent)


def iso_d(hitter):
    iso_d = Decimal(hitter['出塁率']) - Decimal(hitter['打率'])
    hitter['IsoD'] = str(iso_d)
```

---

### おわり

本当はゾーンスイング率、ボールスイング率、`P/PA`(打席あたり投球数)なんかも出せるといいんですが、データを取るのが大変。

---

{{< ad/con/wide/sabr_omata>}}

---

{{< ad/a8/dazn>}}

---
