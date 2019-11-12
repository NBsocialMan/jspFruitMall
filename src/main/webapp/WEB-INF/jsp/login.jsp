<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/20
  Time: 17:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
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
    body {
    margin-top: 20px;
    margin: 0 auto;
    }

    .carousel-inner .item img {
    width: 100%;
    height: 300px;
    }

    .container .row div {
    /* position:relative;
    float:left; */

    }

    font {
    color: #666;
    font-size: 22px;
    font-weight: normal;
    padding-right: 17px;
    }
    #font1{
    color: red;
    }

    </style>
</head>
<body>
<div class="page-header">
    <h1>&nbsp;&nbsp;&nbsp;
<a href="/user/index.do"><span class="glyphicon glyphicon-home"></span>蔬菜水果专卖</a>
        <small><span class="label label-warning">为确保您账户的安全及正常使用，依《网络安全法》相关要求，
            6月1日起会员账户需绑定手机。如您还未绑定，请尽快完成，感谢您的理解及支持</span></small>
            </h1>
</div>
<%--<form method="post" action="/user/login.do">--%>
    <%--用户名:<input type="text" name="name">--%>
    <%--密码:<input type="text" name="password">--%>
    <%--<input type="submit" value="login">--%>
    <%--<h1>${message}</h1>--%>
<%--</form>--%>


<div class="container"
     style="width: 100%; height: 460px; background: #337ab7  no-repeat;">
    <div class="row">
        <div class="col-md-7">
            <!--<img src="./image/login.jpg" width="500" height="330" alt="会员登录" title="会员登录">-->
        </div>

        <div class="col-md-5">
            <div style="width: 430px; border: 1px solid #E7E7E7; padding: 20px 0 20px 30px; border-radius: 5px; margin-top: 60px; background: #fff;">
                <font>会员登录</font>USER LOGIN
                <div>&nbsp;</div>
                <form method="post" action="/user/login.do" class="form-horizontal">
                    <div class="form-group">
                        <label for="name" class="col-sm-3 control-label">用户名</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="name"
                                   placeholder="请输入用户名" name="name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-sm-3 control-label">密码</label>
                        <div class="col-sm-6">
                            <input type="password" class="form-control" id="password"
                                   placeholder="请输入密码" name="password">
                        </div>
                    </div>
                    <%--<div class="form-group">--%>
                        <%--<label for="password" class="col-sm-2 control-label"></label>--%>
                        <%--<div class="col-sm-3">--%>
                        <%--</div>--%>
                        <%--<div class="col-sm-3">--%>

                        <%--</div>--%>
                    <%--</div>--%>
                    <a style="margin-left: 250px;cursor: pointer" href="/user/forgetUI.do">忘记密码</a>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <input type="submit" width="100" value="登录" name="submit"
                                   style="background: url('/static/images/login.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;">
                        </div>
                    </div>
                    <font id="font1" color="red" size="16">${message}</font>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- 引入footer.jsp -->
<jsp:include page="footer.jsp"></jsp:include>
</html>
