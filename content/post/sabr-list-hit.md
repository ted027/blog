---
title: "【野手指標】セイバーメトリクス指標一覧"
date: 2019-05-10T20:44:40+09:00
draft: false
comments: true
categories: ["野球"]
tags: ["セイバーメトリクス", "野手指標"]
---

よく使われるセイバーメトリクスの野手指標一覧をざっくりまとめました。

<!--more-->

---

{{< ad/a8/skyperfect>}}

---

{{< ad/con/wide/purosupi2019>}}

---

### 打撃総合

- [wOBA (weighted On-Base Average)](https://www.ted027.com/post/sabr-hit-woba#woba-weighted-on-base-average)
  - 1打席あたり得点力
  - `出塁率`と同スケール（平均.320程度）に換算された値
  - 四死球、単打〜本塁打に各々の得点価値をかけて足し合わせ、打席(ほぼ)で割る

- [wRAA (weighted Runs Above Average)](https://www.ted027.com/post/sabr-hit-wraa#wraa-weighted-runs-above-average)
  - リーグ平均の打者が同じ打席数立った場合と比べて、何点多く取ったか
  - `wOBA`ベースで、リーグ平均との得点差に打席数をかける

- [wRC (weighted Runs Created)](https://www.ted027.com/post/sabr-hit-wraa#wrc-weighted-runs-created)
  - 累積で何点取ったか（何点分貢献したか）
  - リーグ平均攻撃力をベースに、`wRAA`と合計し貢献得点数を算出

- [wRC+ (weighted Runs Created Plus)](https://www.ted027.com/post/sabr-hit-wrc-plus#wrc-weighted-runs-created-plus)
  - 1打席あたり得点力の傑出度（パーセント）
  - 平均的打者が100
  - 打席あたりの`wRC`にパークファクター補正を加え、リーグ平均と比較する

---

### 攻撃総合

- [RC (Runs Created)](https://www.ted027.com/post/sabr-hit-rc#rc-runs-created)
  - 累積で何点取ったか（何点分貢献したか）
  - `wOBA`系指標との違いは、盗塁、盗塁死、三振、併殺等の結果にも得点価値が振られている点

- [RC27 (Runs Created per 27 outs)](https://www.ted027.com/post/sabr-hit-rc#rc27-runs-created-per-27-outs)
  - この打者だけで一試合した時に何点取れるか
    - 正確には、打者が27アウト取られる間に`RC`をどれだけ稼ぐか
  - ただしマイナスになることがあり、この指標の欠点ともいわれている

- [RCAA/RC+ (Runs Created Above Average)](https://www.ted027.com/post/sabr-hit-rcaa#rcaa-rc-runs-created-above-average)
  - リーグの平均的打者と比較してどれだけ多く`RC`を稼いだか

- [RCWIN](https://www.ted027.com/post/sabr-hit-rcaa#rcwin)
  - リーグの平均的打者と比較して何勝多く貢献したか
  - `RCAA`を`RPW`(Runs Per Win)で割ったもの

- [XR (eXtrapolated Runs)](https://www.ted027.com/post/sabr-hit-rc#xr-extrapolated-runs)
  - 累積で何点取ったか（何点分貢献したか）
  - `RC`の改良版、計算式が異なるが、ほぼ同じ意味合いの指標

- [XR27 (eXtrapolated Runs per 27 outs)](https://www.ted027.com/post/sabr-hit-rc#xr27-extrapolated-runs-per-27-outs)
  - この打者だけで一試合した時に何点取れるか
    - 正確には、打者が27アウト取られる間に`XR`をどれだけ稼ぐか
  - ただしマイナスになることがあり、この指標の欠点ともいわれている

- [XR+ (eXtrapolated Runs Plus)](https://www.ted027.com/post/sabr-hit-rcaa#xr-extrapolated-runs-plus)
  - リーグの平均的打者と比較してどれだけ多く`XR`を稼いだか

- [XRWIN](https://www.ted027.com/post/sabr-hit-rcaa#xrwin)
  - リーグの平均的打者と比較して何勝多く貢献したか
  - `XR+`を`RPW`(Runs Per Win)で割ったもの

---

### 長打力

- [IsoP/ISO (Isolated Power)](https://www.ted027.com/post/sabr-hit-isop#isop-iso-isolated-power)
  - 長打力、二塁打以上を打つ力
  - 長打率から打率を引くことで、長打によって稼いだ（二塁より先の）塁打のみを評価する

---

### 選球眼

- [BB/K](https://www.ted027.com/post/sabr-hit-bb-k#bb-k)
  - 打者のストライクゾーン管理能力
  - 四球 / 三振

- [BB%](https://www.ted027.com/post/sabr-hit-bb-k#bb-walk-rate)
  - 四球率
  - 選球眼、打席自制心
  - 長打力も関係するため、必ずしも選球眼と比例するわけではない

- [K%](https://www.ted027.com/post/sabr-hit-bb-k#k-k-rate)
  - 三振率
  - ミート力、選球眼

- [IsoD (Isolated Discipline)](https://www.ted027.com/post/sabr-hit-bb-k#isod-isolated-discipline)
  - 打席自制心
  - 出塁率から打率を引き、四死球で出塁した割合を求める
  - 故意四球や死球も含むため、`BB%`の下位互換との声も

---

### 走塁力

- [wSB (weighted Stolen Base runs)](https://www.ted027.com/post/sabr-run-wsb#wsb-weighted-stolen-base-runs)
  - リーグ平均の走者と比べて、盗塁によって何点多く取ったか
  - 盗塁および盗塁死に対して得点価値をかけ、リーグ合計の盗塁および盗塁死との差を出す

- UBR (Ultimate Base Run)
  - リーグ平均の走者と比べて、盗塁以外の走塁によって何点多く取ったか
  - 走者時の安打やゴロでの進塁、併殺回避などを評価

---

### 守備力

- UZR (Ultimate Zone Rating)
  - 平均的野手と比べて何点防いだか
  - 打球のゾーン・種類・速度から、平均的選手がこの打球をアウトにする確率を算出し、実際の処理結果によってスコアを加算・減算する
  - 打球の評価はあくまで人の目で行う
  - 試合数に応じて積み上がるため、出場試合数の異なる選手同士の比較には不適
    - そうした場合は`UZR/1000`や`UZR/150`を用いる

- DRS (Defensive Runs Saved)
  - 平均的野手と比べて何点防いだか
  - `UZR`との違いは、ゾーン分けがより細かい点や、打球の記録に数年間でなく1年間のデータを利用する点など

- RF (Range Factor)
  - 9イニングあたり刺殺 + 捕殺
  - 9イニングあたりいくつアウトに絡むか
  - 「出場試合数あたり刺殺 + 捕殺」の簡易版を用いることもある

- RRF (Relative Range Factor)
  - `RF`に、チームの奪三振や守備力を加味した補正を加え、信頼性を上げたもの

---

### 野手総合

- WAR (Wins Above Replacement)
  - 代替選手と比べ、何勝多く上積みしたか
    - 代替選手は、二軍からの昇格やトレードにより簡単に獲得できるレベルの選手
  - 算出方法は複数存在するが、基本的に打撃指標`wRAA`, 走塁指標`wSB`, `UBR`, 守備指標'UZR'に、パークファクターや守備位置補正を加味して算出される

---

### その他

- [BABIP (Batting Average on Balls In Play)](https://www.ted027.com/post/sabr-babip#babip-batting-average-on-balls-in-play)
  - フェアゾーン内に飛んだ打球が安打になる確率
  - 投手の場合、長期的には.300程度に収束するとされ、大きく乖離する場合「幸運/不運」といえる
  - 打者の場合、俊足であれば`BABIP`が高くなりがちであったり、打球傾向が偏る場合、シフトによって`BABIP`を低く抑えることができるなど、決まった値には収束しないとされる

---

- [[参考記事]Pythonでプロ野球の個人成績一覧をJSONにして取得する](https://www.ted027.com/post/python-personal-records)

- [[参考記事]【wOBA】NPB(2019)セイバーメトリクス野手指標の算出①](https://www.ted027.com/post/sabr-hit-woba)

- [[参考記事]【RC, RC27, XR, XR27】NPB(2019)セイバーメトリクス野手指標の算出④](https://www.ted027.com/post/sabr-hit-rc)

- [[参考記事]【wRAA, wRC】NPB(2019)セイバーメトリクス野手指標の算出⑤](https://www.ted027.com/post/sabr-hit-wraa)

---

{{< ad/con/wide/sabr_omata>}}

---

{{< ad/a8/dazn>}}

---
