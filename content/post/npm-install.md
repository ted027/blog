---
title: "Npm Install"
date: 2020-07-14T16:09:56+09:00
draft: true
comments: true
toc: true
categories: []
tags: []
---

<!--more-->

---

{{< ad/ >}}

---

### globalにインストールする

コマンドを実行する環境で、どのディレクトリでも使えるようにする。

```
npm install -g @types/react
```

### 依存インストールする

カレントディレクトリのnodeパッケージを作成/更新し、dependenciesにパッケージをインストールする。  
dependenciesに

```
npm install --save @types/react
```

### 

devDependenciesにパッケージをインストールする。

```
npm install --save-dev @types/react
```

```
npm install --save @types/react@16.9.43
```

```
npm install --save @types/react@16.9.43 --save-exact
```

---

{{< ad/ >}}

---
