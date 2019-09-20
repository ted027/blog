---
title: "Pythonの内包表記と条件文"
date: 2019-05-13T22:45:10+09:00
draft: false
comments: true
categories: ["Python"]
tags: [内包表記", "条件付き内包表記"]
---

Pythonの内包表記で作れるもの、条件文との組み合わせ。

<!--more-->

---

{{< ad/a8/techacademy >}}

---

{{< ad/con/wide/python_analytics >}}

---

### 内包表記

Pythonでループを回してリストを作る際、リスト内包表記が使える。

```py
my_list = []
for i in range(10):
    my_list.append(i * 2)
```

こう書かなくても、

```py
my_list = [i * 2 for i in ramge(10)]
```

こう書ける。

リストだけでなく、dictも内包表記で作れる。

```py
my_dict = {names[i]: scores[i] for i in range(10)}
```

括弧で括って内包表記を書くとtupleになりそうだが、ならない。これはジェネレータになる。

```py
my_generator = (i * 2 for i in ramge(10))
```

tupleは内包表記で作れないので、リストを作ってtupleで変換する。

```py
my_tuple = tuple([i * 2 for i in ramge(10)])
```

---

### 条件付き内包表記

条件付き内包表記でリストやdictなどを作成することができる。

この場合、`if`のみか`if~else~`かで書く場所が異なる。

#### if

普通に書くと、

```py
my_list = []
for i in range(10):
    if i % 2:
        my_list.append(i * 2)
```

リスト内包表記で書くと、

```py
my_list = [i * 2 for i in ramge(10) if i % 2]
```

ifはfor文の後ろに置く。

#### if〜else〜

普通に書くと、

```py
my_list = []
for i in range(10):
    if i % 2:
        my_list.append(i * 2)
    else:
        my_list.append(i / 2)
```

リスト内包表記で書くと、

```py
my_list = [i * 2 if i % 2 else i / 2 for i in ramge(10)]
```

if〜else〜はfor文の前に置く。

---

### おわり

ifのみの方はリストに格納するものを取捨選択する、if〜else〜の方は二択（かそれ以上）はあるが毎回リストに格納していく、と考えると、直感的に理解しやすい、かもしれません。

---

{{< ad/con/wide/python_taikutsu >}}

---

{{< ad/afb/codecamp >}}

---
