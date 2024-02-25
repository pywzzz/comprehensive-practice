package com.by.service.impl;

import com.by.mapper.CategoryMapper;
import com.by.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    CategoryMapper categoryMapper;

    @Override
    public List queryAll() {
        return categoryMapper.queryAll();
    }
}
