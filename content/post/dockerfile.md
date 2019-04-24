---
title: "Dockerfile"
date: 2019-04-24T17:35:18+09:00
draft: true
comments: true
categories: ["Docker"]
tags: ["Docker", "Dockerfile"]
---

Dockerfileを書く時に気にしていることのメモ。

 <!--more-->

---

---

- https://qiita.com/ao_log/items/f615e0e82164ad854792

- https://qiita.com/c18t/items/f3a911ef01f124071c95

### RUNの使い方

- 可読性を損ねない範囲でなるべく一行で書く。

- 最初に`set -ex`をつけて途中でエラーが起きた場合に対処しやすいようにする

- 複数モジュールインストールする場合は一行ずつ分けて、アルファベット順に並べておくのがいい

### 変数について

### ADDとCOPY

### レイヤとキャッシュ