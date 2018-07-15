package com.mongodb.controller;

import com.mongodb.pojo.User;
import com.mongodb.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author Administrator
 * @create 2018-02-22 18:21
 */

@Controller
public class UserController {

    @Autowired
    private IUserService userService;


    //登陆功能
    @RequestMapping("/login")
    public String login(HttpServletRequest request, Model model){
        String username = request.getParameter("userName");
        String password = request.getParameter("password");
        if (username != null){
            User u = userService.findUserByName(username);
            if (u != null){
                if (u.getUserName().equals(username)&&u.getPassword().equals(password)&&"已启用".equals(u.getStatus())){
                    return "forward:getUserList";
                }else{
                    return "login";
                }
            }else{
                return "login";
            }
        }else{
            return "login";
        }
    }

    //注册
    @RequestMapping("/sign_in")
    public String register(User user){
        long time = System.currentTimeMillis();
        String userid = time+"";
        user.setUserId(userid);
        user.setStatus("已启用");
        userService.insert(user);
        return "login";
    }

    //获取用户列表
    @RequestMapping("/getUserList")
    public String getUserList(Model model){
        List<User> userList = userService.findUserList();

        model.addAttribute("userList",userList);

        return "list";
    }

    //添加用户
    @RequestMapping("/saveUser")
    public String saveUser(Model model,User user){
        long time = System.currentTimeMillis();
        String userid = time+"";
        user.setUserId(userid);
        user.setStatus("已启用");
        userService.insert(user);
        return "forward:getUserList";
    }

    //删除用户
    @RequestMapping("/delete")
    public String remove(Model model,HttpServletRequest request){

        String userId = request.getParameter("userId");
        userService.remove(userId);
        return "forward:getUserList";
    }

    //更新用户信息
    @RequestMapping("/updateUser")
    public String mofifyUser(Model model,HttpServletRequest request,User user){
        userService.modify(user);
        return "forward:getUserList";
    }

    //多条件查询
    @RequestMapping("/selectConditions")
    public String findUsersByConditions(HttpServletRequest request,Model model){
        String conditions = request.getParameter("conditions");
        List<User> userList = userService.findUserByConditions(conditions);
        model.addAttribute("userList",userList);
        return "list";
    }

    //根据Id查询用户
    @RequestMapping("/findUser")
    public  String findUserById(HttpServletRequest request,Model model){
        String userId = request.getParameter("userId");
        User user = userService.findUserById(userId);
        request.getSession().setAttribute("user",user);
        return "update";

    }

    //停用用户
    @RequestMapping("/freezeUser")
    public String freezeUser(HttpServletRequest request){
        String userId = request.getParameter("userId");
        userService.freezeUser(userId);
        return "forward:getUserList";
    }

    //启用用户
    @RequestMapping("/unfreezeUser")
    public String unfreezeUser(HttpServletRequest request){
        String userId = request.getParameter("userId");
        userService.unfreezeUser(userId);
        return "forward:getUserList";
    }


}
