package com.by.service.impl;

import com.by.bean.Attachment;
import com.by.bean.Goods;
import com.by.bean.PageBean;
import com.by.bean.PageMap;
import com.by.mapper.AttachmentMapper;
import com.by.mapper.GoodsMapper;
import com.by.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
public class GoodsServiceImpl implements GoodsService {

    @Autowired
    GoodsMapper goodsMapper;

    @Autowired
    AttachmentMapper attachmentMapper;

    @Transactional//事务管理  要么全部成功 要么全部失败
    @Override
    public int save(Goods goods) {
        //生成商品id
        String id= UUID.randomUUID().toString();
        //设置商品id
        goods.setId(id);
        //保存商品
        int rs= goodsMapper.save(goods);
        if(rs>0){
            //保存附件
            Attachment attachment=new Attachment();
            attachment.setBusinessId(id);
            attachment.setBusinessType(1);
            attachment.setUrl(goods.getPicurl());
           int tmp= attachmentMapper.save(attachment);
        }
        return rs;
    }

    @Transactional
    @Override
    public int update(Goods goods) {
        //修改商品
        int rs=goodsMapper.update(goods);
        if(null!=goods.getPicurl()&&!"".equals(goods.getPicurl())){
            Attachment attachment=new Attachment();
            attachment.setBusinessId(goods.getId());
            attachment.setBusinessType(1);
            attachment.setUrl(goods.getPicurl());
            int tmp= attachmentMapper.save(attachment);
        }
        return rs;
    }

    @Override
    public PageBean query(Map map) {
        //转换为pagemap 增加分页参数信息 很重要！！！
        PageMap pageMap=new PageMap(map);
        //查询列表
        List list=goodsMapper.query(pageMap);
        //查询总记录数
        long total=goodsMapper.queryCount(pageMap);
        return new PageBean(pageMap.getPage(), pageMap.getPageSize(), total,list);
    }

    @Override
    public int delete(String id) {
        return goodsMapper.delete(id);
    }
}
