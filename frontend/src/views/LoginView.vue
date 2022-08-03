<template>
  <div class="login">

    <b-form @submit="onSubmit" @reset="onReset" v-if="show">
      <b-form-group
        id="input-group-1"
        label="Email address:"
        label-for="input-1"
        description="We'll never share your email with anyone else."
      >
        <b-form-input
          id="input-1"
          v-model="form.email"
          type="email"
          placeholder="Enter email"
          required
        ></b-form-input>
      </b-form-group>

      <b-form-group
        id="input-group-2"
        label="Password:"
        label-for="input-2"
        description="We'll never share your password with anyone else."
      >
        <b-form-input
          id="input-2"
          v-model="form.password"
          type="password"
          placeholder="Password"
          required
        ></b-form-input>
      </b-form-group>

      <b-form-group id="input-group-4" v-slot="{ ariaDescribedby }">
        <b-form-checkbox-group
          v-model="form.checked"
          id="checkboxes-4"
          :aria-describedby="ariaDescribedby"
        >
          <b-form-checkbox value="me">Remember me</b-form-checkbox>
          <!-- <b-form-checkbox value="that">Check that out</b-form-checkbox> -->
        </b-form-checkbox-group>
      </b-form-group>

      <b-button type="submit" variant="primary">Submit</b-button>
      <!-- <b-button type="reset" variant="danger">Reset</b-button> -->
    </b-form>

  </div>
</template>

<script>
  export default {
    data() {
      return {
        form: {
          email: '',
          password: '',
          checked: []
        },
        show: true
      }
    },
    methods: {
      onSubmit(event) {
        // console.log('Process ENV', process.env)
        event.preventDefault()

        const urlAPI = process.env.VUE_APP_HOST_API
        const urlLogin = urlAPI + "/v1/auth/in" // api de autenticação//
        const data = JSON.stringify(this.form)
        const config = {
          headers: {
            "Accept": "application/json",
            'Content-Type': 'application/json'
          }
        }

        this.axios.post(urlLogin, data, config)
          .then(response => {
            // console.log(response)
            this.show = false

            localStorage.setItem('login', true);
            localStorage.setItem('expires_in', response.data.expires_in);
            localStorage.setItem('token_type', response.data.token_type);
            localStorage.setItem('access_token', response.data.access_token);
            // localStorage.setItem('client', btoa(JSON.stringify(response.data.access_token)));
            if (localStorage.getItem('access_token')) {
              this.$router.push({
                path: '/home'
              })
            }
          })
      },
      onReset(event) {
        event.preventDefault()
        // Reset our form values
        this.form.email = ''
        this.form.name = ''
        this.form.food = null
        this.form.checked = []
        // Trick to reset/clear native browser form validation state
        this.show = false
        this.$nextTick(() => {
          this.show = true
        })
      }
    }
  }
</script>

<style>
.login {
  text-align: justify;
}
</style>
