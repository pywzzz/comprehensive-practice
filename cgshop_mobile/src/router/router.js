import Vue from 'vue'
import VueRouter from 'vue-router'

//引入首页面
import Home from '@/views/Home.vue'
import Order from '@/views/Order.vue'

// 将VueRouter 做为插件安装到Vue对象上，会在Vue上增加两个属性$router $route
Vue.use(VueRouter)

//配置路由信息
const routes=[
    {
       "path":"/",
        component:Home
    },
    {
        "path":"/order",
        component:Order
    }
];


const router=new VueRouter({
    routes  //  routes====>  "routes":routes
});


//导出路由对象
export default router;

