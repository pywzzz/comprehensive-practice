package com.by.service;

import com.by.bean.Order;
import com.by.bean.PageBean;

import java.util.Map;

public interface OrderService {

    /**
     * 生成订单
     * @param order
     * @return
     */
    int save(Order order);

    /**
     * 分页查询
     * @param map
     * @return
     */
    PageBean query(Map map);

    /**
     * 根据id查看详情
     * @param id
     * @return
     */
    Order get(String id);
}
