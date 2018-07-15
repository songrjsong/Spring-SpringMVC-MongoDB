package com.mongodb.service;

import com.mongodb.pojo.User;

import java.util.List;

public interface IUserService {

    void insert(User user);

    void remove(String userId);

    void modify(User user);

    User findUserById(String userId);

    List<User> findUserList();

    User findUserByName(String username);

    List<User> findUserByConditions(String conditions);

    void freezeUser(String userId);

    void unfreezeUser(String userId);

}
