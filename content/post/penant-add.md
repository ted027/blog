---
title: "パワプロ ペナントの補強思考設定（2019年4月時点）"
date: 2019-04-23T09:32:03+09:00
draft: false
comments: true
categories: ["パワプロ"]
tags: ["パワプロ2018", "ペナント", "補強思考", "野球"]
---

実況パワフルプロ野球のペナントモードで、各球団の補強思考を設定できる。

Pythonで近年の移籍情報を取得して、各球団の補強実績に即した設定を算出したい。

 <!--more-->

---

<div class="kaerebalink-box" style="text-align:left;padding-bottom:20px;font-size:small;zoom: 1;overflow: hidden;">
    <div class="kaerebalink-image" style="float:left;margin:0 15px 10px 0;"><a
            href="//af.moshimo.com/af/c/click?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062&amp;url=https%3A%2F%2Fwww.amazon.co.jp%2FPS4-%25E3%2583%2597%25E3%2583%25AD%25E9%2587%258E%25E7%2590%2583%25E3%2582%25B9%25E3%2583%2594%25E3%2583%25AA%25E3%2583%2583%25E3%2583%25842019-%25E3%2580%2590%25E5%25BA%2597%25E8%2588%2597%25E9%2599%2590%25E5%25AE%259A%25E6%2597%25A9%25E6%259C%259F%25E8%25B3%25BC%25E5%2585%25A5%25E7%2589%25B9%25E5%2585%25B8%25E3%2580%2591%25E6%25B5%25B7%25E5%25A4%2596%25E7%25A7%25BB%25E7%25B1%258D%25E9%2581%25B8%25E6%2589%258B%25E5%2585%2588%25E8%25A1%258C%25E5%2585%25A5%25E6%2589%258BDLC-%25E3%2580%2590Amazon-co-jp%25E9%2599%2590%25E5%25AE%259A%25E3%2580%2591%25E3%2582%25AA%25E3%2583%25AA%25E3%2582%25B8%25E3%2583%258A%25E3%2583%25ABPC-%25E3%2582%25B9%25E3%2583%259E%25E3%2583%259B%25E5%25A3%2581%25E7%25B4%2599%2Fdp%2FB07MVQLCR1"
            target="_blank" rel="nofollow"><img
                src="https://images-fe.ssl-images-amazon.com/images/I/51Nufh5pvYL._SL160_.jpg"
                style="border: none;" /></a><img
            src="//i.moshimo.com/af/i/impression?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062" width="1" height="1"
            style="border:none;"></div>
    <div class="kaerebalink-info" style="line-height:120%;zoom: 1;overflow: hidden;">
        <div class="kaerebalink-name" style="margin-bottom:10px;line-height:120%"><a
                href="//af.moshimo.com/af/c/click?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062&amp;url=https%3A%2F%2Fwww.amazon.co.jp%2FPS4-%25E3%2583%2597%25E3%2583%25AD%25E9%2587%258E%25E7%2590%2583%25E3%2582%25B9%25E3%2583%2594%25E3%2583%25AA%25E3%2583%2583%25E3%2583%25842019-%25E3%2580%2590%25E5%25BA%2597%25E8%2588%2597%25E9%2599%2590%25E5%25AE%259A%25E6%2597%25A9%25E6%259C%259F%25E8%25B3%25BC%25E5%2585%25A5%25E7%2589%25B9%25E5%2585%25B8%25E3%2580%2591%25E6%25B5%25B7%25E5%25A4%2596%25E7%25A7%25BB%25E7%25B1%258D%25E9%2581%25B8%25E6%2589%258B%25E5%2585%2588%25E8%25A1%258C%25E5%2585%25A5%25E6%2589%258BDLC-%25E3%2580%2590Amazon-co-jp%25E9%2599%2590%25E5%25AE%259A%25E3%2580%2591%25E3%2582%25AA%25E3%2583%25AA%25E3%2582%25B8%25E3%2583%258A%25E3%2583%25ABPC-%25E3%2582%25B9%25E3%2583%259E%25E3%2583%259B%25E5%25A3%2581%25E7%25B4%2599%2Fdp%2FB07MVQLCR1"
                target="_blank" rel="nofollow">プロ野球スピリッツ2019 【店舗限定早期購入特典】海外移籍選手先行入手DLC 配信
                【Amazon.co.jp限定】</a><img
                src="//i.moshimo.com/af/i/impression?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062" width="1" height="1"
                style="border:none;">
        </div>
        <div class="kaerebalink-detail" style="margin-bottom:5px;"></div>
        <div class="kaerebalink-link1" style="margin-top:10px;">
            <div class="shoplinkamazon"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 0 no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1414800&p_id=170&pc_id=185&pl_id=4062&s_v=b5Rz2P0601xu&url=https%3A%2F%2Fwww.amazon.co.jp%2Fgp%2Fsearch%3Fkeywords%3D%25E3%2583%2597%25E3%2583%25AD%25E9%2587%258E%25E7%2590%2583%25E3%2582%25B9%25E3%2583%2594%25E3%2583%25AA%25E3%2583%2583%25E3%2583%25842019%26__mk_ja_JP%3D%25E3%2582%25AB%25E3%2582%25BF%25E3%2582%25AB%25E3%2583%258A"
                    target="_blank" rel="nofollow">Amazonで調べる</a><img
                    src="//i.moshimo.com/af/i/impression?a_id=1414800&p_id=170&pc_id=185&pl_id=4062" width="1"
                    height="1" style="border:none;"></div>
            <div class="shoplinkrakuten"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -50px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1414727&p_id=54&pc_id=54&pl_id=616&s_v=b5Rz2P0601xu&url=https%3A%2F%2Fsearch.rakuten.co.jp%2Fsearch%2Fmall%2F%25E3%2583%2597%25E3%2583%25AD%25E9%2587%258E%25E7%2590%2583%25E3%2582%25B9%25E3%2583%2594%25E3%2583%25AA%25E3%2583%2583%25E3%2583%25842019%2F-%2Ff.1-p.1-s.1-sf.0-st.A-v.2%3Fx%3D0"
                    target="_blank" rel="nofollow">楽天市場で調べる</a><img
                    src="//i.moshimo.com/af/i/impression?a_id=1414727&p_id=54&pc_id=54&pl_id=616" width="1" height="1"
                    style="border:none;"></div>
            <div class="shoplinkyahoo"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -150px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1418766&p_id=1225&pc_id=1925&pl_id=18502&s_v=b5Rz2P0601xu&url=http%3A%2F%2Fsearch.shopping.yahoo.co.jp%2Fsearch%3Fp%3D%25E3%2583%2597%25E3%2583%25AD%25E9%2587%258E%25E7%2590%2583%25E3%2582%25B9%25E3%2583%2594%25E3%2583%25AA%25E3%2583%2583%25E3%2583%25842019"
                    target="_blank" rel="nofollow">Yahooショッピングで調べる</a><img
                    src="//i.moshimo.com/af/i/impression?a_id=1418766&p_id=1225&pc_id=1925&pl_id=18502" width="1"
                    height="1" style="border:none;"></div>
            <div class="shoplinkseven"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -100px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1414728&p_id=932&pc_id=1188&pl_id=12456&s_v=b5Rz2P0601xu&url=http%3A%2F%2F7net.omni7.jp%2Fsearch%2F%3Fkeyword%3D%25E3%2583%2597%25E3%2583%25AD%25E9%2587%258E%25E7%2590%2583%25E3%2582%25B9%25E3%2583%2594%25E3%2583%25AA%25E3%2583%2583%25E3%2583%25842019%26searchKeywordFlg%3D1"
                    target="_blank"
                    rel="nofollow"><img src="//i.moshimo.com/af/i/impression?a_id=1414728&p_id=932&pc_id=1188&pl_id=12456" width="1" height="1" style="border:none;">7netで調べる
                        </a> </div> </div> </div> <div class="booklink-footer" style="clear: left"></div>
        </div>

