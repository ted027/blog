---
title: "Linuxでファイル検索する際のコマンド"
date: 2019-04-26T14:23:28+09:00
draft: false
comments: true
categories: ["Shell"]
tags: ["Linux", "検索", "find", "grep"]
---

特定ディレクトリや配下ディレクトリのファイル名/ファイルの中身を検索する。

 <!--more-->

---

<a href="https://t.afi-b.com/visit.php?guid=ON&a=99886h-W336947J&p=J690746r" target="_blank" rel="nofollow"><img src="https://www.afi-b.com/upload_image/9886-1534983315-3.jpg" width="728" height="90" style="border:none;" alt="CodeCampGATE" /></a><img src="https://t.afi-b.com/lead/99886h/J690746r/W336947J" width="1" height="1" style="border:none;" />

---

### ファイル名検索

- 特定ディレクトリのファイル名検索

```
$ ls {directory/path} | grep {search_word}
```

- 特定ディレクトリ配下のファイル名検索

```
$ find {directory/path} | -type f -name \*{search_word}\*
```

- 特定ディレクトリ配下のディレクトリ名検索

```
$ find {directory/path} | -type d -name \*{search_word}\*
```

### ファイル内容検索

- 特定ディレクトリのファイル内容検索（一致場所表示）

```
grep {search_word} {directory/path}/*
```

- 特定ディレクトリのファイル内容検索（一致場所非表示）

```
grep {search_word} -l {directory/path}/*
```

- 特定ディレクトリ配下のファイル内容検索（一致場所表示）

```
grep {search_word} -r {directory/path}
```

- 特定ディレクトリ配下のファイル内容検索（一致場所非表示）

```
grep {search_word} -rl {directory/path}
```

---

