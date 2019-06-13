---
title: "【OPS+】NPB(2019)セイバーメトリクス野手指標の算出⑧"
date: 2019-06-13T18:15:39+09:00
draft: false
comments: true
toc: true
categories: ["野球"]
tags: ["野手指標", "Python", "セイバーメトリクス", "得点能力"]
---

リーグ平均と比較したOPSにパークファクター補正を加えたOPS+を算出する。

<!--more-->

---

{{< ad/a8/dazn >}}

---

{{< ad/con/wide/sabr >}}

---

`OPS+`は、平均的打者が100とし、それと比べて何%の得点応力を持つかを表す。

- [[参考記事]【wRC+】NPB(2019)セイバーメトリクス野手指標の算出⑦](https://www.ted027.com/post/sabr-hit-wrc-plus)

---

### 追加する指標

#### OPS+ (On-base Plus Slugging Plus)

- 得点力の傑出度（パーセント）、平均的打者が100

#### 計算式

$A \div 補正係数 \times 100$

$A = \frac{出塁率}{リーグ出塁率} + \frac{長打率}{リーグ長打率} - 1$

補正係数の算出は以下の記事に記載。

- [「パークファクター補正をかけた○○」の算出](https://www.ted027.com/post/sabr-parkfactor-correct)

---

### 実装

```py
def correct_pf(hitter, pf_list):
    correct_pf = Decimal('0')
    for key, value in hitter.get('球場', {}).items():
        pf = pick_dick(pf_list, '球場', key).get('得点PF', '1')
        correct_pf += Decimal(pf) * Decimal(value['試合']) / Decimal(
            hitter['試合'])
    return correct_pf


def ops_plus(hitter, league, cor_pf):
    lg_obp = Decimal(league['出塁率'])
    lg_slg = Decimal(league['長打率'])
    if not lg_obp * lg_slg * cor_pf:
        return '0'
    ops_plus = Decimal('100') * (Decimal(hitter['出塁率']) / lg_obp + Decimal(
        hitter['長打率']) / lg_slg - Decimal('1')) / cor_pf
    return str(ops_plus)
```

最新の成績は以下から閲覧できます。

- [プロ野球成績表 - 行けたら行く](https://www.ted027.com/records/)

---

{{< img src="/img/sabr-ops-plus.png" >}}

---

### おわり

ここまで書いておいて何だが、結局`wOBA`の記事で書いた「長打力を過大に、出塁力を過小に評価する」という`OPS`の欠陥が解消されたわけではない。

結局の所`wRC+`の方がより参考になるかと思います。

---

- [[参考記事]【wOBA】NPB(2019)セイバーメトリクス野手指標の算出①](https://www.ted027.com/post/sabr-hit-woba)

- [[参考記事]【wRC+】NPB(2019)セイバーメトリクス野手指標の算出⑦](https://www.ted027.com/post/sabr-hit-wrc-plus)

---

{{< ad/con/wide/python_dokugaku >}}

---

{{< ad/a8/techacademy_python >}}

---
