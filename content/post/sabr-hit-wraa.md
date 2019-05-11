---
title: "【wRAA, wRC】NPB(2019)セイバーメトリクス野手指標の算出⑤"
date: 2019-05-10T21:57:39+09:00
draft: false
comments: true
categories: ["野球"]
tags: ["野手指標", "Python", "セイバーメトリクス", "得点能力"]
---

得点能力指標wOBAに、リーグ平均と比較する観点を追加した、wRaaとwRCを算出する。

<!--more-->

---

{{< ad/a8/skyperfect>}}

---

{{< ad/con/wide/purosupi2019>}}

---

### 追加する指標

いずれも[`wOBA`](https://www.ted027.com/post/sabr-hit-woba#woba-weighted-on-base-average)の応用指標。

#### wRAA (weighted Runs Above Average)

- 打者の得点貢献度
- リーグ平均の打者が同じ打席数立った場合と比べて、何点多く貢献したか

##### 計算式

$(wOBA - リーグwOBA) / wOBAscale * 打席$

$wOBAscale = 1.15(MLB)$
$wOBAscale = 1.24(NPB)$

※ wOBAは、係数にwOBAscaleをかけることで、`出塁率`と同スケールの値にしている。ここではwOBAscaleで割ることで得点スケールに戻している。

---

#### wRC (weighted Runs Created)

  - 打者の得点貢献度
  - リーグ平均得点力をベースに、[`wRAA`](#wraa-weighted-runs-above-average)と合わせて何点分貢献したか

##### 計算式

$wRAA + (リーグ得点 / リーグ打席 * 打席)$

---

### 実装

```py:sabr.py
WOBA_SCALE = Decimal('1.24')


def wraa(hitter, league):
    raw_wraa = (Decimal(hitter['wOBA']) - Decimal(league['wOBA'])) / WOBA_SCALE * Decimal(hitter['打席'])
    wraa = digits_under_one(raw_wraa, 3)
    hitter['wRAA'] = str(wraa)


def wrc(hitter, league):
    raw_wrc = Decimal(hitter['wRAA']) + (Decimal(league['得点']) / Decimal(league['打席'])) * Decimal(hitter['打席'])
    wrc = digits_under_one(raw_wrc, 3)
    hitter['wRC'] = str(wrc)
```

---

### おわり

セリーグの場合、リーグ平均成績には、投手の打撃成績を含まないことが多い模様。指標の意味を考えれば納得ですね。

[`wRAA`](#wraa-weighted-runs-above-average)や[`wRC`](#wrc-weighted-runs-created)は総合指標`WAR`の計算にも用いられるなど重用されている。

---

- [[参考記事]Pythonでプロ野球の個人成績一覧をJSONにして取得する](https://www.ted027.com/post/python-personal-records)

- [[参考記事]【wOBA】NPB(2019)セイバーメトリクス野手指標の算出①](https://www.ted027.com/post/sabr-hit-woba)

- [[参考記事]【FIP】NPB(2019)セイバーメトリクス投手指標の算出②](https://www.ted027.com/post/sabr-pitch-fip)

---

{{< ad/con/wide/sabr_omata>}}

---

{{< ad/a8/dazn>}}

---