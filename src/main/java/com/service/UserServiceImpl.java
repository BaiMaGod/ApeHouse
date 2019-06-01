package com.service;

import com.dao.LoginMapper;
import com.dao.UserMapper;
import com.model.Login;
import com.model.User;
import com.model.UserExample;
import com.pojo.Page;
import com.util.MyUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public class UserServiceImpl implements  UserService {
    @Autowired
    UserMapper userMapper;
    @Autowired
    LoginMapper loginMapper;

    public User login(User user, HttpServletRequest request) {
        if(user==null || user.getNumber()==null || user.getNumber()=="" || user.getPassword()==null || user.getPassword()==""){
            return null;
        }

        UserExample example = new UserExample();
        example.createCriteria().andNumberEqualTo(user.getNumber()).andPasswordEqualTo(user.getPassword());
        List<User> users = userMapper.selectByExample(example);

        if(users.isEmpty()){
            return null;
        }
        Login login = new Login();
        login.setId(MyUtil.getTableId());
        login.setUserId(users.get(0).getId());
        login.setIp(request.getRemoteAddr());


        return users.get(0);
    }

    public String add(User user) {
        if(user==null){
            return null;
        }

        String id = MyUtil.getTableId();

        user.setId(id);
        user.setHeadImage("static/headimage/headimg.jpg");
        user.setCreateTime(MyUtil.nowDate());

        return id;
    }

    public boolean delete(String id) {
        return false;
    }

    public boolean update(User user) {
        return false;
    }

    public int countByExample(User user) {
        return 0;
    }

    public User findById(String id) {
        return null;
    }

    public List<User> findByExample(User user, Page page) {
        return null;
    }
}
