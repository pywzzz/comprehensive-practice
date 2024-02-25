import Vue from 'vue'
import App from './App.vue'
//引入elementui
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
//引入路由
import router from './router/index.js'
//引入http请求库
import http from './utils/http.js'
//将http添加到Vue原型上
Vue.prototype.$http=http;
//引入服务器地址
import host from './utils/host.js'
//添加到Vue原型上
Vue.prototype.$host=host;

Vue.config.productionTip = false
//将ElementUI做为插件安装到Vue上  在Vue对象上增加属性或方法
Vue.use(ElementUI);

new Vue({
    router,
    render: function(h) {
        return h(App)
    },
}).$mount('#app')
