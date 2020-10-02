---
title: "Linuxで特定パターン以外のファイルを削除"
date: 2020-10-02T12:52:09+09:00
draft: false
comments: true
toc: true
categories: ["Shell"]
tags: ["Linux", "削除"]
---

<!--more-->

---

{{< ad/afb/codecamp >}}

---

### 特定パターンのファイルを削除する際

カレントディレクトリの`*.log`ファイルと`*.txt`ファイルを全て削除したい場合。

```sh
$ rm -r *.log *.txt
```

---

### 特定パターン以外のファイルを削除する際

カレントディレクトリの`*.log`と`*.txt`だけ残して、他のファイルを全て削除したい場合。

```sh
$ ls | grep -v  '*.log|*.txt' | xargs -r
```

`ls -a`を指定すれば隠しファイルも消える。

```sh
$ ls -a | grep -v  '*.log|*.txt' | xargs -r
```

---

{{< ad/con/wide/unix >}}

---
