import Vue from 'vue'
import App from './App.vue'
//引入路由
import router from './router/router.js'
//引入请求库
import http from './utils/http.js'
import host from './utils/host.js'

//增加全局属性 
Vue.prototype.$http=http;
Vue.prototype.$host=host;

Vue.config.productionTip = false

new Vue({
  router,  //  等价于  "router":router
  render: function (h) { return h(App) },
}).$mount('#app')
