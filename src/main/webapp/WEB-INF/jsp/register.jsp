<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/17
  Time: 21:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.0.0.min.js" type="text/javascript"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery.validate.min.js" type="text/javascript"></script>
    <!-- 引入自定义css文件 style.css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css" type="text/css" />
    <style>
        .error{
            color: red;
            size: auto;
        }

        body {
            margin-top: 20px;
            margin: 0 auto;
        }

        .carousel-inner .item img {
            width: 100%;
            height: 300px;
        }

        font {
            color: #3164af;
            font-size: 18px;
            font-weight: normal;
            padding: 0 10px;
        }
    </style>
</head>

<body>

<!-- 引入header.jsp -->
<jsp:include page="header.jsp"></jsp:include>
<br>
<div class="page-header">
    <c:if test="${empty registerMessage}">
        <h1>&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-user"></span>&nbsp;
            会员注册&nbsp;&nbsp;<span class="label label-success">
            --------------------------------------------------------
            USER REGISTER-------------------------------------------------------</span></h1>
    </c:if>
    <c:if test="${not empty registerMessage}">
        <h1>&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-user"></span>&nbsp;
            会员注册&nbsp;&nbsp;<span class="label label-danger">

            ----------------------------------------
                ${registerMessage}-----------------------------------------</span></h1>
    </c:if>
</div>
<div class="container"
     style="width: 100%;">
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8"
             style="background: #fff; padding: 40px 120px; margin: 10px 10px; border: 6px solid #ccc;">
            <font>会员注册</font>USER REGISTER
            <form action="/user/register.do" method="post" id="myform" class="form-horizontal" style="margin-top: 5px;">
                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">用户名</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="name"
                               placeholder="请输入用户名" name="name">
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-2 control-label">密码</label>
                    <div class="col-sm-6">
                        <input type="password" class="form-control" id="password"
                               placeholder="请输入密码" name="password">
                    </div>
                </div>
                <div class="form-group">
                    <label for="confirmpassword" class="col-sm-2 control-label">确认密码</label>
                    <div class="col-sm-6">
                        <input type="password" class="form-control" id="confirmpassword"
                               placeholder="请输入确认密码" name="confirmpassword">
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-2 control-label">Email</label>
                    <div class="col-sm-6">
                        <input type="email" class="form-control" id="email"
                               placeholder="Email" name="email">
                        <a onclick="getRegisterCode()" style="cursor: pointer">获取验证码</a>
                        <script>
                            function getRegisterCode() {
                                var elementById = document.getElementById("email");
                                $.post(
                                    "/user/getRegisterCode.do",
                                    {email:elementById.value},
                                    function (data) {
                                        alert(data);
                                    },
                                    "text"
                                );
                            }
                        </script>
                    </div>
                </div>
                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">验证码</label>
                    <div class="col-sm-2">
                        <input name="testCode">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <input type="submit" width="100" value="注册" name="submit"
                               style="background: url('${pageContext.request.contextPath}/static/images/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;">
                    </div>
                </div>
            </form>
        </div>

        <div class="col-md-2"></div>

    </div>
</div>

<!-- 引入footer.jsp -->
<jsp:include page="footer.jsp"></jsp:include>

<%--检验框架--%>
<script>
    $(function () {
        // 在键盘按下并释放且在提交表单后
        $("#myform").validate({
            rules: {
                name: {
                    required: true,
                    minlength: 2
                },
                password: {
                    required: true,
                    minlength: 4,
                    maxlength:16
                },
                confirmpassword: {
                    required: true,
                    minlength: 4,
                    maxlength:16,
                    equalTo: "#password"
                },
                email: {
                    required: true,
                    email: true
                },
                // uname:"required",
            },
            messages: {
                name: {
                    required: "用户名不能为空！",
                    minlength: "用户名至少由两个字母组成"

                },
                password: {
                    required: "请输入密码",
                    minlength: "密码长度不能小于4位",
                    maxlength:"密码长度不能大于16位"
                },
                confirmpassword: {
                    required: "请输入密码",
                    minlength: "密码长度不能小于4个位",
                    maxlength:"密码长度不能大于16位",
                    equalTo: "两次密码输入不一致"
                },
                email: "请输入一个正确格式的邮箱",
                // uname:"不能为空",
            }
        })
    });


</script>

</body>
</html>
