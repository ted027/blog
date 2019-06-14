---
title: "AWS PolicyDocumentでのワイルドカード"
date: 2019-06-14T17:55:16+09:00
draft: false
comments: true
toc: false
categories: ["AWS"]
tags: ["IAM", "Policy Document", "Principal"]
---

PolicyDocumentでワイルドカードを使って部分指定しようとしたところ失敗した。

<!--more-->

---

{{< ad/a8/techstars >}}

---

AWSでポリシーを作成しアクセス制御を行う際、

- `Action`で動作を、
- `Principal`で操作するユーザやロールを、
- `Resource`で操作対象のリソースを、

それぞれ指定することができる。

```yaml
PolicyName: MyS3Policy
PolicyDocument: 
  Version: "2012-10-17"
  Statement: 
  - Effect: Allow
    Action:
      - s3:PutObject
      - s3:GetObject
    Principal: 
      AWS:
        - arn:aws:iam::123456789012:user/username
    Resource:
      - arn:aws:s3:::examplebucket/exampledir
```

例えばこんなPolicyを作ると、「arn:aws:iam::123456789012:user/username」のarnを持つユーザーが、「arn:aws:s3:::examplebucket/exampledir」のリソースに対し、`PutObject`と`GetObject`できるようになる。

このあたりの記載は`*`(ワイルドカード)を使って「何でも」を指定できる。

```yaml
  Statement: 
  - Effect: Allow
    Action: '*'
    Principal:
      AWS: '*'
    Resource: '*'
```

`Action`や`Resource`は、文字列中に`*`を入れて部分指定をすることもできる。

ただし、`Principal`で同じことをしようとするとエラーになる。

```yaml
  Statement: 
  - Effect: Allow
    Action:
      - s3:Put*
      - s3:Get*
    Principal: 
      AWS:
        # - arn:aws:iam::123456789012:user/user* <= エラーになる
        - arn:aws:iam::123456789012:user/user1
        - arn:aws:iam::123456789012:user/user2
        - arn:aws:iam::123456789012:user/user_admin
    Resource:
      - arn:aws:s3:::examplebucket/*
```

Principalは`*`で全て許可するか、そうでない場合はきちんと記述しないといけない。

先日リソースを作ろうとして失敗した時に初めて知りました。

---

{{< ad/con/wide/aws >}}

---

{{< ad/a8/techacademy1 >}}

---
