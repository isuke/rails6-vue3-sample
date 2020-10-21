<template lang="pug">
.home
  img(src="./../assets/logo.png")
  h1 Home
  p {{ message }}
  p.menu
    a(href="/signup") Sign up
    span.or or
    a(href="/login") Login
</template>

<script lang="coffee">
export default
  data: ->
    message: 'Hello'
</script>

<style lang="scss" scoped>
.home {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;

  > .menu {
    > .or {
      margin-left: 0.5em;
      margin-right: 0.5em;
    }
  }
}
</style>
