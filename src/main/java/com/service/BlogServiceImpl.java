package com.service;

import com.model.Blog;
import com.pojo.Page;
import org.springframework.stereotype.Service;

import java.sql.Blob;
import java.util.List;

@Service
public class BlogServiceImpl implements BlogService {
    @Override
    public String add(Blog resource) {
        return null;
    }

    @Override
    public boolean delete(String id) {
        return false;
    }

    @Override
    public boolean update(Blog resource) {
        return false;
    }

    @Override
    public int countByExample(Blog resource) {
        return 0;
    }

    @Override
    public Blog findById(String id) {
        return null;
    }

    @Override
    public List<Blog> findByExample(Blog resource, Page page) {
        return null;
    }
}
