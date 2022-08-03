<template>
  <div class="course overflow-auto">
    <b-card title="Course page">
    <b-card-text>

      <div class="course-table">

        <b-button size="sm" class="mr-2" variant="success" @click="btNew()" v-b-modal.modal-new>New</b-button>

        <br><br>

        <b-table
          id="course-table"
          :items="items"
          :fields="fields"
          :per-page="perPage"
          :current-page="currentPage"
          responsive="sm"
          striped
          hover
        >
          <template v-slot:cell(actions)="{item}">
            <b-button size="sm" class="mr-2" variant="info" @click="btShow(item)" v-b-modal.modal-show>
              <b-icon icon="eye" aria-hidden="true"></b-icon></b-button>
            <b-button size="sm" class="mr-2" variant="warning" @click="btEdit(item)" v-b-modal.modal-edit>
              <b-icon icon="pencil-square" aria-hidden="true"></b-icon></b-button>
            <b-button size="sm" variant="danger" @click="btDelete(item)">
              <b-icon icon="trash" aria-hidden="true"></b-icon></b-button>
          </template>
        </b-table>

        <p class="mt-3">Current Page: {{ currentPage }}</p>

        <b-pagination
          v-model="currentPage"
          :total-rows="rows"
          :per-page="perPage"
          first-number
          first-text="⏮"
          prev-text="⏪"
          next-text="⏩"
          last-text="⏭"
          last-number
          class="mt-4"
          align="fill"
          aria-controls="course-table"
        ></b-pagination>
      </div>

    </b-card-text>
  </b-card>

  <b-modal
    id="modal-new"
    title="New Course"
    @ok="handleNewOk"
    @cancel="handleNewCancel"
    hide-header-close
    centered
  >
    <form ref="form">
      <b-form-group
        label="Title"
        label-for="title-new-input"
      >
        <b-form-input
          id="title-new-input"
          v-model="form.title"
          type="text"
          placeholder="Enter title"
          required
        ></b-form-input>
      </b-form-group>

      <b-form-group
        label="Description"
        label-for="description-new-input"
      >
        <b-form-input
          id="description-new-input"
          v-model="form.description"
          type="text"
          placeholder="Enter description"
          required
        ></b-form-input>
      </b-form-group>
    </form>
  </b-modal>

  <b-modal
    id="modal-show"
    title="Show Course"
    hide-header-close
    centered
  >
    <form ref="form-show">
      <b-form-group
        label="Title"
        label-for="title-show-input"
      >
        <b-form-input
          id="title-show-input"
          v-model="this.form.title"
          type="text"
          placeholder="Enter title"
          disabled
        ></b-form-input>
      </b-form-group>

      <b-form-group
        label="Description"
        label-for="description-show-input"
      >
        <b-form-input
          id="description-show-input"
          v-model="this.form.description"
          type="text"
          placeholder="Enter description"
          disabled
        ></b-form-input>
      </b-form-group>
    </form>
  </b-modal>

  <b-modal
    id="modal-edit"
    title="Edit Course"
    @ok="handleEditOk"
    @cancel="handleEditCancel"
    hide-header-close
    centered
  >
    <form ref="form">
      <b-form-group
        label="Title"
        label-for="title-edit-input"
      >
        <b-form-input
          id="title-edit-input"
          v-model="this.form.title"
          type="text"
          placeholder="Enter title"
          required
        ></b-form-input>
      </b-form-group>
      {{ this.form.title }}

      <b-form-group
        label="Description"
        label-for="description-edit-input"
      >
        <b-form-input
          id="description-edit-input"
          v-model="this.form.description"
          type="text"
          placeholder="Enter title"
          required
        ></b-form-input>
      </b-form-group>
    </form>
  </b-modal>
  </div>
</template>

<script>
export default {
  name: 'CourseView',
  data() {
    return {
      fields: [
        {
          key: 'id',
          label: '#',
          class: 'thId',
          numeric: true,
          sortable: true
        },
        {
          key: 'title',
          label: 'Title',
          sortable: true
        },
        // {
        //   key: 'description',
        //   label: 'Description',
        //   sortable: true
        // },
        {
          key: 'created_at',
          label: 'Created At'
        },
        {
          key: 'updated_at',
          label: 'Updated At'
        },
        {
          key: 'actions',
          label: 'Actions',
          class: 'thAction'
        },
      ],
      items: [],
      perPage: 5,
      currentPage: 1,

      form: {
        id: null,
        title: null,
        description: null,
        created_at: null,
        updated_at: null,
      },

      delete: {
        id: null,
      },
    }
  },
  methods: {
    btNew() {
      console.log(this.form.title)
      console.log(this.form.description)
      this.form.title = null
      this.form.description = null
      // console.log(this.$el)
    },
    handleNewOk() {
      const urlAPI = process.env.VUE_APP_HOST_API
      const urlLogin = urlAPI + "/v1/courses"
      const data = JSON.stringify(this.form)

      this.axios.post(urlLogin, data)
        .then(response => {
          console.log(response)
          this.getList()
        })
    },
    handleNewCancel() {
      this.form.title = null
      this.form.description = null
      // console.log('cancel')
    },
    btShow(item) {
      console.log(item)
      this.form.id = item.id
      this.form.title = item.title
      this.form.description = item.description
      this.form.created_at = item.created_at
      this.form.updated_at = item.updated_at
      console.log(this.form)
      // console.log(this.$el)
    },
    btEdit(item) {
      this.form.id = null
      this.form.title = null
      this.form.description = null
      console.log(item)
      this.form.id = item.id
      this.form.title = item.title
      this.form.description = item.description
      console.log(this.form)
      // console.log(this.$el)
    },
    handleEditOk() {
      console.log('ok')

      const urlAPI = process.env.VUE_APP_HOST_API
      const urlLogin = urlAPI + "/v1/courses/" + this.form.id
      const data = JSON.stringify(this.form)

      this.axios.put(urlLogin, data)
        .then(response => {
          console.log(response)
          this.getList()
        })
        this.getList()
    },
    handleEditCancel() {
      this.form.title = null
      this.form.description = null
      // console.log('cancel')
    },
    btDelete(item) {
      console.log('deleted ', item)
      alert('deleted ' + item.id)
      const urlAPI = process.env.VUE_APP_HOST_API
      const urlLogin = urlAPI + "/v1/courses/" + item.id

      this.axios.delete(urlLogin)
        .then(response => {
          console.log(response)
          this.getList()
        })
    },
    getList() {
      const urlAPI = process.env.VUE_APP_HOST_API
      const urlCourse = urlAPI + "/v1/courses"
      // const data = JSON.stringify(this.form)
      // console.log('data:', data)

      this.axios.get(urlCourse)
        .then(response => {
          // console.log(response)

          // this.items = response.data.data
          this.items = response.data.items
        })
    }
  },
  computed: {
    rows() {
      return this.items.length
    }
  },
  mounted() { // gerencia o receber de dados de outro componente
    // console.log('CourseView mounted')
    this.getList()
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
