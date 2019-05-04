---
title: "JSONで取得したプロ野球個人成績にwOBA,BB/Kを追加する"
date: 2019-05-04T22:25:17+09:00
draft: false
comments: true
categories: ["野球"]
tags: ["プロ野球", "Python", "セイバーメトリクス"]
---

打者の得点への貢献度を表すwOBA、選球眼を表すBB/Kを算出し追加する。

<!--more-->

---

{{< ad/a8/skyperfect>}}

---

{{< ad/con/wide/purosupi2019>}}

---

- [[参考記事]Pythonでプロ野球の個人成績一覧をJSONにして取得する](https://www.ted027.com/post/python-personal-records)

- [[参考記事]JSONで取得したプロ野球個人成績にQS率,K/BB,WHIP(,他)を追加する](https://www.ted027.com/post/sabr-1)

---

### 指標の説明

#### wOBA (weighted On-Base Average)

1打席あたりの得点貢献を表す指標。スケールは出塁率に合うように調整されており、.320程度が平均とされる。

同じく打者の得点能力を表す指標として`OPS`があるが、`OPS`は出塁率と長打率を同スケールで扱うため、高い値が出やすい長打率の影響が大きく、ロングヒッターが高評価されやすいという欠点がある。

一方`wOBA`では、実際の試合経過から、各打席結果が得点期待値にどの程度影響を与えたかを算出し、それぞれに係数として掛け合わせる。これにより、`OPS`以上に得点相関が高い指標として導出される。

そのため係数はリーグやシーズンによって異なるが、今回は[DELTA Inc.](https://1point02.jp/op/gnav/glossary/gls_explanation.aspx?eid=20004)で紹介されているNPB版の式を利用する。

#### Standard wOBA

「シーズンやリーグごとに係数を変えても影響は微々たるもの」として、上記係数を固定したバージョンの`wOBA`。

打席結果のみ考慮するBasic版と、盗塁を加味するSpeed版がある。

なお、

`失策出塁に関してはデータの入手が難しいため、手に入らない場合は無視してもよいとしている。`(Wikipedia)

この記述に甘え、今回は失策出塁を無視させていただく。

---

### 追加する指標

#### wOBA

- {0.692 * (四球 - 故意四球) + 0.73 * 死球 + 0.865 * 単打 + 1.334 * 二塁打 + 1.725 * 三塁打 + 2.065 * 本塁打} / (打数 + 四球 - 故意四球 + 死球 + 犠飛)
- OPSより正当な打者の得点能力評価
- 出塁率と同等の基準で評価

#### wOBA(Basic)

- {0.7 * (四球 + 死球 - 故意四球) + 0.9 * 単打 + 1.3 * (二塁打 + 三塁打) + 2.0 * 本塁打} / (打数 - 故意四球 -犠打)
- 係数を固定したwOBA
- 打席結果のみを考慮する

#### wOBA(Speed)

- {0.7 * (四球 + 死球 - 故意四球) + 0.9 * 単打 + 1.25 * 二塁打 + 1.6 * 三塁打 + 2.0 * 本塁打 + 0.25 * 盗塁 - 0.5 * 盗塁死} / (打数 - 故意四球 -犠打)
- 係数を固定したwOBA
- 打席結果と盗塁の成否を考慮する

#### BB/K
- 四球 / 三振
- ゾーン管理能力(選球眼)

---

### 実装

```py:sabr.py
WOBA_BB = 0.692
WOBA_HBP = 0.73
WOBA_SINGLE = 0.865
WOBA_DOUBLE = 1.334
WOBA_TRIPLE = 1.725
WOBA_HR = 2.065


def _int_records(player, item):
    return int(player['Records'][item])


def _single(hitter):
    return _int_records(hitter, '安打') - _int_records(
        hitter, '二塁打') - _int_records(hitter, '三塁打') - _int_records(
            hitter, '本塁打')


def woba(hitter):
    atbat = hitter['Records']['打席']
    if atbat == '0' or atbat == '-':
        woba = '-'
    else:
        numerator = WOBA_BB * (_int_records(hitter, '四球') - _int_records(
            hitter, '故意四球')) + WOBA_HBP * _int_records(
                hitter, '死球'
            ) + WOBA_SINGLE * _single(hitter) + WOBA_DOUBLE * _int_records(
                hitter, '二塁打') + WOBA_TRIPLE * _int_records(
                    hitter, '三塁打') + WOBA_HR * _int_records(hitter, '本塁打')
        denominator = _int_records(hitter, '打数') + _int_records(
            hitter, '四球') - _int_records(hitter, '故意四球') + _int_records(
                hitter, '死球') + _int_records(hitter, '犠飛')
        woba = numerator / denominator
    hitter['Records']['wOBA'] = str(woba)[1:]


def woba_basic(hitter):
    atbat = hitter['Records']['打席']
    if atbat == '0' or atbat == '-':
        woba_b = '-'
    else:
        numerator = 0.7 * (_int_records(hitter, '四球') + _int_records(
            hitter, '死球') - _int_records(hitter, '故意四球')) + 0.9 * _single(
                hitter) + 1.3 * (_int_records(hitter, '二塁打') + _int_records(
                    hitter, '三塁打')) + 2.0 * _int_records(hitter, '本塁打')
        denominator = _int_records(hitter, '打数') - _int_records(
            hitter, '故意四球') - _int_records(hitter, '犠打')
        woba_b = numerator / denominator
    hitter['Records']['wOBA(Basic)'] = str(woba_b)[1:]


def woba_speed(hitter):
    atbat = hitter['Records']['打席']
    if atbat == '0' or atbat == '-':
        woba_s = '-'
    else:
        numerator = 0.7 * (_int_records(hitter, '四球') + _int_records(
            hitter, '死球') - _int_records(
                hitter, '故意四球')) + 0.9 * _single(hitter) + 1.25 * _int_records(
                    hitter, '二塁打'
                ) + 1.6 * _int_records(hitter, '三塁打') + 2.0 * _int_records(
                    hitter, '本塁打') + 0.25 * _int_records(
                        hitter, '盗塁') - 0.5 * _int_records(hitter, '盗塁死')
        denominator = _int_records(hitter, '打数') - _int_records(
            hitter, '故意四球') - _int_records(hitter, '犠打')
        woba_s = numerator / denominator
    hitter['Records']['wOBA(Speed)'] = str(woba_s)[1:]


def bb_per_k(hitter):
    k = hitter['Records']['三振']
    if k == '0' or k == '-':
        bb_per_k = '-'
    else:
        bb_per_k = _int_records(hitter, '四球') * 1.0 / int(k)
    hitter['Records']['BB/K'] = str(bb_per_k)
```

---

### おわり

成績をかき集める際にリーグ全体成績も取得するようにすると、`wRAA`, `wRC`も算出できるようになる。

---

{{< ad/con/wide/mlbtheshow19>}}

---

{{< ad/a8/skyperfect>}}

---