#
# scripts
#
import Vue from 'vue'
import Root from './Root.vue'

import axios from 'axios'

Vue.config.productionTip = false

tokenElement = document.querySelector('meta[name=csrf-token]')
Vue.prototype.$backendClient = axios.create
  baseURL: process.env.BACKEND_URL
  headers:
    'X-Requested-With': 'XMLHttpRequest',
    'X-CSRF-TOKEN': tokenElement.content

document.addEventListener 'DOMContentLoaded', (event) =>
  new Vue
    el: '#app'
    components:
      'root': Root
