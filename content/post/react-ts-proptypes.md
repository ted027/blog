---
title: "React+TypeScriptでPropTypesを使う"
date: 2019-10-26T10:13:01+09:00
draft: true
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
const LeagueAppBarWithoutStyles = React.forwardRef((props, ref) => (
  <AppBar className={props.classes.subtab} ref={ref}>
    <Tabs
      variant="fullWidth"
      selected={props.selected}
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

LeagueAppBarWithoutStyles.propTypes = {
  classes: PropTypes.object.isRequired,
  selected: PropTypes.number.isRequired,
  onChange: PropTypes.func.isRequired
};
```

### TypeScript + PropTypes

TypeScriptでPropTypesを使う場合、書き方がかなり変わる。

```ts

```

### TypeScriptでPropTypesは必要なのか

---

{{< ad/con/wide/react >}}

---

{{< ad/a8/techacademy_ui >}}

---
