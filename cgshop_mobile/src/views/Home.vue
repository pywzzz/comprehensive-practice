<template>
    <div class="root">
        
        <!--商品項-->
        <template v-for="goods in goodslist" >
            <div class="goodsitem" :key="goods.id">
                <img  :src="$host+goods.url" class="goodsimg"/>
                <!--內容-->
                <div class="content">
                    <!--商品名稱-->
                    <div class="goodsname">
                        {{goods.name}}
                    </div>
                    <div class="tags">
                        <span class="tag">{{goods.tags}}</span>
                    </div>
                    
                    <div class="buy">
                        <span class="price"><sub style="font-size: 0.24rem;">￥</sub>{{goods.price}}</span>
                        <span v-if="goods.buy">
                            <span class="jian" @click="jian(goods)">-</span>
                            <span class="gnum">{{goods.buy}}</span>
                            <span class="jia" @click="sum(goods)">+</span>
                        </span>
                         <span v-else  class="car" @click="tocar(goods)">加入购物车</span>
                    </div>
                </div>
            </div>
        </template>
        
        
        <!--底部按钮-->
        <div class="btm">
            <div class="btm_car" @click="ck">
                <img src="../static/images/cart.png" class="cart" />
                <div>购物车</div>
                <span class="num" v-if="total>0">{{total}}</span>
            </div>
            <div class="btm_tip" @click="toorder">
                <div class="tip1">
                    先用后付,0元下单
                </div>
                <div class="tip2">
                    确认提货后付款￥{{money}}
                </div>
            </div>
        </div>
        
        
        <!--购物车列表-->
        <div class="carbg" :class="{hid:!isshow}"></div>
        <div class="carinfo" :class="{hid:!isshow}">
              <!--第一行-->
              <div class="header">
                  <div>
                      <img class="sel" src="../static/images/sel.png" />
                      <span>全选</span>
                  </div>
                  <div style="text-align: center;">
                      <span style="display:block;">购物车</span>
                      <span style="font-size: 0.18rem;color: #999;">售后无忧</span>
                  </div>
                  <img class="close" src="../static/images/close.png" @click="isshow=false"/>
              </div>
              
              <!--购物车列表-->
              <template v-for="goods in shoplist" >
                  <div class="caritem" :key="goods.id">
                      
                      <!--单选-->
                      <img src="../static/images/sel.png" class="sel" >
                      
                      <img  :src="$host+goods.url" class="carimg"/>
                      <!--內容-->
                      <div class="content">
                          <!--商品名稱-->
                          <div class="goodsname">
                              {{goods.name}}
                          </div>
                          
                          <div class="buy">
                              <span class="price"><sub style="font-size: 0.24rem;">￥</sub>{{goods.price}}</span>
                              <span>
                                  <span class="jian" @click="diff(goods)">-</span>
                                  <span class="gnum">{{goods.num}}</span>
                                  <span class="jia" @click="he(goods)">+</span>
                              </span>
                          </div>
                      </div>
                  </div>
              </template>
           <div style="height: 0.5rem;"></div>
        </div>
        
    </div>
</template>

