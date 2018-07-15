package com.mongodb.dao;

import com.mongodb.pojo.User;
import java.util.List;

/**
 * @author Administrator
 * @create 2018-02-22 18:00
 */
public interface IUserDao {

    void add(User user);

    void delete(String userId);

    void update(User user);

    User selectUserById(String userId);

    List<User> getUserList();

    User selectUserByName(String username);

    List<User> selectUserByConditions(String conditions);

    void freezeUser(String userId);

    void unfreezeUser(String userId);

}
