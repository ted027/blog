---
title: "JenkinsジョブをDockerfileから実行する際のデフォルトオプション"
date: 2019-04-26T16:05:19+09:00
draft: false
comments: true
categories: ["Jenkins"]
tags: ["Docker", "Pipeline"]
---

Jenkins PipelineジョブのDocker仕様で便利〜と思って使ってたら軽く躓いた話。

<!--more-->

---

{{< ad/con/wide/devops >}}

---

### JenkinsジョブでDockerイメージをagentを指定

Jenkins Pipelineジョブでは、実行agentとしてDocker imageを指定できる。

```groovy
agent {
    docker {
        image 'maven:3-alpine'
        args  '-v /tmp:/tmp'
    }
}
```

pullしたイメージを使えるだけでなく、自前のDockerfileからビルドしたイメージを使うこともできる。

```groovy
agent {
    dockerfile {
        filename 'Dockerfile'
        additionalBuildArgs  '--build-arg version=1.0.2'
        args '-v /tmp:/tmp'
    }
}
```

---

### Docker buildのデフォルト実行オプション

上記のように自前のDockerfileを使う場合、`docker run`時に以下のオプションがついた状態で実行される。

- `-d` : デタッチド（バックグラウンド）
- `-t` : 標準出力をつなぐ
- `-u JenkinsのUID:JenkinsのGID` : Jenkins(のID)ユーザで実行
- `-w path/to/workspace` : workspaceで実行
- `-v ***:***` : workspaceの内容をマウント
- `--entrypoint cat` : entrypoint上書きしcat

`ENTRYPOINT`の話は以下の記事に少し書きました。

- [Dockerfileの書き方や紛らわしいコマンドの話](https://www.ted027.com/post/dockerfile)

このデフォルトオプションには思惑があるだろうし、ジョブはworkspaceで実行する前提なんだろうけど、自分は少し困ることがあった。

---

### ジョブによらずDockerのキャッシュを使いたい

以前、GitHubに成果物をpushしたら、CIでモジュールをS3に上げておき、JenkinsのDockerfileにそれを入れて展開する、といったようなことをしていた。

その際、いくつかのジョブで同様の処理を行っていた。

---

{{< img src="/img/jenkins-flow.png" >}}

---

モジュールに差分が無ければキャッシュを使うことでジョブを高速化する狙いだったけど、ジョブごとに各々のworkspaceを実行ディレクトリにされてしまうと、ジョブが違えばキャッシュが効かなくなってしまう。

---

### 解決策

自分は結局、モジュールをルートディレクトリに展開して、

```groovy
stage ('stage') {
  agent {
    dockerfile {
        filename 'Dockerfile'
        additionalBuildArgs  '...'
        args '...'
    }
  }
  steps {
      cd /
      ...
  }
}
```

`cd`するだけでした。すっきりする解決策ではないけど、これだけで問題なく動いたので。。

---

### もう少しちゃんとした解決策

今後、デフォルトのオプションを上書きしないと無理〜な場面も出てくるかもしれないので、そちらの方法も確認。

```groovy
stage ('stage') {
  steps {
    sh 'docker build -t my/image .'
    script {
      docker.image("my/image").withRun('-v $HOME/.m2:/root/.m2") {
        sh 'ls'
      }
    }
  }
}
```

確かに、自分で`build`して`run`すればいいですね。

参考サイトは以下。

- [逆引きマニュアル: Jenkins: Dockerの使用方法](https://www.ikemo3.com/inverted/jenkins/docker/)

---

{{< ad/con/wide/docker >}}

---