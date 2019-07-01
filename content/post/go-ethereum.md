---
title: "ローカルでイーサリウムのネットワークを構築してみる"
date: 2019-07-01T22:50:12+09:00
draft: true
comments: true
toc: true
categories: ["ブロックチェーン"]
tags: ["Ethereum", "Golang", "Geth"]
---

ローカルにイーサリアムのネットワークを構築して遊んでみる（※本物のイーサリアムをマイニングするわけではないです）。

<!--more-->

---

{{< ad/ >}}

---

### イーサリアム (Ethereum)

かの有名なBitCoinに次ぐ、時価総額世界第二位の仮想通貨。

{{< img src="/img/ethereum.jpg" >}}

[Ethereum](https://www.ethereum.org)
- github
  - https://github.com/ethereum

今回はGo言語で実装された`geth(go ethereum)`を使ってみる。

---

### 環境構築

`geth`をインストールする。

```sh
$ git clone -b release/1.8 https://github.com/ethereum/go-ethereum
$ cd go-ethereum/
$ make geth
```

PATHに追加。

```sh
$ export PATH=/(path)/(to)/go-ethereum/build/bin:$PATH
```

---

### 最初のブロックを作る

#### genesis.jsonを作成

とりあえず作業用ディレクトリを作成。

```sh
$ mkdir ~/geth
```

最初のブロック(Genesis block)を作るため、作業用ディレクトリに以下のような`genesis.json`を作る。

```json
{
  "config": {
    "chainId": 15,
    "homesteadBlock": 0,
    "eip155Block": 0,
    "eip158Block": 0
  },
  "alloc": {
  "0x0000000000000000000000000000000000000001": {
    "balance": "111111111"
  },
  "0x0000000000000000000000000000000000000002": {
    "balance": "222222222"
  },
  "coinbase": "0x0000000000000000000000000000000000000000",
  "difficulty": "0x20000",
  "extraData": "",
  "gasLimit": "0x2fefd8",
  "nonce": "0x0000000000000042",
  "mixhash": "0x0000000000000000000000000000000000000000000000000000000000000000",
  "parentHash": "0x0000000000000000000000000000000000000000000000000000000000000000",
  "timestamp": "0x00"
}
```

`nonce`はセキュリティ担保のため？適当なランダム値を推奨されている。

`difficulty`はマイニングの難易度。

`alloc`は空`{}`でもいいが、アカウントと残高を初期設定できる。

---

#### プライベートネットを作成

まずは初期化。

```sh
$ geth --datadir ~/geth/ init ~/geth/genesis.json
```

処理が成功したら、プライベートネットを起動する。

```sh
$ geth --networkid 10 --datadir ~/geth/ console 2>> ~/geth/error.log
```

これでプライベートネットが起動し、最初のブロックが作成される。

---

---

https://github.com/ethereum/go-ethereum/wiki/Private-network

https://enomotodev.hatenablog.com/entry/2018/02/18/182032

---

{{< ad/ >}}

---
