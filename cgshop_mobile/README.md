# 社区团购移动端

## 创建工程

SAP  单页应用 

~~~shell
 npm install vue
 vue create  cgshop_mobile
 cd cgshop_manage
 npm run dev  
~~~

## 安装路由

~~~shell
npm i vue-router@3.6.5
~~~



## 750稿



~~~javascript
(function(doc, win) {
    var docEl = doc.documentElement,
        resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
        recalc = function() {
            var clientWidth = docEl.clientWidth;
            if (!clientWidth) return;
            if (clientWidth >= 750) {
                docEl.style.fontSize = '100px';
            } else {
                docEl.style.fontSize = 100 * (clientWidth / 750) + 'px';
            }
        };

    if (!doc.addEventListener) return;
    win.addEventListener(resizeEvt, recalc, false);
    doc.addEventListener('DOMContentLoaded', recalc, false);
})(document, window);
~~~



## 购物车



存的信息：  图片  id  商品名称  价格  数量  

相关方法：

* setItem(keyName, keyValue);  存到本地 
* storage.getItem(keyName);  取本地数据  

加入购物车：

如果购物车中有该 商品，直接修改数量 ，没有则加入 

* JSON.parse()  将字符串转换为json对象 
* JSON.stringify() 将json对象转换成字符串 









