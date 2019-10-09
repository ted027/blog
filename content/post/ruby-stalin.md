---
title: "RubyでO(N)のスターリンソートを実装する"
date: 2019-10-09T23:25:53+09:00
draft: false
comments: true
toc: true
categories: ["Ruby"]
tags: ["スターリンソート"]
---

<!--more-->

---

{{< ad/a8/techacademy1 >}}

---

{{< tweet 1155619860027547648 >}}

始めたてのRubyでスターリンソートを実装してみました。

```rb
def stalin_sort(array)
    max = array[0]
    array.select do |item|
        max > item ? next : max = item
    end
end
```

調べつつもなるべく答え的なものを見ないように書いたんですが…当然ですが以下ページの実装の方が使い勝手もよく、可読性も高いです。

- [rubyでスターリンソートをやってみた（ブロック渡しも可能）](https://qiita.com/haru_pad/items/1598690e1105f3e33389)
- [Github gustavo-depaula/stalin-sort](https://github.com/gustavo-depaula/stalin-sort/blob/master/ruby/stalin_sort.rb)

---

{{< ad/a8/techacademy_ruby >}}

---
