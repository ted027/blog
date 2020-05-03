---
title: "Material-UI themeで他要素の規定パラメータを取得"
date: 2020-04-12T21:10:11+09:00
draft: false
comments: true
toc: false
categories: ["React"]
tags: ["Material-UI", "css", "z-index"]
---

<!--more-->

---

{{< ad/a8/techacademy2 >}}

---

`React`で`material ui`を使っていて、ある要素を他要素より手前に持ってきたかった。

```js
const styles = (theme: Theme): StyleRules => createStyles({
  mainAppBar: {
    flexGrow: 1,
  },
  selectYearForm: { // これを手前に持ってきたい
    top: theme.spacing(3),
    right: theme.spacing(5),
    position: "fixed",
    width: 80,
  },
}
```

これだけだと`selectYearForm`が背後に隠れる。

{{< img src="/img/mui-zindex1.png" >}}

---

勿論、それぞれに`zIndex` (`z-index`)を指定すれば手前に持ってこれる

```js
const styles = (theme: Theme): StyleRules => createStyles({
  mainAppBar: {
    flexGrow: 1,
    zIndex: 100
  },
  selectYearForm: { // これを手前に持ってきたい
    top: theme.spacing(3),
    right: theme.spacing(5),
    position: "fixed",
    width: 80,
    zIndex: 110
  },
}
```

ただ、既存の`mainAppBar`の`zIndex`に影響を与えずに`selectYearForm`を手前に持ってきたかった。

以下のように書いて解決。

```js
const styles = (theme: Theme): StyleRules => createStyles({
  mainAppBar: {
    flexGrow: 1,
  },
  selectYearForm: { // これを手前に持ってきたい
    top: theme.spacing(3),
    right: theme.spacing(5),
    position: "fixed",
    width: 80,
    zIndex: theme.zIndex.appBar + 1
  },
}
```

{{< img src="/img/mui-zindex2.png" >}}

---

なお、Material UIでコンポーネントのデフォルト`z-index`は以下のようになっている。

```js
const zIndex = {
  mobileStepper: 1000,
  speedDial: 1050,
  appBar: 1100,
  drawer: 1200,
  modal: 1300,
  snackbar: 1400,
  tooltip: 1500,
};
```

https://github.com/mui-org/material-ui/blob/master/packages/material-ui/src/styles/zIndex.js

---

{{< ad/con/wide/react >}}

---

{{< ad/a8/techacademy_ui >}}

---
