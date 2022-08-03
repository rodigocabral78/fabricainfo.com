<template>
  <div id="app">

    <b-navbar toggleable="lg" type="dark" variant="dark" top="fixed">
    <b-navbar-brand to="/">NavBar</b-navbar-brand>

    <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

      <b-collapse id="nav-collapse" is-nav>
        <b-navbar-nav>
          <b-nav-item to="/home">Home</b-nav-item>
          <b-nav-item to="/course">Course</b-nav-item>
          <b-nav-item to="/student">Student</b-nav-item>
          <b-nav-item to="/about">About</b-nav-item>
          <!-- <b-nav-item to="/login">Login</b-nav-item> -->
        </b-navbar-nav>

        <!-- Right aligned nav items -->
        <b-navbar-nav class="ml-auto">
          <!-- <b-nav-form>
            <b-form-input size="sm" class="mr-sm-2" placeholder="Search"></b-form-input>
            <b-button size="sm" class="my-2 my-sm-0" type="submit">Search</b-button>
          </b-nav-form>

          <b-nav-item href="#" disabled>Disabled</b-nav-item>

          <b-nav-item-dropdown text="Lang" right>
            <b-dropdown-item href="#">EN</b-dropdown-item>
            <b-dropdown-item href="#">ES</b-dropdown-item>
            <b-dropdown-item href="#">RU</b-dropdown-item>
            <b-dropdown-item href="#">FA</b-dropdown-item>
          </b-nav-item-dropdown> -->

          <b-nav-item-dropdown right>
            <!-- Using 'button-content' slot -->
            <template #button-content>
              <em>User</em>
            </template>
            <b-dropdown-item href="#">Profile</b-dropdown-item>
            <!-- <b-dropdown-item to="/logout">Sign Out</b-dropdown-item> -->
            <b-dropdown-item href="#" @click="onLogout">Sign Out</b-dropdown-item>
          </b-nav-item-dropdown>
        </b-navbar-nav>
      </b-collapse>

    </b-navbar>

    <b-container fluid>
      <b-row class="justify-content-center">
        <b-col cols="10">
          <router-view></router-view>
        </b-col>
      </b-row>
    </b-container>

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
      onLogout(event) {
        // console.log('Process ENV', process.env)
        event.preventDefault()

        const urlAPI = process.env.VUE_APP_HOST_API
        // console.log('urlAPI: ', urlAPI)
        const urlLogin = urlAPI + "/v1/auth/out" // api de autenticação//
        const config = {
          headers: {
            "Accept": "application/json",
            'Content-Type': 'application/json'
          }
        }

        this.axios.post(urlLogin, config)
          .then(response => {
            console.log(response)
            this.show = false

            localStorage.clear() //all items

            localStorage.removeItem('access_token') //item
            localStorage.removeItem('expires_in') //item
            localStorage.removeItem('token_type') //item
            // localStorage.removeItem('client') //item
            if (localStorage.getItem('access_token')) {
              this.$router.push({
                path: '/login'
              })
            }
          })
          .catch(error => {
            console.log(error)
          })
      }
    }
  }
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

.container, .container-fluid, .container-sm, .container-md, .container-lg, .container-xl {
  margin-top: 10px;
}
</style>
