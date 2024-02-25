<template>
    <div id="root">
         <div class="container">
             <div class="title">社区团购后台管理系统</div>
             <el-row>
               <el-col :span="6">用户名:</el-col>
                <el-col :span="16"><el-input v-model="user.username" placeholder="请输入用户名"></el-input></el-col>
                 <el-col :span="2">&nbsp;</el-col>
             </el-row>
             <el-row>
               <el-col :span="6">密码:</el-col>
                <el-col :span="16"><el-input v-model="user.password" type="password"  placeholder="请输入密码"></el-input></el-col>
                <el-col :span="2">&nbsp;</el-col>
             </el-row>
             
             <div class="btn" @click="login">登录</div>
         </div>
    </div>
</template>

<script>
    export default{
        data(){
            return{
                user:{
                    username:"",
                    password:""
                }
            }
        },
        methods:{
            login(){
                 this.$http.post("/v1/user/login",this.user)
                 .then(res=>{
                       if(res.code==200){
                           let user=res.data;
                           //保存登录信息
                           localStorage.setItem("loginuser",JSON.stringify(user));
                           
                         
                           
                           //跳转
                           this.$router.push("/main");
                       }else{
                           this.$message.error(res.msg);
                       }
                 })
            }
        }
    }
</script>

<style>
    #root{
        width: 100%;
        height: 100%;
        background: url(../assets/bg.jpg);
        border: #fff solid 1px;
    }
    
    .container{
        width: 500px;
        height: 350px;
        background-color: #Fff;
        margin: 150px auto;
        border-radius: 10px;
    }
    .title{
        height: 150px;
        line-height: 150px;
        text-align: center;
        font-size: 36px;
        font-weight: bold;
    }
    .btn{
        width: 200px;
        height: 30px;
        line-height: 30px;
        text-align: center;
        background-color: #f00;
        color: #fff;
        border-radius: 15px;
        margin: 50px auto;
    }
</style>
