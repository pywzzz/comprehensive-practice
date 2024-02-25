<template>
    <div class="root">
        <el-form label-width="150px">
            <el-form-item label="商品名称">
                <el-input placeholder="请输入商品名称" v-model="goods.name"></el-input>
            </el-form-item>
            <el-form-item label="标签">
                <el-input placeholder="请输入标签" v-model="goods.tags"></el-input>
            </el-form-item>
            <el-form-item label="价格">
                <el-input placeholder="请输入价格" v-model="goods.price"></el-input>
            </el-form-item>

            <el-form-item label="供应商">
                <el-input placeholder="请输入供应商" v-model="goods.pid"></el-input>
            </el-form-item>

            <el-form-item label="所属类别">
                 <el-select v-model="goods.categoryPath" placeholder="请选择">
                    <el-option
                      v-for="item in categorys"
                      :key="item.id"
                      :label="item.name"
                      :value="item.id">
                    </el-option>
                  </el-select>
                  
            </el-form-item>

            <el-form-item label="图片">

                <el-upload class="avatar-uploader" action="http://localhost:8081/upload" :show-file-list="false"
                    :on-success="handleAvatarSuccess" :before-upload="beforeAvatarUpload">
                    <img v-if="imageUrl" :src="imageUrl" class="avatar">
                    <i v-else class="el-icon-plus avatar-uploader-icon"></i>
                </el-upload>

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
                goods: {
                    name: "",
                    tags: "",
                    price: 0.0,
                    pid: "",
                    categoryPath: "",
                    picurl:""
                },
                imageUrl: '',
                categorys:[]
            }
        },
        created() {
            this.queryCategory();
            this.goods=this.$route.params;
            if(this.goods.url){
                this.imageUrl=this.$host+this.goods.url;
            }
        },
        methods: {
            //查询类别
            queryCategory(){
                this.$http.get("/v1/category/query",{})
                .then(res=>{
                    if(res.code==200){
                        this.categorys=res.data;
                    }
                })
            },
            save() {
                this.$http.post("/v1/goods/update", this.goods)
                    .then(res => {
                        if (res.code == 200) {
                            this.$message({
                                message: res.msg,
                                type: 'success'
                            });
                            //跳回列表页面
                            this.$router.push("/goods")
                        }
                    })
            },
            cancel() {
                //跳回列表页面
                this.$router.push("/goods")
            },
            handleAvatarSuccess(res, file) {
                this.imageUrl = URL.createObjectURL(file.raw);
                if(res.code==200){
                    this.goods.picurl=res.data; //图片在服务器上的地址 
                }
            },
            beforeAvatarUpload(file) {
                const isJPG = file.type === 'image/jpeg';
                const isLt10M = file.size / 1024 / 1024 < 10;

                if (!isJPG) {
                    this.$message.error('上传头像图片只能是 JPG 格式!');
                }
                if (!isLt10M) {
                    this.$message.error('上传头像图片大小不能超过 10MB!');
                }
                return isJPG && isLt10M;
            }
        }
    }
</script>

<style scoped="scoped">
    .root {
        width: 60%;
        margin: 50px;
    }

    /deep/ .avatar-uploader .el-upload {
        border: 1px dashed #d9d9d9;
        border-radius: 6px;
        cursor: pointer;
        position: relative;
        overflow: hidden;
    }

    /deep/ .avatar-uploader .el-upload:hover {
        border-color: #409EFF;
    }

    /deep/ .avatar-uploader-icon {
        font-size: 28px;
        color: #8c939d;
        width: 128px;
        height: 128px;
        line-height: 128px;
        text-align: center;
    }

    /deep/ .avatar {
        width: 128px;
        height: 128px;
        display: block;
    }
</style>
