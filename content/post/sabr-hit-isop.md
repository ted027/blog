---
title: "【IsoP】NPB(2019)セイバーメトリクス野手指標の算出②"
date: 2019-05-06T14:02:41+09:00
draft: false
comments: true
categories: ["野球"]
tags: ["野手指標", "Python", "セイバーメトリクス", "長打力"]
---

打者の長打力を表すIsoPを算出し追加する。

<!--more-->

---

{{< ad/a8/skyperfect>}}

---

{{< ad/con/wide/pawapuro_switch>}}

---

### 追加する指標

#### IsoP/ISO (Isolated Power)

- 打者の純粋な長打力

長打力を評価する指標として`長打率`があるが、打率が高く長打が少ない打者であっても`長打率`は高くなるため、必ずしも長打力を測る指針にはならない。

そこで、`長打率`から`打率`を引くことで、長打によって塁打を稼ぐ能力を表したものが`IsoP(ISO)`。

##### 計算式

$長打率 - 打率$

$(二塁打 + 三塁打 \times 2 + 本塁打 \times 3）\div 打数$

※ 上と下の式は同じ意味を表す

---

### 実装

```py:sabr.py
def iso_p(hitter):
    atbat = Decimal(hitter['打数'])
    if not atbat:
        iso_p = Decimal('0')
    else:
        numerator = Decimal(hitter['二塁打']) + Decimal('2') * Decimal(
            hitter['三塁打']) + Decimal('3') * Decimal(hitter['本塁打'])
        raw_iso_p = numerator / atbat
        iso_p = _digits_under_one(raw_iso_p, 3)
    return str(iso_p)
```

---

### おわり

長打力を表す指標…といいつつ今回追加したのは1個だけ。

`出塁率`+`IsoP`出したら`OPS`の欠点が緩和されて単純かついい指標になるんじゃ？と思ったけど、それだと今度は長打力が過小評価されそう。

そのうち余裕があったら得点相関なんかも調べてみたいです。

---

- [[参考記事]Pythonでプロ野球の個人成績一覧をJSONにして取得する](https://www.ted027.com/post/python-personal-records)

- [[参考記事]【wOBA】NPB(2019)セイバーメトリクス野手指標の算出①](https://www.ted027.com/post/sabr-hit-woba)

- [[参考記事]【BB/K, BB%, IsoD】NPB(2019)セイバーメトリクス野手指標の算出③](https://www.ted027.com/post/sabr-hit-bb-k)

---

{{< ad/con/wide/sabr>}}

---

{{< ad/a8/dazn>}}

---
