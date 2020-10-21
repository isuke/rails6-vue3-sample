<template lang="pug">
.login
  h1.title Login
  form.form
    label.label(for="email") Email
    input.input#email(type="email", v-model="email")

    label.label(for="password") Password
    input.input#password(type="password", v-model="password")

    input.button(type="submit", @click.prevent="submit")
</template>

<script lang="coffee">
export default
  data: ->
    email: undefined
    password: undefined
  methods:
    submit: ->
      @$backendClient.post '/api/login',
        email: @email
        password: @password
      .then (response) =>
        window.location.href = '/mypage'
      .catch (error) =>
        console.error error.response.data.message
</script>

<style lang="scss" scoped>
.login {
  display: flex;
  flex-direction: column;
  align-items: center;

  > .title {
  }

  > .form {
    display: grid;
    grid-template-columns: 15rem 1fr;
    gap: 1em;

    > .label {
      text-align: right;
    }
    > .input {
    }
    > .button {
      grid-column: span 2;
    }
  }
}
</style>
