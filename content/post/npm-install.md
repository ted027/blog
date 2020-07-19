---
title: "'npm install'のバージョン固定とdependencies"
date: 2020-07-18T22:51:56+09:00
draft: false
comments: true
toc: true
categories: ["nodejs"]
tags: ["npm", "install", "version"]
---

<!--more-->

---

{{< ad/afb/codecamp >}}

---

### globalにインストールする

コマンドを実行する環境で、どのディレクトリでも使えるようにする。

```sh
npm install -g @types/react
```

### 依存パッケージとしてインストールする

カレントディレクトリのnodeパッケージを作成/更新し、dependenciesにパッケージをインストールする。  
製品ビルドで含むパッケージはこちらで入れる。

```sh
npm install --save @types/react
```

### 開発用依存パッケージとしてインストールする

devDependenciesにパッケージをインストールする。
開発時のみ利用するパッケージはこちらで入れる。

```sh
npm install --save-dev @types/react
```

### バージョンを指定してインストールする

バージョンを指定してインストールする。  

```sh
npm install --save @types/react@16.9.43
```

デフォルト設定では、キャレット記号（`^`）がつく。  
（例） "@types/react": "^16.9.43"  
これは**最上位の0以外のバージョン番号**を固定する意。
なので、メジャーバージョンが0以外なら、メジャーバージョン固定となる。

### バージョンを固定してインストールする

勝手にアップデートされたくない、使うバージョンを決めたい場合は`--save-exact`をつける。

```sh
npm install --save @types/react@16.9.43 --save-exact
```

---

{{< ad/a8/techacademy_nodejs >}}

---
