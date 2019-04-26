---
title: "OSをUbuntu 18.04 LTSにした際にやったこと"
date: 2019-04-21T22:52:31+09:00
draft: false
comments: true
categories: ["Ubuntu"]
tags: ["Ubuntu", "OS", "Linux"]
---

新しいノートPC購入を機に、OSをUbuntu 18.04 LTSにした際の備忘録。

 <!--more-->

---

<div class="kaerebalink-box" style="text-align:left;padding-bottom:20px;font-size:small;zoom: 1;overflow: hidden;">
    <div class="kaerebalink-image" style="float:left;margin:0 15px 10px 0;"><a
            href="//af.moshimo.com/af/c/click?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062&amp;url=https%3A%2F%2Fwww.amazon.co.jp%2FTranscend-USB%25E3%2583%25A1%25E3%2583%25A2%25E3%2583%25AA-%25E3%2582%25B9%25E3%2583%25A9%25E3%2582%25A4%25E3%2583%2589%25E5%25BC%258F-TS32GJF790KBE-%25E3%2580%2590Amazon-co-jp%25E9%2599%2590%25E5%25AE%259A%25E3%2583%2591%25E3%2583%2583%25E3%2582%25B1%25E3%2583%25BC%25E3%2582%25B8%25E3%2580%2591%2Fdp%2FB07MJBR35G"
            target="_blank" rel="nofollow"><img
                src="https://images-fe.ssl-images-amazon.com/images/I/31hxxUk5nuL._SL160_.jpg"
                style="border: none;" /></a><img
            src="//i.moshimo.com/af/i/impression?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062" width="1" height="1"
            style="border:none;"></div>
    <div class="kaerebalink-info" style="line-height:120%;zoom: 1;overflow: hidden;">
        <div class="kaerebalink-name" style="margin-bottom:10px;line-height:120%"><a
                href="//af.moshimo.com/af/c/click?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062&amp;url=https%3A%2F%2Fwww.amazon.co.jp%2FTranscend-USB%25E3%2583%25A1%25E3%2583%25A2%25E3%2583%25AA-%25E3%2582%25B9%25E3%2583%25A9%25E3%2582%25A4%25E3%2583%2589%25E5%25BC%258F-TS32GJF790KBE-%25E3%2580%2590Amazon-co-jp%25E9%2599%2590%25E5%25AE%259A%25E3%2583%2591%25E3%2583%2583%25E3%2582%25B1%25E3%2583%25BC%25E3%2582%25B8%25E3%2580%2591%2Fdp%2FB07MJBR35G"
                target="_blank" rel="nofollow">Transcend USBメモリ 32GB USB 3.1 スライド式 ブラック TS32GJF790KBE</a><img
                src="//i.moshimo.com/af/i/impression?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062" width="1" height="1"
                style="border:none;">
        </div>
        <div class="kaerebalink-detail" style="margin-bottom:5px;"></div>
        <div class="kaerebalink-link1" style="margin-top:10px;">
            <div class="shoplinkamazon"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 0 no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1414800&p_id=170&pc_id=185&pl_id=4062&s_v=b5Rz2P0601xu&url=https%3A%2F%2Fwww.amazon.co.jp%2Fgp%2Fsearch%3Fkeywords%3Dusb%25E3%2583%25A1%25E3%2583%25A2%25E3%2583%25AA%26__mk_ja_JP%3D%25E3%2582%25AB%25E3%2582%25BF%25E3%2582%25AB%25E3%2583%258A"
                    target="_blank" rel="nofollow">Amazonで調べる</a><img
                    src="//i.moshimo.com/af/i/impression?a_id=1414800&p_id=170&pc_id=185&pl_id=4062" width="1"
                    height="1" style="border:none;"></div>
            <div class="shoplinkrakuten"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -50px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1414727&p_id=54&pc_id=54&pl_id=616&s_v=b5Rz2P0601xu&url=https%3A%2F%2Fsearch.rakuten.co.jp%2Fsearch%2Fmall%2Fusb%25E3%2583%25A1%25E3%2583%25A2%25E3%2583%25AA%2F-%2Ff.1-p.1-s.1-sf.0-st.A-v.2%3Fx%3D0"
                    target="_blank" rel="nofollow">楽天市場で調べる</a><img
                    src="//i.moshimo.com/af/i/impression?a_id=1414727&p_id=54&pc_id=54&pl_id=616" width="1" height="1"
                    style="border:none;"></div>
            <div class="shoplinkyahoo"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -150px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1418766&p_id=1225&pc_id=1925&pl_id=18502&s_v=b5Rz2P0601xu&url=http%3A%2F%2Fsearch.shopping.yahoo.co.jp%2Fsearch%3Fp%3Dusb%25E3%2583%25A1%25E3%2583%25A2%25E3%2583%25AA"
                    target="_blank" rel="nofollow">Yahooショッピングで調べる</a><img
                    src="//i.moshimo.com/af/i/impression?a_id=1418766&p_id=1225&pc_id=1925&pl_id=18502" width="1"
                    height="1" style="border:none;"></div>
            <div class="shoplinkseven"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -100px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1414728&p_id=932&pc_id=1188&pl_id=12456&s_v=b5Rz2P0601xu&url=http%3A%2F%2F7net.omni7.jp%2Fsearch%2F%3Fkeyword%3Dusb%25E3%2583%25A1%25E3%2583%25A2%25E3%2583%25AA%26searchKeywordFlg%3D1"
                    target="_blank"
                    rel="nofollow"><img src="//i.moshimo.com/af/i/impression?a_id=1414728&p_id=932&pc_id=1188&pl_id=12456" width="1" height="1" style="border:none;">7netで調べる
                        </a> </div> </div> </div> <div class="booklink-footer" style="clear: left"></div>
        </div>

