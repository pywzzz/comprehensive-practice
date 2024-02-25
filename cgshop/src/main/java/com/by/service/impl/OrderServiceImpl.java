package com.by.service.impl;

import com.by.bean.Order;
import com.by.bean.OrderDetail;
import com.by.bean.PageBean;
import com.by.bean.PageMap;
import com.by.mapper.OrderDetailMapper;
import com.by.mapper.OrderMapper;
import com.by.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    OrderMapper orderMapper;

    @Autowired
    OrderDetailMapper orderDetailMapper;

    @Transactional//事物  保证原子性  要么全部成功   要么全部失败
    @Override
    public int save(Order order) {
        order.setOrderNum("dd-2022-0001");
        //生成订单id
        String id= UUID.randomUUID().toString();
        order.setId(id);
        //保存订单
        int rs=orderMapper.save(order);
        if(rs>0){
            //保存订单明细
            for(int i=0;i<order.getOrderDetail().size();i++){
                OrderDetail orderDetail=order.getOrderDetail().get(i);
                //设置订单id
                orderDetail.setOid(id);
                //保存订单明细
                orderDetailMapper.save(orderDetail);
            }
        }
        return rs;
    }

    @Override
    public PageBean query(Map map) {
        PageMap pageMap=new PageMap(map);
        //查询列表
        List list=orderMapper.query(pageMap);
        //查询总记录数
        long total=orderMapper.queryCount(pageMap);
        return new PageBean(pageMap.getPage(),pageMap.getPageSize(),total,list);
    }


    @Override
    public Order get(String id) {
        //查询订单
        Order order=orderMapper.get(id);
        //查询订单明细
        List<OrderDetail> orderDetails=orderDetailMapper.queryByOid(id);
        order.setOrderDetail(orderDetails);
        return order;
    }
}
