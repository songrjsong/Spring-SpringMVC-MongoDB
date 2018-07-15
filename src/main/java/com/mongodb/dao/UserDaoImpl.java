package com.mongodb.dao;

import com.mongodb.pojo.User;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Administrator
 * @create 2018-02-22 18:04
 */
@Repository
public class UserDaoImpl implements IUserDao {

    @Resource
    private MongoTemplate mongoTemplate;

    public void add(User user) {
        this.mongoTemplate.save(user,"t_user");
    }

    public void delete(String userId) {
        this.mongoTemplate.remove(new Query(Criteria.where("userId").is(userId)), User.class, "t_user");
    }

    public void update(User user) {
        Query query = new Query();
        query.addCriteria(Criteria.where("userId").is(user.getUserId()));
        Update update = new Update();
        update.set("userName",user.getUserName());
        update.set("password",user.getPassword());
        update.set("sex",user.getSex());
        update.set("phone",user.getPhone());
        mongoTemplate.updateFirst(query,update,User.class,"t_user");
    }

    public User selectUserById(String userId) {
        return mongoTemplate.findOne(new Query(Criteria.where("userId").is(userId)),
                User.class,"t_user");
    }

    public List<User> getUserList() {
        return mongoTemplate.find(new Query(),User.class,"t_user");
    }

    public User selectUserByName(String username) {
        //is 为精确匹配，regex 为模糊匹配
        return mongoTemplate.findOne(new Query(Criteria.where("userName").is(username)),User.class,"t_user");
    }

    //多条件查询
    public List<User> selectUserByConditions(String conditions) {

        Criteria criteria = new Criteria();
        criteria.orOperator(Criteria.where("userName").regex(conditions),Criteria.where("userId").is(conditions));
        Query query = new Query(criteria);
        return mongoTemplate.find(query,User.class,"t_user");
    }
    //停用用户
    public void freezeUser(String userId) {
        Query query = new Query();
        query.addCriteria(Criteria.where("userId").is(userId));
        Update update = new Update();
        update.set("status","已停用");
        mongoTemplate.updateFirst(query,update,User.class,"t_user");
    }

    //启用用户
    public void unfreezeUser(String userId) {
        Query query = new Query();
        query.addCriteria(Criteria.where("userId").is(userId));
        Update update = new Update();
        update.set("status","已启用");
        mongoTemplate.updateFirst(query,update,User.class,"t_user");
    }


}
