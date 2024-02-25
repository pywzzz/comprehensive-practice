package com.by.mapper;

import com.by.bean.Order;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface OrderMapper {

    @Insert("insert into b_order(id,orderNum,payable,pay,mid,nickName,siteName,siteMobile,siteAddress,receiveUser,receiveMobile) values(#{id},#{orderNum},#{payable},#{pay},#{mid},#{nickName},#{siteName},#{siteMobile},#{siteAddress},#{receiveUser},#{receiveMobile})")
    int save(Order order);



    @Select("select o.id,o.orderNum,o.payable,o.pay,o.`status`,DATE_FORMAT(o.orderDate,'%Y-%m-%d %H:%i') orderDate,o.mid,o.nickName,o.siteAddress,o.siteMobile,o.siteName,o.receiveMobile,o.receiveUser from b_order o order by o.orderDate desc limit #{begin},#{pageSize}")
    List<Map>  query(Map map);

    @Select("select count(1) from b_order ")
    long queryCount(Map map);


    @Select("select o.id,o.orderNum,o.payable,o.pay,o.status,DATE_FORMAT(o.orderDate,'%Y-%m-%d %H:%i') orderDate,o.mid,o.nickName,o.siteAddress,o.siteMobile,o.siteName,o.receiveMobile,o.receiveUser from b_order o  where id=#{id}")
    Order get(String id);
}
