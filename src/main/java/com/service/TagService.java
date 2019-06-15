package com.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.model.Tag;
import com.pojo.Page;


public interface TagService {
	String add(Tag tag);
    boolean delete(String id);
    boolean update(Tag tag);

    int countByExample(Tag tag);

    Tag findById(String id);
    List<Tag> findAll(Page page);
    List<Tag> findByExample(Tag tag, Page page);

}
