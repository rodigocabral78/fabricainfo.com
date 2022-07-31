<template>
  <div class="course overflow-auto">
    <b-card title="Course page">
    <b-card-text>

      <div class="course-table">

        <b-button size="sm" class="mr-2" variant="success" @click="btNew()">New</b-button>

        <br><br>

        <b-table
          id="course-table"
          :items="items"
          :fields="fields"
          :per-page="perPage"
          :current-page="currentPage"
          striped
          hover
        >
          <template v-slot:cell(actions)="{item}">
            <b-button size="sm" class="mr-2" variant="secondary" @click="btShow(item.id)">
              <b-icon icon="eye" aria-hidden="true"></b-icon></b-button>
            <b-button size="sm" class="mr-2" variant="info" @click="btEdit(item.id)">
              <b-icon icon="pencil-square" aria-hidden="true"></b-icon></b-button>
            <b-button size="sm" variant="danger" @click="btDelete(item.id)">
              <b-icon icon="trash" aria-hidden="true"></b-icon></b-button>
          </template>
        </b-table>

        <p class="mt-3">Current Page: {{ currentPage }}</p>

        <b-pagination
          v-model="currentPage"
          :total-rows="rows"
          :per-page="perPage"
          aria-controls="course-table"
        ></b-pagination>
      </div>

    </b-card-text>


  </b-card>
  </div>
</template>

<script>
export default {
  name: 'CourseView',
  data() {
    return {
      perPage: 5,
      currentPage: 1,

      fields: [
        {
          key: 'actions',
          label: '',
          class: 'thAction',
          sortable: false
        },
        {
          key: 'id',
          label: '#',
          class: 'thId',
          numeric: true,
          centered: true,
          sortable: true
        },
        {
          key: 'first_name',
          label: 'First Name',
          sortable: true
        },
        {
          key: 'last_name',
          label: 'Last Name',
          sortable: true
        }
      ],
      items: [
        {isActive: false, id: 1, first_name: 'Fred', last_name: 'Flintstone' },
        {isActive: true, id: 2, first_name: 'Barney', last_name: 'Rubble' },
        {isActive: true, id: 3, first_name: 'Wilma', last_name: 'Flintstone' },
        {isActive: true, id: 4, first_name: 'Betty', last_name: 'Rubble' },
        {isActive: true, id: 5, first_name: 'BamBam', last_name: 'Rubble' },
        {isActive: true, id: 6, first_name: 'Pebbles', last_name: 'Flintstone' },
        {isActive: true, id: 7, first_name: 'Dino', last_name: 'Flintstone' },
        {isActive: true, id: 8, first_name: 'Clint', last_name: 'Eastwood' },
        {isActive: true, id: 9, first_name: 'Clint', last_name: 'Eastwood' },
        {isActive: true, id: 10, first_name: 'Clint', last_name: 'Eastwood' },
        {isActive: true, id: 11, first_name: 'Clint', last_name: 'Eastwood' },
        {isActive: true, id: 12, first_name: 'Clint', last_name: 'Eastwood' }
      ],
      message: 'Welcome to Your Vue.js App',
      show: true
    }
  },
  methods: {
    btEdit(item) {
      console.log('edited ', item);
    },
    btDelete(item) {
      console.log('deleted ', item);
    },
    getList() {
      const urlAPI = process.env.VUE_APP_HOST_API
      // console.log('urlAPI: ', urlAPI)
      const urlCourse = urlAPI + "/v1/courses" // api de autenticação//
      // const data = JSON.stringify(this.form)
      // console.log('data:', data)
      const config = {
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json'
        }
      }

      this.axios.get(urlCourse, config)
        .then(response => {
          console.log(response)
          this.show = false

          // localStorage.setItem('access_token', response.data.access_token);
          // localStorage.setItem('expires_in', response.data.expires_in);
          // localStorage.setItem('token_type', response.data.token_type);
          // localStorage.setItem('client', btoa(JSON.stringify(response.data.access_token)));
          // if (localStorage.getItem('access_token')) {
          //   this.$router.push({
          //     path: '/home'
          //   })
          // }
        })
        .catch(error => {
          console.log(error)
        })
    }
  },
  computed: {
    rows() {
      return this.items.length
    }
  },
  // watch: {
  //   $route: function(to, from) {
  //     console.log('to: ', to)
  //     console.log('from: ', from)
  //   }
  // },
  mounted() { // gerencia o receber de dados de outro componente
    console.log('CourseView mounted')
    this.getList()
  // },
  // created() {
  //   console.log('CourseView created')
  //   this.getList()
  }
}
</script>

<style>
.course {
  text-align: center;
}
.course-table {
  text-align: justify;
}
.thAction {
  width: 10rem;
  text-align: center;
}
.thId {
  width: 1rem;
  text-align: center;
}
</style>
