<template>
    <el-dialog title="订单详情" :visible.sync="dialogVisible" @close="close">

        <!--订单信息-->
        <el-row>
            <el-col :span="12">
                订单号: {{order.orderNum}}
            </el-col>
            <el-col :span="12">
                订单状态: 
                <span v-if="order.status==1">待支付 </span>
                  <span v-else-if="order.status==2">待发货 </span>
            </el-col>
        </el-row>

        <el-row>
            <el-col :span="12">
                应付金额: ￥{{order.payable}}
            </el-col>
            <el-col :span="12">
                实付金额: ￥{{order.pay}}
            </el-col>
        </el-row>


        <!--订单明细-->
        <el-table :data="order.orderDetail" style="width: 100%">
            <el-table-column prop="goodsname" label="商品名称" width="180">
            </el-table-column>
            <el-table-column prop="price" label="价格" width="180">
            </el-table-column>
            <el-table-column prop="num" label="数量">
            </el-table-column>
        </el-table>

    </el-dialog>
</template>

<script>
    export default {
        data() {
            return {
                order:{}
            };
        },
        props: {
            dialogVisible: {
                type: Boolean,
                default: false
            }
        },
        methods: {
            init(id){
                this.$http.get("/v1/order/get",{id})
                .then(res=>{
                    if(res.code==200){
                        this.order=res.data;
                    }
                })
                
            },
            close() {
                this.$emit("update:dialogVisible", false);
            }
        },
    }
</script>

<style scoped="scoped">
    .el-row {
        margin-bottom: 20px;

        &:last-child {
            margin-bottom: 0;
        }
    }

    .el-col {
        border-radius: 4px;
    }
</style>
