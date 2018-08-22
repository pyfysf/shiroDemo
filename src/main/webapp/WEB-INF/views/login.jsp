<%--
 作者：  pyfysf
 
 qq:  337081267
 
 CSDN:    http://blog.csdn.net/pyfysf
 
 个人博客：    http://wintp.top
 
 时间： 2018/08/2018/8/22 21:56
 
 邮箱：  pyfysf@163.com
 
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%pageContext.setAttribute("ctxPath", request.getContextPath());%>

<html>
<head>
    <title>登录用户</title>

    <link href="${appPath}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="${appPath}/static/js/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${appPath}/static/bootstrap/js/bootstrap.min.js"></script>
    <!-- Bootstrap -->
</head>
<body>


<h1>登录用户</h1>


<form action="${ctxPath}/user/loginUser.do" method="post">

    用户名:<input type="text" name="username"><br>
    密码:<input type="text" name="password"><br>

    <button class="btn btn-primary" type="submit">登录</button>

</form>

</body>
</html>
