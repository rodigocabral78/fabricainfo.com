import Vue from 'vue'
import App from './App.vue'
import './registerServiceWorker'
import router from './router'
import store from './store'
import axios from "axios"
import VueAxios from 'vue-axios'

import { BootstrapVue, IconsPlugin } from 'bootstrap-vue'

// Import Bootstrap and BootstrapVue CSS files (order is important)
import 'bootstrap/dist/css/bootstrap.min.css'
import 'bootstrap-vue/dist/bootstrap-vue.min.css'

// const EventBus = new Vue();
// export default EventBus;

// Make BootstrapVue available throughout your project
Vue.use(BootstrapVue)
// Optionally install the BootstrapVue icon components plugin
Vue.use(IconsPlugin)

Vue.prototype.$appName = process.env.VUE_APP_TITLE;
Vue.prototype.$http = process.env.VUE_APP_HOST;

Vue.config.productionTip = false

// axios.create({
//   // baseURL: 'https://some-domain.com/api/',
//   baseURL: process.env.VUE_APP_HOST_API,
//   headers: {
//     // "Authorization": "Bearer " + localStorage.getItem("access_token"),
//     // "Authorization": localStorage.getItem('token_type') + " " + localStorage.getItem("access_token"),

//     "Accept": "application/json",
//     "Content-Type": "application/json; charset=utf-8",

//     "Access-Control-Allow-Origin": "*",
//     "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, PATCH, OPTIONS",
//     "Access-Control-Allow-Headers": "X-Requested-With, content-type, Authorization",
//     "Access-Control-Allow-Credentials": true,
//     "Access-Control-Expose-Headers": "*",
//     "Access-Control-Max-Age": "1728000"
//   }
// });

axios.defaults.baseURL = process.env.VUE_APP_HOST_API;
// axios.defaults.headers.common = {
//     "Accept": "application/json",
//     "Content-Type": "application/json; charset=utf-8",

//     "Access-Control-Allow-Origin": "*",
//     "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, PATCH, OPTIONS",
//     "Access-Control-Allow-Headers": "X-Requested-With, content-type, Authorization",
//     "Access-Control-Allow-Credentials": true,
//     "Access-Control-Expose-Headers": "*",
//     "Access-Control-Max-Age": "1728000"
// }


// Adiciona um interceptador na requisição
axios.interceptors.request.use(
  (config) => {
    // Faz alguma coisa antes da requisição ser enviada
    const access_token = localStorage.getItem('access_token')
    const token_type = localStorage.getItem('token_type')
    if (access_token) {
      // console.log(access_token)
      config.headers = {
        "Accept": "application/json",
        "Content-Type": "application/json; charset=utf-8",

        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, PATCH, OPTIONS",
        "Access-Control-Allow-Headers": "X-Requested-With, content-type, Authorization",
        "Access-Control-Allow-Credentials": true,
        "Access-Control-Expose-Headers": "*",
        "Access-Control-Max-Age": "1728000",

        "Authorization": `${token_type} ${access_token}`,
      }
    }
    // console.log(config)
    return config
  },
  (error) => {
    // Faz alguma coisa com o erro da requisição
    // console.log(error)
    alert(error);
    return Promise.reject(error)
  }
)
// Adiciona um interceptador na resposta
axios.interceptors.response.use(
  (response) => {
    // Qualquer código de status que dentro do limite de 2xx faz com que está função seja acionada
    // Faz alguma coisa com os dados de resposta
    // console.log(response)
    return response
  },
  (error) => {
    // Qualquer código de status que não esteja no limite do código 2xx faz com que está função seja acionada
    // Faz alguma coisa com o erro da resposta
    // console.log(error)
    alert(error);
    if (error.response !== undefined && error.response.status === 401) {

      store.dispatch('logout')
      router.push('/login')
    }
    return Promise.reject(error)
  }
)

Vue.use(VueAxios, axios)

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
