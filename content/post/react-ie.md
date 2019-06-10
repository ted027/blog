---
title: "ReactのInternetExplorer対応"
date: 2019-06-06T12:34:11+09:00
draft: false
comments: true
toc: true
categories: ["React"]
tags: ["Javascript", "NodeJS", "InternetExplorer"]
---

Reactで作ったページがIEで表示できなかった。

<!--more-->

---

{{< ad/a8/techstars>}}

---

{{< ad/con/wide/unix >}}

---

### 概要

InternetExplorer11が、JavascriptのES2015(ES6)記法に対応していないため。

マイクロソフトも使わないでくれと言うようなレガシーブラウザですが、今なお結構なシェアを誇っているため、対応せざるを得ないケースも多いかと。

---

### 対策

`polyfill`を使います。

`polyfill`は、「隙間を埋める」ような意味の言葉で、「存在しないメソッドを、既存メソッドで擬似的に再現する」ようなもの。

IEが対応していないES6のメソッドも、ES6以前のメソッドを用いて再現してくれます。

---

### 作業

`react-app-polyfill`と、`@babel/polyfill`を使います。

（僕の場合、前者だけだと表示されず。）

まず`package-json`のあるディレクトリで`polyfill`をインストール。

```sh
$ npm install react-app-polyfill --save
$ npm install @babel/polyfill --save
```

これで`package-json`に追加されます。

続いて、`index.js`ファイルに`import`します。

```js
import '@babel/polyfill'; 
import "react-app-polyfill/ie9";
import React from "react";
import ReactDOM from "react-dom";
...
```

`import "react-app-polyfill/ie11"`とするとIE11に、

`import "react-app-polyfill/ie9"`とするとIE9〜11に対応してくれる。

再度ビルドすると、無事IEから見ることが出来ました。

---

### おわり

弊社の標準ブラウザもInternet Explorer！！！()

---

{{< ad/con/wide/devops >}}

---

{{< ad/a8/techacademy2>}}

---
