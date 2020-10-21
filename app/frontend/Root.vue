<template lang="pug">
.root
  component(:is="viewName", :user="user")
</template>

<script lang="coffee">
import Home   from './views/Home.vue'
import Signup from './views/Signup.vue'
import Login  from './views/Login.vue'
import Mypage from './views/Mypage.vue'

export default
  data: ->
    user: {}
  props: [
    'viewName'
    'userId'
  ]
  components:
    'home': Home
    'signup': Signup
    'login': Login
    'mypage': Mypage
  created: ->
    return unless @userId

    @$backendClient.get "/api/users/#{@userId}"
    .then (response) =>
      @user = response.data
    .catch (error) =>
      console.error error.response.data.message

</script>

<style lang="scss" scoped>
.root {
  width: 100%;
  height: 100%;
}
</style>
