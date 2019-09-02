import Vue from 'vue'
import HelloWorld from '../components/hello_world'

document.addEventListener('DOMContentLoaded', () => {
  var element = document.getElementById('main_index')
  if (element != null) {
    new Vue({
      el: '#main_index main',
      data: {},
      created() {},
      components: {
        'hello-world': HelloWorld
      }
    })
  }
})
