---
title: "Reactの導入"
date: 2019-06-27T12:38:54+09:00
draft: false
comments: true
toc: true
categories: ["React"]
tags: ["Javascript", "NodeJS"]
---

Reactを導入してUIを作る。

<!--more-->

---

{{< ad/a8/techacademy2 >}}

---

### React

UIを構成するパーツを作ることができるライブラリ。

FacebookがOSSとして公開している。

- [React](https://ja.reactjs.org/)

---

### ReactでUIを表示してみる

npmで`create-react-app`を入れると簡単にサンプルUIを作成できる。

nodejs, npmをインストールした環境で、以下を実行。

```sh
$ npm install -g create-react-app
$ create-react-app my_react_app
$ cd my_react_app
$ npm start
```

`localhost`でreactのサンプルページにアクセスできる。

### ReactのUIを弄ってみる

`my_react_app/src/index.js`を覗いてみる。

```js
...
import App from './App';
...
ReactDOM.render(<App />, document.getElementById('root'));
...
```

`App`を使っているので、次は`App.js`を覗く。

```js
import React from 'react';
import logo from './logo.svg';
import './App.css';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </div>
  );
}

export default App;
```

ご丁寧に教えてくれているので、書き換えてみる。

```js
function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          // Edit <code>src/App.js</code> and save to reload.   <-この辺を書き換える
          Hello, world                                       // <-この辺を書き換える
        </p>
```

`localhost`にアクセスすると、表示が変わっている。

### Reactをビルドする

```sh
$ cd my_react_app # <-Reactのdirectoryに移動
$ npm run build
```

これで`my_react_app/build`以下にビルドできる。

あとはこれをサーバに置くなりS3に置くなりgithubに置くなりしてホスティングすると、webサイトとして公開できる。

---

{{< ad/con/wide/react >}}

---

{{< ad/a8/techacademy_ui >}}

---
