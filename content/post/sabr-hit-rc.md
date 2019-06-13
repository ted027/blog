---
title: "【RC, RC27, XR, XR27】NPB(2019)セイバーメトリクス野手指標の算出④"
date: 2019-05-07T00:08:58+09:00
draft: false
comments: true
categories: ["野球"]
tags: ["野手指標", "Python", "セイバーメトリクス", "得点能力"]
---

打者の総合指標RCとXRを追加する。指標の目的はwOBAに近く、同じくらいメジャーな印象。

<!--more-->

---

{{< ad/a8/skyperfect >}}

---

{{< ad/con/wide/pawapuro2018>}}

---

### 追加する指標

#### RC (Runs Created)

- 打者の得点貢献度
- 積み上げ式、合計何点分の貢献をしたか

選手の得点を生み出す能力を評価する指標。「当該選手が何点分貢献したか」を表す指標で、チームの全打者のRCを足すと、チームの総得点とほぼ同じになるように作られている。打席数が多いほど数字も大きくなる。

以前取り上げた打撃総合指標[`wOBA`](https://www.ted027.com/post/sabr-hit-woba)との違いは、盗塁や盗塁死といった走塁能力も苦慮している点や、犠打や犠飛、併殺や三振といった打席結果にも細かくポイントが振られている点。

##### 計算式

$(2.4 \times C + A) \times (3 \times C + B）\div (9 \times C)\\\\\\ - 0.9 \times C$

$A = 安打 + 四球 + 死球 - 盗塁死 - 併殺打\\\\\\
B = 塁打 + 0.26 \times (四球 + 死球)\\\\\\ + 0.53 \times (犠飛 + 犠打) + 0.64 \times 盗塁\\\\\\ - 0.03 \times 三振\\\\\\
C = 打数 + 四球 + 死球 + 犠飛 + 犠打$

---

#### RC27 (Runs Created per 27 outs)

- 打者の得点貢献度
- 当該打者のみで一試合したら何点取れるか

`RC`は打席数に伴い増加するため、打席数の異なる選手同士を比較できない。

そこで、当該選手が27アウトを献上するまでに稼ぐ`RC`を算出したものがこの指標。

「当該選手だけで一試合戦った場合に何点取れるか」を表す指標だが、マイナスになる可能性がある点は指標の欠陥として指摘されている。

##### 計算式

$RC \times \frac{27}{打数 - 安打 + 犠打 + 犠飛 + 盗塁死 + 併殺打}$

---

#### XR (eXtrapolated Runs)

- 打者の得点貢献度
- 積み上げ式、合計何点分の貢献をしたか

RCの改良版。計算式は異なるが、指標の意味合いとしては同じ。

##### 計算式

$0.5 \times 単打 + 0.72 \times 二塁打 + 1.04 \times 三塁打\\\\\\ + 1.44 \times 本塁打 + 0.34 \times (四死球 - 故意四球)\\\\\\
     + 0.25 \times 故意四球 + 0.18 \times 盗塁 - 0.32 \times 盗塁死\\\\\\ - 0.09 \times (打数 - 安打 - 三振) - 0.098 \times 三振\\\\\\
     - 0.37 \times 併殺打 + 0.37 \times 犠飛 + 0.04 \times 犠打$

---

#### XR27 (eXtrapolated Runs per 27 outs)

- 打者の得点貢献度
- 当該打者のみで一試合したら何点取れるか

こちらもRC27と同様、当該選手が27アウトを献上するまでに稼ぐ`XR`を表す。

##### 計算式

$XR \times \frac{27}{打数 - 安打 + 犠打 + 犠飛 + 盗塁死 + 併殺打}$

---

### 実装

```py:sabr.py
FULL_OUTCOUNTS = Decimal('27')

XR_SINGLE = Decimal('0.5')
XR_DOUBLE = Decimal('0.72')
XR_TRIPLE = Decimal('1.04')
XR_HR = Decimal('1.44')
XR_BB = Decimal('0.34')
XR_IBB = Decimal('0.25')
XR_STEAL = Decimal('0.18')
XR_FAILED_STEAL = Decimal('-0.32')
XR_OUT = Decimal('-0.09')
XR_STRIKE_OUT = Decimal('-0.098')
XR_DOUBLE_PLAY = Decimal('-0.37')
XR_SAC_FLY = Decimal('0.37')
XR_SAC_BUNT = Decimal('0.04')


def rc_basic(hitter):
    opportunity = Decimal(hitter['打数']) + Decimal(
        hitter['四球']) + Decimal(hitter['死球']) + Decimal(
            hitter['犠打']) + Decimal(hitter['犠飛'])
    if not opportunity:
        return '0'
    on_base = Decimal(hitter['安打']) + Decimal(
        hitter['四球']) + Decimal(
            hitter['死球']) - Decimal(
                hitter['盗塁死']) - Decimal(
                    hitter['併殺打'])
    advance_base = Decimal(hitter['塁打']) + Decimal('0.26') * (
        Decimal(hitter['四球']) + Decimal(hitter['死球'])
    ) + Decimal('0.53') * (Decimal(hitter['犠飛']) +
                Decimal(hitter['犠打'])) + Decimal('0.64' * Decimal(
                    hitter['盗塁']) - Decimal('0.03') * Decimal(
                        hitter['三振'])
    rc = ((on_base + Decimal('2.4') * opportunity) *
                (advance_base + Decimal('3') * opportunity) /
                (Decimal('9') * opportunity)) - Decimal('0.9') * opportunity
    return str(rc)


def xr_basic(hitter):
    xr = XR_SINGLE * _single(hitter) + XR_DOUBLE * Decimal(
        hitter['二塁打']
    ) + XR_TRIPLE * Decimal(hitter['三塁打']) + XR_HR * Decimal(
        hitter['本塁打']) + XR_BB * (
            Decimal(hitter['四球']) + Decimal(
                hitter['死球']) - Decimal(hitter['故意四球'])
        ) + XR_IBB * Decimal(hitter['故意四球']) + XR_STEAL * Decimal(
            hitter['盗塁']
        ) + XR_FAILED_STEAL * Decimal(hitter['盗塁死']) + XR_OUT * (
            Decimal(hitter['打数'])
            - Decimal(hitter['安打']) -
            Decimal(hitter['三振'])) + XR_STRIKE_OUT * Decimal(
                hitter['三振']) + XR_DOUBLE_PLAY * Decimal(
                    hitter['併殺打']) + XR_SAC_FLY * Decimal(
                        hitter['犠飛']) + XR_SAC_BUNT * Decimal(
                            hitter['犠打'])
    return str(xr)


def rc_xr_27(hitter, rc_xr):
    total_out = Decimal(hitter['打数']) - Decimal(
        hitter['安打']) + Decimal(hitter['犠打']) + Decimal(
            hitter['犠飛']) + Decimal(
                hitter['盗塁死']) + Decimal(hitter['併殺打'])
    if not total_out:
        return '0'
    rc_xr_27 = rc_xr * FULL_OUTCOUNTS / total_out
    return str(rc_xr_27)
```

---

### おわり

`RC27`や`XR27`がマイナスになるのが欠陥なら、[`RC27`, 0]みたいに「マイナス値なら0に」ってしたら解決しそうな気がするけど、だめなんですかね？

でもマイナスを示す選手と0を示す選手が同じ評価、というのもやっぱり欠陥かもしれない。

こちらもリーグ平均と比較しての応用指標があるので、それはまた今度。

- [[参考記事]【【RCWIN, XRWIN】NPB(2019)セイバーメトリクス野手指標の算出⑥](https://www.ted027.com/post/sabr-hit-rcaa)


---

- [[参考記事]Pythonでプロ野球の個人成績一覧をJSONにして取得する](https://www.ted027.com/post/python-personal-records)

- [[参考記事]【wOBA】NPB(2019)セイバーメトリクス野手指標の算出①](https://www.ted027.com/post/sabr-hit-woba)

---

{{< ad/con/wide/python_taikutsu >}}

---

{{< ad/a8/dazn>}}

---
