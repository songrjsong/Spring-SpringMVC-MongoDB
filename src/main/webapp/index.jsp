<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>首页</title>
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
    <h2>欢迎来到首页</h2>
    <hr/>
    <div class="container" style="margin-top: 50px;text-align: center;font-size: 18px" >
       欢迎 <a href="${pageContext.request.contextPath}/views/register.jsp" >注册</a>&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="${pageContext.request.contextPath}/views/login.jsp" >登陆</a>
    </div>
</body>
</html>