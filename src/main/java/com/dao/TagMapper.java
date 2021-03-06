package com.dao;

import com.model.Tag;
import com.model.TagExample;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TagMapper {
    long countByExample(TagExample example);

    int deleteByPrimaryKey(String id);

    int insert(Tag record);

    int insertSelective(Tag record);

    List<Tag> selectByExample(TagExample example);

    Tag selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Tag record);

    int updateByPrimaryKey(Tag record);
}