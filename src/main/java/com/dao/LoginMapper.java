package com.dao;

import com.model.Login;
import com.model.LoginExample;
import java.util.List;

public interface LoginMapper {
    int deleteByPrimaryKey(String id);

    int insert(Login record);

    int insertSelective(Login record);

    List<Login> selectByExample(LoginExample example);

    Login selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Login record);

    int updateByPrimaryKey(Login record);
}