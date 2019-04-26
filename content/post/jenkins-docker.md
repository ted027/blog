---
title: "JenkinsでDockerfileを実行する際の不思議な仕様"
date: 2019-04-26T16:05:19+09:00
draft: true
comments: true
categories: ["Jenkins"]
tags: ["Docker", "Pipeline"]
---

 <!--more-->

https://www.ikemo3.com/inverted/jenkins/docker/
https://jenkins.io/doc/book/pipeline/syntax/#agent

---

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

### Docker buildのデフォルト実行オプション

- `-t`
- `-u` <JenkinsのUID>:<JenkinsのGID>
- `-w` <ワークスペースのパス>
- `-v`: ワークスペースの内容をマップ
- `--entrypoint cat`