<script>
    export default{
         data(){
             return{
                 goodslist:[],
                 total:0, //购物车商品总数量 
                 money:0,  //默认总价格 
                 shoplist:[],
                 isshow:false //是否显示购物列表
             }
         },
         created() {
             this.query();
             this.cal();
         },
         methods:{
             toorder(){
                 this.$router.push("/order");
             },
             diff(goods){
                 if(goods.num>1){
                       goods.num--;
                       this.cal();
                       //更新缓存
                       localStorage.setItem("carlist",JSON.stringify(this.shoplist))
                 }
                
             },
             he(goods){
                 goods.num++;
                 this.cal();
                 //更新缓存 
                 localStorage.setItem("carlist",JSON.stringify(this.shoplist))
             },
             //计算购物车商品数量 
             cal(){
                 let carlist=localStorage.getItem("carlist");
                 let count=0;//商品数量 
                 let money=0;//默认总价格
                 if(carlist){
                     //转换成json对象
                     carlist=JSON.parse(carlist);
                     for(let i=0;i<carlist.length;i++){
                         let tmp=carlist[i];
                         count+=parseInt(tmp.num);
                         money+=parseInt(tmp.num)*parseFloat(tmp.price);
                     }
                 }
                 //更新购物车数量 
                 this.total=count;
                 this.money=money;
             },
             //查看购物车
             ck(){
                 let carlist=localStorage.getItem("carlist");
                 if(carlist){
                     //转换成json对象
                     carlist=JSON.parse(carlist);
                     this.shoplist=carlist;
                     console.log(this.shoplist)
                     this.isshow=true;
                 }
             },
             
             sum(goods){
                 //取本地缓存购物车信息
                 let carlist=localStorage.getItem("carlist");
                 if(carlist){
                     //本地存储着购物信息
                     carlist=JSON.parse(carlist);
                     //遍历购物车列表
                     for(let i=0;i<carlist.length;i++){
                         let tmp=carlist[i];
                         if(tmp.id==goods.id){
                             //修改商品数量 
                             tmp.num=parseInt(tmp.num)+1;
                             //更新商品buy
                             goods.buy=parseInt(tmp.num);
                             break;//终止循环
                         }
                     }
                     
                     localStorage.setItem("carlist",JSON.stringify(carlist))
                     this.cal();
                 }
             },
             
             jian(goods){
                 //取本地缓存购物车信息
                 let carlist=localStorage.getItem("carlist");
                 if(carlist){
                     //本地存储着购物信息
                     carlist=JSON.parse(carlist);
                     //遍历购物车列表
                     for(let i=0;i<carlist.length;i++){
                         let tmp=carlist[i];
                         if(tmp.id==goods.id){
                             let num=parseInt(tmp.num);
                             if(num>1){
                                //修改商品数量
                                tmp.num=num-1;
                                //更新商品buy
                                goods.buy=tmp.num; 
                             }
                             break;//终止循环
                         }
                     }
                      localStorage.setItem("carlist",JSON.stringify(carlist))
                      this.cal();
                 }
             },
             
             
             //加入购物车
             tocar(goods){
                 //1. 取本地缓存购物车信息 
                 let carlist=localStorage.getItem("carlist");
                 if(carlist){
                     //本地存储着购物信息
                     carlist=JSON.parse(carlist);
                     
                 }else{
                    
                     carlist=[]; //将carlist声明为数组类型 
                    
                 }
                 
                 //本地没有 第一购物
                 let tmp={};
                 tmp.id=goods.id;
                 tmp.url=goods.url;
                 tmp.name=goods.name;
                 tmp.price=goods.price;
                 tmp.num=1;
                 goods.buy=1;
                 //加入数据
                 carlist.push(tmp);
                
                
                 
                 //存储到本地缓存  
                 localStorage.setItem("carlist",JSON.stringify(carlist))
                 //更新购物车数量 
                 this.cal()
             },
             query(){
                 this.$http.post("/v1/goods/query",{})
                 .then(res=>{
                     if(res.code==200){
                         let goodslist=res.data.list;
                         goodslist.forEach(el=>{
                             el.buy=0;
                         });
                         
                         //取购物信息
                         let carlist=localStorage.getItem("carlist");
                         if(carlist){
                             carlist=JSON.parse(carlist);
                             //遍历
                             for(let i=0;i<carlist.length;i++){
                                 let tmp=carlist[i];
                                 //在商品列表中查询已购买的商品
                                 for(let j=0;j<goodslist.length;j++){
                                     let goods=goodslist[j];
                                     if(tmp.id==goods.id){
                                         goods.buy=tmp.num;
                                     }
                                 }
                             }
                         }
                         this.goodslist=goodslist;
                     }
                 })
             }
         }
    }
</script>

<style scoped="scoped">
    .root{
        width: 7.1rem;
        height: 100%;
        background-color: #fff;
        margin: auto;
    }
    
    .goodsitem{
        width: 7.1rem;
        height: 2.2rem;
        border-style: none;
        border-bottom: #ccc dashed 1px;
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
    
    
    .btm{
        width: 7.1rem;
        height: 1rem;
        position: fixed;
        left: 0.2rem;
        bottom: 0;
        border-top: #F1F1F1 solid 1px;
        display: flex;
    }
    .btm_car{
        background-color: #fff;
        width: 1.5rem;
        height: 1rem;
        display: flex;
        justify-content: center;
        flex-direction: column;
        align-items: center;
        color: #555;
        font-size: 0.24rem;
    }
    
    .num{
        background-color: #FF0000;
        color: #fff;
        width: 0.3rem;
        height: 0.3rem;
        text-align: center;
        line-height: 0.3rem;
        border-radius: 50%;
        position: relative;
        top: -0.8rem;
        left: 0.2rem;
    }
    
    .btm_tip{
        background-color: #FF0000;
        color: #fff;
        width:6.6rem ;
        height: 1rem;
        text-align: center;
    }
    .tip1{
        height: 0.5rem;
        line-height: 0.5rem;
    }
    .tip2{
        height: 0.3rem;
        line-height: 0.3rem;
        font-size: 0.22rem;
        color: #ccc;
    }
    
    
    .cart{
        width: 0.5rem;
        height: 0.5rem;
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
    
    .carbg{
        width: 7.5rem;
        height: 100%;
        background: rgba(0,0,0,0.7);
        position: fixed;
        left: 0;
        bottom: 1.01rem;
    }
    
    .carinfo{
        width: 7.5rem;
        background-color: #fff;
        position: fixed;
        left: 0;
        bottom: 1.01rem;
        border-top-left-radius: 0.2rem;
        border-top-right-radius: 0.2rem;
    }
    
    .header{
          width: 7.5rem;
          height: 1rem;
          display: flex;
          justify-content:space-between;
          align-items: center;
    }
    
    .sel{
        width: 0.3rem;
        height: 0.3rem;
        margin-left: 0.2rem;
        margin-right: 0.2rem;
        vertical-align: middle;
    }
    .close{
        width: 0.4rem;
        height: 0.4rem;
        margin-right: 0.2rem;
    }
    
    .hid{
        display: none;
    }
</style>
