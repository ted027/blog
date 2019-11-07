---
title: "React+TypeScript+material-uiでwithStylesを使う"
date: 2019-10-23T22:21:41+09:00
draft: false
comments: true
toc: true
categories: ["TypeScript"]
tags: ["React", "JavaScript", "material-ui"]
---

<!--more-->

---

{{< ad/a8/techacademy2 >}}

---

### JavaScript + material-ui

JavaScript + material-uiだと、`withStyles(styles)(Component)`でstyleを反映できます。

```js
import React from "react";
...
import { withStyles } from "@material-ui/styles";

const styles = theme => ({
  tab: {
    flexGrow: 1,
    backgroundColor: theme.palette.background.paper,
    color: "black",
    marginTop: 48
  }
});

const OrderAppBarWithoutStyles = React.forwardRef((props, ref) => (
  <AppBar className={props.classes.tab} ref={ref}>
    <Tabs
      variant="fullWidth"
      selected={props.selected}
      value={props.selected}
      indicatorColor="primary"
      textColor="primary"
      scrollButtons="auto"
      onChange={props.onChange}
    >
      <Tab label="順位表" />
      <Tab label="パークファクター" />
    </Tabs>
  </AppBar>
));

export const OrderAppBar = withStyles(styles)(OrderAppBarWithoutStyles);
```

しかし、Typescript + material-uiだと、これだけでは型が合わないとエラーにされてしまいます。

---

### TypeScript + material-ui

下のように型を指定して、`createStyles`でstyleを作成。

WithStylesを拡張してPropsのインタフェースを作り、コンポーネント作成時に渡す。

としてあげると、`withStyles`でstyleを反映できます。

```js
import * as React from "react";
...
import { Theme } from '@material-ui/core/styles/createMuiTheme';
import withStyles, { WithStyles, StyleRules } from '@material-ui/core/styles/withStyles';
import createStyles from '@material-ui/core/styles/createStyles';

const styles = (theme: Theme): StyleRules => createStyles({
  tab: {
    flexGrow: 1,
    backgroundColor: theme.palette.background.paper,
    color: "black",
    marginTop: 48
  }
});

interface Props extends WithStyles<typeof styles> {
  selected: number;
  onChange: (event: any, selected: number) => any;
}

const LeagueAppBarWithoutStyles: React.FC<Props> = React.forwardRef((props, ref) => (
  <AppBar className={props.classes.tab} ref={ref}>
    <Tabs
      variant="fullWidth"
      value={props.selected}
      indicatorColor="primary"
      textColor="primary"
      scrollButtons="auto"
      onChange={props.onChange}
    >
      <Tab label="ALL" />
      <Tab label="セリーグ" />
      <Tab label="パリーグ" />
    </Tabs>
  </AppBar>
));

export const LeagueAppBar = withStyles(styles)(LeagueAppBarWithoutStyles);

```

---

{{< ad/con/wide/react >}}

---

{{< ad/a8/techacademy_ui >}}

---
