---
title: "タグのhref属性でリダイレクトを起こさない"
date: 2019-07-30T23:12:34+09:00
draft: false
comments: true
toc: false
categories: ["JavaScript"]
tags: ["html", "タグ", "href"]
---

<!--more-->

---

{{< ad/afb/codecamp >}}

---

{{< ad/con/wide/nodejs >}}

---

htmlのaタグでhrefに絶対/相対URLを指定することでリンクに飛ばすことができる。

```js
<a href="https://www.ted027.com">クリック</a>
```

新しいウィンドウで開くには`target="_blank"`を指定する。

```js
<a href="https://www.ted027.com" target="_blank">クリック</a>
```

または、以下のように`onClick`を使っても新しいウィンドウで開くことができる。

```js
<a href="" onclick="window.open('https://www.ted027.com')">クリック</a>
```

ただし、これだと元の画面がリダイレクトしてしまう。これを防ぐには、hrefに`javascript:void(0)`を指定する。

```js
<a href="javascript:void(0)" onclick="window.open('https://www.ted027.com')">クリック</a>
```

void式が必ず`undefined`を返すことと、hrefに`undefined`が指定されると画面遷移が起きないことから、この書き方が一般的らしい。0に特に意味は無い。

---

{{< ad/con/wide/javascript >}}

---

{{< ad/a8/techacademy_nodejs >}}

---
