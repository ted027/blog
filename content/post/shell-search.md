---
title: "Linuxでファイル検索する際のコマンド"
date: 2019-04-26T14:23:28+09:00
draft: false
comments: true
categories: ["Shell"]
tags: ["Linux", "検索"]
---

特定ディレクトリや配下ディレクトリのファイル名/ファイルの中身を検索する。

<!--more-->

---

{{< ad/afb/codecamp >}}

---

### ファイル名検索

- 特定ディレクトリのファイル名検索

```sh
$ ls {directory/path} | grep {search_word}
```

- 特定ディレクトリ配下のファイル名検索

```sh
$ find {directory/path} | -type f -name \*{search_word}\*
```

- 特定ディレクトリ配下のディレクトリ名検索

```sh
$ find {directory/path} | -type d -name \*{search_word}\*
```

### ファイル内容検索

- 特定ディレクトリのファイル内容検索（一致場所表示）

```sh
$ grep {search_word} {directory/path}/*
```

- 特定ディレクトリのファイル内容検索（一致場所非表示）

```sh
$ grep {search_word} -l {directory/path}/*
```

- 特定ディレクトリ配下のファイル内容検索（一致場所表示）

```sh
$ grep {search_word} -r {directory/path}
```

- 特定ディレクトリ配下のファイル内容検索（一致場所非表示）

```sh
$ grep {search_word} -rl {directory/path}
```

---

{{< ad/con/wide/unix >}}

---

{{< ad/a8/techacademy>}}

---
