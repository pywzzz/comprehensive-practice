<template>
    <div class="root">
        <!--第一行  头部 -->
        <el-row>
            <el-col :span="24" :class="['header']">
                   <el-button type="primary" @click="logout">退出</el-button>
            </el-col>
        </el-row>
        
        <!--第二行 -->
        <el-row :style="{height:'87%'}">
            <!--第一列 左侧导航 -->
            <el-col :span="4" :class="['left']">
                
               
               <el-menu
                     default-active="2"
                     class="el-menu-vertical-demo"
                     background-color="#545c64"
                     text-color="#fff"
                     active-text-color="#ffd04b"
                     :class="['leftmenu']"
                     >
                     
                     
                     <!--订单管理-->
                     <el-submenu index="3">
                       <template slot="title">
                         <i class="el-icon-s-grid"></i>
                         <span>订单管理</span>
                       </template>
                       
                       <el-menu-item index="3-1">
                           <router-link to="/order">订单列表</router-link>
                       </el-menu-item>
                     </el-submenu>
                     
                     
                     <!--商品管理-->
                     
                     <el-submenu index="2">
                       <template slot="title">
                         <i class="el-icon-s-data"></i>
                         <span>商品管理</span>
                       </template>
                       
                       <el-menu-item index="2-1">
                           <router-link to="/goods">商品列表</router-link>
                       </el-menu-item>
                     </el-submenu>
                     
                     <!--系统管理-->
                     <el-submenu index="1">
                       <template slot="title">
                         <i class="el-icon-location"></i>
                         <span>系统管理</span>
                       </template>
                       
                       <el-menu-item index="1-1">
                           <router-link to="/user">用户管理</router-link>
                       </el-menu-item>
                     </el-submenu>
                     
                     
                     
                     
                     
                   </el-menu>
               
               
                
            </el-col>
            <!--第二列 工作区-->
             <el-col :span="20" class="workspace">
                 <!--嵌套路由-->
                 <router-view></router-view>
             </el-col>
        </el-row>
    </div>
</template>

<script>
    
    export default{
        methods:{
            logout(){
                //退出
              localStorage.removeItem("loginuser");
              //跳转登录页面
              this.$router.push("/")
            }
        }
    }
</script>
<!-- scoped="scoped"  标识 了 这里定义的样式 只适用于当前组件 -->
<style scoped="scoped">
    .root{
        height: 100%;
    }
    .header{
        background-color: rgb(84, 92, 100);
        height: 80px;
        text-align: right;
        line-height: 80px;

    }
    .left{
         background-color: rgb(84, 92, 100);
         height: 100%;
    }
    a{
        color: #fff;
        text-decoration: none;
    }
    .leftmenu{
        text-align: left;
    }
    .workspace{
        height: 100%;
        border: #fff solid 15px;
    }
</style>
