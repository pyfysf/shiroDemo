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


<%--添加编辑按钮的模态框--%>
<div class="modal fade" tabindex="-1" role="dialog" id="updateDialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">编辑用户</h4>
            </div>
            <div class="modal-body">


                <form class="form-horizontal" id="form-update-emp">
                    <div class="form-group">
                        <label for="add_empName" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input class="form-control" id="update_empName" type="text"
                                   placeholder="empName" disabled>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_email" class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="empEmail"
                                   id="update_email"
                                   placeholder="Email@163.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Gender</label>

                        <div class="col-sm-10">

                            <label class="radio-inline">
                                <input type="radio" name="empGender"
                                       value="M"> 男
                            </label>
                            <%--                                       checked="checked"
                            --%>
                            <label class="radio-inline">
                                <input type="radio" name="empGender"
                                       value="F"> 女
                            </label>
                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-sm-2 control-label">dept</label>
                        <div class="col-sm-10">
                            <select class="form-control" name="dId">
                            </select>

                        </div>
                    </div>

                </form>


            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="btn_update_close">关闭</button>
                <button type="button" class="btn btn-primary" id="btn_update_save">更新</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<%--添加新增按钮的模态框--%>
<div class="modal fade" tabindex="-1" role="dialog" id="myModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">新增用户</h4>
            </div>
            <div class="modal-body">


                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="add_empName" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="add_empName" name="empName"
                                   placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_email" class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="empEmail" id="add_email"
                                   placeholder="Email@163.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Gender</label>

                        <div class="col-sm-10">

                            <label class="radio-inline">
                                <input type="radio" name="empGender" id="inlineRadio1"
                                       checked="checked"
                                       value="M"> 男
                            </label>

                            <label class="radio-inline">
                                <input type="radio" name="empGender" id="inlineRadio2"
                                       value="F"> 女
                            </label>
                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-sm-2 control-label">dept</label>
                        <div class="col-sm-10">
                            <select class="form-control" name="dId">
                            </select>

                        </div>
                    </div>

                </form>


            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="btn_add_close">关闭</button>
                <button type="button" class="btn btn-primary" id="btn_add_save">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


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
            <button class="btn btn-primary" id="btn_add_emp">新增</button>
            <button class="btn btn-danger btn_all_del">删除</button>
        </div>
    </div>
    <%--表格--%>
    <div class="row">
        <div>
            <table class="table" id="table_emp">

                <thead>

                <tr>
                    <th><input type="checkbox" id="select-all"></th>
                    <th>#</th>
                    <th>lastName</th>
                    <th>email</th>
                    <th>gender</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                </thead>

                <tbody>

                </tbody>
            </table>
        </div>
    </div>
    <%--分页信息--%>
    <div class="row">

        <p class="text-left" id="text-page-info">
        </p>

    </div>

    <%--分页显示--%>
    <div class="row">
        <div class="col-md-6 col-md-offset-6">

            <nav aria-label="Page navigation" id="page_nav">

            </nav>
        </div>
    </div>
</div>

