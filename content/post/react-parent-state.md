---
title: "Reactで親コンポーネントのstateを変更/参照する"
date: 2019-06-21T12:38:54+09:00
draft: false
comments: true
toc: true
categories: ["React"]
tags: ["Javascript", "NodeJS", "state"]
---

<!--more-->

---

{{< ad/a8/techacademy >}}

---

{{< ad/con/wide/javascript >}}

---

### 概要

Reactで（こういうことをするべきかどうかは置いておいて）他のコンポーネントのstateを変更する方法。

---

### 親のstateを参照する

普通にstateをpropとして子コンポーネントに渡せばよい。

親側はこんな感じ。

```js
class Parent extends React.component {
    state = {
        mystate: "hoge"
    }

    render() {
        return {
            <Clild parent_state={this.state}>
        }
    }
}
```

子側はこんな感じ。

```js
class Child extends React.component {
    render() {
        const { main_state } = this.props;
        return {
            <Typography>
              {main_state.mystate}
            </Typography>
        }
    }
}

Child.propTypes = {
  main_state: PropTypes.object
};
```

---

### 親のstateを変更する

親コンポーネント側でstateを変更する関数を用意し、子コンポーネントに渡す。

親側はこんな感じ。

```js
class Parent extends React.component {
    state = {
        mystate: ""
    }

    handleStateChange = (str) => {
        this.setState({ mystate: str })
    };
    render() {
        return {
            <Clild parent_func={this.handleStateChange}>
        }
    }
}
```

子側はこんな感じ。

```js
class Child extends React.component {
    handleClick = (str) => event => {
        return this.props.parent_func(str);
    };
    render() {
        var str1 = "fuga";
        var str2 = "piyo";
        return {
            <div>
              <Button onClick={this.handleClick(str1)}>
                {str1}
              </Button>
              <Button onClick={this.handleClick(str2)}>
                {str2}
              </Button>
            </div>
        }
    }
}

Child.propTypes = {
  parent_func: PropTypes.func
};
```

---

{{< ad/con/wide/react >}}

---

{{< ad/a8/techacademy_nodejs >}}

---
