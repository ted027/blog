---
title: "【LOB%】NPB(2019)セイバーメトリクス投手指標の算出③"
date: 2019-06-20T12:49:58+09:00
draft: false
comments: true
toc: true
categories: ["野球"]
tags: ["投手指標", "Python", "セイバーメトリクス"]
---

LOB%は、投手が塁に出した走者をどれだけ残塁させたかを表す指標。

<!--more-->

---

{{< ad/a8/skyperfect >}}

---

{{< ad/con/wide/purosupi2019>}}

---

### 追加する指標

#### LOB%

前述の通り、LOB％はどれだけ走者を残塁させたかを表す値であり、これが高い投手は「勝負強い、粘り強い」と言うことができる。

一方、セイバーメトリクスの考え方では、残塁の多さは投手がコントロールしづらい、運要素を多く含む値であるとされ、`BABIP`のように、「高い投手は成績の悪化が、低い投手は成績の良化が期待できる」という使い方をされる。

#### 計算式

$\frac{被安打 + 与四死球 - 失点}{安打 + 与四死球 - 1.4 \times 被本塁打}$

1.4が固定値になっているのはよく分からないですが、1本塁打につき還るランナーの期待値、ということだと思っています。

---

### 実装

```py
def lob_percent(pitcher):
    denominator = Decimal(pitcher['被安打']) + Decimal(pitcher['与四球']) + Decimal(
        pitcher['与死球']) - Decimal('1.4') * Decimal(pitcher['被本塁打'])
    if not denominator:
        return '0.0'
    numerator = Decimal(pitcher['被安打']) + Decimal(pitcher['与四球']) + Decimal(
        pitcher['与死球']) - Decimal(pitcher['失点'])
    lob_percent = numerator / denominator * Decimal('100')
    return str(lob_percent)
```

最新の成績は以下から閲覧できます。

- [プロ野球成績表 - 行けたら行く](https://www.ted027.com/records/)

---

- [[参考記事]【FIP】NPB(2019)セイバーメトリクス投手指標の算出②](https://www.ted027.com/post/sabr-pitch-fip)

---

{{< ad/con/wide/python_analytics >}}

---

{{< ad/a8/techacademy_python >}}

---
