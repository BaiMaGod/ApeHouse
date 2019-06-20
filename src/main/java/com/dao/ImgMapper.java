package com.dao;

import com.model.Img;
import com.model.ImgExample;
import java.util.List;

public interface ImgMapper {
    long countByExample(ImgExample example);

    int deleteByPrimaryKey(String id);

    int insert(Img record);

    int insertSelective(Img record);

    List<Img> selectByExample(ImgExample example);

    Img selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Img record);

    int updateByPrimaryKey(Img record);
}