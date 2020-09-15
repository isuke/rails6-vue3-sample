<template lang="pug">
.home
  img(src="./../assets/logo.png")
  h1 Home
  p {{ message }}
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
}
</style>
