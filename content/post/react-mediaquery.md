---
title: "Reactでのレスポンシブ対応"
date: 2019-06-15T15:42:54+09:00
draft: false
comments: true
toc: true
categories: ["React"]
tags: ["Javascript", "NodeJS", "レスポンシブ"]
---

Reactでメディアクエリを設定しレスポンシブ対応。

<!--more-->

---

{{< ad/afb/codecamp >}}

---

{{< ad/con/wide/nodejs >}}

---

### cssで通常のmedia query

通常レスポンシブ対応は、cssでmediaクエリを設定し、ページ幅に応じて表示するコンテンツを変えることで対応する。

以下の例だと、普段は`smartphone_area`のクラスを持つコンテンツを表示し、`pc__area`のクラスを持つコンテンツを非表示とする。

横幅が`767px`以上になったら、`smartphone_area`のクラスを持つコンテンツを非表示とし、`pc__area`のクラスを持つコンテンツを表示する。

```css
.smartphone__area {
	display: block;
}

.pc__area {
	display: none;
}

@media screen and (min-width: 767px) {
	.smartphone_area {
		display: none;
	}

	.pc__area {
		display: block;
	}
}
```

これを使って、以下のように書くと、横幅によって一方の`div`コンテンツだけが表示されるため、幅にあった表示のコンテンツを提供できる。

```html
<div class="smartphone__area">
    <SmartPhoneContents />
</div>
<div class="pc__area">
    <PCContents />
</div>
```

---

### Reactでのmedia query

Reactでは、npmの`react-responsive`パッケージを使うことで簡単にレスポンシブの動作を実現できる。

まず`package-json`のあるディレクトリで`react-responsive`をインストール。

```sh
$ npm install react-responsive --save
```

これで`package-json`に追加されます。

あとはファイルにimportして、以下のように使うだけ。

```js
import MediaQuery from "react-responsive";

<MediaQuery query="(max-width: 767px)">
    <SmartPhoneContents />
</MediaQuery>
<MediaQuery query="(min-width: 767px)">
    <PCContents />
</MediaQuery>
```

### 実際の動作

[プロ野球成績表](https://www.ted027.com/records/)は、以下のように、スマホから見た場合は、チーム名や選手名で改行して表示するようにしている。

---

{{< img src="/img/react-responsive1.png" >}}

---

{{< img src="/img/react-responsive2.png" >}}

---

{{< ad/con/wide/react >}}

---

{{< ad/a8/techacademy_ui >}}

---
