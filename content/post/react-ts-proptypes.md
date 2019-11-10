---
title: "React+TypeScriptでPropTypesを使う"
date: 2019-11-10T12:57:01+09:00
draft: false
comments: true
toc: true
categories: ["TypeScript"]
tags: ["React", "JavaScript", "PropTypes"]
---

<!--more-->

---

{{< ad/a8/techacademy >}}

---

### JavaScript + PropTypes

PropTypesを使って、Propsの型や`Required`かどうかを指定できる。

```js
import React from "react";
import PropTypes from "prop-types";
...

class SearchContents extends React.Component {
  render() {
    const {
      execSearch,
      resetSearch,
      handlePopper
    } = this.props;

    return (
      <div>
        <Popper
          open={open}
          anchorEl={anchorEl}
          placement="top-end"
          transition
        >
            ...
        </Popper>
        <Fab color="primary" aria-label="Search">
          <SearchIcon onClick={handlePopper} />
        </Fab>
      </div>
    );
  }
}

SearchContents.propTypes = {
  execSearch: PropTypes.func.isRequired,
  resetSearch: PropTypes.func.isRequired,
  handlePopper: PropTypes.func.isRequired
};
```

---

### TypeScript + PropTypes

TypeScriptでPropTypesを使う場合は書き方が変わる。

というか、Propsを定義する必要があるので、PropTypesを使うと二重定義になる。

```js
import * as React from "react";
import PropTypes from "prop-types";
...

interface Props {
  execSearch: (team: string, name: string) => {[key: string]: string};
  resetSearch: () => {[key: string]: string};
  handlePopper: (event: React.MouseEvent<SVGSVGElement, MouseEvent>) => {[key: string]: any};
}

class SearchContents extends React.Component<Props> {
  static propTypes = {
    execSearch: PropTypes.func.isRequired,
    resetSearch: PropTypes.func.isRequired,
    handlePopper: PropTypes.func.isRequired
  };
  render() {
    const {
      execSearch,
      resetSearch,
      handlePopper
    } = this.props;

    return (
      <div>
        <Popper
          open={open}
          anchorEl={anchorEl}
          placement="top-end"
          transition
        >
            ...
        </Popper>
        <Fab color="primary" aria-label="Search">
          <SearchIcon onClick={handlePopper} />
        </Fab>
      </div>
    );
  }
}
```

---

### TypeScriptでPropTypesは必要か

じゃあ不要じゃん…となるところだが、TypeScriptのgithubに以下のようなIssueがある。

- [Support setting React PropTypes using TypeScript types #4833](https://github.com/Microsoft/TypeScript/issues/4833)

TypeScriptでbuildする際はPropTypesを書かずとも想定外の型を弾けるが、buildしたものを他者が利用する場合はその限りではない。

他者がTypeScriptを使うのであればいいが、JavaScript等を使う場合、想定外の型も受け入れてしまう。

なので、そのような場合に型の制約をかけたければ、TypeScriptであってもpropTypesを記載する。

---

{{< ad/con/wide/react >}}

---

{{< ad/a8/techacademy_ui >}}

---
