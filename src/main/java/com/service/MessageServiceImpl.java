package com.service;

import com.dao.MessageMapper;
import com.model.Message;
import com.model.MessageExample;
import com.pojo.Page;
import com.util.MyUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MessageServiceImpl implements MessageService {
    @Autowired
    MessageMapper messageMapper;

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
        MessageExample example = new MessageExample();
        MessageExample.Criteria criteria = example.createCriteria();

        example.setOrderByClause("createTime desc");

        if(MyUtil.notEmpty(message.getNickname())){
            criteria.andNicknameLike(message.getNickname());
        }
        if(MyUtil.notEmpty(message.getContent())){
            criteria.andContentLike(message.getContent());
        }

        if(page!=null){
            page.setTotalRows((int)messageMapper.countByExample(example));
            if(page.getCurPage()>0){
                example.setStartRow(page.getStartRow());
                example.setPageRows(page.getPageRows());
            }
        }

        return messageMapper.selectByExample(example);
    }
}
