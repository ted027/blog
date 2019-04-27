---
title: "JenkinsでDockerfileから実行する際のデフォルトオプション"
date: 2019-04-26T16:05:19+09:00
draft: false
comments: true
categories: ["Jenkins"]
tags: ["Docker", "Pipeline"]
---

Jenkins PipelineジョブのDocker仕様で便利〜と思って使ってたら軽く躓いた話。

 <!--more-->

---

<div class="kaerebalink-box" style="text-align:left;padding-bottom:20px;font-size:small;zoom: 1;overflow: hidden;">
    <div class="kaerebalink-image" style="float:left;margin:0 15px 10px 0;"><a
            href="//af.moshimo.com/af/c/click?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062&amp;url=https%3A%2F%2Fwww.amazon.co.jp%2FEffective-DevOps-%25E2%2580%25954%25E6%259C%25AC%25E6%259F%25B1%25E3%2581%25AB%25E3%2582%2588%25E3%2582%258B%25E6%258C%2581%25E7%25B6%259A%25E5%258F%25AF%25E8%2583%25BD%25E3%2581%25AA%25E7%25B5%2584%25E7%25B9%2594%25E6%2596%2587%25E5%258C%2596%25E3%2581%25AE%25E8%2582%25B2%25E3%2581%25A6%25E6%2596%25B9-Jennifer-Davis%2Fdp%2F4873118352"
            target="_blank" rel="nofollow"><img
                src="https://images-fe.ssl-images-amazon.com/images/I/51hSE7AENQL._SL160_.jpg"
                style="border: none;" /></a><img
            src="///i.moshimo.com/af/i/impression?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062" width="1" height="1"
            style="border:none;"></div>
    <div class="kaerebalink-info" style="line-height:120%;zoom: 1;overflow: hidden;">
        <div class="kaerebalink-name" style="margin-bottom:10px;line-height:120%"><a
                href="//af.moshimo.com/af/c/click?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062&amp;url=https%3A%2F%2Fwww.amazon.co.jp%2FEffective-DevOps-%25E2%2580%25954%25E6%259C%25AC%25E6%259F%25B1%25E3%2581%25AB%25E3%2582%2588%25E3%2582%258B%25E6%258C%2581%25E7%25B6%259A%25E5%258F%25AF%25E8%2583%25BD%25E3%2581%25AA%25E7%25B5%2584%25E7%25B9%2594%25E6%2596%2587%25E5%258C%2596%25E3%2581%25AE%25E8%2582%25B2%25E3%2581%25A6%25E6%2596%25B9-Jennifer-Davis%2Fdp%2F4873118352"
                target="_blank" rel="nofollow">Effective DevOps 4本柱による持続可能な組織文化の育て方 [ Jennifer Davis ]</a><img
                src="///i.moshimo.com/af/i/impression?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062" width="1" height="1"
                style="border:none;">
        </div>
        <div class="kaerebalink-detail" style="margin-bottom:5px;"></div>
        <div class="kaerebalink-link1" style="margin-top:10px;">
            <div class="shoplinkamazon"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 0 no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1414800&p_id=170&pc_id=185&pl_id=4062&s_v=b5Rz2P0601xu&url=https%3A%2F%2Fwww.amazon.co.jp%2Fgp%2Fsearch%3Fkeywords%3DDevOps%26__mk_ja_JP%3D%25E3%2582%25AB%25E3%2582%25BF%25E3%2582%25AB%25E3%2583%258A"
                    target="_blank" rel="nofollow">Amazonで調べる</a><img
                    src="//i.moshimo.com/af/i/impression?a_id=1414800&p_id=170&pc_id=185&pl_id=4062" width="1"
                    height="1" style="border:none;"></div>
            <div class="shoplinkrakuten"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -50px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1414727&p_id=54&pc_id=54&pl_id=616&s_v=b5Rz2P0601xu&url=https%3A%2F%2Fsearch.rakuten.co.jp%2Fsearch%2Fmall%2FDevOps%2F-%2Ff.1-p.1-s.1-sf.0-st.A-v.2%3Fx%3D0"
                    target="_blank" rel="nofollow">楽天市場で調べる</a><img
                    src="//i.moshimo.com/af/i/impression?a_id=1414727&p_id=54&pc_id=54&pl_id=616" width="1" height="1"
                    style="border:none;"></div>
            <div class="shoplinkyahoo"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -150px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1418766&p_id=1225&pc_id=1925&pl_id=18502&s_v=b5Rz2P0601xu&url=http%3A%2F%2Fsearch.shopping.yahoo.co.jp%2Fsearch%3Fp%3DDevOps"
                    target="_blank" rel="nofollow">Yahooショッピングで調べる</a><img
                    src="//i.moshimo.com/af/i/impression?a_id=1418766&p_id=1225&pc_id=1925&pl_id=18502" width="1"
                    height="1" style="border:none;"></div>
            <div class="shoplinkseven"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -100px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1414728&p_id=932&pc_id=1188&pl_id=12456&s_v=b5Rz2P0601xu&url=http%3A%2F%2F7net.omni7.jp%2Fsearch%2F%3Fkeyword%3DDevOps%26searchKeywordFlg%3D1"
                    target="_blank"
                    rel="nofollow"><img src="//i.moshimo.com/af/i/impression?a_id=1414728&p_id=932&pc_id=1188&pl_id=12456" width="1" height="1" style="border:none;">7netで調べる
                        </a> </div> </div> </div> <div class="booklink-footer" style="clear: left"></div>
        </div>

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

