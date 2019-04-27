---
title: "Dockerfileの書き方や紛らわしいコマンドの話"
date: 2019-04-24T17:35:18+09:00
draft: false
comments: true
categories: ["Docker"]
tags: ["Docker", "Dockerfile", "CMD", "ENTRYPOINT"]
---

Dockerfileを書く時に気にしていること、よくわからなくて調べたことなど。

 <!--more-->

---

<a href="https://t.afi-b.com/visit.php?guid=ON&a=99886h-W336947J&p=J690746r" target="_blank" rel="nofollow"><img src="https://www.afi-b.com/upload_image/9886-1534983315-3.jpg" width="728" height="90" style="border:none;" alt="CodeCampGATE" /></a><img src="https://t.afi-b.com/lead/99886h/J690746r/W336947J" width="1" height="1" style="border:none;" />

---

### RUNの使い方

可読性を損ねない範囲で、なるべく一つの`RUN`で続けて書く。

最初に`set -ex`をつけると、ビルド状況が出力され、途中でエラーが起きた場合はそこで止まる。

極力`cd`は使わない。パスでアクセスし、必要なら`WORKDIR`に絶対パスを指定して移動する。

複数モジュールインストールする場合は一行ずつ分けて、アルファベット順に並べておくのがいい。追加削除がしやすく、重複も防げる。

```Dockerfile
RUN set -ex && \
    yum -yq install \
    clock \
    gcc \
    make
```

---

### ENVとARG（とRUN）

`ENV`, `ARG`, `RUN`で変数に値を代入できる。

```Dockerfile
ENV VAR1 "hoge"

ARG VAR2="fuga"

RUN export VAR3="piyo"
```

`ENV`で環境変数に設定、runした後のコンテナ内でも使える。利用用途はPATHなど。

`ARG`はビルド時のみ有効。モジュールのバージョンなど、ビルド時しか使わない変数は`ARG`を使う。

(ただし、`ARG`に設定した内容は`docker history`で確認できるので、公開すべきでない情報は扱わない。)

`RUN`で設定した変数は、同一の`RUN`の中でしか扱えない

※ Dockerfileで、コマンドの実行結果を変数に格納することは（基本的に）できない。

 - [Dockerでコマンド実行結果を変数に入れられなくて困った話](https://www.ted027.com/post/docker-var)

---

### ADDとCOPY

`ADD`はtarやgzを解凍して配置したり、リモートから追加する等の機能がある。

ただコピーしたいだけなら`COPY`を使う。

```Dockerfile
ADD add.tar /tmp

COPY copy.zip /tmp
```

※ zipはADDでも解凍してくれないらしい

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

### CMDとENTRYPINT

それぞれ`docker run`の時に実行するプロセスを指定する。

使い方が似ているけど意味合いはかなり異なるみたい。

---

#### docker run commandとENTRYPOINT["command"]

`CMD`のことは忘れて、`run`時のプロセスを指定する方法は以下の二つ。

1. `docker run {image} command param1 param2`

2. Dockerfileに`ENTRYPOINT ["command", "param1", "param2"]`を記載

ちなみにこの二つが競合した場合は、`ENTRYPOINT`が優先される。

ただし、`docker run {image} --entrypoint command`で`ENTRYPOINT`を上書きすることもできる。

---

#### CMDは上記のデフォルト値指定

`CMD`は、`docker run {image}`に続く入力のデフォルト値を指定しているだけ。

デフォルトなので、`docker run {image}`の後にコマンドを指定すればそちらが優先される。

1. `docker run {image}`

    ```Dockerfile
    CMD ["command","param1","param2"]
    ```

    `ENTRYPOINT`との併用もできるが、コマンドは`ENTRYPOINT`のものが最優先で実行される。

    その場合、`ENTRYPOINT`に指定された内容の追加引数、のデフォルト値となる。

2. Dockerfileに`ENTRYPOINT`を記載

    ```Dockerfile
    ENTRYPOINT ["command", "param1"]

    CMD ["param2"]
    ```

以下の例だと、`docker run {image}`でrunすると、`command --help`が実行される。

一方、`docker run {image} --build`でrunすると、`command --build`が実行されることになる。

```Dockerfile
ENTRYPOINT ["command"]

CMD ["--help"]
```

---

### FROM

ベースイメージは極力公式のものを使う。

ちょっとした環境なら軽量の`alpine`をベースとしたイメージを使う。

（複雑になってくると`apk`で取れるバージョンが古かったり、何かしらで詰まって諦めることが多い気がします。）

---

### ファイル構成

Dockerfileの同階層以下には、必要なものを除き、極力ファイルを配置しない。

Dockerfile用のディレクトリを一つ掘って置いておく。

それが無理なら.dockerignoreに書く。

---

間違っていたら教えてくれるとありがたいです。

参考サイトは以下。

- [Dockerfile のベストプラクティスを自分なりに整理してみた](https://qiita.com/ao_log/items/f615e0e82164ad854792)

- [DockerfileのCMDとENTRYPOINTを改めて解説する](https://qiita.com/uehaj/items/e6dd013e28593c26372d)

---

<a href="https://px.a8.net/svt/ejp?a8mat=35DFWV+F4RNAQ+50+2HLITT" target="_blank" rel="nofollow">
<img border="0" width="728" height="90" alt="" src="https://www29.a8.net/svt/bgt?aid=190423759915&wid=001&eno=01&mid=s00000000018015049000&mc=1"></a>
<img border="0" width="1" height="1" src="https://www17.a8.net/0.gif?a8mat=35DFWV+F4RNAQ+50+2HLITT" alt="">

---