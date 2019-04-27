---
title: "Makefileで一部だけ並列処理で実行する"
date: 2019-04-26T07:32:32+09:00
draft: false
comments: true
categories: ["GNU Make"]
tags: ["Makefile", "並列", "wait"]
---

Makefileでターゲットを呼ぶ際、全部でなく一部分だけ並列で実行したかった。

 <!--more-->

---

<a href="https://t.afi-b.com/visit.php?guid=ON&a=M10262Q-X351704n&p=J690746r" target="_blank" rel="nofollow"><img src="https://www.afi-b.com/upload_image/10262-1549272488-3.jpg" width="728" height="90" style="border:none;" alt="BTCエージェント forエンジニア" /></a><img src="https://t.afi-b.com/lead/M10262Q/J690746r/X351704n" width="1" height="1" style="border:none;" />

---

### 概要

Makeを並列で実行するには、`-j`のオプションをつけて実行する。

```
$ make target -j3
```

ただ今回、targetに書いた処理のうち一部だけ並列化し、他の部分は順序通り実行してほしかった。

シェルで並列実行といえば、コマンドに`&`をつけてバックグラウンド実行にして、それをwaitで待つ、というのが一般的。

なので以下のように書きました。が、これだと待ってくれない。

```Makefile
target:
    command-parallel1 &
    command-parallel2 &
    wait
    command3
    ...
```

---

### Makeで改行するとwaitは効かない

Makeは一行ごとに違うシェルで実行される。なので、上のように書くと、

1. 1つめのシェルでcommand-parallel1をバックグラウンド実行
2. 2つめのシェルでcommand-parallel2をバックグラウンド実行
3. 3つめのシェルでwaitを実行するが、子プロセスがいなければ一瞬で終了する
4. command3を実行

となり、高い確率で、並列処理中に`command3`へ進んでしまう。

これを防ぐには、シェルを変えずにワンライナーで書けばよい。

```Makefile
target:
    command-parallel1 & \
    command-parallel2 & \
    wait \
    command3
    ...
```

---

### 並列処理で起きたエラーはスキップされる

これで部分的な並列化は実現できた。

ところが、並列処理の中でエラーが起きた際にスキップされてしまう可能性がある。

waitの仕様として、最後に終了した子プロセスの終了コードを自身の終了コードとする。なので、

```Makefile
target:
    command-parallel1 & \ # <- 先にエラー終了
    command-parallel2 & \ # <- 後で正常終了
    wait \ # <- 正常終了とみなす
    command3
    ...
```

のように、`command-parallel1`のエラーが無視されてしまうケースがある。

`wait $(PID)`でプロセスIDごとに待ってみようとしても、改行すると効かなくなるので、

```
    wait $(PID1) && wait $(PID2)
```

と、それぞれの終了ステータスを見て進むこともできない。

---

### 結局jobsオプションで解決

解決といえるか微妙だけど、targetの形を変えて、

```Makefile
target-parallel:
    command-parallel1
    command-parallel2

target-post:
    command3
```

```
$ make -j3 target-parallel
$ make target-post
```

で落ち着いた。

結論としては、失敗するかもしれないような処理を並列化とwaitで雑に処理するな、ということですね。

---

