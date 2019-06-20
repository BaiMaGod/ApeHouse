package com.service;

import com.model.Log;
import com.pojo.Page;

import java.util.List;

public interface LogService {

    String add(Log log);
    boolean delete(String id);
    boolean update(Log log);

    int countByExample(Log log);

    Log findById(String id);
    List<Log> findByExample(Log log, Page page);

}
