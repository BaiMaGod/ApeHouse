package com.service;


import com.dao.LogMapper;
import com.model.Log;
import com.model.LogExample;
import com.pojo.Page;
import com.util.MyUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class LogServiceImpl implements LogService {
    @Autowired
    LogMapper logMapper;

    @Override
    public String add(Log log) {
        String id = MyUtil.getLongId();

        log.setId(id);
        log.setCreateTime(MyUtil.nowDate());


        return logMapper.insertSelective(log)>0 ? id : null;
    }

    @Override
    public boolean delete(String id) {
        return logMapper.deleteByPrimaryKey(id)>0;
    }

    @Override
    public boolean update(Log log) {
        return logMapper.updateByPrimaryKeySelective(log)>0;
    }

    @Override
    public int countByExample(Log log) {

        return 0;
    }

    @Override
    public Log findById(String id) {
        return logMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Log> findByExample(Log log, Page page) {
        LogExample example = new LogExample();
        LogExample.Criteria criteria = example.createCriteria();

        example.setOrderByClause("createTime desc");
        if(MyUtil.notEmpty(log.getId())){
            criteria.andIdEqualTo(log.getId());
        }
        if(MyUtil.notEmpty(log.getTitle())){
            criteria.andTitleLike(log.getTitle());
        }
        if(MyUtil.notEmpty(log.getContent())){
            criteria.andWeatherLike(log.getWeather());
        }

        page.setTotalRows((int)logMapper.countByExample(example));
        if(page.getCurPage()>0){
            example.setStartRow(page.getStartRow());
            example.setPageRows(page.getPageRows());
        }

        return logMapper.selectByExampleWithBLOBs(example);
    }
}
