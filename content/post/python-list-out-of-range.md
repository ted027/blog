---
title: "PythonでListのIndexErrorを手軽に回避したかった"
date: 2019-12-25T12:39:08+09:00
draft: false
comments: true
toc: true
categories: ["Python"]
tags: ["list", "dict", "IndexError"]
---

<!--more-->

---

{{< ad/a8/techacademy_py_ai >}}

---

### dictで存在しないkeyを指定

dictで存在しないkeyを指定すると、KeyErrorが返る。

```py
>>> dic = {
    '11': 'Darvish',
    '22': 'Furuta',
    '33': 'Yamakawa',
    '44': 'Yanagita',
    '55': 'Matsui',
    '66': 'Kazumi'
}
>>> dic['22']
'Furuta'
>>> dic['23']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: '23'
```

#### KeyErrorを回避

存在しないKeyを指定する可能性がある場合、`get`を使うと、エラーにせず任意の値を返せる。

```py
>>> error_str = 'Is that number a repdigit?'
>>> dic.get('33', error_str)
'Yamakawa'
>>> dic.get('34', error_str)
'Is that number a repdigit?'
```

---

### listで存在しないindexを指定

listで存在しない要素を指定した場合は、IndexErrorが返る。

```py
>>> lst = ['Darvish', 'Furuta', 'Yamakawa', 'Yanagita', 'Matsui', 'Kazumi']
>>> lst[5]
'Kazumi'
>>> lst[6]
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
IndexError: list index out of range
```

#### IndexErrorを回避

listにはdictのgetにあたる、要素指定エラーの回避手段が無さそう。

やむを得ず書いた。

```py
def list_get(lst, index, error):
    return lst[index] if len(lst) > index else error
```

```py
>>> list_get(lst, 5, error_str)
'Kazumi'
>>> list_get(lst, 6, error_str)
'Is that number a repdigit?'
```

---

{{< ad/con/wide/python_dokugaku >}}

---

{{< ad/a8/techacademy_python >}}

---

{{< ad/a8/techacademy_blockchain >}}

---
