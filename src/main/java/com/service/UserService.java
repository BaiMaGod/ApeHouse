package com.service;

import com.model.User;
import com.pojo.Page;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface UserService {
    User login(User user, HttpServletRequest request);

    String add(User user);
    boolean delete(String id);
    boolean update(User user);

    int countByExample(User user);

    User findById(String id);
    List<User> findByExample(User user, Page page);
}
