package com.dao;

import com.model.Login;
import com.model.LoginExample;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface LoginMapper {
    long countByExample(LoginExample example);

    int deleteByPrimaryKey(String id);

    int insert(Login record);

    int insertSelective(Login record);

    List<Login> selectByExample(LoginExample example);

    Login selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Login record);

    int updateByPrimaryKey(Login record);
}