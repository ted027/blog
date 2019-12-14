---
title: "Pythonでlistのlistを引き算したかった"
date: 2019-12-14T21:57:13+09:00
draft: false
comments: true
toc: true
categories: ["Python"]
tags: ["list"]
---

<!--more-->

---

{{< ad/con/wide/python_taikutsu >}}

---

### list同士の加減

Pythonで、list同士の足し算はできる。

```py
>>> list1 = ['1', '3', '4', '14', '16', '34']
>>> list2 = ['10', '55']
>>> list1 + list2
['1', '3', '4', '14', '16', '34', '10', '55']
```

list同士の引き算はできないので、setで集合にして引く。必要ならさらにlistに戻す。

```py
>>> list3 = ['1', '3', '55', '4', '10', '14', '55', '16', '34', '55']
>>> list2 = ['10', '55']
>>> list3 - list2
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: unsupported operand type(s) for -: 'list' and 'list'
>>> set(list3) - set(list2)
{'16', '14', '4', '3', '34', '1'}
>>> list(set(list3) - set(list2))
['16', '14', '4', '3', '34', '1']
```

---

### listのlistを減算

listのlistを同様に減算しようとするとうまくいかない。

listを集合の要素にすることができないため、setにする段階でエラーになる。

```py
>>> dlist1 = [['1', '2'], ['2', '3'], ['2', '4'], ['3', '4'], ['4', '5']]
>>> dlist2 = [['2', '3'], ['2', '4'], ['4', '5']]
>>> set(dlist1)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: unhashable type: 'list'
```

結局ループを回すのであまりスマートではないが、ワンライナーで書ける。

```py
>>> [i for i in dlist1 if i not in dlist2]
[['1', '2'], ['3', '4']]

```

---

{{< ad/con/wide/python_dokugaku >}}

---

{{< ad/a8/techacademy_python >}}

---