<div class="kaerebalink-box" style="text-align:left;padding-bottom:20px;font-size:small;zoom: 1;overflow: hidden;"><div class="kaerebalink-image" style="float:left;margin:0 15px 10px 0;"><a href="//af.moshimo.com/af/c/click?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062&amp;url=https%3A%2F%2Fwww.amazon.co.jp%2FGNU-Make-%25E7%25AC%25AC3%25E7%2589%2588-Robert-Mecklenburg%2Fdp%2F4873112699" rel="nofollow" target="_blank"><img src="https://images-fe.ssl-images-amazon.com/images/I/51gJZE-8b5L._SL160_.jpg" style="border: none;"/></a><img height="1" src="//i.moshimo.com/af/i/impression?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062" style="border:none;" width="1"/></div><div class="kaerebalink-info" style="line-height:120%;zoom: 1;overflow: hidden;"><div class="kaerebalink-name" style="margin-bottom:10px;line-height:120%"><a href="//af.moshimo.com/af/c/click?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062&amp;url=https%3A%2F%2Fwww.amazon.co.jp%2FGNU-Make-%25E7%25AC%25AC3%25E7%2589%2588-Robert-Mecklenburg%2Fdp%2F4873112699" rel="nofollow" target="_blank">GNU Make 第3版</a><img height="1" src="//i.moshimo.com/af/i/impression?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062" style="border:none;" width="1"/></div><div class="kaerebalink-detail" style="margin-bottom:5px;"></div><div class="kaerebalink-link1" style="margin-top:10px;"><div class="shoplinkamazon" style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 0 no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;"><a href="//af.moshimo.com/af/c/click?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062&amp;s_v=b5Rz2P0601xu&amp;url=https%3A%2F%2Fwww.amazon.co.jp%2Fgp%2Fsearch%3Fkeywords%3Dgnu%2520make%26__mk_ja_JP%3D%25E3%2582%25AB%25E3%2582%25BF%25E3%2582%25AB%25E3%2583%258A" rel="nofollow" target="_blank">Amazonで調べる</a><img height="1" src="//i.moshimo.com/af/i/impression?a_id=1414800&amp;p_id=170&amp;pc_id=185&amp;pl_id=4062" style="border:none;" width="1"/></div><div class="shoplinkrakuten" style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -50px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;"><a href="//af.moshimo.com/af/c/click?a_id=1414727&amp;p_id=54&amp;pc_id=54&amp;pl_id=616&amp;s_v=b5Rz2P0601xu&amp;url=https%3A%2F%2Fsearch.rakuten.co.jp%2Fsearch%2Fmall%2Fgnu%2520make%2F-%2Ff.1-p.1-s.1-sf.0-st.A-v.2%3Fx%3D0" rel="nofollow" target="_blank">楽天市場で調べる</a><img height="1" src="//i.moshimo.com/af/i/impression?a_id=1414727&amp;p_id=54&amp;pc_id=54&amp;pl_id=616" style="border:none;" width="1"/></div><div class="shoplinkyahoo" style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -150px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;"><a href="//af.moshimo.com/af/c/click?a_id=1418766&amp;p_id=1225&amp;pc_id=1925&amp;pl_id=18502&amp;s_v=b5Rz2P0601xu&amp;url=http%3A%2F%2Fsearch.shopping.yahoo.co.jp%2Fsearch%3Fp%3Dgnu%2520make" rel="nofollow" target="_blank">Yahooショッピングで調べる</a><img height="1" src="//i.moshimo.com/af/i/impression?a_id=1418766&amp;p_id=1225&amp;pc_id=1925&amp;pl_id=18502" style="border:none;" width="1"/></div><div class="shoplinkseven" style="margin-right:5px;background: url('//img.yomereba.com/tam_k_01.gif') 0 -100px no-repeat;padding: 2px 0 2px 18px;white-space: nowrap;"><a href="//af.moshimo.com/af/c/click?a_id=1414728&amp;p_id=932&amp;pc_id=1188&amp;pl_id=12456&amp;s_v=b5Rz2P0601xu&amp;url=http%3A%2F%2F7net.omni7.jp%2Fsearch%2F%3Fkeyword%3Dgnu%2520make%26searchKeywordFlg%3D1" rel="nofollow" target="_blank"><img src=" af="" height="1" i="" i.moshimo.com="" impression?a_id='1414728&amp;p_id=932&amp;pc_id=1188&amp;pl_id=12456"' style="border:none;" width="1">7netで調べる</img src="></a></div></div></div><div class="booklink-footer" style="clear: left"></div></div>

---