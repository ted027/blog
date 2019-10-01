---
title: "【wOBA】NPB(2019)セイバーメトリクス野手指標の算出①"
date: 2019-05-04T22:25:17+09:00
draft: false
comments: true
categories: ["野球"]
tags: ["野手指標", "Python", "セイバーメトリクス", "得点能力"]
---

打者の得点への貢献度を表すwOBAを算出し追加する。

<!--more-->

---

{{< ad/a8/dazn >}}

---

{{< ad/con/wide/purosupi2019 >}}

---

### 追加する指標

#### wOBA (weighted On-Base Average)

- 打者の得点貢献度
- 出塁率と同等の基準で評価

1打席あたりの得点貢献を表す指標。スケールは出塁率に合うように調整されており、.320程度が平均とされる。

同じく打者の得点能力を表す指標として`OPS`があるが、`OPS`は出塁率と長打率を同スケールで扱うため、高い値が出やすい長打率の影響が大きく、ロングヒッターが高評価されやすいという欠点がある。

一方`wOBA`では、実際の試合経過から、各打席結果が得点期待値にどの程度影響を与えたかを算出し、それぞれに係数として掛け合わせる。これにより、`OPS`以上に得点相関が高い指標として導出される。

そのため係数はリーグやシーズンによって異なるが、今回は[DELTA Inc.](https://1point02.jp/op/gnav/glossary/gls_explanation.aspx?eid=20004)で紹介されているNPB版の式を利用する。

##### 計算式

${0.692 \times (四球 - 故意四球) + 0.73 \times 死球\\\\\\ + 0.865 \times 単打 + 1.334 \times 二塁打\\\\\\ + 1.725 \times 三塁打 + 2.065 \times 本塁打}\\\\\\ \div (打数 + 四球 - 故意四球 + 死球 + 犠飛)$

---

#### wOBA(Basic)

- 係数を固定したwOBA
- 打席結果のみを考慮する

「シーズンやリーグごとに係数を変えても影響は微々たるもの」として、上記係数を固定した`Standard wOBA`。

打席結果のみ考慮するBasic版。

##### 計算式

${0.7 \times (四球 + 死球 - 故意四球) + 0.9 \times 単打\\\\\\ + 1.3 \times (二塁打 + 三塁打) + 2.0 \times 本塁打}\\\\\\ \div (打席 - 故意四球 - 犠打)$

---

#### wOBA(Speed)

- 係数を固定したwOBA
- 打席結果と盗塁の成否を考慮する

「シーズンやリーグごとに係数を変えても影響は微々たるもの」として、上記係数を固定したバージョンの`wOBA`。

盗塁を加味するSpeed版。

##### 計算式

$(0.7 \times (四球 + 死球 - 故意四球) + 0.9 \times 単打\\\\\\ + 1.25 \times 二塁打 + 1.6 \times 三塁打\\\\\\ + 2.0 \times 本塁打 + 0.25 \times 盗塁 - 0.5 \times 盗塁死)\\\\\\ \div (打席 - 故意四球 - 犠打)$

---

なお、

`失策出塁に関してはデータの入手が難しいため、手に入らない場合は無視してもよいとしている。`(Wikipedia)

この記述に甘え、失策出塁を無視させていただくことに。

---

### 実装

```py:sabr.py
WOBA_BB = 0.692
WOBA_HBP = 0.73
WOBA_SINGLE = 0.865
WOBA_DOUBLE = 1.334
WOBA_TRIPLE = 1.725
WOBA_HR = 2.065


def _single(hitter):
    return (Decimal(hitter['安打']) - Decimal(hitter['二塁打']) -
            Decimal(hitter['三塁打']) - Decimal(hitter['本塁打']))


def woba(hitter):
    denominator = Decimal(hitter['打数']) + Decimal(
        hitter['四球']) - Decimal(hitter['故意四球']) + Decimal(
            hitter['死球']) + Decimal(hitter['犠飛'])
    if not denominator:
        return '0'
    numerator = WOBA_BB * (Decimal(hitter['四球']) - Decimal(
        hitter['故意四球'])) + WOBA_HBP * Decimal(hitter[
            '死球']) + WOBA_SINGLE * _single(hitter) + WOBA_DOUBLE * Decimal(
                hitter['二塁打']) + WOBA_TRIPLE * Decimal(
                    hitter['三塁打']) + WOBA_HR * Decimal(
                        hitter['本塁打'])
    woba = numerator / denominator
    return str(woba)


def woba_basic(hitter):
    denominator = Decimal(hitter['打席']) - Decimal(
        hitter['故意四球']) - Decimal(hitter['犠打'])
    if not denominator:
        return '0'
    numerator = Decimal('0.7') * (
        Decimal(hitter['四球']) + Decimal(hitter['死球']) -
        Decimal(hitter['故意四球'])) + Decimal('0.9') * _single(hitter) + Decimal('1.3') * (
            Decimal(hitter['二塁打']) + Decimal(hitter['三塁打'])
        ) + Decimal('2.0') * Decimal(hitter['本塁打'])
    woba_b = numerator / denominator
    return str(woba_b)


def woba_speed(hitter):
    denominator = Decimal(hitter['打席']) - Decimal(
        hitter['故意四球']) - Decimal(hitter['犠打'])
    if not denominator:
        return '0'
    numerator = Decimal('0.7') * (
        Decimal(hitter['四球']) + Decimal(hitter['死球']) -
        Decimal(hitter['故意四球'])) + Decimal('0.9') * _single(
            hitter) + Decimal('1.25') * Decimal(hitter['二塁打']) + Decimal('1.6') * Decimal(
                hitter['三塁打']) + Decimal('2.0') * Decimal(
                    hitter['本塁打']) + Decimal('0.25') * Decimal(
                        hitter['盗塁']) - Decimal('0.5') * Decimal(
                            hitter['盗塁死'])
    woba_s = numerator / denominator
    return str(woba_s)
```

最新の成績は以下から閲覧できます。

- [プロ野球成績表 - 行けたら行く](https://www.ted027.com/records/)

---

### おわり

成績をかき集める際にリーグ全体成績も取得するようにすると、[`wRAA`](https://www.ted027.com/post/sabr-hit-wraa#wraa-weighted-runs-above-average), [`wRC`](https://www.ted027.com/post/sabr-hit-wraa#wrc-weighted-runs-created)も算出できるようになる。

---

- [[参考記事]Pythonでプロ野球の個人成績一覧をJSONにして取得する](https://www.ted027.com/post/python-personal-records)

- [[参考記事]【RC, RC27, XR, XR27】NPB(2019)セイバーメトリクス野手指標の算出④](https://www.ted027.com/post/sabr-hit-rc)

- [[参考記事]【wRAA, wRC】NPB(2019)セイバーメトリクス野手指標の算出⑤](https://www.ted027.com/post/sabr-hit-wraa)

---

{{< ad/con/wide/python_dokugaku >}}

---

{{< ad/a8/dazn >}}

---
