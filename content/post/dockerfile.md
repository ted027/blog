---
title: "Dockerfileの書き方や紛らわしいコマンドの話"
date: 2019-04-24T17:35:18+09:00
draft: false
comments: true
categories: ["Docker"]
tags: ["Dockerfile"]
---

Dockerfileを書く時に気にしていること、よくわからなくて調べたことなど。

<!--more-->

---

{{< ad/afb/codecamp >}}

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

 - [[参考記事]Dockerでコマンド実行結果を変数に入れられなくて困った話](https://www.ted027.com/post/docker-var)

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

{{< ad/con/wide/docker >}}

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

{{< ad/con/wide/docker >}}

---

{{< ad/a8/onamae >}}

---
