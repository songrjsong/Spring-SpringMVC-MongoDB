<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <title>修改</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <style type="text/css">
        body h2{
            text-align: center;
            color: red;
        }
    </style>
</head>
<body>
<h2>修改页面</h2>
<hr/>
<div class="container" style="margin-top: 50px">
    <form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/updateUser" method="post">

        <div class="form-group">
            <div class="col-sm-10">
                <input type="hidden" class="form-control" id="userId" name="userId" value="${user.userId}">
            </div>
        </div>

        <div class="form-group">
            <label for="userName" class="col-sm-2 control-label">用户名</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="userName" name="userName" value="${user.userName}">
            </div>
        </div>
        <div class="form-group">
            <label for="pwd" class="col-sm-2 control-label">密码</label>
            <div class="col-sm-10">
                <input type="password" class="form-control" id="pwd" name="password" value="${user.password}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">性别</label>
            <div class="col-sm-10">
                <input type="radio"  name="sex" value="男" <c:if test="${user.sex eq '男' }" >checked</c:if> />男&nbsp;&nbsp;
                <input type="radio"  name="sex" value="女" <c:if test="${user.sex eq '女' }" >checked</c:if> />女
            </div>
        </div>

        <div class="form-group">
            <label for="phone" class="col-sm-2 control-label">手机号码</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="phone" name="phone" value="${user.phone}">
            </div>
        </div>


        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary">确定</button>
                <button type="reset" class="btn btn-primary">取消</button>
            </div>
        </div>
    </form>
</div>


</body>
</html>

