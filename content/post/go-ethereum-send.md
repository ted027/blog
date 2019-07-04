---
title: "ローカルで構築したイーサリアムでマイニングや送金"
date: 2019-07-04T12:42:14+09:00
draft: true
comments: true
toc: true
categories: ["ブロックチェーン"]
tags: ["Ethereum", "Golang", "Geth"]
---

イーサリアムのローカルネットでマイニングや送金、ブロックチェーンの生成を行う。

<!--more-->

---

{{< ad/con/wide/unix >}}

---

### 前回

gethをインストールし、イーサリアムのローカルネットを構築した。

- [ローカルでイーサリアムのネットワークを構築してみる](https://www.ted027.com/post/go-ethereum)

---

### アカウントを作成

マイニングや送金を行うため、アカウントを二人分作成する。

```sh
> personal.newAccount("passwor1")
"0xa60641a855ff4eb42ba4e39e3433064bfeee2ddd"
> personal.newAccount("passwor2")
"0x9e24224b65c317ed3a67dab395df2c6ad63dc28a"
```

---

### マイニング

デフォルトでは、マイニングの報酬は、最初のアカウント(`eth.accounts[0]`)に支払われる。

```sh
> eth.coinbase
"0xa60641a855ff4eb42ba4e39e3433064bfeee2ddd"
```

これを別のアカウントに変更するには以下。

```sh
> miner.setEtherbase(eth.accounts[1])
```

続いて、以下でマイニングを開始する。

```sh
> miner.start(1)
```

適当に時間を置いて、以下でマイニングを終了。

```sh
> miner.stop()
```

アカウントを覗いてみると、coinbaseのアカウントに報酬が入っている。

```sh
> eth.getBalance(eth.accounts[0])
0
> eth.getBalance(eth.accounts[1])
290000000000000000000
```

---

### 送金する

そのままだと送金できないので、アカウントのロックを解除する。



---

{{< ad/a8/techacademy_blockchain >}}

---
