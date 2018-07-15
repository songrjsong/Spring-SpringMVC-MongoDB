package com.mongodb.pojo;

import java.io.Serializable;

/**
 * @author Administrator
 * @create 2018-02-22 17:54
 */
public class User implements Serializable{

    private static final long serialVersionUID = 1L;
    private String userId;
    private String userName;
    private String password;
    private String phone;
    private String sex;
    private String status;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getStatus() { return status; }

    public void setStatus(String status) { this.status = status; }
}
