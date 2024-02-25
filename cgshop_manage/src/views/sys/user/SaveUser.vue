<template>
    <div class="root">
        <el-form label-width="150px">
            <el-form-item label="用户名">
                <el-input placeholder="请输入用户名" v-model="user.username"></el-input>
            </el-form-item>
            <el-form-item label="密码">
                <el-input type="password" placeholder="请输入密码" v-model="user.password"></el-input>
            </el-form-item>
            <el-form-item label="姓名">
                <el-input placeholder="请输入姓名" v-model="user.name"></el-input>
            </el-form-item>
            <el-form-item label="邮箱">
                <el-input placeholder="请输入邮箱" v-model="user.email"></el-input>
            </el-form-item>
            <el-form-item label="性别">
                <el-radio v-model="user.gender" :label="1">男</el-radio>
                <el-radio v-model="user.gender" :label="2">女</el-radio>
                <el-radio v-model="user.gender" :label="0">未知</el-radio>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="save">保存</el-button>
                <el-button type="info" @click="cancel">取消</el-button>
            </el-form-item>

        </el-form>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                user: {
                    username: "",
                    password: "",
                    name: "",
                    gender: 0,
                    email: ""
                }
            }
        },
        methods: {
            save() {
                this.$http.post("/v1/user/save", this.user)
                    .then(res => {
                        if (res.code == 200) {
                            this.$message({
                                message: res.msg,
                                type: 'success'
                            });
                            //跳回列表页面
                            this.$router.push("/user")
                        }
                    })
            },
            cancel(){
                //跳回列表页面
                this.$router.push("/user")
            }
        }
    }
</script>

<style scoped="scoped">
    .root {
        width: 60%;
        margin: 50px;
    }
</style>
