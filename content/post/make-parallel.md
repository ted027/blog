---
title: "Makefileで一部だけ並列処理で実行する"
date: 2019-04-26T07:32:32+09:00
draft: false
comments: true
categories: ["GNU Make"]
tags: ["Makefile", "並列", "wait"]
---

Makefileでターゲットを呼ぶ際、全部でなく一部分だけ並列で実行したかった。

<!--more-->

---

{{< ad/afb/btc >}}

---

### 概要

Makeを並列で実行するには、`-j`のオプションをつけて実行する。

```sh
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

---

### Makeで改行するとwaitは効かない

Makeは一行ごとに違うシェルで実行される。なので、上のように書くと、

1. 1つめのシェルでcommand-parallel1をバックグラウンド実行
2. 2つめのシェルでcommand-parallel2をバックグラウンド実行
3. 3つめのシェルでwaitを実行するが、子プロセスがいなければ一瞬で終了する
4. command3を実行

となり、高い確率で、並列処理中に`command3`へ進んでしまう。

これを防ぐには、シェルを変えずにワンライナーで書けばよい。

```Makefile
target:
    command-parallel1 & \
    command-parallel2 & \
    wait \
    command3
    ...
```

---

### 並列処理で起きたエラーはスキップされる

これで部分的な並列化は実現できた。

ところが、並列処理の中でエラーが起きた際にスキップされてしまう可能性がある。

waitの仕様として、最後に終了した子プロセスの終了コードを自身の終了コードとする。なので、

```Makefile
target:
    command-parallel1 & \ # <- 先にエラー終了
    command-parallel2 & \ # <- 後で正常終了
    wait \ # <- 正常終了とみなす
    command3
    ...
```

のように、`command-parallel1`のエラーが無視されてしまうケースがある。

`wait $(PID)`でプロセスIDごとに待ってみようとしても、改行すると効かなくなるので、

```Makefile
    wait $(PID1) && wait $(PID2)
```

と、それぞれの終了ステータスを見て進むこともできない。

---

### 結局jobsオプションで解決

解決といえるか微妙だけど、targetの形を変えて、

```Makefile
target-parallel:
    command-parallel1
    command-parallel2

target-post:
    command3
```

```sh
$ make -j3 target-parallel
$ make target-post
```

で落ち着いた。

結論としては、失敗するかもしれないような処理を並列化とwaitで雑に処理するな、ということですね。

---

{{< ad/con/wide/make >}}

---

{{< ad/a8/techacademy_py_ai >}}

---
