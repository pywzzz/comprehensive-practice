package com.by.controller;

import com.by.bean.ResultBean;
import com.by.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/v1/category")
@CrossOrigin
public class CategoryController extends BaseController{

    @Autowired
    CategoryService categoryService;

    @GetMapping("/query")
    public ResultBean query(){
        List list=categoryService.queryAll();
        return success("类别列表",list);
    }
}
