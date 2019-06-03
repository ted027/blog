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

とはいえ、上の記事にあるようにパークファクターが参考値なので、`wRC+`も参考値。

---

### 追加する指標

#### wRC+ (weighted Runs Created Plus)

- 1打席あたり得点力の傑出度（パーセント）、平均的打者が100
- 打席あたりの`wRC`にパークファクター補正を加え、リーグ平均と比較する

##### 計算式

$\frac{PF込みwRC \div 打席}{リーグ得点 \div リーグ打席}$

$PF込みwRC$
$= \sum wRC \div x球場PF \times \frac{x球場試合数}{試合数}$

※PF: 得点パークファクター

---

### 実装

```py
def _pf_wrc(hitter, pf_list, raw_wrc):
    pf_wrc = Decimal('0')
    for key, value in hitter.get('球場', {}).items():
        pf = pick_dick(pf_list, '球場', key).get('得点PF', '1')
        pf_wrc += raw_wrc * Decimal(value['試合']) / Decimal(hitter['試合']) / Decimal(pf)
    return pf_wrc


def wrc_plus(hitter, league, pf_list, raw_wrc):
    if not Decimal(hitter['打席']) * Decimal(league['打席']):
        return '0'
    pf_wrc = _pf_wrc(hitter, pf_list, raw_wrc)
    numerator = pf_wrc / Decimal(hitter['打席'])
    denominator = Decimal(league['得点']) / Decimal(league['打席'])

    raw_wrc_plus = numerator / denominator * Decimal('100')
    wrc_plus = digits_under_one(raw_wrc_plus, 0)
    return str(wrc_plus)
```

---

### おわり

本拠地球場以外の得点パークファクターは1として計算しました。

---

- [[参考記事]【wOBA】NPB(2019)セイバーメトリクス野手指標の算出①](https://www.ted027.com/post/sabr-hit-woba)

- [[参考記事]【wRAA, wRC】NPB(2019)セイバーメトリクス野手指標の算出⑤](https://www.ted027.com/post/sabr-hit-wraa)

- [[参考記事]【前半】パークファクターの算出で大いに躓く①](https://www.ted027.com/post/sabr-parkfactor-1)

---

{{< ad/con/wide/sabr_omata>}}

---

{{< ad/afb/codecamp>}}

---