---

{{< img src="/img/ubuntu.png" >}}

### Live USBを作成してインストール

以下のサイトを参考

 - [UbuntuのLive USBをつくる](https://blog.mktia.com/how-to-make-ubuntu-live-usb/)

---

### 自分好みに設定を弄る

 - [Ubuntu 18.04 LTSをインストールした直後に行う設定 & インストールするソフト](https://sicklylife.jp/ubuntu/1804/settings.html)

---

### Byobuを入れる

仮想端末ソフト。画面分割等機能が多彩で使いやすい。

 - [端末ソフトByobuの導入とよく使うコマンド等](https://www.ted027.com/post/byobu)

---

### Albertを入れる

設定したホットキーでアプリの起動とか検索ができる。

 - [Linuxでアプリの起動やファイル検索などができる軽快なランチャー"Albert"](http://ich.hatenadiary.com/entry/launcher_on_ubuntu)

---

### LINEを入れる

Ubuntu用のクライアントは無いけど、Google ChromeやChromiumの拡張機能がある。

 - https://chrome.google.com/webstore/detail/line/ophjlpahpchlmihnnnihgmmeilfjmjjc

---

### Kindleを入れる

Ubuntu用のクライアントは無いし拡張機能も多分無い。Wineを使ってwindows版をインストール。

 - [Ubuntu 18.04にKindleをインストールした](https://www.ted027.com/post/ubuntu-kindle)

---

<div class="kaerebalink-box" style="text-align:left;padding-bottom:20px;font-size:small;zoom: 1;overflow: hidden;">
    <div class="kaerebalink-image" style="float:left;margin:0 15px 10px 0;"><a
            href="//af.moshimo.com/af/c/click?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062&amp;url=https%3A%2F%2Fwww.amazon.co.jp%2F%25E3%2582%25A8%25E3%2582%25A4%25E3%2582%25B9%25E3%2583%25BC%25E3%2582%25B9-ZenBook-UX370UA%25EF%25BC%2588Core-512GB%25EF%25BC%2589-UX370UA-8550%2Fdp%2FB07DWXRNGF"
            target="_blank" rel="nofollow"><img
                src="https://images-fe.ssl-images-amazon.com/images/I/41paXPb2T%2BL._SL160_.jpg"
                style="border: none;" /></a><img
            src="//i.moshimo.com/af/i/impression?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062" width="1" height="1"
            style="border:none;"></div>
    <div class="kaerebalink-info" style="line-height:120%;zoom: 1;overflow: hidden;">
        <div class="kaerebalink-name" style="margin-bottom:10px;line-height:120%"><a
                href="//af.moshimo.com/af/c/click?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062&amp;url=https%3A%2F%2Fwww.amazon.co.jp%2F%25E3%2582%25A8%25E3%2582%25A4%25E3%2582%25B9%25E3%2583%25BC%25E3%2582%25B9-ZenBook-UX370UA%25EF%25BC%2588Core-512GB%25EF%25BC%2589-UX370UA-8550%2Fdp%2FB07DWXRNGF"
                target="_blank" rel="nofollow">エイスース 13.3型 2-in-1 パソコン ASUS ZenBook Flip UX370UA（Core i7 / メモリ 16GB / SSD
                512GB） UX370UA-8550</a><img
                src="//i.moshimo.com/af/i/impression?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062" width="1" height="1"
                style="border:none;">
        </div>
        <div class="kaerebalink-detail" style="margin-bottom:5px;"></div>
        <div class="kaerebalink-link1" style="margin-top:10px;">
            <div class="shoplinkamazon"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 0 no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1414800&p_id=170&pc_id=185&pl_id=4062&s_v=b5Rz2P0601xu&url=https%3A%2F%2Fwww.amazon.co.jp%2Fgp%2Fsearch%3Fkeywords%3D%25E3%2583%258E%25E3%2583%25BC%25E3%2583%2588%25E3%2583%2591%25E3%2582%25BD%25E3%2582%25B3%25E3%2583%25B3%2520SSD%2520512GB%252016GB%2520core%2520i7%26__mk_ja_JP%3D%25E3%2582%25AB%25E3%2582%25BF%25E3%2582%25AB%25E3%2583%258A"
                    target="_blank" rel="nofollow">Amazonで調べる</a><img
                    src="//i.moshimo.com/af/i/impression?a_id=1414800&p_id=170&pc_id=185&pl_id=4062" width="1"
                    height="1" style="border:none;"></div>
            <div class="shoplinkrakuten"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -50px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1414727&p_id=54&pc_id=54&pl_id=616&s_v=b5Rz2P0601xu&url=https%3A%2F%2Fsearch.rakuten.co.jp%2Fsearch%2Fmall%2F%25E3%2583%258E%25E3%2583%25BC%25E3%2583%2588%25E3%2583%2591%25E3%2582%25BD%25E3%2582%25B3%25E3%2583%25B3%2520SSD%2520512GB%252016GB%2520core%2520i7%2F-%2Ff.1-p.1-s.1-sf.0-st.A-v.2%3Fx%3D0"
                    target="_blank" rel="nofollow">楽天市場で調べる</a><img
                    src="//i.moshimo.com/af/i/impression?a_id=1414727&p_id=54&pc_id=54&pl_id=616" width="1" height="1"
                    style="border:none;"></div>
            <div class="shoplinkyahoo"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -150px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1418766&p_id=1225&pc_id=1925&pl_id=18502&s_v=b5Rz2P0601xu&url=http%3A%2F%2Fsearch.shopping.yahoo.co.jp%2Fsearch%3Fp%3D%25E3%2583%258E%25E3%2583%25BC%25E3%2583%2588%25E3%2583%2591%25E3%2582%25BD%25E3%2582%25B3%25E3%2583%25B3%2520SSD%2520512GB%252016GB%2520core%2520i7"
                    target="_blank" rel="nofollow">Yahooショッピングで調べる</a><img
                    src="//i.moshimo.com/af/i/impression?a_id=1418766&p_id=1225&pc_id=1925&pl_id=18502" width="1"
                    height="1" style="border:none;"></div>
            <div class="shoplinkseven"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -100px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1414728&p_id=932&pc_id=1188&pl_id=12456&s_v=b5Rz2P0601xu&url=http%3A%2F%2F7net.omni7.jp%2Fsearch%2F%3Fkeyword%3D%25E3%2583%258E%25E3%2583%25BC%25E3%2583%2588%25E3%2583%2591%25E3%2582%25BD%25E3%2582%25B3%25E3%2583%25B3%2520SSD%2520512GB%252016GB%2520core%2520i7%26searchKeywordFlg%3D1"
                    target="_blank"
                    rel="nofollow"><img src="//i.moshimo.com/af/i/impression?a_id=1414728&p_id=932&pc_id=1188&pl_id=12456" width="1" height="1" style="border:none;">7netで調べる
                        </a> </div> </div> </div> <div class="booklink-footer" style="clear: left"></div>
        </div>

---