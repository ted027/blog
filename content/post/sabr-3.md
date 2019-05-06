---
title: "【長打力】プロ野球個人成績からセイバーメトリクス打者指標を算出する②"
date: 2019-05-06T14:02:41+09:00
draft: false
comments: true
categories: ["野球"]
tags: ["打者", "Python", "セイバーメトリクス", "長打力"]
---

打者の長打力を表すIsoPを算出し追加する。

<!--more-->

---

{{< ad/a8/skyperfect>}}

---

{{< ad/con/wide/purosupi2019>}}

---

- [[参考記事]Pythonでプロ野球の個人成績一覧をJSONにして取得する](https://www.ted027.com/post/python-personal-records)

- [[参考記事]【打者総合指標-1】プロ野球個人成績からセイバーメトリクス打者指標を算出する①](https://www.ted027.com/post/sabr-2)

- [[参考記事]【選球眼】プロ野球個人成績からセイバーメトリクス打者指標を算出する](https://www.ted027.com/post/sabr-4)

---

### 指標の説明

#### IsoP/ISO (Isolated Power)

同様に長打力を評価する指標として`長打率`があるが、単打が多く長打が少ない打者であっても`長打率`は高くなるため、必ずしも長打力を測る指針にはならない。

一方`IsoP(ISO)`では、単打を完全に除外するため、純粋に長打を打つ能力を測ることができる。

---

### 追加する指標

#### IsoP

$長打率 - 打率$

$(二塁打 + 三塁打 * 2 + 本塁打 * 3）/ 打数$

※ 上と下の式は同じ意味を表す

- 打者の長打力
- 単打は考慮から排除

---

### 実装

```py:sabr.py
def iso_p(hitter):
    atbat = Decimal(hitter['Records']['打数'])
    if not atbat:
        iso_p = 0
    else:
        numerator = Decimal(hitter['Records']['二塁打']) + 2 * Decimal(
            hitter['Records']['三塁打']) + 3 * Decimal(hitter['Records']['本塁打'])
        raw_iso_p = numerator / atbat
        iso_p = _digits_under_one(raw_iso_p, 3)
    hitter['Records']['IsoP'] = str(iso_p)
```

---

### おわり

長打力を表す指標…といいつつ今回追加したのは1個だけ。

`出塁率`+`IsoP`出したら`OPS`の欠点消えて単純かついい指標になるんじゃ？と思ったけど、それくらい考えてる人いそうですね。

そのうち余裕があったら得点相関なんかを調べてみたい。

---

{{< ad/con/wide/pawapuro2018>}}

---

{{< ad/a8/skyperfect>}}

---