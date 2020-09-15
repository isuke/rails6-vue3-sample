<template lang="pug">
.root
  component(:is="viewName")
</template>

<script lang="coffee">
import Home from './views/Home.vue'

export default
  props: ['viewName']
  components:
    'home': Home
</script>

<style lang="scss" scoped>
.root {
  width: 100%;
  height: 100%;
}
</style>
