import Vue from 'vue'
import VueRouter from 'vue-router'

//引入组件  
import Login from '../views/Login.vue'
//你可以使用@符号  代表的是src  根目录 
import User from '@/views/sys/user/index.vue'
import SaveUser from '@/views/sys/user/SaveUser.vue'
import UpdateUser from '@/views/sys/user/UpdateUser.vue'
//主页
import Main from '@/views/common/Main.vue'

//商品
import Goods from '@/views/goods/index.vue'
import SaveGoods from '@/views/goods/SaveGoods.vue'
import UpdateGoods from '@/views/goods/UpdateGoods.vue'

//订单 
import  Order from '@/views/order/index.vue'

// 将VueRouter 做为插件安装到Vue对象上，会在Vue上增加两个属性$router $route
Vue.use(VueRouter)

//配置路由信息
const routes=[
    {
        path:"/",
        component:Login
    },
    {
        path:"/main",
        component:Main,
        //嵌套路由 以下路由将在main组件内显示
        children:[
            {
                path:"/user",
                component:User
            },
            {
                path:"/saveuser",
                component:SaveUser
            },
            {
                path:"/updateuser",
                name:"updateuser",
                component:UpdateUser
            },
            {
                path:"/goods",
                component:Goods
            },
            {
                path:"/savegoods",
                component:SaveGoods
            },
            {
                path:"/updategoods",
                name:"updategoods",
                component:UpdateGoods
            },
            {
                path:"/order",
                name:"order",
                component:Order
            }
        ]
    }
   
];


const router=new VueRouter({
    routes  //  routes====>  "routes":routes
});

/**
 * 当路由发生变化时 执行
 */
router.beforeEach((to, from, next) => {
    
    
    if(to.path=="/"){
        next();//直接放行
    }else{
        //获取用户登录信息
        let user=localStorage.getItem("loginuser");
        if(user){
            //登录过  直接访问 
            next();
        }else{
            //跳转到登录页面
            next("/");
        }
    }
  
})

//导出路由对象
export default router;

