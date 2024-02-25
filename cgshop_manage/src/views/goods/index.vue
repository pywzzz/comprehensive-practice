<template>
    <div>

        <!--工具条-->
        <div class="toolbar">
            <el-button type="primary" size="small" @click="add">添加商品</el-button>
        </div>

        <!--表格数据-->
        <el-table :data="tableData" stripe border style="width: 100%">

            <el-table-column header-align="center" align="center" type="index" label="行号" width="80">
            </el-table-column>
            
            <el-table-column header-align="center"  width="100" label="图片">
                <template v-slot="{row}">
                    <img :src="$host+row.url" v-if="row.url" class="goodsimg">
                    <span v-else>无</span>
                </template>
            </el-table-column>

            <el-table-column header-align="center" prop="name" label="名称">
            </el-table-column>
            <el-table-column header-align="center" prop="tags" label="标签" width="120">
            </el-table-column>
            <el-table-column header-align="center" width="100" prop="price" label="价格">
            </el-table-column>
            <el-table-column header-align="center" width="100" prop="commentTotal" label="评论数量">
            </el-table-column>
            <el-table-column header-align="center" width="100" prop="score" label="评分">
            </el-table-column>
            <el-table-column header-align="center" width="80" prop="status" label="状态">
                <template v-slot="scope">
                    <span v-if="scope.row.status==1">未上架</span>
                    <span v-else-if="scope.row.status==2">已上架</span>
                    <span v-else-if="scope.row.status==3">已下架</span>
                </template>
            </el-table-column>
            <el-table-column header-align="center" align="center" width="150" label="操作">
                <template v-slot="scope">
                    <el-button type="primary" icon="el-icon-edit" circle @click="edit(scope.row)"></el-button>
                    <el-button type="danger" icon="el-icon-delete" circle @click="del(scope.row.id)"></el-button>
                </template>
            </el-table-column>

        </el-table>
        
        <!--分页-->
       <div class="page">
           <el-pagination
             background
             layout="total,sizes,prev, pager, next"
             :total="total"
             :page-size="pageSize"
             :page-sizes="[10,20,30,50,100]"
             @current-change="chg"
             @size-change="chgsize"
             >
           </el-pagination>
       </div>

    </div>
</template>

<script>
    export default {
        //函数   返回一个响应对象 
        data() {
            return {
                tableData: [],
                page:1,//默认第1页
                pageSize:10, //每页记录数 
                total:0//总记录数 
            }
        },
        //生命周期函数
        created() {
            //在vue实例创建好后 在数据对象 方法都可用时调用 该方法 
            this.initData();
        },
        //方法
        methods: {
            //每页记录数发生改变时
            chgsize(pgsize){
                //更改每页记录数
                this.pageSize=pgsize;
                //从每一页开始查询 
                this.page=1;
                //重新查询 
                this.initData();
            },
            //当页数发生变化时执行
            chg(curpage){
                //更新查询的页数
                this.page=curpage;
                //重新查询 
                this.initData();
            },
            //添加
            add() {
                this.$router.push({
                    path: "/savegoods"
                })
            },
            //初始化数据 
            initData() {
                let params={
                    "page":this.page,
                    "pageSize":this.pageSize
                };
                this.$http.post("/v1/goods/query",params)
                    .then(res => {
                        //判断接口状态码
                        if (res.code == 200) {
                            this.tableData = res.data.list;
                            this.page=res.data.page;
                            this.pageSize=res.data.pageSize;
                            this.total=res.data.total;
                        }
                    })
            },

            //删除
            del(id) {
                this.$confirm('您确定要删除吗?', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    //执行删除操作
                    this.todel(id)
                }).catch(() => {
                    //取消了什么都不做   
                });
            },
            async todel(id) {
                //等待异步结果  只有服务器返回结果后 程序才会继续执行 
                const rs = await this.$http.get("/v1/goods/delete", {
                    id
                });

                if (rs.code == 200) {
                    this.$message({
                        message: rs.msg,
                        type: 'success'
                    });
                    //重新查询数据 
                    this.initData()
                }

            },

            //编辑用户
            edit(params) {
                this.$router.push({
                    name: "updategoods",
                    params
                });
            }

        }


    }
</script>

<style scoped="scoped">
    .goodsimg{
        width: 60px;
        height: 60px;
    }
    .toolbar {
        text-align: left;
        height: 40px;
        line-height: 40px;
    }

    .toolbar a {
        color: #666;
        text-decoration: none;
    }
    .page{
        margin-top: 20px;
        text-align: right;
    }
</style>
