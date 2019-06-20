package com.dao;

import com.model.Log;
import com.model.LogExample;
import java.util.List;

public interface LogMapper {
    long countByExample(LogExample example);

    int deleteByPrimaryKey(String id);

    int insert(Log record);

    int insertSelective(Log record);

    List<Log> selectByExampleWithBLOBs(LogExample example);

    List<Log> selectByExample(LogExample example);

    Log selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Log record);

    int updateByPrimaryKeyWithBLOBs(Log record);

    int updateByPrimaryKey(Log record);
}