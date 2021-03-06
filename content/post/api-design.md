---
title: "REST API設計で気にするべきこと"
date: 2019-09-16T20:42:03+09:00
draft: false
comments: true
toc: true
categories: ["API"]
tags: ["REST", "WebAPI"]
---

<!--more-->

---

{{< ad/a8/techacademy2 >}}

---

### URIは名詞

APIのURIはリソースを表す名詞。基本的に複数形を使う。URIが指すリソースに大して、各種メソッド(動詞)の操作を行う。

URIは簡潔で、かつ何のリソースを指すのかわかりやすい名前にする。

---

### メソッドは基本的にCRUDに対応する4つ

主に使うのは上4つ。

|メソッド|CRUD|説明|
|:-:|:-:|:-:|
|**GET**|READ|**リソース取得**|
|**POST**|CREATE|**リソース作成**|
|**PUT**|UPDATE|**リソース更新 or 作成**|
|**DELETE**|DELETE|**リソース削除**|
||||
|HEAD||リソースのヘッダ取得|
|OPTIONS||リソースがサポートするメソッド取得|
|TRACE||リクエストを返す|
|CONNECT||プロキシ経由でhttps通信|

---

### URIの階層は親子関係

URIを階層構造にする際は、「コレクション」と「特定の要素」のような関連性を示す。

一番基本形は`/コレクション/名詞`。

ただし、階層はなるべく浅く保ち、複雑になる部分はクエリパラメータで指定させる。

---

### POSTの対象になるURIは複数形

POSTは、複数個存在するリソースを対象として、新たな一つを新規作成する。特定の一つを指定してPOSTを行うことはしない。

なので、POSTの対象になるURIは名詞の複数形にする。

---

### URIに含むIDはランダム文字列

連番の数字などは予測されやすいため、予測されても問題ないものでなければ、UUID等のランダム文字列にするとよい。

また、あとで変更できなくなるため、IDを意味のある文字列にしない。

---

### バージョニング

階層の最上位や上の方にバージョンを入れておく。

内部処理の変更程度ならバージョンは上げない。振る舞いが保てないほどの変更を入れる場合にバージョンを上げる。

---

### 認証/認可

認可プロトコルはOAuth2を利用する。

認証プロトコルはOpenIDが有名。

---

### おわり

以上はあくまで基本方針であり、原理主義的にならないようにする。あくまで使い手が使いやすいよう心がける。

間違いあったらすみません。

---

### 参考

- [RESTful API設計入門](https://www.slideshare.net/MonstarLabInc/rest-ful-api)
- [Web API 設計のベストプラクティス集 ”Web API Design - Crafting Interfaces that Developers Love”](http://please-sleep.cou929.nu/20130121.html)
- [RESTfulなWeb APIを設計するときに考えること](https://qiita.com/shrkw/items/c6123ca25981e44a3d82)

---

{{< ad/afb/btc >}}

---

{{< ad/a8/techacademy1 >}}

---

{{< ad/a8/techacademy_py_ai >}}

---
