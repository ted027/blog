---
title: "AWS CloudFrontでSPAを返す"
date: 2020-04-14T21:42:58+09:00
draft: false
comments: true
toc: true
categories: ["AWS"]
tags: ["CloudFront", "SPA", "S3"]
---

<!--more-->

---

{{< ad/con/wide/devops >}}

---

### 概要

Reactで作ったSPAをCloudFrontで配信する際、パスを直叩きされると404を返してしまう。

Lambda等でホストする場合はパスに関わらず元の`index.html`を返してやればいいが、S3にSPAを配置する場合そうはいかない。

---

### 解決策

CloudFrontのError Pagesで、404の場合にルートの`index.html`を返すように設定する。

---

- HTTP Error Code
  - 404: Not Found
- Error Caching Minimum TTL
  - 300 (適当)
- Customize Error Response
  - Yes
- Response Page Path
  - /index.html
  - ※S3上のパスに合わせて、SPAの基になるindex.htmlを指定
- HTTP Response Code
  - 200: OK

---

SPAの中で、存在しないパスへのアクセスには404を返すようちゃんと書いておく。

---

{{< ad/con/wide/aws >}}

---

{{< ad/a8/techacademy1 >}}

---
