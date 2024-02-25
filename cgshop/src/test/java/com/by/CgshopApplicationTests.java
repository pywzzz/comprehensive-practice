package com.by;

import com.by.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.junit.jupiter.api.*;

import java.util.HashMap;
import java.util.Map;

@SpringBootTest
class CgshopApplicationTests {

    @Autowired //按类型自动注入
    UserMapper userMapper;

    @Test
   public void query(){
        Map map=userMapper.getUserById("e394e636-6c97-11ed-b841-b888e3dd6e82");
        System.out.println("------");

   }

   @Test
   public void save(){
        Map map=new HashMap();
        map.put("username","test");
        map.put("password","123456");
        map.put("name","测试");
        int rs=userMapper.saveUser(map);
       System.out.println(rs);
   }

}
