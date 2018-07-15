<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta charset="utf-8">
    <title>用户列表</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <style type="text/css">
        body h2{
            text-align: center;
            color: red;
        }
    </style>
</head>
<body>
<h2>用户列表</h2>
<hr/>
<div style="height:60px;line-height: 60px">

    <form action="${pageContext.request.contextPath}/selectConditions" method="post">
        <div style="margin-left: 50px" >
            <div class="col-sm-2">
                <input type="text" name="conditions" class="form-control" placeholder="请输入用户名或编号">
            </div>
            <div class="col-sm-2">
                <input type="submit" name="find" class="btn btn-primary"  value="搜索">
            </div>
        </div>
    </form>

</div>
<hr>
<div class="container" style="margin-top: 50px">
    <table class="table table-bordered">
        <thead>
            <tr class="text-c" style="text-align: center">
                <th>编号</th>
                <th>用户名</th>
                <th>密码</th>
                <th>性别</th>
                <th>手机号码</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${userList}" var="u">
            <tr class="text-c" style="text-align: center">
                <td>${u.userId}</td>
                <td>${u.userName}</td>
                <td>${u.password}</td>
                <td>${u.sex}</td>
                <td>${u.phone}</td>
                <td>${u.status}</td>
                <td>
                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/findUser?userId=${u.userId}"  >修改</a>
                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/delete?userId=${u.userId}"  onclick="return del();">删除</a>
                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/views/add.jsp"  >添加</a>
                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/unfreezeUser?userId=${u.userId}" >启用</a>
                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/freezeUser?userId=${u.userId}" >停用</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>

<script>

    function del() {
        if (confirm("确定要删除吗？")){
            return true;
        }else {
            return false;
        }
    }

</script>

</html>