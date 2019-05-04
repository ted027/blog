---
title: "JSONで取得した成績にQS率,K/BB,WHIP(,他)を追加する"
date: 2019-05-04T00:08:02+09:00
draft: false
comments: true
categories: ["野球"]
tags: ["プロ野球", "Python", "セイバーメトリクス"]
---

以前取得したプロ野球の個人成績に、簡単な計算で算出できる指標をいくつか追加する。

<!--more-->

---

{{< ad/a8/skyperfect>}}

---

{{< ad/con/wide/purosupi2019>}}

---

- [[参考記事]Pythonでプロ野球の個人成績一覧をJSONにして取得する](https://www.ted027.com/post/python-personal-records)

今回追加するのはごくごく簡単な指標6つ。

というか3つは既に取れているので実施3つ

---

### 指標の説明

- QS率
    - QS / 先発登板
    - 先発投手の安定感
    - 高いほどいい
- K/BB
    - 奪三振 / 与四球
    - 投手の三振奪取力と制球力の総合指標
    - 高いほどいい
- K/9
    - 奪三振 * 9 / 投球回
    - 9イニングあたり何奪三振とるか（奪三振率）
    - 高いほどいい
- BB/9
    - 与四球 * 9 / 投球回
    - 9イニングあたり何四球与えるか
    - 低いほどいい
- HR/9
    - 被本塁打 * 9 / 投球回
    - 9イニングあたり何本塁打打たれるか
    - 低いほどいい
- WHIP
    - (与四球 + 被安打) / 投球回
    - 1イニングあたり何人（安打と四球の）走者を出すか
    - 低いほどいい

---

### 実装

```py:sabr.py
def _return_outcounts(innings):
    if innings == '-':
        return 0
    dec_innings, int_innings = modf(innings)
    return 3 * int_innings + 10 * dec_innings


def qs_rate(pitcher):
    start = pitcher['Records']['先発']
    if start == '-':
        qsrate = '-'
    elif start == '0':
        qsrate = '0'
    else:
        qsrate = pitcher['Records']['QS'] * 100.0 / start
    pitcher['Records']['QS率'] = qsrate


def k_per_bb(pitcher):
    bb = pitcher['Records']['与四球']
    if not bb or bb == '-':
        k_per_bb = '-'
    else:
        k_per_bb = pitcher['Records']['奪三振'] + 1.0 / bb
    pitcher['Records']['K/BB'] = k_per_bb


def k_per_nine(pitcher):
    innings = pitcher['Records']['投球回']
    outcounts = _return_outcounts(innings)
    if not outcounts:
        k_per_n = '-'
    else:
        k_per_n = pitcher['Records']['奪三振'] * 27 * 1.0 / outcounts
    pitcher['Records']['K/9'] = k_per_n


def bb_per_nine(pitcher):
    innings = pitcher['Records']['投球回']
    outcounts = _return_outcounts(innings)
    if not outcounts:
        bb_per_n = '-'
    else:
        bb_per_n = pitcher['Records']['与四球'] * 27 * 1.0 / outcounts
    pitcher['Records']['BB/9'] = bb_per_n


def hr_per_nine(pitcher):
    innings = pitcher['Records']['投球回']
    outcounts = _return_outcounts(innings)
    if not outcounts:
        hr_per_n = '-'
    else:
        hr_per_n = pitcher['Records']['被本塁打'] * 27 * 1.0 / outcounts
    pitcher['Records']['HR/9'] = hr_per_n


def whip(pitcher):
    innings = pitcher['Records']['投球回']
    outcounts = _return_outcounts(innings)
    if not outcounts:
        whip = '-'
    else:
        whip = pitcher['Records']['与四球'] + pitcher['Records']['被安打'] / outcounts
    pitcher['Records']['WHIP'] = whip
```

---

### おわり

特に特筆すべきこともない実装ですが、今後ぽつぽつと指標は追加していきたい。

---

{{< ad/con/wide/mlbtheshow19>}}

---

{{< ad/a8/skyperfect>}}

---