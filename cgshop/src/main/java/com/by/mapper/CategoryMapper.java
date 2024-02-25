package com.by.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface CategoryMapper {

    @Select("select id,name from category where parentId=\"0\"")
    List<Map>  queryAll();
}
