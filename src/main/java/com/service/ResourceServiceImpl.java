package com.service;

import com.model.Resource;
import com.pojo.Page;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ResourceServiceImpl implements ResourceService {

    public String add(Resource resource) {
        return null;
    }

    public boolean delete(String id) {
        return false;
    }

    public boolean update(Resource resource) {
        return false;
    }

    public int countByExample(Resource resource) {
        return 0;
    }

    public Resource findById(String id) {
        return null;
    }

    public List<Resource> findByExample(Resource resource, Page page) {
        return null;
    }
}
