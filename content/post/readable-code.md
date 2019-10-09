---
title: "『リーダブルコード』個人的まとめ"
date: 2019-09-24T12:46:01+09:00
draft: false
comments: true
toc: true
categories: ["開発"]
tags: ["リーダブルコード", "初心者"]
---

<!--more-->

---

{{< ad/afb/codecamp >}}

---

新人エンジニアのバイブル[『リーダブルコード ―より良いコードを書くためのシンプルで実践的なテクニック』](//af.moshimo.com/af/c/click?a_id=1414800&p_id=170&pc_id=185&pl_id=4062&url=https%3A%2F%2Fwww.amazon.co.jp%2F%25E3%2583%25AA%25E3%2583%25BC%25E3%2583%2580%25E3%2583%2596%25E3%2583%25AB%25E3%2582%25B3%25E3%2583%25BC%25E3%2583%2589-%25E2%2580%2595%25E3%2582%2588%25E3%2582%258A%25E8%2589%25AF%25E3%2581%2584%25E3%2582%25B3%25E3%2583%25BC%25E3%2583%2589%25E3%2582%2592%25E6%259B%25B8%25E3%2581%258F%25E3%2581%259F%25E3%2582%2581%25E3%2581%25AE%25E3%2582%25B7%25E3%2583%25B3%25E3%2583%2597%25E3%2583%25AB%25E3%2581%25A7%25E5%25AE%259F%25E8%25B7%25B5%25E7%259A%2584%25E3%2581%25AA%25E3%2583%2586%25E3%2582%25AF%25E3%2583%258B%25E3%2583%2583%25E3%2582%25AF-Theory-practice-Boswell%2Fdp%2F4873115655)を今更読んだので、ざっくりとポイントを書き出します。

---

### 大原則

- コードは理解しやすくなければならない

- コードは他の人が最短時間で理解できるよう書かなければならない

---

### 表面的な改善

#### 名前に具体的な情報を詰め込む

- 単語はより具体的、特定的な表現を使う
    - getはfetchやdownloadにした方が具体的
- 単位があるなら単位もつける
- バグになると思ったら「この形式である」「整形前である」といった情報も詰め込む
- 詰め込んだ上でなるべく短くする、スコープが短い変数なら名前も短くなる
- tmp/iを使うということは、生存期間が短い変数/イテレータ変数、という意味を持たせて使うことになる
    - 安易にtmpやらiやらを使わない

#### 誤解されない名前をつける

- filterって、指定した部分だけを返す？それとも指定した部分を除いて返す？
- 範囲はminとmax, firstとlastなど使うと、境界を含むことが伝わりやすい
    - 終端を含まないときはbeginとendを使うといいらしい…（直感的には微妙な気がするが）
- get...だと使う側は軽い処理だと思い込む、計算して返すならcompute...にしたり

#### 見た目の美しいコードを書く

- 同種の処理が続くなら、「同種の処理が続いている」とわかるシルエット
    - 改行位置等を合わせて一貫性を持たせる
    - メソッドに切り出し、引数を変えながらメソッドを連続して呼び出す
- 同じ要素列で並び順が場所によって変わる…ということはしない
- 空行を使ってブロック分けする


#### 何をコメントすべきか

- 酷いコードを補うためのコメントであってはならない、それならコードを直すべき
    - コメントではなく名前で分かるようにする
- コードからすぐわかることはコメントしない
- コードを熟読すればわかることはコメントしてもよい
- コードに現れないが、書いた時に考えていたことや意図をコメントすべき
    - 〇〇より××の処理のほうが早い、△△の倍の値なので十分…など
- 質問されそうなこと、使ったらハマりそうなことは先回りでコメントしておく
- コードの欠陥や一次対応を書き残しておく
    - 『TODO:』『FIXME:』など
- プロジェクト全体像の中でこの部分が何をしているか…を書くと、新たに参加したメンバが入りやすい

#### コメントを正確に、簡潔に書く

- コメントは簡潔に書く、少ない画面領域に有益な情報を詰め込む
- あいまいな代名詞（それ、これ）や歯切れの悪い表現を使わない
    - 「〇〇によって優先度を変える」でなく「〇〇が高ければ優先度を高くする」
- 境界ケースの実例を書くと分かりやすい

---

### ループやロジックの改善

#### 制御フローの改善

- 条件はなるべく肯定で書く
- 条件文で単純な処理を先に書く（ガード節）、目立つ条件を先に書く
- do/while文は条件が後ろに来て瞬間的に分かりにくいので非推奨
- ネストを浅くするために出来ることをする
    - 結果が確定したらreturnでさっさと返す
    - ループ内でさっさと返すならcontinueで次に行く
        - ただし、continueはcontinueでループ内を飛んで分かりにくくなることがある
- 比較文を書くときは左に変化する値、右に安定した値、と決めるといい

#### 巨大な式の分割

- 巨大な式は途中で説明変数に入れて分割する
    - 説明変数にはそこまでの処理結果が分かるイイ名前をつける
- 短絡評価はごく単純なケース以外使わないほうがいい
    - A and B でAがFalseならBが評価されない…を利用する類の処理
- ロジックが複雑化してきたら単純化できないかを創造的に考える
    - 反対のことをする、は定番の初段の一つ
    - この範囲のものを取得する→この範囲以外のものを除外する、など

#### 読みやすいコードのための変数の使い方

- 不要な変数は消す
- 変数は以下いずれかの用途のためにあるべき、どれでもない変数は消せるはず
    - 複雑な式を分割する
    - 何の値かより明確に説明する
    - 重複した処理を削除するため、変数に入れて使い回す
- 中間結果を変数に入れるなら結果をさっさと返したほうがいい
- 同時に気にする変数は少ないほうがいい、変数のスコープはなるべく短くする
    - 定義するのは使う寸前
    - 同じ変数に何度も書き込まない、できれば一度しか書き込まない

---

### コードを再構成する

#### 下位問題は切り出す

- そのコードで解決すべき上位問題と、そのために必要な下位問題を切り分ける
- 下位問題は関数を分けて切り出す
- 汎用コードをたくさん見つけて切り出し、使い回す
- プロジェクトに特化した処理でも下位問題を切り出しておくべき

#### 一度に行うタスクは一つ

- コードが行っているタスクをリストアップする
    - 関数に分割できるタスクは分割する
    - 分割したタスクを一つづつ行う

#### 易しいコードを書く

- 自分よりも知識がない人が理解できるように、簡単な言葉で書く
- ロジックを言語化してみる、その通りに書いたら簡単に書けないか

#### 短いコードを書く

- 必要でない機能のコードを書かない
    - コードを書くとその保守、テスト等工数が発生する
    - 要求を詳しく調べる、起こりえないケースのケアのためにコードを書くべきでない
- コードを小さく保つ
    - 不要になったコードはもったいなくても消す
        - また必要になったらgitで引っ張ってくればよい
    - 汎用コードを切り出して重複を削除
    - サブプロジェクトに切り出す
- ライブラリを使おう
    - 暇な時に15分言語の標準ライブラリを読んでみる
    - →「あんなのがあったな…」で使えるようになる

---

### その他のテーマ

#### テストも読みやすく保つ

- テストは動作や使い方を示す非公式文書（だと言う人もいる）
- 入出力をシンプルにし、テストしている項目が目立つように書く
- assertで失敗した際、何が入ってどう失敗したのかわかるように書く
    - ライブラリであるなら使う、無ければ望みのエラーメッセージを出力するよう作り込む
- テストにも適切な名前をつける
- ただし、テストのために製品コードに制限が加えられるべきではない

---

### 格言めいたもの

#### 酷いコードに優れたコメントをつけるよりも、優れたコードのほうがいい

#### どうして１行で書こうとしたのだろう？そのときは「オレは頭がいい」と思っていたのだ

#### おばあちゃんがわかるように説明できなければ、本当に理解したとは言えない

アルバート・アインシュタインの発言。コードはそれくらい易しく書くべき。

#### 最も読みやすいコードは、何も書かれていないコードだ

余計なコードを書かない。要らないコードは消す。もったいなくても消す。

#### その機能の実装について悩まないで、きっと必要ないから

これ本当に要るのかよ…という機能に限って実装がめんどくさかったり。『ドメインエキスパート』に確認しましょう。

---

### まとめ

急に全部は意識できないと思うので、個人的に優先的に意識したらいいと思うところ。

- 関数、変数の名前付けを気にする
    - 意味を詰め込む、限定的で誤解されない名前
- コメントは質問されそうなこと、ハマりそうなことを書く
- ネストを浅くする
    - 早めにreturn, continueするなど
- 長く酷く読みにくい式は途中で変数に入れるが、変数は必要以上に使わない
    - 使うとしても変数を気にする範囲は狭く
- 複数のことを同時に処理していたらブロック分けする、関数に切り出す
- コードは易しく、少なく書く

---

### おわり

記事では部分的に抜き出しましたが、本では具体例込みで丁寧に説明されています。もっとずっと分かりやすいのでぜひ読んでみてください。

{{< ad/con/wide/readable_code >}}

---

{{< ad/a8/techacademy >}}

---