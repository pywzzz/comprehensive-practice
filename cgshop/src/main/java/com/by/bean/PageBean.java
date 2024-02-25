package com.by.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 封装分页查询的结果
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PageBean {
    int page; //第几页的数据
    int pageSize; //每页记录数
    long total; //总记录数
    List list; //分页结果
}
