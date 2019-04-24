---
title: "パワプロ ペナント補強思考設定の条件判断"
date: 2019-04-23T16:19:47+09:00
draft: false
comments: true
categories: ["パワプロ"]
tags: ["パワプロ2018", "ペナント", "補強思考", "Python"]
---

補強思考設定、各項目の判断基準の説明です。

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

2019年4月現在の計算結果は以下。

- [パワプロ ペナントの補強思考設定（2019年4月時点）](https://www.ted027.com/post/penant-add-descript)

---

### トレード

2016年以降のトレードで、獲得した選手・放出した選手の合計数をチームごとに計算。

- 頻度
    - 判断基準
        - 獲得選手数の上位4チームを「積極的」、下位4チームを「消極的」、残りを「おまかせ」に

#### データソース

- [NPB公式](http://npb.jp/announcement/2019/pn_traded.html)(2016〜2019)

※注釈付き（人的補償での移籍等）は含みません

---

### 新外国人獲得

2016年オフ以降に新外国人として獲得した選手の合計数、平均年齢をチームごとに計算。

ただし年齢は正確ではなく、獲得年から生誕年を引いただけの簡易的な疑似年齢。

※ 一度対談し帰国した外国人選手を再度獲得するケース（2016オフC.マギーなど）は含めない。

- 頻度
    - 判断基準
        - 獲得選手数の上位4チームを「積極的」、下位4チームを「消極的」、残りを「おまかせ」に
- 獲得方針
    - 判断基準
        - 獲得選手の平均年齢上位4チームを「ベテラン中心」、下位4チームを「若手中心」、残りを「おまかせ」に
- 重視特徴
    -  単純な計算で判断しづらいので一律「おまかせ」に

#### データソース

- Wikipediaを見ながらjsonで書きました
- https://github.com/ted027/Scripts/blob/master/other/foreign_player.json

---

### ドラフト

2017年以降にドラフトで獲得した選手の平均年齢をチームごとに計算。

- 獲得方針
    - 判断基準
        - 獲得選手の平均年齢上位4チームを「即戦力重視」、下位4チームを「将来性重視」、残りを「おまかせ」に
        - 「一芸重視」は単純な計算で判断しづらいので扱わない
- 重視特徴
    -  単純な計算で判断しづらいので一律「おまかせ」に

#### データソース

- [サンスポ ドラフト特集](https://www.sanspo.com/baseball/draft/18/draft_table.html)(2017〜2018)
- 2年分しか見れなかったので、いつか余裕があれば3年前以前もどこかから取って計算に入れたい

---

### FA交渉

2009年オフ以降にFAで獲得した選手に関して、選手の合計数、平均年齢、平均の翌年推定年俸をチームごとに計算。

- 自チームの選手に対して
    - 判断基準
        - 今日日、日本ハムも西武も広島も、残留交渉は行っていそうです。ゲーム的にも、パワプロ2018では残留交渉でFA交渉枠を消費しないので、一律「残留交渉する」でいいと思います。
- 他チームの選手に対して
    - 判断基準
        - 獲得した選手合計数の上位4チームを「積極的」、下位4チームを「消極的」、残りを「おまかせ」に
- 獲得方針
    - 判断基準
        - 獲得した選手の平均翌年推定年俸の平均、上位4チームを「目玉選手重視」、下位4チームを「単独交渉重視」、残りを「おまかせ」に
        - 獲得した選手の平均年齢、上位4チームを「経験重視」、下位4チームを「若さ重視」、残りを「おまかせ」に
        - 複数条件に当てはまる場合、優先度は
            - 目玉選手重視/単独交渉重視 > 経験重視/若さ重視 > おまかせ
- 人数
    - 判断基準
        - 年平均の獲得した選手数が0.7人より多いチームを「複数人」、0.2人より少ないチームを「一人」、残りを「おまかせ」に

#### データソース

- [ここ](https://www.gurazeni.com/)やWikipediaを見ながらjsonで書きました
- https://github.com/ted027/Scripts/blob/master/other/free_agent_player.json

---

### 契約更改

- 解雇方針
    - 各所で言われているが、「おまかせ」だと`能力も成績もいいベテランが平気で首を切られ、それを獲得していけば普通に優勝できる`ようになってしまう
    - 一律「能力重視」にして功労者にやさしい世界にしてあげましょう

---

### ポスティング

歴代で獲得した米国帰国選手の合計数をチームごとに計算。

※ 米国から独立リーグ等を経てNPBに復帰した選手（藤川球児など）も含む。

※ 日本球界を経ずに米国に渡り帰国した選手（マイケル中村、多田野数人など）は含めない。

- 承認
    - 判断基準
        - 正直なところ誰が拒否されたかは分からないので、承認しないことを公言している巨人とソフトバンクのみ「承認しない」、残りは「おまかせ」に
        - 承認ケースの多いヤクルトあたりは「承認する」にしてもいいかも
        - 上でも書いた[参考のサイト](http://disummer.blog.fc2.com/blog-entry-3.html)では、金子千尋選手のFA取得時、各球団の交渉姿勢から判断していました。これも面白い。
- 獲得方針
    - 判断基準
        - 歴代で獲得した米国帰国選手の合計数上位4チームを「積極的」、下位4チームを「消極的」、残りを「おまかせ」に

#### データソース

- Wikipediaを見ながらjsonで書きました
- https://github.com/ted027/Scripts/blob/master/other/returned_player.json

---

### 自由契約選手獲得

2016年オフ以降に自由契約から獲得した選手の平均年齢をチームごとに計算。

ただし年齢は正確ではなく、獲得年から生誕年を引いただけの簡易的な疑似年齢。

※ 自由契約したチームと再契約したケース（2018オフ上原浩治など）は含めない。

※ 外国人選手（2018オフO.ガルシア、B.レアードなど）は含めない。

- 獲得方針
    - 判断基準
        - 由契約からの獲得選手の平均年齢上位4チームを「経験重視」、下位4チームを「のびしろ重視」、残りを「おまかせ」に
        - 「一芸重視」「器用さ重視」は単純な計算で判断しづらいので扱わない

#### データソース

- [日刊スポーツ移籍情報](https://www.nikkansports.com/baseball/news/201809280000378.html)やWikipediaを見ながらjsonで書きました
- https://github.com/ted027/Scripts/blob/master/other/unregistered_player.json

---

### その他細かい判断や計算など

- 基本的に育成選手は計算に含めない。パワプロで育成選手は扱わないため
- ただし育成から支配下登録された外国人選手は「新外国人選手」として計算に含む
- データ数が0で平均が取れない場合、上位4/下位4の判断から除外し、設定は「おまかせ」にする
- 上位4位と5位/下位4と5位が同数の場合、上位4位/下位4位も「おまかせ」に吸収する
  - その場合、上位3位と4位/下位3と4位が同数の場合…で繰り返し

---

### 以上の計算をしてくれたやつ

- https://github.com/ted027/Scripts/blob/master/python_/addition.py

---

### おわり

自動化したいといいつつ手で書いてばかりだった。

間違いがあるかもしれないので、もし気づいた方はそっと教えてくれるとありがたいです。

---

<div class="kaerebalink-box" style="text-align:left;padding-bottom:20px;font-size:small;zoom: 1;overflow: hidden;">
    <div class="kaerebalink-image" style="float:left;margin:0 15px 10px 0;"><a
            href="//af.moshimo.com/af/c/click?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062&amp;url=https%3A%2F%2Fwww.amazon.co.jp%2F%25E3%2582%25B3%25E3%2583%258A%25E3%2583%259F%25E3%2583%2587%25E3%2582%25B8%25E3%2582%25BF%25E3%2583%25AB%25E3%2582%25A8%25E3%2583%25B3%25E3%2582%25BF%25E3%2583%2586%25E3%2582%25A4%25E3%2583%25B3%25E3%2583%25A1%25E3%2583%25B3%25E3%2583%2588-%25E5%25AE%259F%25E6%25B3%2581%25E3%2583%2591%25E3%2583%25AF%25E3%2583%2595%25E3%2583%25AB%25E3%2583%2597%25E3%2583%25AD%25E9%2587%258E%25E7%2590%25832018-PS4%25E3%2580%2590Amazon-co-jp%25E9%2599%2590%25E5%25AE%259A%25E3%2580%2591%25E3%2582%25AA%25E3%2583%25AA%25E3%2582%25B8%25E3%2583%258A%25E3%2583%25AB%25E5%25A3%2581%25E7%25B4%2599-%25E9%2585%258D%25E4%25BF%25A1%2Fdp%2FB07KJNWQFL"
            target="_blank" rel="nofollow"><img
                src="https://images-fe.ssl-images-amazon.com/images/I/51LFkDMGvoL._SL160_.jpg"
                style="border: none;" /></a><img
            src="//i.moshimo.com/af/i/impression?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062" width="1" height="1"
            style="border:none;"></div>
    <div class="kaerebalink-info" style="line-height:120%;zoom: 1;overflow: hidden;">
        <div class="kaerebalink-name" style="margin-bottom:10px;line-height:120%"><a
                href="//af.moshimo.com/af/c/click?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062&amp;url=https%3A%2F%2Fwww.amazon.co.jp%2F%25E3%2582%25B3%25E3%2583%258A%25E3%2583%259F%25E3%2583%2587%25E3%2582%25B8%25E3%2582%25BF%25E3%2583%25AB%25E3%2582%25A8%25E3%2583%25B3%25E3%2582%25BF%25E3%2583%2586%25E3%2582%25A4%25E3%2583%25B3%25E3%2583%25A1%25E3%2583%25B3%25E3%2583%2588-%25E5%25AE%259F%25E6%25B3%2581%25E3%2583%2591%25E3%2583%25AF%25E3%2583%2595%25E3%2583%25AB%25E3%2583%2597%25E3%2583%25AD%25E9%2587%258E%25E7%2590%25832018-PS4%25E3%2580%2590Amazon-co-jp%25E9%2599%2590%25E5%25AE%259A%25E3%2580%2591%25E3%2582%25AA%25E3%2583%25AA%25E3%2582%25B8%25E3%2583%258A%25E3%2583%25AB%25E5%25A3%2581%25E7%25B4%2599-%25E9%2585%258D%25E4%25BF%25A1%2Fdp%2FB07KJNWQFL"
                target="_blank" rel="nofollow">実況パワフルプロ野球2018 -【Amazon.co.jp限定】</a><img
                src="//i.moshimo.com/af/i/impression?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062" width="1" height="1"
                style="border:none;">
        </div>
        <div class="kaerebalink-detail" style="margin-bottom:5px;"></div>
        <div class="kaerebalink-link1" style="margin-top:10px;">
            <div class="shoplinkamazon"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 0 no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1414800&p_id=170&pc_id=185&pl_id=4062&s_v=b5Rz2P0601xu&url=https%3A%2F%2Fwww.amazon.co.jp%2Fgp%2Fsearch%3Fkeywords%3D%25E5%25AE%259F%25E6%25B3%2581%25E3%2583%2591%25E3%2583%25AF%25E3%2583%2595%25E3%2583%25AB%25E3%2583%2597%25E3%2583%25AD%25E9%2587%258E%25E7%2590%25832018%26__mk_ja_JP%3D%25E3%2582%25AB%25E3%2582%25BF%25E3%2582%25AB%25E3%2583%258A"
                    target="_blank" rel="nofollow">Amazonで調べる</a><img
                    src="//i.moshimo.com/af/i/impression?a_id=1414800&p_id=170&pc_id=185&pl_id=4062" width="1"
                    height="1" style="border:none;"></div>
            <div class="shoplinkrakuten"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -50px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1414727&p_id=54&pc_id=54&pl_id=616&s_v=b5Rz2P0601xu&url=https%3A%2F%2Fsearch.rakuten.co.jp%2Fsearch%2Fmall%2F%25E5%25AE%259F%25E6%25B3%2581%25E3%2583%2591%25E3%2583%25AF%25E3%2583%2595%25E3%2583%25AB%25E3%2583%2597%25E3%2583%25AD%25E9%2587%258E%25E7%2590%25832018%2F-%2Ff.1-p.1-s.1-sf.0-st.A-v.2%3Fx%3D0"
                    target="_blank" rel="nofollow">楽天市場で調べる</a><img
                    src="//i.moshimo.com/af/i/impression?a_id=1414727&p_id=54&pc_id=54&pl_id=616" width="1" height="1"
                    style="border:none;"></div>
            <div class="shoplinkyahoo"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -150px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1418766&p_id=1225&pc_id=1925&pl_id=18502&s_v=b5Rz2P0601xu&url=http%3A%2F%2Fsearch.shopping.yahoo.co.jp%2Fsearch%3Fp%3D%25E5%25AE%259F%25E6%25B3%2581%25E3%2583%2591%25E3%2583%25AF%25E3%2583%2595%25E3%2583%25AB%25E3%2583%2597%25E3%2583%25AD%25E9%2587%258E%25E7%2590%25832018"
                    target="_blank" rel="nofollow">Yahooショッピングで調べる</a><img
                    src="//i.moshimo.com/af/i/impression?a_id=1418766&p_id=1225&pc_id=1925&pl_id=18502" width="1"
                    height="1" style="border:none;"></div>
            <div class="shoplinkseven"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -100px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1414728&p_id=932&pc_id=1188&pl_id=12456&s_v=b5Rz2P0601xu&url=http%3A%2F%2F7net.omni7.jp%2Fsearch%2F%3Fkeyword%3D%25E5%25AE%259F%25E6%25B3%2581%25E3%2583%2591%25E3%2583%25AF%25E3%2583%2595%25E3%2583%25AB%25E3%2583%2597%25E3%2583%25AD%25E9%2587%258E%25E7%2590%25832018%26searchKeywordFlg%3D1"
                    target="_blank"
                    rel="nofollow"><img src="//i.moshimo.com/af/i/impression?a_id=1414728&p_id=932&pc_id=1188&pl_id=12456" width="1" height="1" style="border:none;">7netで調べる
                        </a> </div> </div> </div> <div class="booklink-footer" style="clear: left"></div>
        </div>

---