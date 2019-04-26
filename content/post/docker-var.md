---
title: "Dockerでコマンド実行結果を変数に入れられなくて困った話"
date: 2019-04-24T08:10:53+09:00
draft: false
comments: true
categories: ["Docker"]
tags: ["Docker", "Dockerfile"]
---

Dockerfileではコマンド実行結果を変数に入れられない。それでも入れたい時の回避策。

<!--more-->

---

<a href="https://t.afi-b.com/visit.php?guid=ON&a=C9511S-i324416Z&p=J690746r" target="_blank" rel="nofollow"><img src="https://www.afi-b.com/upload_image/9511-1521815201-3.gif" width="728" height="90" style="border:none;" alt="フォスターフリーランス" /></a><img src="https://t.afi-b.com/lead/C9511S/J690746r/i324416Z" width="1" height="1" style="border:none;" />

---

 - [Dockerfileの書き方や紛らわしいコマンド達の話](https://www.ted027.com/post/dockerfile)

### 問題

何がやりたかったかというとOracle JDKを入れたかった。

のですが、コマンド実行結果を変数に入れることができない。

```Dockerfile
RUN set -ex &&\
    URL=$(curl -s http://www.oracle.com/technetwork/java/javase/downloads/index.html | egrep -m1 -o '/technetwork/java/javase/downloads/jdk8-downloads-[0-9]+\.html') && \
    ...
```

`ENV`を使ってもできない。

```Dockerfile
ENV URL_SUFFIX=$(curl -s http://www.oracle.com/technetwork/java/javase/downloads/index.html | egrep -m1 -o '/technetwork/java/javase/downloads/jdk8-downloads-[0-9]+\.html')
```

---

### 回避策

すっきりした解決策は無さそうですが、`.bashrc`に書けば一応は回避可能のようです。

```Dockerfile
RUN echo 'export URL="$(curl -s http://www.oracle.com/technetwork/java/javase/downloads/index.html | egrep -m1 -o '/technetwork/java/javase/downloads/jdk8-downloads-[0-9]+\.html')"' >> ~/.bashrc
```

---

### ちなみに

この回避策は使わず、おとなしくOpenJDKに切り替えました。

```Dockerfile
RUN set -ex && \
    yum -yq install java-1.8.0-openjdk && \
    yum clean all
```

---

### 参考

- [[Docker] ENV にコマンドの結果を使えない問題の回避策](https://srz-zumix.blogspot.com/2017/05/docker-env.html)

- [docker build中のコマンドの実行結果を環境変数として登録し、docker runで利用する](https://qiita.com/c18t/items/e380a6bb586a595e1138)

---

<div class="kaerebalink-box" style="text-align:left;padding-bottom:20px;font-size:small;zoom: 1;overflow: hidden;">
    <div class="kaerebalink-image" style="float:left;margin:0 15px 10px 0;"><a
            href="//af.moshimo.com/af/c/click?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062&amp;url=https%3A%2F%2Fwww.amazon.co.jp%2FDocker%25E5%25AE%259F%25E8%25B7%25B5%25E3%2582%25AC%25E3%2582%25A4%25E3%2583%2589-%25E7%25AC%25AC2%25E7%2589%2588-impress-top-gear%2Fdp%2F4295005525"
            rel="nofollow" target="_blank"><img
                src="https://images-fe.ssl-images-amazon.com/images/I/51lsC1rZ8HL._SL160_.jpg"
                style="border: none;" /></a><img height="1"
            src="//i.moshimo.com/af/i/impression?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062"
            style="border:none;" width="1" /></div>
    <div class="kaerebalink-info" style="line-height:120%;zoom: 1;overflow: hidden;">
        <div class="kaerebalink-name" style="margin-bottom:10px;line-height:120%"><a
                href="//af.moshimo.com/af/c/click?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062&amp;url=https%3A%2F%2Fwww.amazon.co.jp%2FDocker%25E5%25AE%259F%25E8%25B7%25B5%25E3%2582%25AC%25E3%2582%25A4%25E3%2583%2589-%25E7%25AC%25AC2%25E7%2589%2588-impress-top-gear%2Fdp%2F4295005525"
                rel="nofollow" target="_blank">Docker実践ガイド 第2版</a><img height="1"
                src="//i.moshimo.com/af/i/impression?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062"
                style="border:none;" width="1" /></div>
        <div class="kaerebalink-detail" style="margin-bottom:5px;"></div>
        <div class="kaerebalink-link1" style="margin-top:10px;">
            <div class="shoplinkamazon"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 0 no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062&amp;s_v=b5Rz2P0601xu&amp;url=https%3A%2F%2Fwww.amazon.co.jp%2Fgp%2Fsearch%3Fkeywords%3Ddocker%26__mk_ja_JP%3D%25E3%2582%25AB%25E3%2582%25BF%25E3%2582%25AB%25E3%2583%258A"
                    rel="nofollow" target="_blank">Amazonで調べる</a><img height="1"
                    src="//i.moshimo.com/af/i/impression?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062"
                    style="border:none;" width="1" /></div>
            <div class="shoplinkrakuten"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -50px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1414727&amp;p_id=54&amp;pc_id=54&amp;pl_id=616&amp;s_v=b5Rz2P0601xu&amp;url=https%3A%2F%2Fsearch.rakuten.co.jp%2Fsearch%2Fmall%2Fdocker%2F-%2Ff.1-p.1-s.1-sf.0-st.A-v.2%3Fx%3D0"
                    rel="nofollow" target="_blank">楽天市場で調べる</a><img height="1"
                    src="//i.moshimo.com/af/i/impression?a_id=1414727&amp;p_id=54&amp;pc_id=54&amp;pl_id=616"
                    style="border:none;" width="1" /></div>
            <div class="shoplinkyahoo"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -150px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1418766&amp;p_id=1225&amp;pc_id=1925&amp;pl_id=18502&amp;s_v=b5Rz2P0601xu&amp;url=http%3A%2F%2Fsearch.shopping.yahoo.co.jp%2Fsearch%3Fp%3Ddocker"
                    rel="nofollow" target="_blank">Yahooショッピングで調べる</a><img height="1"
                    src="//i.moshimo.com/af/i/impression?a_id=1418766&amp;p_id=1225&amp;pc_id=1925&amp;pl_id=18502"
                    style="border:none;" width="1" /></div>
            <div class="shoplinkseven"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -100px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1414728&amp;p_id=932&amp;pc_id=1188&amp;pl_id=12456&amp;s_v=b5Rz2P0601xu&amp;url=http%3A%2F%2F7net.omni7.jp%2Fsearch%2F%3Fkeyword%3Ddocker%26searchKeywordFlg%3D1"
                    rel="nofollow" target="_blank"><img src=" af="" height="1" i="" i.moshimo.com=""
                        impression?a_id='1414728&amp;p_id=932&amp;pc_id=1188&amp;pl_id=12456"' style="border:none;"
                        width="1">7netで調べる</img src="></a></div>
        </div>
    </div>
    <div class="booklink-footer" style="clear: left"></div>
</div>

---