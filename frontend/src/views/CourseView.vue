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
    <form ref="form" @submit.stop.prevent="handleSubmitNew">
      <b-form-group
        label="Title"
        label-for="title-new-input"
      >
        <b-form-input
          id="title-new-input"
          v-model="title"
          required
        ></b-form-input>
      </b-form-group>

      <b-form-group
        label="Description"
        label-for="description-new-input"
      >
        <b-form-input
          id="description-new-input"
          v-model="description"
          required
        ></b-form-input>
      </b-form-group>
    </form>
  </b-modal>

  <b-modal
    id="modal-show"
    title="Show Course"
    @ok="handleNewOk"
    @cancel="handleNewCancel"
    hide-header-close
    centered
  >
    <form ref="form-show" @submit.stop.prevent="handleSubmitShow">
      <b-form-group
        label="Title"
        label-for="title-show-input"
      >
        <b-form-input
          id="title-show-input"
          v-model="this.show.title"
          disabled
        ></b-form-input>
      </b-form-group>

      <b-form-group
        label="Description"
        label-for="description-show-input"
      >
        <b-form-input
          id="description-show-input"
          v-model="this.show.description"
          disabled
        ></b-form-input>
      </b-form-group>
    </form>
  </b-modal>

  <b-modal
    id="modal-edit"
    title="Edit Course"
    @ok="handleNewOk"
    @cancel="handleNewCancel"
    hide-header-close
    centered
  >
    <form ref="form" @submit.stop.prevent="handleSubmitEdit">
      <b-form-group
        label="Title"
        label-for="title-edit-input"
      >
        <b-form-input
          id="title-edit-input"
          v-model="this.edit.title"
          required
        ></b-form-input>
      </b-form-group>

      <b-form-group
        label="Description"
        label-for="description-edit-input"
      >
        <b-form-input
          id="description-edit-input"
          v-model="this.edit.description"
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

      title: null,
      description: null,

      show: {
        id: null,
        title: null,
        description: null,
        created_at: null,
        updated_at: null,
      },

      edit: {
        id: null,
        title: null,
        description: null,
      },

      delete: {
        id: null,
      },
    }
  },
  methods: {
    btNew() {
      console.log(this.title)
      console.log(this.description)
      this.title = null
      this.description = null
      // console.log(this.$el)
    },
    handleSubmitNew() {
      console.log(this.title)
      console.log(this.description)
      this.title = this.$refs.title.value
      this.description = this.$refs.description.value
      this.items.push({
        title: this.title,
        description: this.description,
        // created_at: new Date(),
        // updated_at: new Date(),
      })
      this.$refs.form.reset()
      this.$bvModal.hide('modal-new')
    },
    handleNewOk() {
      console.log('ok')
    },
    handleNewCancel() {
      console.log('cancel')
    },
    handleNewClose() {
      console.log('close')
    },
    btShow(item) {
      console.log(item)
      this.show.id = item.id
      this.show.title = item.title
      this.show.description = item.description
      this.show.created_at = item.created_at
      this.show.updated_at = item.updated_at
      console.log(this.show)
      // console.log(this.$el)
    },
    btEdit(item) {
      console.log(item)
      this.edit.id = item.id
      this.edit.title = item.title
      this.edit.description = item.description
      console.log(this.edit)
      // console.log(this.$el)
    },
    btDelete(item) {
      console.log('deleted ', item)
      alert('deleted ' + item.id)
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
          // console.log(response)

          // this.items = response.data.data
          this.items = response.data
        })
        .catch(error => {
          // console.log(error)
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
