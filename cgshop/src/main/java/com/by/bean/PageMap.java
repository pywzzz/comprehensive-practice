package com.by.bean;

import lombok.Data;

import java.util.HashMap;
import java.util.Map;

/**
 * 用来处理用户分页参数
 */
@Data
public class PageMap extends HashMap {
    int page=1; //默认显示第1页数据
    int pageSize=10; //默认一页显示10条记录
    int begin=0;//默认从0条记录开始查询

    public PageMap(Map map){
        super();

        if(null!=map){
            //判断用户是否传递page参数
            if(map.containsKey("page")){
                page=Integer.parseInt(map.get("page").toString());
            }
            if(map.containsKey("pageSize")){
                pageSize=Integer.parseInt(map.get("pageSize").toString());
            }

            //将map添加到当前map中
            putAll(map);
        }
        begin=(page-1)*pageSize;
        //添加值
        put("page",page);
        put("pageSize",pageSize);
        put("begin",begin);

    }

}
