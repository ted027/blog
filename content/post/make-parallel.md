---
title: "Makefileで一部並列化をしたかった"
date: 2019-04-26T07:32:32+09:00
draft: true
comments: true
categories: ["Makefile"]
tags: ["Makefile", "並列", "wait"]
---

Makefileでターゲット呼ぶ際、全部でなく一部分だけ並列で実行したかった。

 <!--more-->

---

---

### 概要

Makefileを普通に並列で実行しようとしたら、`-j`のオプションをつけて実行すればいい。

```
$ make target -j3
```

ただ今回、targetに書いた処理のうち一部だけ並列化し、他の部分は順序通り実行してほしかった。

シェルで並列実行といえば、コマンドに`&`をつけてバックグラウンド実行にして、それをwaitで待つ、というのが一般的。

なので以下のように書きました。が、これだと待ってくれない。

```Makefile
target:
    command-parallel1 &
    command-parallel2 &
    wait
    command3
...
```

### Makeで改行するとwaitは効かない

Makeは一行ごとに違うシェルで実行される。なので、上のように書くと、

1. 1つめのシェルでcommand-parallel1をバックグラウンド実行
2. 2つめのシェルでcommand-parallel2をバックグラウンド実行
3. 3つめのシェルでwaitを実行するが、子プロセスがいなければ一瞬で終了する
4. command3を実行

となる。このため、高い確率で、並列処理中に`command3`へ進んでしまう。

これを防ぐには、シェルを変えずにワンライナーで書けばよい。

```Makefile
target:
    command-parallel1 & \
    command-parallel2 & \
    wait \
    command3
...
```

### 並列処理で起きたエラーはスキップされる

自分の場合、上で解決…とはならず、今度は、並列処理の中でエラーが起きた際もスキップされてしまう、という問題が。

waitの仕様として、最後に終了した子プロセスの終了ステータスが正常終了なら、wait自身も正常終了を返し先に進む。なので、

```Makefile
target:
    command-parallel1 & \ # <- 先にエラー終了
    command-parallel2 & \ # <- 後で正常終了
    wait \ # <- 正常終了とみなす
    command3
...
```

となり、`command-parallel1`のエラーが無視されてしまう。

`wait $(PID)`でプロセスIDごとに待ってみようとしても、改行すると効かなくなるので、

```
    wait $(PID1) && wait $(PID2)
```

のようにもできない。

### 結局jobsオプションで解決

解決というか、targetの形は変えたけど、

```Makefile
target-parallel:
    command-parallel1
    command-parallel2

target-post:
    command3
```

```
$ make -j3 target-parallel
$ make target-post
```

結論としては、失敗するかもしれないような処理を並列とwaitで雑に処理するな、ということですね。