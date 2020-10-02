---
title: "Linuxでディレクトリサイズをソート"
date: 2020-10-02T15:24:22+09:00
draft: true
comments: true
toc: true
categories: ["Shell"]
tags: ["Linux", "サイズ", "ソート"]
---

<!--more-->

---

{{< ad/a8/techacademy_ui >}}

---

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
