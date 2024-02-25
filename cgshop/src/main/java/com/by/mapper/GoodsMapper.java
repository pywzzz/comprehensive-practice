package com.by.mapper;

import com.by.bean.Goods;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

@Mapper
public interface GoodsMapper {

    @Insert("insert into goods(id,name,tags,price,pid,categoryPath) values(#{id},#{name},#{tags},#{price},#{pid},#{categoryPath})")
    int save(Goods goods);

    @Update("update goods set name=#{name},tags=#{tags},price=#{price},pid=#{pid},categoryPath=#{categoryPath} where id=#{id}")
    int update(Goods goods);

    @Select("select g.id,g.name,g.tags,g.price,g.pid,g.commentTotal,g.score,g.createTime,g.updateTime,g.status,a.url from goods g left join attachment a on g.id=a.businessId and a.businessType=1 where isdel=0 order by updateTime desc limit #{begin},#{pageSize}")
    List<Map> query(Map map);

    @Select("select  count(1) from goods where isdel=0")
    long queryCount(Map map);


    @Update("update goods set isdel=1 where id=#{id}")
    int delete(String id);
}
