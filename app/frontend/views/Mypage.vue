<template lang="pug">
.mypage
  h1.title My Page
  h2.email {{ user.email }}
  a(@click.prevent="logout", href="#") logout
</template>

<script lang="coffee">
export default
  props: ['user']
  methods:
    logout: ->
      @$backendClient.delete '/api/logout'
      .then (response) =>
        window.location.href = '/'
      .catch (error) =>
        console.error error.response.data.message
</script>

<style lang="scss" scoped>
.signup {
  > .title {
  }
}
</style>
