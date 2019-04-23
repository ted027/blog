---
title: "パワプロ ペナントの補強思考設定（2019年4月時点）"
date: 2019-04-23T09:32:03+09:00
draft: false
comments: true
categories: ["パワプロ"]
tags: ["パワプロ2018", "ペナント", "補強思考", "Python"]
---

実況パワフルプロ野球のペナントモードで、各球団の補強思考を設定できる。

Pythonで近年の移籍情報を取得して、各球団の補強実績に即した設定を算出したい。

 <!--more-->

---

<a target="_blank" href="//af.moshimo.com/af/c/click?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062&amp;url=https%3A%2F%2Fwww.amazon.co.jp%2F%25E3%2580%2590PS4%25E3%2580%2591MLB-The-Show-19-%25E8%258B%25B1%25E8%25AA%259E%25E7%2589%2588%2Fdp%2FB07N8YZ3QJ" rel="nofollow"><img src="https://images-fe.ssl-images-amazon.com/images/I/516lcsxQbCL._SL160_.jpg" alt="" style="border: none;" /><br />【PS4】MLB The Show 19(英語版)</a><img src="//i.moshimo.com/af/i/impression?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062" alt="" width="1" height="1" style="border: 0px;" />

---

### 説明

自分がペナントを始めるときは、以下のサイトを参考に補強思考を設定していた。（ありがとうございます）

