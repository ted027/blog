---
title: "【ブロックチェーンお勉強】イーサリアムのローカルネットワークでマイニング、送金"
date: 2019-07-08T07:49:34+09:00
draft: false
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

- [【ブロックチェーンお勉強】イーサリアムのローカルネットワークを構築](https://www.ted027.com/post/go-ethereum)

---

### アカウントを作成

マイニングや送金を行うため、アカウントを二人分作成する。

```sh
> personal.newAccount("password1")
"0xa60641a855ff4eb42ba4e39e3433064bfeee2ddd"
> personal.newAccount("password2")
"0x9e24224b65c317ed3a67dab395df2c6ad63dc28a"
```

---

### マイニング

デフォルトでは、マイニングの報酬は、最初のアカウント(`eth.accounts[0]`)に支払われる。

```sh
> eth.coinbase
"0xa60641a855ff4eb42ba4e39e3433064bfeee2ddd"
```

別のアカウントに変更したければ以下のように実行する。

```sh
> miner.setEtherbase(eth.accounts[1])
```

マイニングを開始。

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
290000000000000000000
> eth.getBalance(eth.accounts[1])
0
```

---

### 送金する

#### 送金処理

そのままだと送金できないので、アカウントのロックを解除する。

```sh
> personal.unlockAccount(eth.accounts[0])
Passphrase:     # <= password1 を入力
true
```

マイニング報酬の入った`accounts[0]`から、`accounts[1]`へ1000weiほど送金してみる（weiは単位）。

```sh
> eth.sendTransaction({from: eth.accounts[0], to: eth.accounts[1], value: 1000})
"0x70d6b5a4c5e76a4bed69f6ae26c07fef739f3646bd88adb0c118f19ff3962269"
```

送金処理の返り値は、送金処理が記録されたトランザクションのハッシュ値。これを使ってトランザクションの情報を確認できる。

`blockNumber: null`なので、まだブロックに取り込まれていないことが分かる。

```sh
> eth.getTransaction("0x70d6b5a4c5e76a4bed69f6ae26c07fef739f3646bd88adb0c118f19ff3962269")
{
  blockHash: "0x0000000000000000000000000000000000000000000000000000000000000000",
  blockNumber: null,
  from: "0xa60641a855ff4eb42ba4e39e3433064bfeee2ddd",
  gas: 90000,
  gasPrice: 1000000000,
  hash: "0x70d6b5a4c5e76a4bed69f6ae26c07fef739f3646bd88adb0c118f19ff3962269",
  input: "0x",
  nonce: 0,
  r: "0x92639c3794adbd45e17753539e147fb37b32e4aa2c1413bbc30ec99ea1ea9d9e",
  s: "0x21199ada96137d39c20a35fc686202a7e62925f6dfa75de9f84db18f6fbc8530",
  to: "0x9e24224b65c317ed3a67dab395df2c6ad63dc28a",
  transactionIndex: 0,
  v: "0x42",
  value: 1000
}
```

送金したらアカウントのロックをかけ直す。ちなみに、しばらく放っておいてもロックがかかる。

```sh
> personal.lockAccount(eth.accounts[0])
true
```

#### 送金をブロックチェーンに取り込む

送金処理はまだ完了していない。完了させるには、マイニングによって、送金処理が記録されたトランザクションをブロックに取り込み、いわゆるブロックチェーンを繋げる必要がある。

再度マイニングを開始。

```sh
> miner.start(1)
```

しばらく待ってから再度トランザクションを確認する。

`blockNumber`に59が入ったので、ブロックに取り込まれたことが分かる。

```sh
> eth.getTransaction("0x70d6b5a4c5e76a4bed69f6ae26c07fef739f3646bd88adb0c118f19ff3962269")
{
  blockHash: "0xd4dbd092f666d3ed19e830cde7d70a90a2d787e5ab91b570fb03172546c4d7df",
  blockNumber: 59,
  from: "0xa60641a855ff4eb42ba4e39e3433064bfeee2ddd",
  gas: 90000,
  gasPrice: 1000000000,
  hash: "0x70d6b5a4c5e76a4bed69f6ae26c07fef739f3646bd88adb0c118f19ff3962269",
  input: "0x",
  nonce: 0,
  r: "0x92639c3794adbd45e17753539e147fb37b32e4aa2c1413bbc30ec99ea1ea9d9e",
  s: "0x21199ada96137d39c20a35fc686202a7e62925f6dfa75de9f84db18f6fbc8530",
  to: "0x9e24224b65c317ed3a67dab395df2c6ad63dc28a",
  transactionIndex: 0,
  v: "0x42",
  value: 1000
}
```

アカウントの残高を見ると、`accounts[1]`に1000wei入っている。

```sh
> eth.getBalance(eth.accounts[1])
1000
```

### おわり

コンソールは`exit`で終了。

```sh
> exit
```

一円の儲けにもならないけど、ブロックチェーンの仕組みを実感して遊べる。

---

{{< ad/a8/techacademy_blockchain >}}

---
