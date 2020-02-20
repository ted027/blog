---
title: "Github Pages 独自ドメインの証明書エラー"
date: 2019-06-07T22:19:54+09:00
draft: false
comments: true
toc: true
categories: ["Blog"]
tags: ["エラー", "GitHub Pages", "ドメイン"]
---

前々から出ていた証明書エラーが気になっていたので対策。

<!--more-->

---

{{< ad/afb/codecamp >}}

---

{{< ad/a8/onamae >}}

---

### 概要

Github Pagesでは独自ドメインに対してもSSL証明書を発行してくれるため、設定すればhttps接続を行うことができる。

はずなのだが、証明書エラーが出ていたため対処した。

---

### GitHub Pagesでの設定

GitHubから、GitHub Pagesで公開するレポジトリへアクセスし、Settingsを開く。

下の方で`GitHub Pages`の設定項目野中の、`Custom Domain`に独自ドメインを設定、`Enforce HTTPS`のチェックをつける。

{{< img src="/img/github-pages-https.png" >}}

すると、独自ドメイン名が記述された`CNAME`ファイルが自動生成される。

---

### ドメイン側の設定

サブドメイン(`www`などが先頭に付く)を使う場合は上記だけでよさそうだが、自分は以下のようにメインドメインの転送設定を行っていたため証明書エラーに。

```
www.ted027.com <= ted027.com
```

なので、<a href="https://px.a8.net/svt/ejp?a8mat=35DFWV+F4RNAQ+50+2HHVNM" target="_blank" rel="nofollow">お名前.com</a>
<img border="0" width="1" height="1" src="https://www12.a8.net/0.gif?a8mat=35DFWV+F4RNAQ+50+2HHVNM" alt="">で追加の設定。

- [Github Pages - Setting up a custom subdomain](https://help.github.com/en/articles/setting-up-an-apex-domain)

このページを参考に、独自メインドメインに以下のAレコード4つを追加。

```
185.199.108.153
185.199.109.153
185.199.110.153
185.199.111.153
```

{{< img src="/img/domain-certificate.png" >}}

少し待ってからアクセスすると、証明書エラーが起きなくなっている。

---

{{< ad/con/wide/github >}}

---

{{< ad/a8/onamae >}}

---
