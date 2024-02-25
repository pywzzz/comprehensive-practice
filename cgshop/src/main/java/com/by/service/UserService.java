package com.by.service;

import com.by.bean.PageBean;
import com.by.bean.User;

import java.util.List;
import java.util.Map;

public interface UserService {
    /**
     * 查詢用户列表
     * @param map
     * @return
     */
    PageBean query(Map map);

    /**
     * 保存用户
     * @param map
     * @return
     */
    int save(Map map);

    /**
     * 删除用户
     * @param id  用户id
     * @return  1 删除成功 0 删除失败
     */
    int delete(String id);

    /**
     * 修改用户
     * @param map
     * @return
     */
    int update(Map map);

    /**
     * 根据用户名查询用户
     * @param username
     * @return
     */
     User queryByUsername(String username);
}
