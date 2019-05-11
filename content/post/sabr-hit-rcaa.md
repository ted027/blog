---
title: "【RCWIN, XRWIN】NPB(2019)セイバーメトリクス野手指標の算出⑥"
date: 2019-05-11T14:17:38+09:00
draft: true
comments: true
categories: ["野球"]
tags: ["野手指標", "Python", "セイバーメトリクス", "得点能力"]
---

得点力指標RC, XRに、リーグ平均と比較する観点を加味した、RCAA, RCWIN, XRAA, XRWINを算出する。

<!--more-->

---

{{< ad/a8/skyperfect>}}

---

{{< ad/con/wide/mlbtheshow19>}}

---

### 追加する指標

今回算出するのは、[`RC`](https://www.ted027.com/post/sabr-hit-rc#rc-runs-created)および[`XR`](https://www.ted027.com/post/sabr-hit-rc#xr-extrapolated-runs)の応用指標。

#### RCAA/RC+ (Runs Created Above Average)

- リーグの平均的打者と比較してどれだけ多く[`RC`](https://www.ted027.com/post/sabr-hit-rc#rc-runs-created)を稼いだか

##### 計算式

$RC - リーグRC \times \frac{打席}{リーグ打席}$

---

#### RCWIN

- リーグの平均的打者と比較して何勝多く貢献したか
- [`RCAA`](#rcaa-rc+-runs-created-above-average)を`RPW`(Runs Per Win)で割ったもの

##### 計算式

$\frac{RCAA}{RPW}$

$RPW = 10 \times \sqrt{\frac{リーグ得点 + リーグ失点}{リーグ投球回}}$

---

{{< ad/con/wide/sabr>}}

---

{{< ad/a8/dazn>}}

---