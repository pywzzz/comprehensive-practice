package com.by.controller;

import com.by.bean.ResultBean;

/**
 * 所有控制类的父类   要求控制类都继承该 类
 */
public abstract class BaseController {

    private final int SUCCESS=200; //代表成功的状态码
    private final int FAILE=0; //代表失败的状态码

    /**
     * 操作成功
     * @param msg  成功的描述消息
     * @return
     */
    protected ResultBean success(String msg){
        return convert(SUCCESS,msg,null);
    }

    /**
     * 操作成功
     * @param msg  描述消息
     * @param data 操作的结果数据
     * @return
     */
    protected ResultBean success(String msg,Object data){
        return convert(SUCCESS,msg,data);
    }


    /**
     * 操作失败
     * @param msg
     * @return
     */
    protected ResultBean fail(String msg){
        return convert(FAILE,msg,null);
    }

    /**
     * 将内容转换成ResultBean实例
     * @param code
     * @param msg
     * @param data
     * @return
     */
    ResultBean convert(int code,String msg,Object data){
        return new ResultBean(code,msg,data);
    }
}
