---
title: "【後半】パークファクターの算出で大いに躓く②"
date: 2019-05-22T13:15:37+09:00
draft: false
comments: true
categories: ["野球"]
tags: ["Python", "セイバーメトリクス", "パークファクター"]
---

前半からの続き。今回で実際にパークファクター（参考値）を算出する。

<!--more-->

---

{{< ad/a8/dazn >}}

---

{{< ad/con/wide/purosupi2019>}}

---

### 前半

[【前半】パークファクターの算出で大いに躓く①](https://www.ted027.com/post/sabr-parkfactor-1)

---

### 追加する指標

#### 得点パークファクター

東京ドームのパークファクターであれば、巨人の東京ドームでの成績、及び東京ドーム以外での成績、を用いて計算します。（ホームでの成績、ビジターでの成績ではない）

$\frac{本拠地での得点 + 失点 \div 本拠地での試合数}{本拠地以外での得点 + 失点 \div 本拠地以外での試合数}$

---

#### 本塁打パークファクター

$\frac{本拠地での本塁打 + 被本塁打 \div 本拠地での試合数}{本拠地以外での本塁打 + 被本塁打 \div 本拠地以外での試合数}$

---

### 実装で躓く

前回、（妥協込みで）チームごとに、本拠地/非本拠地での試合数および成績を算出した。

今回はこれをもとにパークファクターを算出したい。

したいところだったが、またもデータ不足で悩まされることに。

#### 問題

1. 球場ごと打撃成績で`打点`は分かるが`得点`が分からない
2. 球場ごと打撃成績で投手の打撃成績が含まれない

#### 妥協

あまり妥協したくない問題ではあったものの、やはり取れないものは仕方ない。

`本拠地チーム以外11球団の、該当球場での投手成績(失点)`を使おうかとも考えたけど、日本ハムや楽天が東京ドームを使ったり、阪神が京セラドームを使ったりもするので、どうやっても妥協は入ってしまう。

仕方がないので、以下の注釈をつけ、`正確ではない参考値のパークファクター`として算出することにする。

1. 本パークファクター(参考値)では、該当球場/非該当球場における、該当球場を本拠地とするチームの、打点に含まない得点（併殺の間やエラーによる得点など）は考慮しない
1. 本パークファクター(参考値)では、該当球場/非該当球場における、該当球場を本拠地とするチームの、投手の打撃成績は考慮しない

本拠地か非本拠地かで取れる情報が変わるわけではないので、パークファクターの値自体にそこまで深刻な影響を与える妥協ではない…と思いたい。

---

### 実装

```py
def park_factor(team_dic, hit_str, pit_str):
    home_denominator = Decimal(team_dic['本拠地']['試合'])
    visitor_denominator = Decimal(team_dic['非本拠地']['試合'])
    if not home_denominator or not visitor_denominator:
        return '0'
    visitor = (Decimal(team_dic['非本拠地'][hit_str]) + Decimal(
        team_dic['非本拠地'][pit_str])) / visitor_denominator
    if not visitor:
        return '0'
    home = (Decimal(team_dic['本拠地'][hit_str]) + Decimal(
        team_dic['本拠地'][pit_str])) / home_denominator
    pf = home / visitor
    return str(park_factor)

...
def update_team_park_records():
    ...
    pf_list = []
    for team_dic in team_list:
        team = team_dic['チーム']
        # team_dic['球場'] = park_dic[team]
        team_dic['本拠地'] = park_dic[team][HOME_DIC[team]]
        sum_visitor_dic = {}
        sum_visitor_park_dick(sum_visitor_dic, park_dic[team], team)
        team_dic['非本拠地'] = sum_visitor_dic

        fix_rate_records(team_dic)

        pf_list.append({
            '球場': HOME_DIC[team],
            '得点PF': park_factor(team_dic, '打点', '失点'),
            'HRPF': park_factor(team_dic, '本塁打', '被本塁打')
        })
```

---

### 結果

先に述べたように、妥協を孕んだ参考値であり、正確な値でないことにはご注意ください。

参考程度に。

{{< img src="/img/parkfactor.png" >}}

最新は以下から閲覧できます。

- [プロ野球成績表 - 行けたら行く](https://www.ted027.com/records/)

---

### おわり

色々妥協してしまったが、それらしい値を出すことはできた。

次はこれを使って`wRC+`を算出したい。やはり参考値にはなってしまうけど。

---

- [[参考記事]「パークファクター補正をかけた○○」の算出](https://www.ted027.com/post/sabr-parkfactor-correct)

- [[参考記事]Pythonでプロ野球の個人成績一覧をJSONにして取得する](https://www.ted027.com/post/python-personal-records)

- [[参考記事]【wOBA】NPB(2019)セイバーメトリクス野手指標の算出①](https://www.ted027.com/post/sabr-hit-woba)

---

{{< ad/con/wide/python_analytics >}}

---

{{< ad/a8/dazn >}}

---
