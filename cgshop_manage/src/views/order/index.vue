<template>
    <div>


        <!--表格数据-->
        <el-table :data="tableData" stripe border style="width: 100%">

            <el-table-column type="expand">
                 <template slot-scope="props">
                <el-form label-position="left"  class="demo-table-expand">
                    <el-form-item label="订单号">
                        <span>{{ props.row.orderNum }}</span>
                    </el-form-item>
                    
                    <el-form-item label="应付金额">
                        <span>{{ props.row.payable }}</span>
                    </el-form-item>
                    
                    <el-form-item label="实付金额">
                        <span>{{ props.row.pay }}</span>
                    </el-form-item>

                </el-form>
                </template>
            </el-table-column>

            <el-table-column header-align="center" align="center" type="index" label="行号" width="80">
            </el-table-column>

            <el-table-column header-align="center" prop="orderNum" label="订单号">
            </el-table-column>
            <el-table-column header-align="center" width="80" prop="status" label="状态">
                <template v-slot="scope">
                    <span v-if="scope.row.status==1">待支付</span>
                    <span v-else-if="scope.row.status==2">待发货</span>
                    <span v-else-if="scope.row.status==3">已完成</span>
                </template>
            </el-table-column>

            <el-table-column header-align="center" prop="payable" label="应付金额" width="120">
            </el-table-column>
            <el-table-column header-align="center" prop="pay" label="实付金额" width="120">
            </el-table-column>
            <el-table-column header-align="center" prop="orderDate" label="订单日期" width="150">
            </el-table-column>

            <el-table-column header-align="center" prop="siteName" label="自提点" width="120">
            </el-table-column>



            <el-table-column header-align="center" align="center" width="150" label="操作">
                <template v-slot="scope">
                    <el-button type="primary" @click="ck(scope.row.id)">查看详情</el-button>
                </template>
            </el-table-column>

        </el-table>

        <!--分页-->
        <div class="page">
            <el-pagination background layout="total,sizes,prev, pager, next" :total="total" :page-size="pageSize"
                :page-sizes="[10,20,30,50,100]" @current-change="chg" @size-change="chgsize">
            </el-pagination>
        </div>


          <!--详情-->
          <OrderDetail ref="orderDetail" :dialogVisible.sync="isshowdetail"></OrderDetail>
    </div>
</template>

<script>
    //引入详情组件
    import OrderDetail from './OrderDetail.vue'
    export default {
        //函数   返回一个响应对象 
        data() {
            return {
                tableData: [],
                page: 1, //默认第1页
                pageSize: 10, //每页记录数 
                total: 0, //总记录数 
                isshowdetail:false //是否显示详情 
            }
        },
        //注册组件
        components:{
            OrderDetail
        },
        //生命周期函数
        created() {
            //在vue实例创建好后 在数据对象 方法都可用时调用 该方法 
            this.initData();
        },
        //方法
        methods: {
            
            //查看详情
            ck(id){
                this.isshowdetail=true;
                this.$refs.orderDetail.init(id);
            },
            
            //每页记录数发生改变时
            chgsize(pgsize) {
                //更改每页记录数
                this.pageSize = pgsize;
                //从每一页开始查询 
                this.page = 1;
                //重新查询 
                this.initData();
            },
            //当页数发生变化时执行
            chg(curpage) {
                //更新查询的页数
                this.page = curpage;
                //重新查询 
                this.initData();
            },
            //添加
            add() {
                this.$router.push({
                    path: "/saveuser"
                })
            },
            //初始化数据 
            initData() {
                let params = {
                    "page": this.page,
                    "pageSize": this.pageSize
                };
                this.$http.post("/v1/order/query", params)
                    .then(res => {
                        //判断接口状态码
                        if (res.code == 200) {
                            this.tableData = res.data.list;
                            this.page = res.data.page;
                            this.pageSize = res.data.pageSize;
                            this.total = res.data.total;
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
                const rs = await this.$http.get("/v1/user/delete", {
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
                    name: "updateuser",
                    params
                });
            }

        }


    }
</script>

<style scoped="scoped">
    .toolbar {
        text-align: left;
        height: 40px;
        line-height: 40px;
    }

    .toolbar a {
        color: #666;
        text-decoration: none;
    }

    .page {
        margin-top: 20px;
        text-align: right;
    }
</style>
