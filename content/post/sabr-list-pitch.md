---
title: "【投手指標】セイバーメトリクス指標一覧"
date: 2019-05-12T23:38:22+09:00
draft: false
comments: true
categories: ["野球"]
tags: ["セイバーメトリクス", "投手指標"]
---

よく使われるセイバーメトリクスの投手指標一覧をざっくりまとめました。

<!--more-->

---

{{< ad/a8/dazn >}}

---

{{< ad/con/wide/purosupi2019 >}}

---

- [WHIP (Walks plus Hits per Inning Pitched)](https://www.ted027.com/post/sabr-pitch-whip#whip)
  - 1イニングあたり何人（安打と四球の）走者を出すか

- [K/BB](https://www.ted027.com/post/sabr-pitch-whip#k-bb)
  - 奪三振 / 四球
  - 投手の三振奪取力と制球力の総合指標

- [K/9](https://www.ted027.com/post/sabr-pitch-whip#k-9)
  - 9イニングあたり何奪三振とるか（奪三振率）

- [BB/9](https://www.ted027.com/post/sabr-pitch-whip#bb-9)
  - 9イニングあたり何四球与えるか

- [HR/9](https://www.ted027.com/post/sabr-pitch-whip#hr-9)
  - 9イニングあたり何本塁打打たれるか

- [K%](https://www.ted027.com/post/sabr-pitch-whip#k)
  - 打者と対戦し奪三振を取る確率
  - 味方守備力の影響を受けない、投手の純粋な奪三振能力

- [BB%](https://www.ted027.com/post/sabr-pitch-whip#bb)
  - 打者と対戦し四球を与える確率
  - 味方守備力の影響を受けない、投手の純粋な四球回避能力

- [QS率](https://www.ted027.com/post/sabr-pitch-whip#qs率)
  - 先発登板のうちQS（6回以上3失点以内）に抑えた割合

- [FIP (Fielding Independent Pitching)](https://www.ted027.com/post/sabr-pitch-fip#fip-fielding-independent-pitching)
  - 被本塁打、与四死球、奪三振だけで評価した擬似的な防御率
  - リーグ平均防御率のうち、上記三部門で構成される(と思われる)部分だけ個人の数値に置き換える
  - 長期（例えば通算）でみれば防御率と近い値になるといわれている

- xFIP
  - `FIP`で被本塁打と換算していた部分を、フライボール数 * フライボールが本塁打になる確率、で置き換える
  - 投球回が増えれば、フライボールあたりの本塁打はほぼ収束する、という考えに基づく

- [BABIP (Batting Average on Balls In Play)](https://www.ted027.com/post/sabr-babip#babip-batting-average-on-balls-in-play)
  - フェアゾーン内に飛んだ打球が安打になる確率
  - 長期的に見れば.300程度に収束するとされ、大きく乖離する場合「幸運/不運」といえる
  - 運だけを表す指標ではなく、投手能力が低い場合や味方守備力が低い場合、フィールド内に安打性の打球を打たれる機会が増え、`BABIP`が高くなる

- WAR (Wins Above Replacement)
  - 代替選手と比べ、何勝多く上積みしたか
    - 代替選手は、二軍からの昇格やトレードにより簡単に獲得できるレベルの選手
  - 算出方法は複数存在するが、`FIP`や、チームの守備指標を加味した`失点率`、パークファクターなどから算出される

---

- [[参考記事]Pythonでプロ野球の個人成績一覧をJSONにして取得する](https://www.ted027.com/post/python-personal-records)

- [[参考記事]【WHIP, K/BB他】NPB(2019)セイバーメトリクス投手指標の算出①](https://www.ted027.com/post/sabr-pitch-whip)

- [[参考記事]【FIP】NPB(2019)セイバーメトリクス投手指標の算出②](https://www.ted027.com/post/sabr-pitch-fip)

---

{{< ad/con/wide/sabr_omata >}}

---

{{< ad/a8/dazn >}}

---
