//引入网络请求库 
 import axios from 'axios'
//引入服务器地址 
import baseURL from './host.js'
import { Message } from 'element-ui';

//创建axios实例 
const instance = axios.create({
  baseURL,//当对象中的key与value一样是，可以简化
  timeout: 5000//请求服务器超时时间
});


// 添加响应拦截器
instance.interceptors.response.use(function (response) {
    // 2xx 范围内的状态码都会触发该函数。
    // 对响应数据做点什么
    //判断http状态码
    if(response.status==200){
        //将接口返回的数据包装成Promise对象返回 
        return Promise.resolve(response.data);
    }
    return null;
  }, function (error) {
    // 超出 2xx 范围的状态码都会触发该函数。
    // 对响应错误做点什么
    let res=error.response.data;
    if(res.status==500){
        showError("服务器出错");
    }else{
       showError(res.error);
    }
    
    return Promise.resolve({code:0,msg:res.error});
  });


//错误消息提示
function showError(msg){
    Message({
        message:msg,
        type:"error"
    });
}

export default {
    /**
     * 处理get请求 
     * @param {Object} url  接口的相对地址 
     * @param {Object} params  对象参数，用于在地址栏里传递的参数
     * @return   以Promise对象形式返回接口返回的数据
     */
    get:function(url,params){
       return instance.get(url,{
           params
       });
    },
    
    /**
     * 处理post请求
     * @param {Object} url  接口的相对地址 
     * @param {Object} data  传递的对象数据  form-data形式传递 
     * @return   以Promise对象形式返回接口返回的数据
     */
    post:function(url,data){
        return instance.post(url,data);
    }
    
}