package com.mongodb.service;

import com.mongodb.dao.IUserDao;
import com.mongodb.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Administrator
 * @create 2018-02-22 18:17
 */

@Service
public class UserServiceImpl implements IUserService {

    @Autowired
    private IUserDao userDao;

    public void insert(User user) {
        userDao.add(user);
    }

    public void remove(String userId) {
        userDao.delete(userId);
    }

    public void modify(User user) { userDao.update(user);}

    public User findUserById(String userId) {
        return userDao.selectUserById(userId);
    }

    public List<User> findUserList() {
        return userDao.getUserList();
    }

    public User findUserByName(String username) {
        return userDao.selectUserByName(username);
    }

    public List<User> findUserByConditions(String conditions) {
        return userDao.selectUserByConditions(conditions);
    }

    public void freezeUser(String userId) { userDao.freezeUser(userId); }

    public void unfreezeUser(String userId) { userDao.unfreezeUser(userId); }
}
