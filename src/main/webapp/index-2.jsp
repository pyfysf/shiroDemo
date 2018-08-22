<%@ page import="org.apache.taglibs.standard.lang.jstl.test.PageContextImpl" %><%--
  Created by IntelliJ IDEA.
  User: shaofei
  Date: 2017/12/12
  Time: 23:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%
    pageContext.setAttribute("appPath",request.getContextPath());
%>
<%--<jsp:forward page="${appPath}/emp/findAll.do"/>--%>
<%--<jsp:forward page="${appPath}/emp/findAllWithJson.do"/>--%>
<html>
<head>
    <title>首页</title>
    <link href="${appPath}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <script src="${appPath}/static/js/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${appPath}/static/bootstrap/js/bootstrap.min.js"></script>
    <!-- Bootstrap -->
</head>
<body>

<button class="btn btn-success">成功</button>

</body>
</html>
