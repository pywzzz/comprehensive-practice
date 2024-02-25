package com.by.controller;

import com.by.bean.Goods;
import com.by.bean.PageBean;
import com.by.bean.ResultBean;
import com.by.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/v1/goods")
@CrossOrigin
public class GoodsController extends BaseController {

    @Autowired
    GoodsService goodsService;

    /**
     * @RequestBody注解  可以将json格式的参数 转换成javabean
     * @param goods
     * @return
     */
    @PostMapping("/save")
    public ResultBean save(@RequestBody Goods goods){
        int rs=goodsService.save(goods);
        return rs==1?success("保存成功"):fail("保存失败");
    }

    @PostMapping("/update")
    public ResultBean update(@RequestBody Goods goods){
        int rs=goodsService.update(goods);
        return rs==1?success("修改成功"):fail("修改失败");
    }


    @PostMapping("/query")
    public ResultBean query(@RequestBody Map map){
        PageBean bean=goodsService.query(map);
        return success("商品列表",bean);
    }


    @GetMapping("/delete")
    public ResultBean delete(String id){
        int rs=goodsService.delete(id);
        return rs==1?success("删除成功"):fail("删除失败");

    }

}
