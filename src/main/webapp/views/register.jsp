<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>注册</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

</head>
<style type="text/css">
    body h2{
        text-align: center;
        color: red;
    }
</style>
</head>
<body>
<h2>注册页面</h2>
<hr/>
<div class="container" style="margin-top: 50px">
    <form class="form-horizontal" role="form" id="signupForm" action="${pageContext.request.contextPath}/sign_in" method="post">
        <div class="form-group">
            <label for="userName" class="col-sm-2 control-label">用户名</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="userName" name="userName"
                       placeholder="请输入用户名" >
            </div>
        </div>
        <div class="form-group">
            <label for="password" class="col-sm-2 control-label">密码</label>
            <div class="col-sm-10">
                <input type="password" class="form-control" id="password" name="password"
                       placeholder="请输入密码" >
            </div>
        </div>
        <div class="form-group">
            <label for="repassword" class="col-sm-2 control-label">重复密码</label>
            <div class="col-sm-10">
                <input type="password" class="form-control" id="repassword" name="repassword"
                       placeholder="请重新输入密码" >

            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">性别</label>
            <div class="col-sm-10">
                <input type="radio"  name="sex" value="男" checked> 男&nbsp;&nbsp;
                <input type="radio"  name="sex" value="女"> 女
            </div>
        </div>

        <div class="form-group">
            <label for="phone" class="col-sm-2 control-label">手机号码</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="phone" name="phone"
                       placeholder="请输入手机号码">
            </div>
        </div>


        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-success" onclick=" return check()">确定</button>
                <button type="reset" class="btn btn-success">取消</button>
            </div>
        </div>
    </form>
</div>


</body>


<script >

   function check() {
       var username = document.getElementById("userName").value;
       var pwd1 = document.getElementById("password").value;
       var pwd2 = document.getElementById("repassword").value;
       if (username ==""||username == null){

           alert("用户名不能为空");
           return false;
       }else if (username.length<2){
            alert("用户名长度至少为2位");
            return false;
       }

       if (pwd1=="" || pwd1==null || pwd2=="" ||pwd2 == null){
           alert("密码不能为空");
           return false;
       }else if (pwd1 != pwd2){
           alert("两次输入密码不一致");
           return false;
       }
   }

</script>
</html>