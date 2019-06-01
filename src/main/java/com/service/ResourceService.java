package com.service;

import com.model.Resource;
import com.pojo.Page;

import java.util.List;

public interface ResourceService {
    String add(Resource resource);
    boolean delete(String id);
    boolean update(Resource resource);

    int countByExample(Resource resource);

    Resource findById(String id);
    List<Resource> findByExample(Resource resource, Page page);
}
