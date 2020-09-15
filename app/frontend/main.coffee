#
# scripts
#
import Vue from 'vue'
import Root from './Root.vue'

Vue.config.productionTip = false

document.addEventListener 'DOMContentLoaded', (event) =>
  new Vue
    el: '#app'
    components:
      'root': Root
