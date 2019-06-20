package com.service;

import com.model.Message;
import com.pojo.Page;

import java.util.List;

public interface MessageService {

    String add(Message message);
    boolean delete(String id);
    boolean update(Message message);

    int countByExample(Message message);

    Message findById(String id);
    List<Message> findByExample(Message message, Page page);
}