<div class="kaerebalink-box" style="text-align:left;padding-bottom:20px;font-size:small;zoom: 1;overflow: hidden;">
    <div class="kaerebalink-image" style="float:left;margin:0 15px 10px 0;"><a
            href="//af.moshimo.com/af/c/click?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062&amp;url=https%3A%2F%2Fwww.amazon.co.jp%2FDocker%25E5%25AE%259F%25E8%25B7%25B5%25E3%2582%25AC%25E3%2582%25A4%25E3%2583%2589-%25E7%25AC%25AC2%25E7%2589%2588-impress-top-gear%2Fdp%2F4295005525"
            rel="nofollow" target="_blank"><img
                src="https://images-fe.ssl-images-amazon.com/images/I/51lsC1rZ8HL._SL160_.jpg"
                style="border: none;" /></a><img height="1"
            src="//i.moshimo.com/af/i/impression?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062"
            style="border:none;" width="1" /></div>
    <div class="kaerebalink-info" style="line-height:120%;zoom: 1;overflow: hidden;">
        <div class="kaerebalink-name" style="margin-bottom:10px;line-height:120%"><a
                href="//af.moshimo.com/af/c/click?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062&amp;url=https%3A%2F%2Fwww.amazon.co.jp%2FDocker%25E5%25AE%259F%25E8%25B7%25B5%25E3%2582%25AC%25E3%2582%25A4%25E3%2583%2589-%25E7%25AC%25AC2%25E7%2589%2588-impress-top-gear%2Fdp%2F4295005525"
                rel="nofollow" target="_blank">Docker実践ガイド 第2版</a><img height="1"
                src="//i.moshimo.com/af/i/impression?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062"
                style="border:none;" width="1" /></div>
        <div class="kaerebalink-detail" style="margin-bottom:5px;"></div>
        <div class="kaerebalink-link1" style="margin-top:10px;">
            <div class="shoplinkamazon"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 0 no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062&amp;s_v=b5Rz2P0601xu&amp;url=https%3A%2F%2Fwww.amazon.co.jp%2Fgp%2Fsearch%3Fkeywords%3Ddocker%26__mk_ja_JP%3D%25E3%2582%25AB%25E3%2582%25BF%25E3%2582%25AB%25E3%2583%258A"
                    rel="nofollow" target="_blank">Amazonで調べる</a><img height="1"
                    src="//i.moshimo.com/af/i/impression?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062"
                    style="border:none;" width="1" /></div>
            <div class="shoplinkrakuten"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -50px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1414727&amp;p_id=54&amp;pc_id=54&amp;pl_id=616&amp;s_v=b5Rz2P0601xu&amp;url=https%3A%2F%2Fsearch.rakuten.co.jp%2Fsearch%2Fmall%2Fdocker%2F-%2Ff.1-p.1-s.1-sf.0-st.A-v.2%3Fx%3D0"
                    rel="nofollow" target="_blank">楽天市場で調べる</a><img height="1"
                    src="//i.moshimo.com/af/i/impression?a_id=1414727&amp;p_id=54&amp;pc_id=54&amp;pl_id=616"
                    style="border:none;" width="1" /></div>
            <div class="shoplinkyahoo"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -150px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1418766&amp;p_id=1225&amp;pc_id=1925&amp;pl_id=18502&amp;s_v=b5Rz2P0601xu&amp;url=http%3A%2F%2Fsearch.shopping.yahoo.co.jp%2Fsearch%3Fp%3Ddocker"
                    rel="nofollow" target="_blank">Yahooショッピングで調べる</a><img height="1"
                    src="//i.moshimo.com/af/i/impression?a_id=1418766&amp;p_id=1225&amp;pc_id=1925&amp;pl_id=18502"
                    style="border:none;" width="1" /></div>
            <div class="shoplinkseven"
                style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -100px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;">
                <a href="//af.moshimo.com/af/c/click?a_id=1414728&amp;p_id=932&amp;pc_id=1188&amp;pl_id=12456&amp;s_v=b5Rz2P0601xu&amp;url=http%3A%2F%2F7net.omni7.jp%2Fsearch%2F%3Fkeyword%3Ddocker%26searchKeywordFlg%3D1"
                    rel="nofollow" target="_blank"><img src=" af="" height="1" i="" i.moshimo.com=""
                        impression?a_id='1414728&amp;p_id=932&amp;pc_id=1188&amp;pl_id=12456"' style="border:none;"
                        width="1">7netで調べる</img src="></a></div>
        </div>
    </div>
    <div class="booklink-footer" style="clear: left"></div>
</div>

---