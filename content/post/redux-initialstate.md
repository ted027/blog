---
title: "Reduxで複数のReducerを扱う際のState初期値設定"
date: 2019-07-15T01:13:59+09:00
draft: false
comments: true
toc: true
categories: ["React"]
tags: ["Redux", "State", "エラー"]
---

combineReducersを使うと、Stateの初期設定でエラーが発生した。

<!--more-->

---

{{< ad/a8/techacademy_py_ai >}}

---

{{< ad/con/wide/javascript >}}

---

### Reduxの概念とStateの初期設定

Reduxに関して、自分は以下のような概念で認識している。

```js
// Reducerは、actionと旧stateから、新stateを生成する
const reducer = (state, action) => state
// storeは、初期値initialState、その後reducerを用いて生成したstateを保持
const store = createStore(reducer, initialState)
// storeはactionをdispatchして新たなstateを生成していく
store.dispatch(action)
```

{{< img src="/img/redux.jpg" >}}

※ 画像: [UNIDIRECTIONAL USER INTERFACE ARCHITECTURES](https://staltz.com/unidirectional-user-interface-architectures.html)

---

なので、stateの初期値はcreateStoreの部分で設定していた。

```js
import recordsApp from './reducers'

...

initialState = {
    ...
}

let store = createStore(recordsApp, initialState)

ReactDOM.render(
    <Provider store={store}>
        <App />,
    </Provider>,
    document.getElementById("root")
);
serviceWorker.register();
```

---

### combineReducerするとエラー

Reducerが一つならこれで問題ないが、複数のReducerを扱おうとすると問題が起こる。

`combineReducer`を使って複数のReducerをまとめて使用する際、上と同じように初期値を設定するとエラーが発生する。

```js
import { combineReducers } from "redux";
import MainPage from "./page";
import Search from "./search";

const recordsApp = combineReducers({ MainPage, Search });
export default recordsApp;
```

```js
import recordsApp from './reducers'

...

initialState = {
    MainPage: {
        ...
    },
    Serarch: {
        ...
    }
}

let store = createStore(recordsApp, initialState)

ReactDOM.render(
    <Provider store={store}>
        <App />,
    </Provider>,
    document.getElementById("root")
);
serviceWorker.register();
```

---

{{< img src="/img/initialstate.png" >}}

---

### 解決策

`combineReducer`を使う場合、初期stateはReducer内で指定しなければならない。

なので、`initialState`の設定を`createStore`の部分から各Reducerに移せば解決する。

```js
const initialState = {
  ...
};

const MainPage = (state = initialState, action) => {
  switch (action.type) {
      ...
    default:
      return state;
  }
};
export default MainPage;
```

```js
const initialState = {
  ...
};

const Search = (state = initialState, action) => {
  switch (action.type) {
      ...
    default:
      return state;
  }
};
export default Search;
```

```js
import recordsApp from './reducers'

...

let store = createStore(recordsApp)

ReactDOM.render(
    <Provider store={store}>
        <App />,
    </Provider>,
    document.getElementById("root")
);
serviceWorker.register();
```

---

※ 参考: https://qiita.com/shinout/items/4a7f67275c3ad887d98d

---

{{< ad/con/wide/react >}}

---

{{< ad/a8/techacademy_ui >}}

---