<div class="kaerebalink-box" style="text-align:left;padding-bottom:20px;font-size:small;zoom: 1;overflow: hidden;">
    <div class="kaerebalink-image" style="float:left;margin:0 15px 10px 0;"><a
            href="//af.moshimo.com/af/c/click?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062&amp;url=https%3A%2F%2Fwww.amazon.co.jp%2F%25E5%2585%25A5%25E9%2596%2580UNIX%25E3%2582%25B7%25E3%2582%25A7%25E3%2583%25AB%25E3%2583%2597%25E3%2583%25AD%25E3%2582%25B0%25E3%2583%25A9%25E3%2583%259F%25E3%2583%25B3%25E3%2582%25B0%25E2%2580%2595%25E3%2582%25B7%25E3%2582%25A7%25E3%2583%25AB%25E3%2581%25AE%25E5%259F%25BA%25E7%25A4%258E%25E3%2581%258B%25E3%2582%2589%25E5%25AD%25A6%25E3%2581%25B6UNIX%25E3%2581%25AE%25E4%25B8%2596%25E7%2595%258C-%25E3%2583%2596%25E3%2583%25AB%25E3%2583%25BC%25E3%2582%25B9%25E3%2583%25BB%25E3%2583%2596%25E3%2583%25AA%25E3%2583%25B3%2Fdp%2F4797321946"
            target="_blank" rel="nofollow"><img
                src="https://images-fe.ssl-images-amazon.com/images/I/51gWeaXVBFL._SL160_.jpg"
                style="border: none;" /></a><img
            src="//i.moshimo.com/af/i/impression?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062" width="1"
            height="1" style="border:none;"></div>
    <div class="kaerebalink-info" style="line-height:120%;zoom: 1;overflow: hidden;">
        <div class="kaerebalink-name" style="margin-bottom:10px;line-height:120%"><a
                href="//af.moshimo.com/af/c/click?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062&amp;url=https%3A%2F%2Fwww.amazon.co.jp%2F%25E5%2585%25A5%25E9%2596%2580UNIX%25E3%2582%25B7%25E3%2582%25A7%25E3%2583%25AB%25E3%2583%2597%25E3%2583%25AD%25E3%2582%25B0%25E3%2583%25A9%25E3%2583%259F%25E3%2583%25B3%25E3%2582%25B0%25E2%2580%2595%25E3%2582%25B7%25E3%2582%25A7%25E3%2583%25AB%25E3%2581%25AE%25E5%259F%25BA%25E7%25A4%258E%25E3%2581%258B%25E3%2582%2589%25E5%25AD%25A6%25E3%2581%25B6UNIX%25E3%2581%25AE%25E4%25B8%2596%25E7%2595%258C-%25E3%2583%2596%25E3%2583%25AB%25E3%2583%25BC%25E3%2582%25B9%25E3%2583%25BB%25E3%2583%2596%25E3%2583%25AA%25E3%2583%25B3%2Fdp%2F4797321946"
                target="_blank" rel="nofollow">入門UNIXシェルプログラミング―シェルの基礎から学ぶUNIXの世界</a><img
                src="//i.moshimo.com/af/i/impression?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062" width="1"
                height="1" style="border:none;">
        </div>
        <div class="kaerebalink-detail" style="margin-bottom:5px;"></div>
        <div class="kaerebalink-link1" style="margin-top:10px;">
            <div class="shoplinkamazon"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 0 no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1414800&p_id=170&pc_id=185&pl_id=4062&s_v=b5Rz2P0601xu&url=https%3A%2F%2Fwww.amazon.co.jp%2Fgp%2Fsearch%3Fkeywords%3DUNIX%25E3%2580%2580%25E3%2582%25B7%25E3%2582%25A7%25E3%2583%25AB%26__mk_ja_JP%3D%25E3%2582%25AB%25E3%2582%25BF%25E3%2582%25AB%25E3%2583%258A"
                    target="_blank" rel="nofollow">Amazonで調べる</a><img
                    src="//i.moshimo.com/af/i/impression?a_id=1414800&p_id=170&pc_id=185&pl_id=4062" width="1"
                    height="1" style="border:none;"></div>
            <div class="shoplinkrakuten"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -50px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1414727&p_id=54&pc_id=54&pl_id=616&s_v=b5Rz2P0601xu&url=https%3A%2F%2Fsearch.rakuten.co.jp%2Fsearch%2Fmall%2FUNIX%25E3%2580%2580%25E3%2582%25B7%25E3%2582%25A7%25E3%2583%25AB%2F-%2Ff.1-p.1-s.1-sf.0-st.A-v.2%3Fx%3D0"
                    target="_blank" rel="nofollow">楽天市場で調べる</a><img
                    src="//i.moshimo.com/af/i/impression?a_id=1414727&p_id=54&pc_id=54&pl_id=616" width="1" height="1"
                    style="border:none;"></div>
            <div class="shoplinkyahoo"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -150px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1418766&p_id=1225&pc_id=1925&pl_id=18502&s_v=b5Rz2P0601xu&url=http%3A%2F%2Fsearch.shopping.yahoo.co.jp%2Fsearch%3Fp%3DUNIX%2520%25E3%2582%25B7%25E3%2582%25A7%25E3%2583%25AB"
                    target="_blank" rel="nofollow">Yahooショッピングで調べる</a><img
                    src="//i.moshimo.com/af/i/impression?a_id=1418766&p_id=1225&pc_id=1925&pl_id=18502"
                    width="1" height="1" style="border:none;"></div>
            <div class="shoplinkseven"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -100px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1414728&p_id=932&pc_id=1188&pl_id=12456&s_v=b5Rz2P0601xu&url=http%3A%2F%2F7net.omni7.jp%2Fsearch%2F%3Fkeyword%3DUNIX%25E3%2580%2580%25E3%2582%25B7%25E3%2582%25A7%25E3%2583%25AB%26searchKeywordFlg%3D1"
                    target="_blank"
                    rel="nofollow"><img src="//i.moshimo.com/af/i/impression?a_id=1414728&p_id=932&pc_id=1188&pl_id=12456" width="1" height="1" style="border:none;">7netで調べる
                        </a> </div> </div> </div> <div class="booklink-footer" style="clear: left"></div>
        </div>

---