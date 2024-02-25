<template>
    <div>
        <div>自提点：郑州市高新区...</div>
        <div>张三 1585522</div>
        
        <template v-for="goods in goodslist" >
            <div class="goodsitem" :key="goods.id">
                <img  :src="$host+goods.url" class="goodsimg"/>
                <!--內容-->
                <div class="content">
                    <!--商品名稱-->
                    <div class="goodsname">
                        {{goods.name}}
                    </div>
                    
                    <div class="buy">
                        <span class="price"><sub style="font-size: 0.24rem;">￥</sub>{{goods.price}}</span>
                        <span >
                            <span class="jian" @click="jian(goods)">-</span>
                            <span class="gnum">{{goods.num}}</span>
                            <span class="jia" @click="sum(goods)">+</span>
                        </span>
                    </div>
                </div>
            </div>
        </template>
        <div>
            总价格:{{total}}
        </div>
        
        <div class="btn" @click="toorder">立即下单</div>
    </div>
</template>

<script>
    export default{
        data(){
            return{
                goodslist:[]
            }
        },
        computed:{
            total:function(){
                let money=0;
                this.goodslist.forEach(el=>{
                    money+=parseInt(el.num)*parseFloat(el.price);
                })
                return money;
            }
        },
        created() {
            //取缓存 
            let carlist=localStorage.getItem("carlist");
            if(carlist){
                this.goodslist=JSON.parse(carlist);
            }
        },
        methods:{
            toorder(){
                let order={
                    "mid":"1",
                    "nickName":"张三",
                    "siteName":"阿五遍历店",
                    "siteMobile":"152552322",
                    "siteAddress":"郑州市高新区",
                    "reciveUser":"莉莉",
                    "reciveMobile":"1365555"
                };
                order.payable=this.total;
                order.pay=this.total;
                let od=[];
                this.goodslist.forEach(el=>{
                    let tmp={};
                    tmp.gid=el.id;
                    tmp.goodsname=el.name;
                    tmp.price=el.price;
                    tmp.num=el.num;
                    od.push(tmp);
                })
                order.orderDetail=od;
               
               //保存
               this.$http.post("/v1/order/save",order)
               .then(res=>{
                   if(res.code==200){
                       console.log("下单成功")
                   }
               })
            }
        }
    }
</script>

<style scoped="scoped">
    .goodsimg{
        width: 1.8rem;
        height: 1.8rem;
        margin-top: 0.2rem;
        float: left;
    }
    
    .jian{
        border: #f00 solid 1px;
        width: 0.3rem;
        height: 0.3rem;
        display: inline-block;
        text-align: center;
        line-height: 0.3rem;
        color: #f00;
    }
    .gnum{
        display: inline-block;
        width: 0.6rem;
        text-align: center;
    }
    .jia{
        background-color: #FF0000;
        color: #fff;
        width: 0.3rem;
        height: 0.3rem;
        display: inline-block;
        text-align: center;
        line-height: 0.3rem;
        margin-right: 0.1rem;
    }
    
    .goodsitem{
        width: 7.1rem;
        height: 2.2rem;
        border-style: none;
        border-bottom: #ccc dashed 1px;
        background-color: #fff;
    }
    
    .caritem{
        width: 7.1rem;
        height: 2.2rem;
        border-style: none;
        border-bottom: #ccc dashed 1px;
        display: flex;
        align-items: center;
    }
    
    .goodsimg{
        width: 1.8rem;
        height: 1.8rem;
        margin-top: 0.2rem;
        float: left;
    }
    
    .carimg{
        width: 1.2rem;
        height: 1.2rem;
        margin-top: 0.2rem;
        float: left;
    }
    .content{
        width: 5.1rem;
        height: 1.8rem;
        margin-top: 0.2rem;
        margin-left: 0.15rem;
        float: left;
    }
    
    .goodsname{
        height: 0.8rem;
        line-height: 0.8rem;
        font-weight: bold;
    }
    .tags{
        height: 0.5rem;
        line-height: 0.5rem;
    }
    .tag{
        background-color: #FF0000;
        color: #fff;
        margin-left: 0.1rem;
        font-size: 0.18rem;
        padding: 0.03rem 0.06rem;
        border-radius: 0.1rem;
    }
    .buy{
        height: 0.5rem;
        line-height: 0.5rem;
        display: flex;
        justify-content: space-between;
    }
    
    .price{
        color: #FF0000;
        font-size: 0.32rem;
    }
    
    .car{
        background-color: #f00;
        color: #fff;
        padding: 0 0.1rem;
        font-size: 0.24rem;
        border-radius: 0.25rem;
        margin-right: 0.1rem;
    }
    
    .btn{
        width: 6rem;
        height: 0.8rem;
        line-height: 0.8rem;
        text-align: center;
        color: #fff;
        background-color: #f00;
        margin: 1rem auto;
        border-radius:0.35rem;
    }
</style>
