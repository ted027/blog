---
title: "NodeJSでlisten EACCES 0.0.0.0:443エラー"
date: 2021-01-13T23:54:03+09:00
draft: false
comments: true
toc: false
categories: ["nodejs"]
tags: ["npm", "エラー"]
---

<!--more-->

---

{{< ad/a8/techacademy_nodejs >}}

---

### 問題

`npm start`とかした際に`EACCES 0.0.0.0::443`のようにエラーが出ることがある。

### 解決策

`sudo npm start`すればよい。

1024未満のportはprivilleged portsとなっており、管理者権限がないとここを開けることが出来ない。

---

{{< ad/a8/techacademy_nodejs >}}

---
