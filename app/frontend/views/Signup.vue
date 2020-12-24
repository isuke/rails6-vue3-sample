<template lang="pug">
.signup
  h1.title Sign Up
  form.form
    label.label(for="email") Email
    input.input#email(type="email", v-model="email")

    label.label(for="password") Password
    input.input#password(type="password", v-model="password")

    label.label(for="password_confirmation") Password Confirmation
    input.input#password_confirmation(type="password", v-model="passwordConfirmation")

    button.button(@click.prevent="submit") Submit
</template>

<script lang="coffee">
export default
  data: ->
    email: undefined
    password: undefined
    passwordConfirmation: undefined
  methods:
    submit: ->
      @$backendClient.post '/api/users',
        email: @email
        password: @password
        passwordConfirmation: @passwordConfirmation
      .then (response) =>
        window.location.href = '/mypage'
      .catch (error) =>
        console.error error.response.data.message
</script>

<style lang="scss" scoped>
.signup {
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