- [各球団のペナント補強思考【パワプロ2014】](http://disummer.blog.fc2.com/blog-entry-3.html)

とはいえ4年前時点でのデータなので、最新の情報が欲しいと思い、いい感じに計算するプログラムを作成。

条件判断は以下に記載。

- [パワプロ ペナント補強思考設定の条件判断を説明](https://www.ted027.com/post/penant-add-descript)

---

### 先に結論

書いてない項目は「おまかせ」で。

---

#### 広島
- トレード
    - 頻度
        - おまかせ
- 新外国人獲得
    - 頻度
        - おまかせ
    - 獲得方針
        - おまかせ
- ドラフト
    - 獲得方針
        - 将来性重視
- FA交渉
    - 自チームの選手に対して
        - 残留交渉する
    - 他チームの選手に対して
        - 消極的
    - 獲得方針
        - おまかせ
    - 人数
        - 一人
- ポスティング
    - 承認
        - おまかせ
    - 獲得方針
        - 消極的
- 契約更改
    - 解雇方針
        - 能力重視
- 自由契約選手獲得
    - 獲得方針
        - おまかせ

---

#### ヤクルト
- トレード
    - 頻度
        - おまかせ
- 新外国人獲得
    - 頻度
        - おまかせ
    - 獲得方針
        - ベテラン中心
- ドラフト
    - 獲得方針
        - 即戦力重視
- FA交渉
    - 自チームの選手に対して
        - 残留交渉する
    - 他チームの選手に対して
        - おまかせ
    - 獲得方針
        - 若さ重視
    - 人数
        - おまかせ
- ポスティング
    - 承認
        - おまかせ
    - 獲得方針
        - おまかせ
- 契約更改
    - 解雇方針
        - 能力重視
- 自由契約選手獲得
    - 獲得方針
        - おまかせ

---

#### 読売
- トレード
    - 頻度
        - 積極的
- 新外国人獲得
    - 頻度
        - おまかせ
    - 獲得方針
        - 若手中心
- ドラフト
    - 獲得方針
        - おまかせ
- FA交渉
    - 自チームの選手に対して
        - 残留交渉する
    - 他チームの選手に対して
        - 積極的
    - 獲得方針
        - 目玉選手重視
    - 人数
        - 複数人
- ポスティング
    - 承認
        - 承認しない
    - 獲得方針
        - おまかせ
- 契約更改
    - 解雇方針
        - 能力重視
- 自由契約選手獲得
    - 獲得方針
        - 経験重視

---

#### ＤｅＮＡ
- トレード
    - 頻度
        - おまかせ
- 新外国人獲得
    - 頻度
        - おまかせ
    - 獲得方針
        - おまかせ
- ドラフト
    - 獲得方針
        - おまかせ
- FA交渉
    - 自チームの選手に対して
        - 残留交渉する
    - 他チームの選手に対して
        - 積極的
    - 獲得方針
        - 単独交渉重視
    - 人数
        - おまかせ
- ポスティング
    - 承認
        - おまかせ
    - 獲得方針
        - おまかせ
- 契約更改
    - 解雇方針
        - 能力重視
- 自由契約選手獲得
    - 獲得方針
        - のびしろ重視

---

#### 中日
- トレード
    - 頻度
        - 消極的
- 新外国人獲得
    - 頻度
        - おまかせ
    - 獲得方針
        - おまかせ
- ドラフト
    - 獲得方針
        - 将来性重視
- FA交渉
    - 自チームの選手に対して
        - 残留交渉する
    - 他チームの選手に対して
        - おまかせ
    - 獲得方針
        - 単独交渉重視
    - 人数
        - おまかせ
- ポスティング
    - 承認
        - おまかせ
    - 獲得方針
        - 消極的
- 契約更改
    - 解雇方針
        - 能力重視
- 自由契約選手獲得
    - 獲得方針
        - 経験重視

---

#### 阪神
- トレード
    - 頻度
        - おまかせ
- 新外国人獲得
    - 頻度
        - おまかせ
    - 獲得方針
        - おまかせ
- ドラフト
    - 獲得方針
        - おまかせ
- FA交渉
    - 自チームの選手に対して
        - 残留交渉する
    - 他チームの選手に対して
        - おまかせ
    - 獲得方針
        - 経験重視
    - 人数
        - おまかせ
- ポスティング
    - 承認
        - おまかせ
    - 獲得方針
        - おまかせ
- 契約更改
    - 解雇方針
        - 能力重視
- 自由契約選手獲得
    - 獲得方針
        - おまかせ

---

#### 西武
- トレード
    - 頻度
        - 消極的
- 新外国人獲得
    - 頻度
        - おまかせ
    - 獲得方針
        - ベテラン中心
- ドラフト
    - 獲得方針
        - おまかせ
- FA交渉
    - 自チームの選手に対して
        - 残留交渉する
    - 他チームの選手に対して
        - 消極的
    - 獲得方針
        - おまかせ
    - 人数
        - 一人
- ポスティング
    - 承認
        - おまかせ
    - 獲得方針
        - 消極的
- 契約更改
    - 解雇方針
        - 能力重視
- 自由契約選手獲得
    - 獲得方針
        - おまかせ

---

#### ソフトバンク
- トレード
    - 頻度
        - おまかせ
- 新外国人獲得
    - 頻度
        - 消極的
    - 獲得方針
        - 若手中心
- ドラフト
    - 獲得方針
        - おまかせ
- FA交渉
    - 自チームの選手に対して
        - 残留交渉する
    - 他チームの選手に対して
        - 積極的
    - 獲得方針
        - 若さ重視
    - 人数
        - 複数人
- ポスティング
    - 承認
        - 承認しない
    - 獲得方針
        - 積極的
- 契約更改
    - 解雇方針
        - 能力重視
- 自由契約選手獲得
    - 獲得方針
        - おまかせ

---

#### 日本ハム
- トレード
    - 頻度
        - 積極的
- 新外国人獲得
    - 頻度
        - おまかせ
    - 獲得方針
        - 若手中心
- ドラフト
    - 獲得方針
        - 将来性重視
- FA交渉
    - 自チームの選手に対して
        - 残留交渉する
    - 他チームの選手に対して
        - 消極的
    - 獲得方針
        - 単独交渉重視
    - 人数
        - 一人
- ポスティング
    - 承認
        - おまかせ
    - 獲得方針
        - おまかせ
- 契約更改
    - 解雇方針
        - 能力重視
- 自由契約選手獲得
    - 獲得方針
        - おまかせ

---

#### オリックス
- トレード
    - 頻度
        - おまかせ
- 新外国人獲得
    - 頻度
        - おまかせ
    - 獲得方針
        - ベテラン中心
- ドラフト
    - 獲得方針
        - 即戦力重視
- FA交渉
    - 自チームの選手に対して
        - 残留交渉する
    - 他チームの選手に対して
        - おまかせ
    - 獲得方針
        - おまかせ
    - 人数
        - おまかせ
- ポスティング
    - 承認
        - おまかせ
    - 獲得方針
        - 積極的
- 契約更改
    - 解雇方針
        - 能力重視
- 自由契約選手獲得
    - 獲得方針
        - おまかせ

---

#### ロッテ
- トレード
    - 頻度
        - 消極的
- 新外国人獲得
    - 頻度
        - 積極的
    - 獲得方針
        - おまかせ
- ドラフト
    - 獲得方針
        - おまかせ
- FA交渉
    - 自チームの選手に対して
        - 残留交渉する
    - 他チームの選手に対して
        - おまかせ
    - 獲得方針
        - 目玉選手重視
    - 人数
        - おまかせ
- ポスティング
    - 承認
        - おまかせ
    - 獲得方針
        - おまかせ
- 契約更改
    - 解雇方針
        - 能力重視
- 自由契約選手獲得
    - 獲得方針
        - のびしろ重視

---

#### 楽天
- トレード
    - 頻度
        - 積極的
- 新外国人獲得
    - 頻度
        - おまかせ
    - 獲得方針
        - おまかせ
- ドラフト
    - 獲得方針
        - 即戦力重視
- FA交渉
    - 自チームの選手に対して
        - 残留交渉する
    - 他チームの選手に対して
        - おまかせ
    - 獲得方針
        - 目玉選手重視
    - 人数
        - おまかせ
- ポスティング
    - 承認
        - おまかせ
    - 獲得方針
        - おまかせ
- 契約更改
    - 解雇方針
        - 能力重視
- 自由契約選手獲得
    - 獲得方針
        - 経験重視

---

### やったこと

Pythonのwebスクレイビングと手書き()のJSONファイルを使って、過去の補強傾向から特徴を抽出しました。

細かい条件判断は[こちらに。](https://www.ted027.com/post/penant-add-descript)

---

### おわりに

ロッテが涌井とサブローの二人でまさかの目玉選手重視に。丸へのアプローチは必然だった。

阪神などあまり特徴が出せず残念。データ数増やしたり改善できたらまた更新します。

---

<a target="_blank" href="//af.moshimo.com/af/c/click?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062&amp;url=https%3A%2F%2Fwww.amazon.co.jp%2F%25E3%2582%25B3%25E3%2583%258A%25E3%2583%259F%25E3%2583%2587%25E3%2582%25B8%25E3%2582%25BF%25E3%2583%25AB%25E3%2582%25A8%25E3%2583%25B3%25E3%2582%25BF%25E3%2583%2586%25E3%2582%25A4%25E3%2583%25B3%25E3%2583%25A1%25E3%2583%25B3%25E3%2583%2588-%25E5%25AE%259F%25E6%25B3%2581%25E3%2583%2591%25E3%2583%25AF%25E3%2583%2595%25E3%2583%25AB%25E3%2583%2597%25E3%2583%25AD%25E9%2587%258E%25E7%2590%25832018-PS4%25E3%2580%2590Amazon-co-jp%25E9%2599%2590%25E5%25AE%259A%25E3%2580%2591%25E3%2582%25AA%25E3%2583%25AA%25E3%2582%25B8%25E3%2583%258A%25E3%2583%25AB%25E5%25A3%2581%25E7%25B4%2599-%25E9%2585%258D%25E4%25BF%25A1%2Fdp%2FB07KJNWQFL" rel="nofollow"><img src="https://images-fe.ssl-images-amazon.com/images/I/51LFkDMGvoL._SL160_.jpg" alt="" style="border: none;" /><br />実況パワフルプロ野球2018 - PS4【Amazon.co.jp限定】オリジナル壁紙 配信</a><img src="//i.moshimo.com/af/i/impression?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062" alt="" width="1" height="1" style="border: 0px;" />

---