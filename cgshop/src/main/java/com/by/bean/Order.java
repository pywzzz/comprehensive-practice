package com.by.bean;

import lombok.Data;

import java.util.List;

@Data
public class Order {
    String id;
    String orderNum;
    double payable;
    double pay;
    int status;
    String mid;
    String nickName;
    String siteName;
    String siteMobile;
    String siteAddress;
    double longitude;
    double latitude;
    String receiveUser;
    String receiveMobile;
    List<OrderDetail> orderDetail;
}
