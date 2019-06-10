---
title: "JavaScriptで複数の配列に対しforループ"
date: 2019-06-01T01:28:45+09:00
draft: false
comments: true
categories: ["JavaScript"]
tags: ["連想配列", "ループ"]
---

JavaScriptで配列を二つ見ながらループしたかった。

<!--more-->

---

{{< ad/afb/btc >}}

---

### Pythonだとzip

Pythonだと、zip関数を使って書ける。

```py
chiba = ["10", "10", "10", "3"]
hyogo = ["1", "0", "1", "2"]

for c, h in zip(chiba, hyogo):
    print(f"{c}-{h}")
```

JavaScriptにzip的なものは実装しないと無さそうだったので、他の方法を使う。

---

### JavaScriptのループ

- 基本的なやつ

```js
var chiba = ["10", "10", "10", "3"]
for (var i = 0; i < chiba.length; i++) {
    console.log(chiba[i])
}
```

- for in
  - オブジェクトのプロパティ名を取り出す

```js
var chiba = ["10", "10", "10", "3"]
for (var i in chiba) {
    console.log(chiba[i])
}
```

- for of
  - オブジェクトのプロパティ値を取り出す

```js
var chiba = ["10", "10", "10", "3"]
for (var i of chiba) {
    console.log(i)
}
```

- forEach

```js
var chiba = ["10", "10", "10", "3"]
chiba.forEach(funcrtion(value){
    console.log(value)
})
```

---

### JavaScriptで複数オブジェクトのループ

今回のケースに関しては、基本のやつで特に問題なく動く。

```js
var chiba = ["10", "10", "10", "3"]
var hyogo = ["1", "0", "1", "2"]
for (var i = 0; i < chiba.length; i++) {
    console.log('%s-%s', chiba[i], hyogo[i])
}
```

連想配列にしてループしてもできる。

```js
var chiba = ["10", "10", "10", "3"]
var hyogo = ["1", "0", "1", "2"]
var series = {}
for (var i = 0; i < chiba.length; i++) {
    series[chiba[i]] = hyogo[i]
}
for (k in series) {
    console.log('%s-%s', k, series[k])
}
```

---

### おわり

まだ慣れておらず試行錯誤しながら書いていますが、もっといい方法ありそう。。

---

{{< ad/con/wide/javascript >}}

---

{{< ad/a8/techacademy_nodejs >}}

---
