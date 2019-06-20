package com.service;

import com.model.Message;
import com.pojo.Page;
import com.util.MyUtil;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MessageServiceImpl implements MessageService {
    @Override
    public String add(Message message) {
        String id  = MyUtil.getLongId();

        message.setId(id);
        message.setCreateTime(MyUtil.nowDate());

        return null;
    }

    @Override
    public boolean delete(String id) {
        return false;
    }

    @Override
    public boolean update(Message message) {
        return false;
    }

    @Override
    public int countByExample(Message message) {
        return 0;
    }

    @Override
    public Message findById(String id) {
        return null;
    }

    @Override
    public List<Message> findByExample(Message message, Page page) {
        return null;
    }
}
