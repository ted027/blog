---
title: "fake-s3にlist objectsをする際の注意点"
date: 2021-03-21T11:42:09+09:00
draft: false
comments: true
toc: true
categories: ["AWS"]
tags: ["S3", "fake-s3"]
---

<!--more-->

---

{{< ad/a8/onamae >}}

---

### fake-s3にlist objectsしてもデータを取得できない

fake-s3にlist objectsをかけたところ、中身が空で取得してしまう事態が発生。しかしResponseMetadataを見ると、StatusCodeは200で成功しているように見える。

一つずつget itemすると登録は出来ていそうなので不思議に思っていたところ、以下のIssueを発見。

* [list objects not working?](https://github.com/jubos/fake-s3/issues/17)

clientと異なるhostのfake-s3に対してlist objectsをかけると、うまく動作しないらしい。

---

### 解決策

hostをclientと合わせてやればよい。

自分はGitLab-CI環境だったため、`alias`を切ってlocakhostを指定。

```yaml
my_s3_test:
  services:
    - name: lphoward/fake-s3:14.04
      alias: localhost
  variables:
    S3_ENDPOINT: http:localhost:4569
  script:
    - aws s3 mb --endpoint-url $S3_ENDPOINT s3://my-bucket
    - cd s3 && pytest test ...
```

これで無事成功しました。

---

{{< ad/con/wide/aws >}}

---

{{< ad/afb/codecamp >}}

---
