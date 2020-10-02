---
title: "Linuxでディレクトリサイズをソート"
date: 2020-10-03T00:24:22+09:00
draft: false
comments: true
toc: false
categories: ["Shell"]
tags: ["Linux", "サイズ", "ソート"]
---

<!--more-->

---

{{< ad/a8/techacademy_ui >}}

---

ディスク容量が一杯になった時など、ディレクトリを辿りながら大きい不要ファイルを探したりする。

`du -h`の実行結果をソートするのが見やすい。

`--max-depth=1`でカレントディレクトリのみ探せる。

```sh
$ du -h --max-depth=1 | sort -hr
2.1M    .
1.9M    ./.git
84K     ./python_
64K     ./other
28K     ./shell
16K     ./typescript
12K     ./ruby
12K     ./batch
8.0K    ./perl
8.0K    ./go
```

---

{{< ad/afb/codecamp >}}

---
