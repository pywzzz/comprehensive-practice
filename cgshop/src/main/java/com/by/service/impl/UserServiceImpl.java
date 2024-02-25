package com.by.service.impl;

import com.by.bean.PageBean;
import com.by.bean.PageMap;
import com.by.bean.User;
import com.by.mapper.UserMapper;
import com.by.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service//向容器注入该类实例
public class UserServiceImpl implements UserService {

    @Autowired
    UserMapper userMapper;

    @Override
    public PageBean query(Map map) {
        PageMap pageMap=new PageMap(map);
        //查出第page页的记录
        List list=userMapper.query(pageMap);
        //查询总页数
       long total=userMapper.queryCount(pageMap);
        return new PageBean(pageMap.getPage(),pageMap.getPageSize(),total,list);
    }


    @Override
    public int save(Map map) {
        return userMapper.saveUser(map);
    }

    @Override
    public int delete(String id) {
        return userMapper.deleteUser(id);
    }

    @Override
    public int update(Map map) {
        return userMapper.updateUser(map);
    }


    @Override
    public User queryByUsername(String username) {
        return userMapper.queryByUsername(username);
    }
}
