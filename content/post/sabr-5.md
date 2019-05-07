---
title: "【打者総合指標-2】プロ野球個人成績からセイバーメトリクス打者指標を算出する④"
date: 2019-05-07T00:08:58+09:00
draft: false
comments: true
categories: ["野球"]
tags: ["打者指標", "Python", "セイバーメトリクス", "得点能力"]
---

打者の総合指標RCとXRを追加する。感覚的にはwOBAに近く、同じくらいメジャーな印象。

<!--more-->

---

{{< ad/a8/skyperfect>}}

---

{{< ad/con/wide/purosupi2019>}}

---

- [[参考記事]Pythonでプロ野球の個人成績一覧をJSONにして取得する](https://www.ted027.com/post/python-personal-records)

- [[参考記事]【打者総合指標-1】プロ野球個人成績からセイバーメトリクス打者指標を算出する①](https://www.ted027.com/post/sabr-2)

- [[参考記事]【選球眼】プロ野球個人成績からセイバーメトリクス打者指標を算出する③](https://www.ted027.com/post/sabr-4)

---

### 追加する指標

#### RC (Runs Created)

- 打者の得点貢献度
- 積み上げ式、合計何点分の貢献をしたか

選手の得点を生み出す能力を評価する指標。「当該選手が何点分貢献したか」を表す指標で、チームの全打者のRCを足すと、チームの総得点とほぼ同じになるように作られている。打席数が多いほど数字も大きくなる。

以前取り上げた打撃総合指標[`wOBA`](https://www.ted027.com/post/sabr-2)との違いは、盗塁や盗塁死といった走塁能力も苦慮している点や、犠打や犠飛、併殺や三振といった打席結果にも細かくポイントが振られている点。

##### 計算式

$(2.4 * C + A) * (3 * C + B）/ (9 * C)\\\\\\ - 0.9 * C\\\\\\
\\\\\\
A = 安打 + 四球 + 死球 - 盗塁死 - 併殺打\\\\\\
B = 塁打 + 0.26 * (四球 + 死球)\\\\\\ + 0.53 * (犠飛 + 犠打) + 0.64 * 盗塁\\\\\\ - 0.03 * 三振\\\\\\
C = 打数 + 四球 + 死球 + 犠飛 + 犠打$

---

#### RC27 (Runs Created per 27 outs)

- 打者の得点貢献度
- 当該打者のみで一試合したら何点取れるか

`RC`は打席数に伴い増加するため、打席数の異なる選手同士を比較できない。

そこで、当該選手が27アウトを献上するまでに稼ぐ`RC`を算出したものがこの指標。

「当該選手だけで一試合戦った場合に何点取れるか」を表す指標だが、マイナスになる可能性がある点は指標の欠陥として指摘されている。

##### 計算式

$RC * \frac{27}{打数 - 安打 + 犠打 + 犠飛 + 盗塁死 + 併殺打}$

---

#### XR (eXtrapolated Runs)

- 打者の得点貢献度
- 積み上げ式、合計何点分の貢献をしたか

RCの改良版。計算式は異なるが、指標の意味合いとしては同じ。

##### 計算式

$0.5 * 単打 + 0.72 * 二塁打 + 1.04 * 三塁打\\\\\\ + 1.44 * 本塁打 + 0.34 * (四死球 - 故意四球)\\\\\\
     + 0.25 * 故意四球 + 0.18 * 盗塁 - 0.32 * 盗塁死\\\\\\ - 0.09 * (打数 - 安打 - 三振) - 0.098 * 三振\\\\\\
     - 0.37 * 併殺打 + 0.37 * 犠飛 + 0.04 * 犠打$

---

#### XR27 (eXtrapolated Runs per 27 outs)

- 打者の得点貢献度
- 当該打者のみで一試合したら何点取れるか

こちらもRC27と同様、当該選手が27アウトを献上するまでに稼ぐ`XR`を表す。

##### 計算式

$XR * \frac{27}{打数 - 安打 + 犠打 + 犠飛 + 盗塁死 + 併殺打}$

---

### 実装

```py:sabr.py
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
    opportunity = Decimal(hitter['Records']['打数']) + Decimal(
        hitter['Records']['四球']) + Decimal(hitter['Records']['死球']) + Decimal(
            hitter['Records']['犠打']) + Decimal(hitter['Records']['犠飛'])
    if not opportunity:
        rc = -1
    else:
        on_base = Decimal(hitter['Records']['安打']) + Decimal(
            hitter['Records']['四球']) + Decimal(
                hitter['Records']['死球']) - Decimal(
                    hitter['Records']['盗塁死']) - Decimal(
                        hitter['Records']['併殺打'])
        advance_base = Decimal(hitter['Records']['塁打']) + Decimal('0.26') * (
            Decimal(hitter['Records']['四球']) + Decimal(hitter['Records']['死球'])
        ) + Decimal('0.53') * (Decimal(hitter['Records']['犠飛']) +
                    Decimal(hitter['Records']['犠打'])) + Decimal('0.64' * Decimal(
                        hitter['Records']['盗塁']) - Decimal('0.03') * Decimal(
                            hitter['Records']['三振'])
        raw_rc = ((on_base + Decimal('2.4') * opportunity) *
                  (advance_base + Decimal('3') * opportunity) /
                  (Decimal('9') * opportunity)) - Decimal('0.9') * opportunity
        rc = _digits_under_one(raw_rc, 2)
    hitter['Records']['RC'] = str(rc)


def rc_27(hitter, raw_rc):
    total_out = Decimal(hitter['Records']['打数']) - Decimal(
        hitter['Records']['安打']) + Decimal(hitter['Records']['犠打']) + Decimal(
            hitter['Records']['犠飛']) + Decimal(
                hitter['Records']['盗塁死']) + Decimal(hitter['Records']['併殺打'])
    if not total_out:
        rc_27 = -1
    else:
        raw_rc_27 = raw_rc * 27 / total_out
        rc_27 = _digits_under_one(raw_rc_27, 2)
    hitter['Records']['RC27'] = str(rc_27)


def xr_basic(hitter):
    raw_xr = XR_SINGLE * _single(hitter) + XR_DOUBLE * Decimal(
        hitter['Records']['二塁打']
    ) + XR_TRIPLE * Decimal(hitter['Records']['三塁打']) + XR_HR * Decimal(
        hitter['Records']['本塁打']) + XR_BB * (
            Decimal(hitter['Records']['四球']) + Decimal(
                hitter['Records']['死球']) - Decimal(hitter['Records']['故意四球'])
        ) + XR_IBB * Decimal(hitter['Records']['故意四球']) + XR_STEAL * Decimal(
            hitter['Records']['盗塁']
        ) + XR_FAILED_STEAL * Decimal(hitter['Records']['盗塁死']) + XR_OUT * (
            Decimal(hitter['Records']['打数'])
            - Decimal(hitter['Records']['安打']) -
            Decimal(hitter['Records']['三振'])) + XR_STRIKE_OUT * Decimal(
                hitter['Records']['三振']) + XR_DOUBLE_PLAY * Decimal(
                    hitter['Records']['併殺打']) + XR_SAC_FLY * Decimal(
                        hitter['Records']['犠飛']) + XR_SAC_BUNT * Decimal(
                            hitter['Records']['犠打'])
    xr = _digits_under_one(raw_xr, 2)
    hitter['Records']['XR'] = str(xr)


def xr_27(hitter, raw_xr):
    total_out = Decimal(hitter['Records']['打数']) - Decimal(
        hitter['Records']['安打']) + Decimal(hitter['Records']['犠打']) + Decimal(
            hitter['Records']['犠飛']) + Decimal(
                hitter['Records']['盗塁死']) + Decimal(hitter['Records']['併殺打'])
    if not total_out:
        xr_27 = -1
    else:
        raw_xr_27 = xr * 27 / total_out
        xr_27 = _digits_under_one(raw_xr_27, 2)
    hitter['Records']['XR27'] = str(xr_27)
```

---

### おわり

犠打の得点貢献がめちゃめちゃ低い。

こちらもリーグ平均と比較しての応用指標があるので、それはまた今度。

---

{{< ad/con/wide/sabr_omata>}}

---

{{< ad/a8/skyperfect>}}

---