package com.service;

import com.model.Blog;
import com.pojo.Page;

import java.util.List;

public interface BlogService {
    String add(Blog resource);
    boolean delete(String id);
    boolean update(Blog resource);

    int countByExample(Blog resource);

    Blog findById(String id);
    List<Blog> findByExample(Blog resource, Page page);
}
