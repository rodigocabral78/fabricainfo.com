import Vue from 'vue'
import VueRouter, { RouteConfig } from 'vue-router'
// import HomeView from '../views/HomeView.vue'

Vue.use(VueRouter)

const routes: Array<RouteConfig> = [
  {
    path: '*',
    redirect: '/login',
  },
  {
    path: '/',
    redirect: '/login',
  },
  {
    path: '/login',
    name: 'Login',
    component: () => import ( /* webpackChunkName: "login" */ '@/views/LoginView.vue')
  },
  // {
  //   path: '/logout',
  //   name: 'Logout',
  //   component: () => import ( /* webpackChunkName: "logout" */ '@/views/LogoutView.vue')
  // },
  {
    path: '/home',
    name: 'home',
    // component: HomeView
    // route level code-splitting
    // this generates a separate chunk (home.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "home" */ '@/views/HomeView.vue')
  },
  {
    path: '/student',
    name: 'student',
    // route level code-splitting
    // this generates a separate chunk (student.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "student" */ '@/views/StudentView.vue')
  },
  {
    path: '/course',
    name: 'course',
    // route level code-splitting
    // this generates a separate chunk (course.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "course" */ '@/views/CourseView.vue')
  },
  {
    path: '/about',
    name: 'about',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '@/views/AboutView.vue')
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
