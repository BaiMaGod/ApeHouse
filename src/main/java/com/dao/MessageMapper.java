package com.dao;

import com.model.Message;
import com.model.MessageExample;
import java.util.List;

public interface MessageMapper {
    long countByExample(MessageExample example);

    int deleteByPrimaryKey(String id);

    int insert(Message record);

    int insertSelective(Message record);

    List<Message> selectByExample(MessageExample example);

    Message selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Message record);

    int updateByPrimaryKey(Message record);
}