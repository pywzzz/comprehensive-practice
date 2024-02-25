package com.by.mapper;

import com.by.bean.OrderDetail;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface OrderDetailMapper {

    @Insert("insert into b_orderdetail(id,gid,goodsname,price,num,oid)  values(uuid(),#{gid},#{goodsname},#{price},#{num},#{oid})")
    int save(OrderDetail orderDetail);


    @Select("select id,gid,goodsname,price,num,oid from b_orderdetail where oid=#{id}")
    List<OrderDetail>  queryByOid(String id);
}
