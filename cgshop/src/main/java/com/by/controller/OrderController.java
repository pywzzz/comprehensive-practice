package com.by.controller;

import com.by.bean.Order;
import com.by.bean.PageBean;
import com.by.bean.ResultBean;
import com.by.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/v1/order")
@CrossOrigin
public class OrderController extends BaseController{

    @Autowired
    OrderService orderService;

    @PostMapping("/save")
    public ResultBean save(@RequestBody Order order){
        int rs=orderService.save(order);
        return rs==1?success("下单成功"):fail("下单失败");
    }

    @PostMapping("/query")
    public ResultBean query(@RequestBody Map map){
        PageBean bean=orderService.query(map);
        return success("订单列表",bean);
    }


    @GetMapping("/get")
    public ResultBean get(String id){
        Order order=orderService.get(id);
        return success("订单详情",order);
    }
}
