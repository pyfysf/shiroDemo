<%--
  Created by IntelliJ IDEA.
  User: shaofei
  Date: 2017/12/14
  Time: 22:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% pageContext.setAttribute("appPath", request.getContextPath()); %>
<html>
<head>
    <title>Title</title>
    <link href="${appPath}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="${appPath}/static/js/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${appPath}/static/bootstrap/js/bootstrap.min.js"></script>
    <!-- Bootstrap -->

</head>
<body>

<%--配置显示内容--%>
<div class="container">
    <%--标题--%>
    <div class="row">
        <div>
            <h1 class="col-md-4 col-md-offset-4"> SSM——CRUD </h1>
        </div>
    </div>
    <%--新增和删除--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <%--表格--%>
    <div class="row">
        <div>
            <table class="table">
                <tr>
                    <th>#</th>
                    <th>lastName</th>
                    <th>email</th>
                    <th>gender</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>

                <c:forEach var="employee" items="${employeePageInfo.list}">
                    <tr>
                        <td>${employee.empId}</td>
                        <td>${employee.empName}</td>
                        <td>${employee.empEmail}</td>
                        <td>${employee.empGender == "M" ? "男" : "女"}</td>
                        <td>${employee.department.deptName}</td>
                        <td>
                            <button class="btn btn-info">
                            <span class="glyphicon glyphicon-pencil" aria-hidden="false">
                            </span>编辑
                            </button>
                            <button class="btn btn-danger">
                              <span class="glyphicon glyphicon-trash" aria-hidden="true">
                            </span>删除
                            </button>

                        </td>
                    </tr>

                </c:forEach>

            </table>
        </div>
    </div>
    <%--分页信息--%>
    <div class="row">

        <p class="text-left">
            当前第${employeePageInfo.pageNum}页
            共有${employeePageInfo.pages}页
            总计${employeePageInfo.total}条记录

        </p>

    </div>

    <%--分页显示--%>
    <div class="row">
        <div class="col-md-6 col-md-offset-6">

            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="${appPath}/emp/findAll.do?pageNum=1">首页</a></li>

                    <c:if test="${employeePageInfo.pageNum != 1}">
                        <li>
                            <a href="${appPath}/emp/findAll.do?pageNum=${employeePageInfo.pageNum-1}"
                               aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach var="p" items="${employeePageInfo.navigatepageNums}">
                        <c:if test="${employeePageInfo.pageNum == p}">
                            <li class="active"><a
                                    href="${appPath}/emp/findAll.do?pageNum=${p}">${p}</a></li>
                        </c:if>
                        <c:if test="${employeePageInfo.pageNum != p}">
                            <li><a
                                    href="${appPath}/emp/findAll.do?pageNum=${p}">${p}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${employeePageInfo.pageNum != employeePageInfo.pages}">
                        <li>
                            <a href="${appPath}/emp/findAll.do?pageNum=${employeePageInfo.pageNum+1}"
                               aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <li><a href="${appPath}/emp/findAll.do?pageNum=${employeePageInfo.pages}">尾页</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>

</body>
</html>
