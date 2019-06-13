---
title: "AWS AutoScallingGroupの削除に失敗する"
date: 2019-05-21T16:52:42+09:00
draft: false
comments: true
categories: ["AWS"]
tags: ["AutoScalling", "エラー"]
---

AutoScallingGroupのスタック削除で少々詰まったので備忘録。

<!--more-->

---

{{< ad/a8/techstars>}}

---

{{< ad/con/wide/devops >}}

---

### やったこと

`AWS::AutoScaling::AutoScalingGroup`のCloudformationスタックを立て、EC2 Instanceを管理。

```sh
aws cloudformation create-stack --stack-name MyStackName --template-body file://mytemplate.yml
```

```yml
...
Resources:
  AutoScalingGroupJmeter:
    Type: AWS::AutoScaling::AutoScalingGroup
    Properties:
...
```

使い終わって、Instanceの利用料金がもったいないのでsuspend(中断)。

```sh
aws autoscaling suspend-processes --auto-scaling-group-name MyAsgName
```

その後も使うことが無さそうなので、スタックを削除。

```sh
aws cloudformation delete-stack --stack-name MyStackName
```

---

### 現象

以下のメッセージが出て削除に失敗しました。

```sh
AutoscalingGroup deletion cannot be performed because the Terminate process has been suspended; please resume this process and then retry stack deletion.
```

---

### 原因

suspend-processesを実行する際、特にプロセスを指定しなかったので、全てのプロセスがsuspendされた。

---

{{< img src="/img/autoscalling-suspend.png" >}}

---

このためTerminateもsuspendされてしまい、削除に失敗。

---

### 解決策

Terminateだけresume(再開)すれば、削除に成功する。

```sh
aws autoscaling resume-processes --auto-scaling-group-name MyAsgName --scaling-processes Terminate
```

---

{{< ad/con/wide/aws >}}

---

{{< ad/a8/techacademy1 >}}

---
