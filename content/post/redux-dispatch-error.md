---
title: "'dispatch is not a function'エラーの対処"
date: 2019-06-29T13:47:16+09:00
draft: false
comments: true
toc: false
categories: [”React”]
tags: ["Redux", "エラー"]
---

<!--more-->

---

{{< ad/afb/codecamp >}}

---

### 概要

react-reduxの、actionをcomponentにdispatchするcontainerのところで

`dispatch is not a function`

のエラーに遭遇した。

下の図で言う星のところのあたり。

---

{< img src="/img/redux.jpg" >}

---

※ 画像: https://staltz.com/unidirectional-user-interface-architectures.html

---

### 詳細

```js
const mapDispatchToProps = (dispatch) => {
    return {
        onChange: (selected) => {
            dispatch(changeTab(selected));
        }
    }
}

export const VisibleMainAppBar = connect(
    mapDispatchToProps
)(MainAppBar)
```

---

{< img src="/img/redux-dispathc-error.png" >}

---

### 原因と解決策

dispatchだけをconnectしているとこのエラーが起きる。ので、stateもconnectします。

stateを変更しないのであれば空でも大丈夫。

```js
const mapDispatchToProps = (dispatch) => {
    return {
        onChange: (selected) => {
            dispatch(changeTab(selected));
        }
    }
}

// 追加
const mapStateToProps = () => {
    return
}

export const VisibleMainAppBar = connect(
    mapStateToProps,    // 追加
    mapDispatchToProps
)(MainAppBar)
```

---

無事エラーが消えました。

---

{{< ad/con/wide/javascript >}}

---

{{< ad/a8/techacademy_ui >}}

---
