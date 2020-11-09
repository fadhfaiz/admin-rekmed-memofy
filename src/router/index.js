import Vue from 'vue'
import VueRouter from 'vue-router'
// import Home from '../views/Home.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/home',
    name: 'Home',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "home" */ '../views/Home.vue')
  },
  {
    path: '/',
    name: 'Dashboard',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "dashboard" */ '../views/Dashboard.vue')
  },
  {
    path: '/riwayat_medis',
    name: 'Riwayat_Medis',
    props: true,
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "riawayat_medis" */ '../views/Riwayat_Medis.vue')
  },
  {
    path: '/tag',
    name: 'tag',
    props: true,
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "tag" */ '../views/tag.vue')
  },
  {
    path: '/pendaftaran',
    name: 'Pendaftaran',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "pendaftaran" */ '../views/Pendaftaran.vue')
  },
  {
    path: '/rekmed',
    name: 'Rekmed',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "rekmed" */ '../views/Rekmed.vue')
  },
  {
    path: '/objective',
    name: 'Objective',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "objektif" */ '../views/Objective.vue')
  },
  {
    path: '/obat',
    name: 'Obat',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "obat" */ '../views/Obat.vue')
  },
  {
    path: '/racikan',
    name: 'Racikan',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "racikan" */ '../views/Racikan.vue')
  },
  {
    path: '/laporan',
    name: 'Laporan',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "laporan" */ '../views/Laporan.vue')
  },
  {
    path: '/subjektif',
    name: 'Subjektif',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "subjektif" */ '../views/Subjektif.vue')
  },
  {
    path: '/assesment',
    name: 'Assesment',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "assesment" */ '../views/Assesment.vue')
  },
  {
    path: '/plan',
    name: 'Plan',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "plan" */ '../views/Plan.vue')
  },
  {
    path: '/SOAP',
    name: 'SOAP',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "SOAP" */ '../views/SOAP.vue')
  },
  {
    path: '/invoice',
    name: 'Invoice',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "invoice" */ '../views/Invoice.vue')
  },
  {
    path: '/invoicenew',
    name: 'Invoicenew',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "invoicenew" */ '../views/InvoiceNew.vue')
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
