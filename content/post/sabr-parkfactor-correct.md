---
title: "「パークファクター補正をかけた○○」の算出"
date: 2019-06-11T20:28:56+09:00
draft: false
comments: true
toc: true
categories: ["野球"]
tags: ["Python", "セイバーメトリクス", "パークファクター"]
---

指標の説明で「パークファクター補正をかけたwRAA」とか言われても、どうかければいいんだ…と思って調べた。

<!--more-->

---

{{< ad/a8/skyperfect>}}

---

{{< ad/con/wide/purosupi2019>}}

---

### パークファクター

「得点」「本塁打」等の数値が、球場ごとにどの程度起きやすいか、高くなりやすいかの数値。

例として、得点と出塁率のパークファクター(PF)を求める式は以下のようになる。

$\frac{本拠地での得点 + 失点 \div 本拠地での試合数}{本拠地以外での得点 + 失点 \div 本拠地以外での試合数}$

$\frac{本拠地での出塁率 + 被出塁率}{本拠地以外での出塁率 + 被出塁率}$

回数であれば一試合ごとの値にし、率であればそのまま計算。

その球場を本拠地とするチームが、「した数値 + された数値」を、本拠地と非本拠地で比較する。

なので、「西武はよく打つからメットライフドームの得点PFは高い」というようなこともない。

---

### パークファクターで補正をかける

#### 補正係数を求める

一応ここからが本題。

総合打撃指標`wRC+`を算出する式には「得点PF補正をかけた`wRAA`」か「得点PF補正をかけた`wRC`」が登場する。

まず、ここでパークファクターをそのまま使うことはしない。当然全ての試合を本拠地で行うわけではないので、そのチームの試合数を加味した`補正係数`を使う。

$補正係数 = \\\\\\本拠地PF \times \frac{本拠地試合数}{試合数} + \\\\\\(6 - 本拠地PF) \div 5 \times \frac{非本拠地試合数}{試合数}$

リーグ内対戦の場合、リーグの平均PFは１、6チームなら合計PFは6になるため。

ただ、交流戦もあれば出場試合数も人によって異なるので、以下のように個人補正係数を算出した方がいいのでは？と思っている。

$球場1PF \times \frac{球場1試合数}{試合数} + \\\\\\球場2PF \times \frac{球場2試合数}{試合数} + ...$

思っているが、その程度は誤差の範疇なのかもしれない。

---

#### 扱う指標の復習

まず補正を書ける前に、`wRAA`と`wRC`の指標の意味を思い出す。

`wRAA`: 当該選手がリーグ平均と比べ、何得点分多く貢献したか

`wRC`: 当該選手が何得点分の貢献をしたか

- [[参考記事]【wRAA, wRC】NPB(2019)セイバーメトリクス野手指標の算出⑤](https://www.ted027.com/post/sabr-hit-wraa)

「リーグ総得点をリーグ総打席数で割り、当該選手の打席数をかける」ことで、「平均的選手が同じ打席数立ったときの得点貢献」を算出。これを`wRAA`と加算することで、`wRC`が求められる。

「得点を意味する指標なんだから、得点の入りやすさを表す補正係数で割れば終わりじゃん」と僕はずっと思っていた。ただ、そう単純なものではないらしい。

---

#### 補正をかける

[baseball-reference](https://www.baseball-reference.com/about/war_explained_wraa.shtml)には、WARを算出するための、PF補正込み`wRAA`の計算式が掲載されている。

$wRAA - (BPF/100 - 1) \times PA\\\\\\ \times lgR/PA \times (BPF/100)$

`BPF/100`が補正係数を表す。

この式の意味を噛み砕くと、

`補正係数≒パークファクターによって得した/損したと思われる得点機会の分、「リーグ平均的打者が当該打者と同じ球場環境で打席に立った際の得点貢献を引く/足す`

ということでしょうか。しっくり来るような来ないような。

---

### 実装

上記を踏まえて`wRC+`を算出する部分を書く。

まずは補正係数の算出。

```py
def correct_pf(hitter, pf_list):
    correct_pf = Decimal('0')
    for key, value in hitter.get('球場', {}).items():
        pf = pick_dick(pf_list, '球場', key).get('得点PF', '1')
        correct_pf += Decimal(pf) * Decimal(value['試合']) / Decimal(
            hitter['試合'])
    return correct_pf
```

ちょっと迷ったが、12球団本拠地球場以外（神戸含む）のPFを1として、出場試合数に応じて個人の補正係数を算出する方式を引き続き採用した。

次に、補正係数を使って`wRC+`を算出。

```py
def wrc_plus(hitter, league, pf_list, raw_wrc):
    if not Decimal(hitter['打席']) * Decimal(league['打席']):
        return '0'
    cor_pf = correct_pf(hitter, pf_list)
    correct_wrc = raw_wrc + (Decimal('1') - cor_pf) * Decimal(
        league['得点']) / Decimal(league['打席']) * Decimal(hitter['打席']) / cor_pf
    numerator = correct_wrc / Decimal(hitter['打席'])
    denominator = Decimal(league['得点']) / Decimal(league['打席'])

    raw_wrc_plus = numerator / denominator * Decimal('100')
    wrc_plus = digits_under_one(raw_wrc_plus, 0)
    return str(wrc_plus)
```

---

### おわり

同様の計算で、PF補正込みの`FIP`も計算するようにした。

調べていてよく目にしたのは「パークファクターは数年分を用いる」の記述。やはり単年かそこらではサンプル数が少なすぎる模様です。

---

{{< ad/con/wide/sabr_omata>}}

---

{{< ad/a8/dazn>}}

---
