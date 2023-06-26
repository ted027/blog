---
title: "OpenSSLのdefault security levelを変更"
date: 2020-10-04T00:33:27+09:00
draft: false
comments: true
toc: true
categories: ["Linux"]
tags: ["SSL", "OpensSSL"]
---

<!--more-->

---

{{< ad/afb/musicjp >}}

---

### 現象

Ubuntu20.04に上げてから、pythonのrequestsを使ってSSL通信しようとしたところ、`bad handshake`のエラー。

```sh
requests.exceptions.SSLError: HTTPSConnectionPool(host='xxx.com', port=443): Max retries exceeded with url: /brabra.html (Caused by SSLError(SSLError("bad handshake: Error([('SSL routines', 'tls12_check_peer_sigalg', 'wrong signature type')])")))
```

軽く調べると、`/etc/ssl/openssl.cnf`の`DEFAULT@SECLEVEL=2`を`1`に変えれば解決する、と書いてあるが、ファイルを見たところそのような記載はない。

---

### 解決策

`/etc/ssl/openssl.cnf`に`DEFAULT@SECLEVEL=1`を記載した定義を作成し、openssl_confに設定する。

ファイルの上の方に以下を記載。

```cnf
openssl_conf = default_conf
```

ファイル末尾に以下を記載。

```cnf
[default_conf]
ssl_conf = ssl_sect

[ssl_sect]
system_default = system_default_sect

[system_default_sect]
MinProtocol = TLSv1.2
CipherString = DEFAULT@SECLEVEL=1
```

---

### 参考

- [Ubuntu 20.04 - how to set lower SSL security level?](https://askubuntu.com/questions/1233186/ubuntu-20-04-how-to-set-lower-ssl-security-level)

---

{{< ad/a8/techacademy_py_ai >}}

---

{{< ad/a8/techacademy_blockchain >}}

---
