package com.dao;

import com.model.Resource;
import com.model.ResourceExample;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface ResourceMapper {
    long countByExample(ResourceExample example);

    int deleteByPrimaryKey(String id);

    int insert(Resource record);

    int insertSelective(Resource record);

    List<Resource> selectByExample(ResourceExample example);

    Resource selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Resource record);

    int updateByPrimaryKey(Resource record);
}