</body>
<script>

    //所有的数据记录数
    var dataTotal;

    /**
     *当前页
     */
    var currentPage;

    $(function () {
        getDataForNet(1)
    })

    function getDataForNet(pageNumber) {
        console.log(pageNumber + "ajax");
        $.ajax({
            url: "${appPath}/emp/findAllWithJson.do",
            data: {"pageNum": pageNumber},
            type: "GET",
            dataType: "json",
            success: function (res) {
                console.log(res);

                //拼接emp表格
                bulidTable(res)
                //拼接分页info
                bulidPageInfo(res)

                //拼接分页条目
                bulidPageNav(res)
            }

        })
    }

    //拼接分页条目
    function bulidPageNav(res) {

        $("#page_nav").empty()

        var ulEle = $("<ul></ul>").addClass("pagination")

        if (res.resultBody.employeePageInfo.pageNum != res.resultBody.employeePageInfo.firstPage) {
            var homePage = $("<li></li>").append($("<a></a>").append("首页"))
            var prePage = $("<li></li>").append($("<a></a>").attr("aria-label", "Previous").append("&laquo;"))

            homePage.click(function () {
                getDataForNet(1)
            })
            prePage.click(function () {
                getDataForNet(res.resultBody.employeePageInfo.pageNum - 1)
            })
            ulEle.append(homePage).append(prePage)
        }


        $.each(res.resultBody.employeePageInfo.navigatepageNums, function (index, item) {
            var pageLi = $("<li></li>").append($("<a></a>").append(item));

            if (item == res.resultBody.employeePageInfo.pageNum) {
                pageLi.addClass("active")
            }

            ulEle.append(pageLi)


            pageLi.click(function () {
                getDataForNet(item)
            })

        })

        if (res.resultBody.employeePageInfo.pageNum != res.resultBody.employeePageInfo.pages) {
            var nextPage = $("<li></li>").append($("<a></a>").attr("aria-label", "Next").append("&raquo;"))

            var lastPage = $("<li></li>").append($("<a></a>").append("尾页"))

            nextPage.click(function () {
                getDataForNet(res.resultBody.employeePageInfo.pageNum + 1)
            })

            lastPage.click(function () {
                getDataForNet(res.resultBody.employeePageInfo.pages)
            })
            ulEle.append(nextPage).append(lastPage).appendTo("#page_nav")
        } else {
            ulEle.appendTo("#page_nav")
        }


    }

    //凭借分页信息
    function bulidPageInfo(res) {
        $("#text-page-info").empty()

        $("#text-page-info").append("当前第" + res.resultBody.employeePageInfo.pageNum + " 页 共有"
            + res.resultBody.employeePageInfo.pages + "页 总计" + res.resultBody.employeePageInfo.total + "条记录")

        dataTotal = res.resultBody.employeePageInfo.total
        currentPage = res.resultBody.employeePageInfo.pageNum
    }


    //凭借table格式
    function bulidTable(res) {

        $("#table_emp tbody").empty()


        $.each(res.resultBody.employeePageInfo.list, function (i, item) {
            var empCheckbox = $("<td></td>").append($("<input type='checkbox' class='check-td-item'>"));
            var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
            var empGenderTd = $("<td></td>").append(item.empGender == "M" ? "男" : "女");
            var empEmailTd = $("<td></td>").append(item.empEmail);
            var deptNameTd = $("<td></td>").append(item.department.deptName);

            var editBtn = $("<td></td>").append($("<button></button>")
                .addClass("btn btn-info btn-edit").attr("edit_id", item.empId).append("<span></span>")
                .addClass("glyphicon glyphicon-pencil").append("编辑"))
                .append("\t\t")
                .append($("<button></button>")
                    .addClass("btn btn-danger").append("<span></span>")
                    .addClass("glyphicon glyphicon-trash btn-del").attr("del_id", item.empId).append("删除"));

            $("<tr></tr>")
                .append(empCheckbox)
                .append(empIdTd)
                .append(empNameTd)
                .append(empGenderTd)
                .append(empEmailTd)
                .append(deptNameTd)
                .append(editBtn)
                .appendTo("#table_emp tbody")
        })
    }

    $("#btn_add_emp").click(function () {

        //获取所有的部门
        getDepts("#myModal select");

        //显示模态框
        $('#myModal').modal({
            backdrop: "static",
        })
    })

    function getDepts(ele) {
        $.ajax({
            url: "${appPath}/depts.do",
            type: "GET",
            dataType: "json",
            success: function (res) {

                $(ele).empty()

                $.each(res.resultBody.depts, function (i, item) {
                    if (item.deptName != null) {
                        var optionEle = $("<option></option>")
                            .attr("value", item.deptId).append(item.deptName)

                        console.log(item.deptName);

                        optionEle.appendTo(ele)
                    }

                })

            }
        })

    }


    $("#btn_add_close").click(function () {
        $('#myModal').modal('hide')
    })

    $("#btn_add_save").click(function () {


        console.log("是否可用" + checkAddEmpNameIsUse());

        if (!checkAddEmpName() || !checkAddEmail() || $(this).attr("empNameIsUse") == "error") {
            alert("请检查上方是否有错误")

            return false;
        }

        $.ajax({
            url: "${appPath}/emp/emps.do",
            data: $("#myModal form").serialize(),
            type: "POST",
            dataType: "json",
            success: function (res) {
                if (res.resultCode == 200) {
                    //关闭模态框
                    $('#myModal').modal('hide')
                    getDataForNet(dataTotal)
                    //清空添加form表单
                    $("#myModal form")[0].reset()
                } else {
                    console.log(res);
                    if (res.resultBody.fieldErrors.empEmail != undefined) {
                        //说明邮箱有问题
                        changeStatus($("#add_email"), false, res.resultBody.fieldErrors.empEmail, false)

                    }
                    if (res.resultBody.fieldErrors.empName != undefined) {
                        //说明姓名
                        changeStatus($("#add_empName"), false, res.resultBody.fieldErrors.empName, false)

                    }

                }


            }
        })


    })


    $("#add_empName").blur(function () {
        // console.log("empname blur");
        // console.log(checkAddEmpName($(this).val()));

        changeStatus($(this), checkAddEmpName(), "姓名格式为6-16位英文字符，3-5位中文", false)

        if (checkAddEmpName()) {
            //检查是否可用
            checkAddEmpNameIsUse()
        }

    })

    function checkAddEmpNameIsUse() {

        if ($("#add_empName").val() == "") {
            changeStatus($("#add_empName"), false, "用户名不可空", true)
            return;
        }

        $.ajax({
            url: "${appPath}/emp/checkEmpName.do",
            data: "empName=" + $("#add_empName").val(),
            type: "GET",
            dataType: "json",
            success: function (res) {
                if (res.resultCode == 500) {
                    $("#btn_add_save").attr("empNameIsUse", "error");
                    console.log("用户名不可用");
                    changeStatus($("#add_empName"), false, "用户名不可用", true)
                } else {
                    $("#btn_add_save").attr("empNameIsUse", "success");

                    changeStatus($("#add_empName"), true, "用户名可用", true)
                    console.log("用户名可用");
                }
            }
        })
    }

    $("#add_email").blur(function () {
        // console.log("add_email blur" + $(this).val());
        // console.log(checkAddEmail($(this).val()));

        changeStatus($(this), checkAddEmail(), "邮箱格式不正确", false)
    })

    // .has-error 或 .has-success

    /**
     *修改UI状态
     * @param ele 元素
     * @param isSuccess 是否是成功状态
     * @param msg 要显示的错误/成功信息
     * @param isChackNamUse 是否是检测用户名可用
     */
    function changeStatus(ele, isSuccess, msg, isChackNamUse) {
        console.log(ele + isSuccess);

        ele.parent().removeClass("has-error has-success")
        ele.next("span").text("")
        if (isSuccess) {
            ele.parent().addClass("has-success")
            if (isChackNamUse) {
                ele.next("span").text(msg)
            } else {
                ele.next("span").text("")

            }
        } else {
            ele.parent().addClass("has-error")
            ele.next("span").text(msg)

        }

    }

    //校验姓名
    function checkAddEmpName() {
        //6-16位英文字符，3-5位中文
        var rexEmpName = /(^[a-z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,3})/

        return rexEmpName.test($("#add_empName").val())
    }


    //校验姓名
    function checkAddEmail() {
        var rexEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/

        return rexEmail.test($("#add_email").val())
    }


    //  编辑模态框  编辑模态框     编辑模态框  编辑模态框  编辑模态框  编辑模态框
    $(document).on("click", ".btn-edit", function () {

        console.log("click - btn - edit");
        getDepts("#updateDialog select")


        //显示模态框
        $('#updateDialog').modal({
            backdrop: "static"
        })

        var empId = $(this).attr("edit_id")

        //存储id
        $("#btn_update_save").attr("update_save_id", empId)

        //查询数据显示在页面上
        getEmpById(empId);
    })

    $(document).on("click", ".btn-del", function () {
        var empName = $(this).parents("tr").find("td:eq(2)").text()

        if (confirm("是否删除【" + empName + "】？")) {
            $.ajax({
                url: "${appPath}/emp/delEmp/" + $(this).attr("del_id") + ".do",
                type: "GET",
                dataType: "json",
                success: function (result) {
                    alert("删除成功")
                    getDataForNet(currentPage)
                }
            })
        }


    })


    function getEmpById(id) {
        $.ajax({
            url: "${appPath}/emp/empById/" + id + ".do",
            type: "GET",
            dataType: "json",
            success: function (result) {
                console.log(result);
                if (result.resultCode == 200) {
                    var emp = result.resultBody.emp
                    $("#update_empName").val(emp.empName)
                    $("#update_email").val(emp.empEmail)

                    $("#updateDialog form :radio[value=" + emp.empGender + "]").attr("checked", true)

                    $("#updateDialog form  option[value=" + emp.dId + "]").attr("selected", "selected")

                }

            }

        })
    }


    $("#btn_update_close").click(function () {
        $('#updateDialog').modal('hide')
    })

    $("#btn_update_save").click(function () {

        $.ajax({
            url: "${appPath}/emp/updateEmp.do",
            data: $("#form-update-emp").serialize() + "&empId=" + $(this).attr("update_save_id"),
            type: "POST",
            dataType: "json",
            success: function (result) {
                $('#updateDialog').modal('hide')
                getDataForNet(currentPage)
            }

        })
    })

    //-----------全选------------------
    $("#select-all").click(function () {
        console.log("select-all");


        $(".check-td-item").prop("checked", $("#select-all").prop("checked"))

    })
    //-----------全选/全不选------------------
    $(document).on("click", ".check-td-item", function () {
        $("#select-all").prop("checked", $(".check-td-item:checked").length == $(".check-td-item").length)
    })

    //全部删除
    $(".btn_all_del").click(function () {

        var names = [];
        var ids = [];


        //获取所有被选中的item
        $(".check-td-item:checked").each(function (i, item) {
           var name = $(item).parents("tr").find("td:eq(2)").text();
           var id = $(item).parents("tr").find("td:eq(1)").text();
            names[i] = name
            ids[i]=id
        })


        if (confirm("是否删除【"+names+"】？")) {
            $.ajax({
                url: "${appPath}/emp/delBanch.do",
                data: {ids:ids.toString()},
                type: "POST",
                dataType: "json",
                success: function (result) {
                    getDataForNet(currentPage)
                }

            })
        }


    })
</script>


</html>
