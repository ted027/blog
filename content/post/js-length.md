---
title: "JavaScriptで連想配列の長さを取得する"
date: 2019-05-29T22:47:01+09:00
draft: false
comments: true
toc: false
categories: ["JavaScript"]
tags: ["連想配列", "エラー"]
---

<!--more-->

---

{{< ad/afb/codecamp >}}

---

{{< ad/con/wide/nodejs >}}

---

連想配列の長さを撮ろうとして、素直にlengthを使ったところ、`undefined`が返っていた。

```js
var array = {ichi: ".380", uchi: ".370", ochi: ".360"}
for (var i = 0; i < array.length i++) {
    ...
    // -> undefined
```

この場合、`Object.keys`でkeyだけの配列を取得してからlengthを使う。

```js
var array = {ichi: ".380", uchi: ".370", ochi: ".360"}
for (var i = 0; i < Object.keys(array).length i++) {
    ...
    // -> 3
```

ちなみに、`Object.values`でvalueだけの配列を取得できる。

---

{{< ad/con/wide/javascript >}}

---

{{< ad/a8/techacademy_nodejs >}}

---
