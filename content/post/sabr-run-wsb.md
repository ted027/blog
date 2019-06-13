---
title: "【wSB】NPB(2019)セイバーメトリクス走塁指標の算出"
date: 2019-05-11T10:44:53+09:00
draft: false
comments: true
categories: ["野球"]
tags: ["野手指標", "Python", "セイバーメトリクス", "走塁指標"]
---

盗塁に関しての走塁能力を評価するwSBを算出する。

<!--more-->

---

{{< ad/a8/skyperfect>}}

---

{{< ad/con/wide/mlbtheshow19>}}

---

### 追加する指標

#### wSB (weighted Stolen Base runs)

- 盗塁による得点貢献の相対値
- 盗塁および盗塁死に対して得点を付与し、リーグ合計の盗塁/盗塁死を、該当選手と同じ一塁への出塁≒盗塁機会へ換算した値を引く

##### 計算式

$累積盗塁スコア\\\\\\ - リーグ累積盗塁スコア \times \frac{簡易盗塁機会}{リーグ簡易盗塁機会}$

$累積盗塁スコア\\\\\\ = (盗塁 \times 盗塁得点)\\\\\\ + (盗塁死 \times 盗塁死得点)$
$簡易盗塁機会\\\\\\ = (単打 + 四球 + 死球 - 故意四球)$

※ [DELTA CREATIVE](http://p.booklog.jp/book/84362/read)を参考に、盗塁得点は0.18、盗塁死得点は-0.32で計算する。

---

### 実装

```py:sabr.py
STEAL_SCORE = Decimal('0.18')
FAILED_STEAL_SCORE = Decimal('-0.32')


def _wsb_part(record):
    steal_score = Decimal(record['盗塁']) * STEAL_SCORE + Decimal(record['盗塁死']) * FAILED_STEAL_SCORE
    steal_chance = single(record) + Decimal(record['四球']) +  Decimal(record['死球']) - Decimal(record['故意四球'])
    return steal_score, steal_chance


def wsb(hitter, league):
    steal_score, steal_chance = _wsb_part(hitter)
    league_steal_score, league_steal_chance = _wsb_part(league)
    if not league_steal_chance:
        return '0'
    wsb = steal_score - league_steal_score * steal_chance / league_steal_chance
    return str(wsb)
```

最新の成績は以下から閲覧できます。

- [プロ野球成績表 - 行けたら行く](https://www.ted027.com/records/)

---

### おわり

`UBR`(Ultimate Base Running)という、盗塁以外での走塁による得点貢献を評価する指標もある。

が、例によって算出が困難。

---

{{< ad/con/wide/python_dokugaku >}}

---

{{< ad/a8/dazn>}}

---
