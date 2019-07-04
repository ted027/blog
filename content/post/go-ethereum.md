---
title: "ローカルでイーサリアムのネットワークを構築してみる"
date: 2019-07-02T07:50:12+09:00
draft: false
comments: true
toc: true
categories: ["ブロックチェーン"]
tags: ["Ethereum", "Golang", "Geth"]
---

ローカルにイーサリアムのネットワークを構築して遊んでみる（※本物のイーサリアムをマイニングするわけではないです）。

<!--more-->

---

{{< ad/con/wide/unix >}}

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

aptでインストールする場合は以下。

```sh
$ add-apt-repository -y ppa:ethereum/ethereum
$ apt-get update
$ apt-get install ethereum
```

もしくはgithubからバージョンを指定して直接取得する。

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
    }
  },
  "coinbase": "0x0000000000000000000000000000000000000000",
  "difficulty": "0x20000",
  "extraData": "",
  "gasLimit": "0x2fefd8",
  "nonce": "0x0000000000012345",
  "mixhash": "0x0000000000000000000000000000000000000000000000000000000000000000",
  "parentHash": "0x0000000000000000000000000000000000000000000000000000000000000000",
  "timestamp": "0x00"
}
```

`chainid`は、1はメインネットを表すので、1以外の適当な値を指定。

`difficulty`はマイニングの難易度。

`alloc`でウォレットの初期設定ができる。空`{}`でもいい。

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

#### 作成したブロックを確認

`eth.getBlock([Block Number])`で確認できる。

```sh
> eth.getBlock(0)
{
  difficulty: 131072,
  extraData: "0x",
  gasLimit: 3141592,
  gasUsed: 0,
  hash: "0x0a34aafeef87619754f3607753cc229b6f2c88c127cc7ddfad3c54e702ad1373",
  logsBloom: "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
  miner: "0x0000000000000000000000000000000000000000",
  mixHash: "0x0000000000000000000000000000000000000000000000000000000000000000",
  nonce: "0x0000000000012345",
  number: 0,
  parentHash: "0x0000000000000000000000000000000000000000000000000000000000000000",
  receiptsRoot: "0x56e81f171bcc55a6ff8345e692c0f86e5b48e01b996cadc001622fb5e363b421",
  sha3Uncles: "0x1dcc4de8dec75d7aab85b567b6ccd41ad312451b948a7413f0a142fd40d49347",
  size: 507,
  stateRoot: "0x92683e6af0f8a932e5fe08c870f2ae9d287e39d4518ec544b0be451f1035fd39",
  timestamp: 0,
  totalDifficulty: 131072,
  transactions: [],
  transactionsRoot: "0x56e81f171bcc55a6ff8345e692c0f86e5b48e01b996cadc001622fb5e363b421",
  uncles: []
}
```

---

構築したネットワークで遊ぶのは今度。

---

- 参考
  - https://github.com/ethereum/go-ethereum/wiki/Private-network
  - https://enomotodev.hatenablog.com/entry/2018/02/18/182032

---

{{< ad/a8/techacademy_blockchain >}}

---
