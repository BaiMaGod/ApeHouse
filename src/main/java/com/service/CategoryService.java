package com.service;

import java.util.List;

import com.model.Category;
import com.pojo.Page;

public interface CategoryService {
	String add(Category category);
    boolean delete(String id);
    boolean update(Category category);

    int countByExample(Category category);

    Category findById(String id);
    List<Category> findAll(Page page);
    List<Category> findByType(String type,Page page);
    List<Category> findByExample(Category category, Page page);

}
