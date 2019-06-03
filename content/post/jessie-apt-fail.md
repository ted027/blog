---
title: "Debian(Jessie)のdocker imageでapt updateがこける"
date: 2019-06-03T15:13:53+09:00
draft: true
comments: true
toc: true
categories: ["Docker"]
tags: ["Linux", "Docker", "apt"]
---

<!--more-->

---

<!-- {{< ad/ >}} -->

---

```sh
W: Failed to fetch http://deb.debian.org/debian/dists/jessie-updates/InRelease  Unable to find expected entry 'main/binary-amd64/Packages' in Release file (Wrong sources.list entry or malformed file)
```

```source.list
deb http://deb.debian.org/debian jessie main
deb http://security.debian.org/debian-security jessie/updates main
deb http://deb.debian.org/debian jessie-updates main
```

```
sed -i '@deb http://deb.debian.org/debian jessie-updates main@d' /etc/apt/sources.list
```

---

<!-- {{< ad/ >}} -->

---
