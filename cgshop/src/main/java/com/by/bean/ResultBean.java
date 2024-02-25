package com.by.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 处理用户统一返回结果  
 */
@Data //生成Java类成员变量的get/set方法
@AllArgsConstructor //生成一个构造函数 包含所有参数
@NoArgsConstructor //生成一个无参的构造函数
public class ResultBean {

    int code; //请求结果码
    String msg;//请求消息描述
    Object data;//结果


}
