---
title: "セイバーメトリクス 指標一覧"
date: 2019-05-10T20:44:40+09:00
draft: true
comments: true
categories: ["野球"]
tags: ["指標", "セイバーメトリクス"]
---

よく使われるセイバーメトリクスの指標一覧を簡潔にまとめました。

<!--more-->

---

{{< ad/a8/skyperfect>}}

---

{{< ad/con/wide/purosupi2019>}}

---

簡潔に概念だけまとめました。

リンクがある指標はリンク先でもう少し詳しい説明があったりなかったり。

### 野手指標

#### 得点能力

- [wOBA (weighted On-Base Average)](https://www.ted027.com/post/sabr-2#woba-weighted-on-base-average)
  - 打者の得点貢献度、出塁率と同スケールに換算
  - 四死球、単打〜本塁打に各々の得点価値をかけて足し合わせ、打席で割る
    - 厳密には、故意四球・犠打・打撃妨害は除くため打席ではない

- [RC (Runs Created)](https://www.ted027.com/post/sabr-5#rc-runs-created)
  - 打者の得点貢献度、何点分貢献したかの積み上げ式
  - [`wOBA`](#woba-weighted-on-base-average)との違いは、盗塁、盗塁死、三振、併殺等の結果にも得点価値が振られている点

- [RC27 (Runs Created per 27 outs)](https://www.ted027.com/post/sabr-5#rc27-runs-created-per-27-outs)
  - 打者が27アウト取られる間に[`RC`](#rc-runs-created)をどれだけ稼ぐか
  - すなわち、この打者だけで一試合した時に何点取れるか、を意味する指標
  - ただしマイナスになることがあり、この指標の欠点ともいわれている

- [XR (eXtrapolated Runs)](https://www.ted027.com/post/sabr-5#xr-extrapolated-runs)
  - 打者の得点貢献度、何点分貢献したかの積み上げ式
  - [`RC`](#rc-runs-created)の改良版、計算式が異なるが、ほぼ同じ意味合いの指標

- [XR27 (eXtrapolated Runs per 27 outs)](https://www.ted027.com/post/sabr-5#xr-extrapolated-runs-per-27-outs)
  - 打者が27アウト取られる間に[`XR`](#xr-extrapolated-runs)をどれだけ稼ぐか
  - すなわち、この打者だけで一試合した時に何点取れるか、を意味する指標
  - ただしマイナスになることがあり、この指標の欠点ともいわれている

#### 長打力

- [IsoP/ISO (Isolated Power)](https://www.ted027.com/post/sabr-3#isop-iso-isolated-power)
  - 打者の純粋な長打力
  - 長打率から打率を引くことで、長打によって稼いだ塁打のみを評価する

#### 選球眼

- [BB/K](https://www.ted027.com/post/sabr-4#bb-k)
  - 四球 / 三振
  - 打者のストライクゾーン管理能力

- [BB%](https://www.ted027.com/post/sabr-4#bb%-walk-rate)
  - 四球率、打席自制心
  - 長打力も関係するため、必ずしも選球眼と比例するわけではない

- [IsoD (Isolated Discipline)](https://www.ted027.com/post/sabr-4#bb%-walk-rate)
  - 打席自制心
  - 出塁率から打率を引き、四死球で出塁した割合を求める
  - 故意四球や死球も含むため、`BB%`の下位互換との声も

---

### 投手指標

- [WHIP](https://www.ted027.com/post/sabr-1#whip)
  - 1イニングあたり何人（安打と四球の）走者を出すか

- [K/BB](https://www.ted027.com/post/sabr-1#k-bb)
  - 奪三振 / 四球
  - 投手の三振奪取力と制球力の総合指標

- [K/9](https://www.ted027.com/post/sabr-1#k-9)
  - 9イニングあたり何奪三振とるか（奪三振率）

- [BB/9](https://www.ted027.com/post/sabr-1#bb-9)
  - 9イニングあたり何四球与えるか

- [HR/9](https://www.ted027.com/post/sabr-1#hr-9)
  - 9イニングあたり何本塁打打たれるか

- [QS率](https://www.ted027.com/post/sabr-1#qs率)
  - 先発登板のうちQS（6回以上3失点以内）に抑えた割合

- [FIP](https://www.ted027.com/post/sabr-6#fip-fielding-independent-pitching)
  - 被本塁打、与四死球、奪三振だけを評価した擬似的な防御率
  - リーグ平均防御率のうち、被本塁打、与四死球、奪三振で構成される(と思われる)部分だけ個人の数値に置き換える
  - 長期（例えば通算）でみれば防御率と近い値になるといわれている

---

{{< ad/con/wide/sabr_omata>}}

---

{{< ad/a8/dazn>}}

---
