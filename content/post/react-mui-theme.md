---
title: "Material-UIのテーマカラーを変える"
date: 2019-06-10T12:32:18+09:00
draft: false
comments: true
toc: true
categories: ["React"]
tags: ["Javascript", "NodeJS", "Material-UI"]
---

<!--more-->

---

{{< ad/a8/techacademy2 >}}

---

{{< ad/con/wide/nodejs >}}

---

### Material-UI

Material-UIは、material designを踏襲したReactのUIライブラリ。

フラットデザインに陰影などを持たせた、モダンなUIコンテンツを作ることができます。

- [Material-UI: The world's most popular React UI framework](https://material-ui.com/)

Material-UIでは、コンテンツに`primary`, `secondary`といったテーマカラーを使うことができる。

デフォルトだと`primary`が`indigo`(紫)、`secondary`が`pink`。

{{< img src="/img/mui-theme1.png" >}}

---

### Material-UIのテーマカラーを変える

`createMuiTheme`と`MuiThemeProvider`を使って変える。

`@material-ui/core/colors`から色をimportして使うと、簡単に色を変えることができる。

```js
import { createMuiTheme } from '@material-ui/core/styles';
import blue from '@material-ui/core/colors/blue';
import red from '@material-ui/core/colors/red';

export const theme = createMuiTheme({
  palette: {
    type: 'light',
    primary: blue,
    secondary: red
  },
});
```

`MuiThemeProvider`に作成した`theme`を設定し、`theme`を反映させたいコンテンツを囲う。

```js
import React from 'react';
import './App.css';
import MainContents from './components/MainContents';
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider';

import { theme } from "./theme";

function App() {
  return (
    <MuiThemeProvider theme={theme}>
    <div className="App">
        <MainContents />
    </div>
    </MuiThemeProvider>
  );
}

export default App;
```

`theme`が反映される。

{{< img src="/img/mui-theme2.png" >}}

---

### もっと詳細に変える

詳細に色を指定してテーマを変えることもできる。

色を選ぶ際は以下のColor Toolを使うとよいかと思います。

- [Color Tool - Material Design](https://material.io/tools/color/)

```js
import { createMuiTheme } from '@material-ui/core/styles';

export const theme = createMuiTheme({
  palette: {
    primary: {
      light: '#757ce8',
      main: '#3f50b5',
      dark: '#002884',
      contrastText: '#fff',
    },
    secondary: {
      light: '#ff7961',
      main: '#f44336',
      dark: '#ba000d',
      contrastText: '#000',
    },
  },
});
```

---

{{< ad/con/wide/react >}}

---

{{< ad/a8/techacademy_ui >}}

---
