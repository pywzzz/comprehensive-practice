package com.by.mapper;

import com.by.bean.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

@Mapper  //向容器注入一个该类的实例  以便其它地方使用时可以注入
public interface UserMapper {

    @Select("select * from user where id=#{id}")
    public Map getUserById(String id);


    /**
     * 查询所有未删除的字段
     * @return
     */
    @Select("select * from user  where isdel=0 order by updateTime desc  limit #{begin},#{pageSize} ")
    public List<Map> query(Map map);

    /**
     * 统计总记录数
     * @param map
     * @return
     */
    @Select("select count(1) from user where isdel=0  ")
    long queryCount(Map map);

    /**
     * 保存用户
     * @param map
     * @return 代表影响的行数  1 代表成功 0 代表失败
     */
    @Insert("insert into user(id,username,password,name,gender,email) values(uuid(),#{username},#{password},#{name},#{gender},#{email})")
    public int saveUser(Map map);

    @Update("update user set isdel=1 where id=#{id}")
    int deleteUser(String id);


    @Update("update user set name=#{name},gender=#{gender},mobile=#{mobile},email=#{email},updateTime=now() where id=#{id}")
    int updateUser(Map map);


   @Select("select id,username,password,name,gender,mobile,roleId,status from user where isdel=0 and username like #{username}")
    User queryByUsername(String username);
}
