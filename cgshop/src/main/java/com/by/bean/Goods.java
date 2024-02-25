package com.by.bean;

import lombok.Data;

@Data  //生成get/set方法
public class Goods {

    String id;
    String name;
    String tags;
    double price;
    String pid;
    String categoryPath;
    String picurl;
}
