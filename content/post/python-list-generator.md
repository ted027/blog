---
title: "Python List内包表記 vs. Generator"
date: 2021-03-26T6:45:02+09:00
draft: false
comments: true
toc: true
categories: ["Python"]
tags: ["List", "Generator"]
---

<!--more-->

---

{{< ad/a8/techacademy_python >}}

---

PythonでList内包表記をとGeneratorをどう使い分けるか。

```py
# List comprehension
>>> lst = [x*2 for x in range(10)]
>>> lst
[0, 2, 4, 6, 8, 10, 12, 14, 16, 18]

# Generator expression
>>> gen = (x*2 for x in range(10))
>>> next(gen)
0
>>> next(gen)
2
```

---

### List内包表記を使う場面

List内包表記は、全ての要素を計算し、保持して返却します。

なので、indexやsliceを使って途中要素にアクセスしたり、何度も同じ要素にアクセスする場合に利用します。

* 結果を繰り返し利用する場合
* 特定要素にアクセスする場合

---

### Generatorを使う場面

Generatorは作成時点で各要素を計算するわけではありません。  
`yield`を使い、返却する値のみを計算します。  
そのため、要素が膨大/無限でリストに保持しておけない場合や、一周しか利用しないため保持する必要がない場合に利用します。

* 扱う範囲が大きい、或いは無限の場合
* 結果を一度しか利用しない場合

---

ちなみに、`all`や`any`の引数にList内包表記を指定すると、pylintでGeneratorにしろと指摘されるようです。

```sh
...[R1729(use-a-generator), ...] Use a generator instead 'all(x*2 for x in range(10))'
```

---

### 参考

* [Generator expressions and list comprehensions](https://docs.python.org/3/howto/functional.html#generator-expressions-and-list-comprehensions)
* [Generator expressions vs. list comprehensions](https://stackoverflow.com/questions/47789/generator-expressions-vs-list-comprehensions)

---

{{< ad/con/wide/python_dokugaku >}}

---

{{< ad/a8/techacademy_py_ai >}}

---
