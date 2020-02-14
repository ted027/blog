---
title: "【WHIP, K/BB他】NPB(2019)セイバーメトリクス投手指標の算出①"
date: 2019-05-04T00:08:02+09:00
draft: false
comments: true
categories: ["野球"]
tags: ["投手指標", "Python", "セイバーメトリクス"]
---

以前取得したプロ野球の個人成績に、簡単な計算で算出できる投手指標をいくつか追加する。

<!--more-->

---

{{< ad/a8/skyperfect >}}

---

{{< ad/con/wide/purosupi2019>}}

---

今回追加するのはごくごく簡単な指標6つ。

というか3つは既に取れているので実施3つ

---

- [[参考記事]Pythonでプロ野球の個人成績一覧をJSONにして取得する](https://www.ted027.com/post/python-personal-records)

---

### 追加する指標

#### QS率

$\frac{QS}{先発登板}$

- 先発登板のうちQS（6回以上3失点以内）に抑えた割合

---

#### K/BB

- 投手の三振奪取力と制球力の総合指標

$\frac{奪三振}{与四球}$

---

#### K/9

- 9イニングあたり何奪三振とるか（奪三振率）

$奪三振 \times \frac{9}{投球回}$

---

#### BB/9

- 9イニングあたり何四球与えるか

$与四球 \times \frac{9}{投球回}$

---

#### HR/9

- 9イニングあたり何本塁打打たれるか

$被本塁打 \times \frac{9}{投球回}$

---

#### K%

- 打者と対戦し奪三振を取る確率
- [K/9(奪三振率)](#k-9)は味方守備力の影響を受けるのに対し、こちらは純粋に投手の奪三振能力のみを評価できる
    - こちらのほうが本来の意味で「奪三振率」ともいえる

$\frac{奪三振}{打席}$

---

#### BB%

- 打者と対戦し四球を与える確率
- [BB/9](#bb-9)は味方守備力の影響を受けるのに対し、こちらは純粋に投手の四球回避能力のみを評価できる

$\frac{四球}{打席}$

---

#### WHIP

- 1イニングあたり何人（安打と四球の）走者を出すか

$\frac{与四球 + 被安打}{投球回}$

---

### 実装

```py:sabr.py
FULL_OUTCOUNTS = Decimal('27')

def _return_outcounts(innings):
    int_innings = int(innings)
    dec_innings = innings - int_innings
    return 3 * int_innings + 10 * dec_innings


def qs_rate(pitcher):
    start = Decimal(pitcher['先発'])
    if not start:
        return '0'
    qsrate = Decimal(pitcher['QS']) * 100 / start
    return str(qsrate)


def k_per_bb(pitcher):
    bb = Decimal(pitcher['与四球'])
    k = Decimal(pitcher['奪三振'])
    if not k:
        return '0'
    elif not bb:
        return '99.99'
    k_per_bb = k / bb
    return  str(k_per_bb)


def k_per_nine(pitcher):
    innings = Decimal(pitcher['投球回'])
    outcounts = return_outcounts(innings)
    if not outcounts:
        return '0'
    k_per_n = Decimal(pitcher['奪三振']) * FULL_OUTCOUNTS / outcounts
    return str(k_per_n)


def bb_per_nine(pitcher):
    bb = Decimal(pitcher['与四球'])
    innings = Decimal(pitcher['投球回'])
    outcounts = return_outcounts(innings)
    if not bb:
        return '0'
    elif not outcounts:
        return '99.99'
    bb_per_n = bb * FULL_OUTCOUNTS / outcounts
    return str(bb_per_n)


def hr_per_nine(pitcher):
    hr = Decimal(pitcher['被本塁打'])
    innings = Decimal(pitcher['投球回'])
    outcounts = return_outcounts(innings)
    if not hr:
        return '0'
    elif not outcounts:
        return '99.99'
    hr_per_n = hr * FULL_OUTCOUNTS / outcounts
    return str(hr_per_n)


def whip(pitcher):
    runner = Decimal(pitcher['与四球']) + Decimal(pitcher['被安打'])
    innings = Decimal(pitcher['投球回'])
    outcounts = return_outcounts(innings)
    if not runner:
        return '0'
    elif not outcounts:
        return '99.99'
    whip = runner * 3 / outcounts
    return str(whip)
```

---

### おわり

特筆すべきこともない実装ですが、今後ぽつぽつと指標は追加していきたい。

---

- [[参考記事]Pythonでプロ野球の個人成績一覧をJSONにして取得する](https://www.ted027.com/post/python-personal-records)

- [[参考記事]【wOBA】NPB(2019)セイバーメトリクス野手指標の算出①](https://www.ted027.com/post/sabr-hit-woba)

- [[参考記事]【FIP】NPB(2019)セイバーメトリクス投手指標の算出②](https://www.ted027.com/post/sabr-pitch-fip)

---

{{< ad/con/wide/python_analytics >}}

---

{{< ad/a8/techacademy2 >}}

---
