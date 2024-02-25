package com.by.service;

import com.by.bean.Goods;
import com.by.bean.PageBean;

import java.util.Map;

public interface GoodsService {
    /**
     * 保存商品
     * @param goods
     * @return  1成功 0失败
     */
    int save(Goods goods);

    /**
     * 修改商品
     * @param goods
     * @return
     */
    int update(Goods goods);

    /**
     * 分页查询商品
     * @param map
     * @return
     */
    PageBean query(Map map);


    /**
     * 删除商品
     * @param id 商品id
     * @return
     */
    int delete(String id);
}
