---
title: "【wRC+】NPB(2019)セイバーメトリクス野手指標の算出⑦"
date: 2019-05-23T21:52:45+09:00
draft: false
comments: true
categories: ["野球"]
tags: ["野手指標", "Python", "セイバーメトリクス", "得点能力"]
---

wRCにパークファクターを加味し、リーグ平均と比較して打者の価値を表現するwRC+を算出する。

<!--more-->

---

{{< ad/a8/skyperfect>}}

---

{{< ad/con/wide/sabr>}}

---

パークファクターも算出できたので、打撃指標`wRC+`を計算するプログラムを実装する。

- [[参考記事]【前半】パークファクターの算出で大いに躓く①](https://www.ted027.com/post/sabr-parkfactor-1)

- [[参考記事]【後半】パークファクターの算出で大いに躓く②](https://www.ted027.com/post/sabr-parkfactor-2)

---

### 追加する指標

#### wRC+ (weighted Runs Created Plus)

- 1打席あたり得点力の傑出度（パーセント）、平均的打者が100
- 打席あたりの`wRC`にパークファクター補正を加え、リーグ平均と比較する

##### 計算式

$\frac{wRC\\_pf \div 打席}{リーグ得点 \div リーグ打席}$

$wRC_pf = wRC + (1 - 補正係数) \\\\\\ \times 打席 \times \frac{リーグ得点}{リーグ打席} \div 補正係数$


※補正係数の算出は以下の記事に記載

- [「パークファクター補正をかけた○○」の算出](https://www.ted027.com/post/ssabr-parkfactor-correct)

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


def wrc_plus(hitter, league, pf_list, raw_wrc):
    if not Decimal(hitter['打席']) * Decimal(league['打席']):
        return '0'
    cor_pf = correct_pf(hitter, pf_list)
    correct_wrc = raw_wrc + (Decimal('1') - cor_pf) * Decimal(
        league['得点']) / Decimal(league['打席']) * Decimal(hitter['打席']) / cor_pf
    numerator = correct_wrc / Decimal(hitter['打席'])
    denominator = Decimal(league['得点']) / Decimal(league['打席'])

    wrc_plus = numerator / denominator * Decimal('100')
    return str(wrc_plus)
```

最新の成績は以下から閲覧できます。

- [プロ野球成績表 - 行けたら行く](https://www.ted027.com/records/)

---

{{< img src="/img/sabr-wrc-plus.png" >}}

---

### おわり

自分一人で計算できるレベルの指標は、単独ではこれが一番だと思っている。

---

- [[参考記事]【wOBA】NPB(2019)セイバーメトリクス野手指標の算出①](https://www.ted027.com/post/sabr-hit-woba)

- [[参考記事]【wRAA, wRC】NPB(2019)セイバーメトリクス野手指標の算出⑤](https://www.ted027.com/post/sabr-hit-wraa)

- [[参考記事]【前半】パークファクターの算出で大いに躓く①](https://www.ted027.com/post/sabr-parkfactor-1)

---

{{< ad/con/wide/python_analytics >}}

---

{{< ad/afb/codecamp>}}

---
