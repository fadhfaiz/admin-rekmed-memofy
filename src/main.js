/*eslint-disable*/
import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import VoerroTagsInput from '@voerro/vue-tagsinput'
import Vuelidate from 'vuelidate'

Vue.use(Vuelidate);

Vue.component('tags-input', VoerroTagsInput);

Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