---

### 説明

自分がペナントを始めるときは、以下のサイトを参考に補強思考を設定していた。（ありがとうございます）

- [各球団のペナント補強思考【パワプロ2014】](http://disummer.blog.fc2.com/blog-entry-3.html)

とはいえ4年前時点でのデータなので、最新の情報が欲しいと思い、いい感じに計算するプログラムを作成。

条件判断は以下に記載。

- [パワプロ ペナント補強思考設定の条件判断を説明](https://www.ted027.com/post/penant-add-descript)

---

{{< img src="/img/penant-add-f.png" >}}

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

#### 読売
- トレード
    - 頻度
        - 積極的
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
        - 消極的
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
        - 若手中心
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
        - のびしろ重視

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
        - 経験重視

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
        - 積極的
    - 獲得方針
        - 経験重視
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
        - ベテラン中心
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
        - 消極的
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

Pythonのwebスクレイビングと手書き（）のJSONファイルを使って、過去の補強傾向から特徴を抽出しました。

細かい条件判断は[こちらに。](https://www.ted027.com/post/penant-add-descript)

---

### おわり

ロッテが涌井とサブローの二人でまさかの目玉選手重視に。丸へのアプローチは必然だった。

データ数増やしたり改善できたらまた更新します。

---

<div class="kaerebalink-box" style="text-align:left;padding-bottom:20px;font-size:small;zoom: 1;overflow: hidden;">
    <div class="kaerebalink-image" style="float:left;margin:0 15px 10px 0;"><a
            href="//af.moshimo.com/af/c/click?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062&amp;url=https%3A%2F%2Fwww.amazon.co.jp%2F%25E3%2580%2590PS4%25E3%2580%2591MLB-The-Show-19-%25E8%258B%25B1%25E8%25AA%259E%25E7%2589%2588%2Fdp%2FB07N8YZ3QJ"
            target="_blank" rel="nofollow"><img
                src="https://images-fe.ssl-images-amazon.com/images/I/516lcsxQbCL._SL160_.jpg"
                style="border: none;" /></a><img
            src="//i.moshimo.com/af/i/impression?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062" width="1" height="1"
            style="border:none;"></div>
    <div class="kaerebalink-info" style="line-height:120%;zoom: 1;overflow: hidden;">
        <div class="kaerebalink-name" style="margin-bottom:10px;line-height:120%"><a
                href="//af.moshimo.com/af/c/click?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062&amp;url=https%3A%2F%2Fwww.amazon.co.jp%2F%25E3%2580%2590PS4%25E3%2580%2591MLB-The-Show-19-%25E8%258B%25B1%25E8%25AA%259E%25E7%2589%2588%2Fdp%2FB07N8YZ3QJ"
                target="_blank" rel="nofollow">MLB The Show 19(エムエルビーザショウ19)〈Sony〉</a><img
                src="//i.moshimo.com/af/i/impression?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062" width="1" height="1"
                style="border:none;">
        </div>
        <div class="kaerebalink-detail" style="margin-bottom:5px;"></div>
        <div class="kaerebalink-link1" style="margin-top:10px;">
            <div class="shoplinkamazon"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 0 no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1414800&p_id=170&pc_id=185&pl_id=4062&s_v=b5Rz2P0601xu&url=https%3A%2F%2Fwww.amazon.co.jp%2Fgp%2Fsearch%3Fkeywords%3Dmlb%2520the%2520show%26__mk_ja_JP%3D%25E3%2582%25AB%25E3%2582%25BF%25E3%2582%25AB%25E3%2583%258A"
                    target="_blank" rel="nofollow">Amazonで調べる</a><img
                    src="//i.moshimo.com/af/i/impression?a_id=1414800&p_id=170&pc_id=185&pl_id=4062" width="1"
                    height="1" style="border:none;"></div>
            <div class="shoplinkrakuten"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -50px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1414727&p_id=54&pc_id=54&pl_id=616&s_v=b5Rz2P0601xu&url=https%3A%2F%2Fsearch.rakuten.co.jp%2Fsearch%2Fmall%2Fmlb%2520the%2520show%2F-%2Ff.1-p.1-s.1-sf.0-st.A-v.2%3Fx%3D0"
                    target="_blank" rel="nofollow">楽天市場で調べる</a><img
                    src="//i.moshimo.com/af/i/impression?a_id=1414727&p_id=54&pc_id=54&pl_id=616" width="1" height="1"
                    style="border:none;"></div>
            <div class="shoplinkyahoo"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -150px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1418766&p_id=1225&pc_id=1925&pl_id=18502&s_v=b5Rz2P0601xu&url=http%3A%2F%2Fsearch.shopping.yahoo.co.jp%2Fsearch%3Fp%3Dmlb%2520the%2520show"
                    target="_blank" rel="nofollow">Yahooショッピングで調べる</a><img
                    src="//i.moshimo.com/af/i/impression?a_id=1418766&p_id=1225&pc_id=1925&pl_id=18502" width="1"
                    height="1" style="border:none;"></div>
            <div class="shoplinkseven"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -100px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1414728&p_id=932&pc_id=1188&pl_id=12456&s_v=b5Rz2P0601xu&url=http%3A%2F%2F7net.omni7.jp%2Fsearch%2F%3Fkeyword%3Dmlb%2520the%2520show%26searchKeywordFlg%3D1"
                    target="_blank"
                    rel="nofollow"><img src="//i.moshimo.com/af/i/impression?a_id=1414728&p_id=932&pc_id=1188&pl_id=12456" width="1" height="1" style="border:none;">7netで調べる
                        </a> </div> </div> </div> <div class="booklink-footer" style="clear: left"></div>
        </div>

---