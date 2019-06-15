package com.service;

import com.model.Blog;
import com.pojo.Page;

import java.util.List;

public interface BlogService {
    String add(Blog blog);
    boolean delete(String id);
    boolean update(Blog blog);

    int countByExample(Blog blog);

    Blog findById(String id);
    List<Blog> findByExample(Blog blog, Page page);
}
