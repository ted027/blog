---
title: "【RCWIN, XRWIN】NPB(2019)セイバーメトリクス野手指標の算出⑥"
date: 2019-05-11T14:17:38+09:00
draft: false
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

#### XR+ (eXtrapolated Runs Plus)

- リーグの平均的打者と比較してどれだけ多く[`XR`](https://www.ted027.com/post/sabr-hit-rc#xr-extrapolated-runs)を稼いだか

※ 関係ないですが、XRAA (eXtrapolated Runs Above Average) という呼び方はしないんですかね？そう呼んでるのを見たことないです。

##### 計算式

$XR - リーグXR \times \frac{打席}{リーグ打席}$

---

#### XRWIN

- リーグの平均的打者と比較して何勝多く貢献したか
- [`XR+`](#xr+-extrapolated-runs-plus)を`RPW`(Runs Per Win)で割ったもの

##### 計算式

$\frac{XR+}{RPW}$

$RPW = 10 \times \sqrt{\frac{リーグ得点 + リーグ失点}{リーグ投球回}}$

---

### RPWってなんぞ…？

`RCWIN`と`XRWIN`の計算式に出てきた`RPW`(Runs Per Win)。

これは、1勝積み上げるのに何点必要か、を表す値。

野球のリーグ戦においては基本的に「得失点差が10積み重なると、1勝上積みされる」という考え方（つまり、`RPW`=10）。ただこれはあくまで「基本的に」であって、打高投高などによって変化する。

それらを加味して、「統計学的に、該当リーグでは何点で1勝と換算するか」を表すのが`RPW`で、以下の式で表される。

$RPW = 10 \times \sqrt{\frac{リーグ得点 + リーグ失点}{リーグ投球回}}$

第二項の分数は、イニングあたりの得点と失点の合計（の平方根）、ということになる。点が入りやすいほど、1点が勝敗に与える影響は小さくなり、`RPW`は大きくなる。

ここでモヤモヤしたのは、交流戦は考慮しなくていいの？という点。

ただ、交流戦を考慮しなければ、リーグ得点とリーグ失点は一致するはず。$2 \times リーグ得点$とかにはなっていないので、交流戦も含めて正直に計算していいだろう、と判断しました。

---

### 実装

```py:sabr.py
def rc_xr_plus(hitter, league, rc_xr, league_rc_xr):
    on_base = Decimal(hitter['打席'])
    league_on_base = Decimal(league['打席'])
    if not league_on_base:
        rc_xr_plus = raw_rc_xr_plus = Decimal('0')
    else:
        raw_rc_xr_plus = rc_xr - league_rc_xr / league_on_base * on_base
        rc_xr_plus = digits_under_one(raw_rc_xr_plus, 2)
    return str(rc_xr_plus), raw_rc_xr_plus


def rc_xr_win(hitter, full_league, rc_xr_plus):
    league_pitcher = full_league['Pitcher'][hitter['League']]
    league_hitter = full_league['Hitter'][hitter['League']]
    outcounts = return_outcounts(Decimal(league_pitcher['投球回']))
    if not outcounts:
        rc_xr_win = Decimal('0')
    else:
        runs_per_inning = Decimal('3') * (Decimal(
            league_hitter['得点']) + Decimal(league_pitcher['失点'])) / outcounts
        runs_per_win = Decimal('10') * math.sqrt(runs_per_inning)
        raw_rc_xr_win = rc_xr_plus / runs_per_win
        rc_xr_win = digits_under_one(raw_rc_xr_win, 2)
    return str(rc_xr_win)
```

---

### おわり

[`RC`](https://www.ted027.com/post/sabr-hit-rc#rc-runs-created)系の指標と[`XR`](https://www.ted027.com/post/sabr-hit-rc#xr-extrapolated-runs)系の指標って並べて書いておく必要あるんですかね？どっちかだけでいいような。

---

{{< ad/con/wide/sabr>}}

---

{{< ad/afb/codecamp>}}

---
