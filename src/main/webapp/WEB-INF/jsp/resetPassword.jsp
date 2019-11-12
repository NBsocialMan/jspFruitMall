
<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/7/5
  Time: 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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
</head>
<body>

<c:if test="${not empty message}">
    ${message}
</c:if>
<c:if test="${ms==1}">
    <form action="/user/modifyPasswordWhenForget.do">
        邮箱：<input name="email" value="${email}" disabled>
        请输入新密码：<input name="password" type="text">
        <input type="submit" value="修改">
    </form>

</c:if>
<c:if test="${ms!=1}">
    <form action="/user/forgetTest.do" method="post">
        请输入你注册的邮箱：<input name="email" type="text" id="email">
        <a onclick="getRegisterCode()" style="cursor: pointer">获取验证码</a>
        验证码：<input name="code" type="text">
        <input type="submit" value="提交">
    </form>
    <script>
        function getRegisterCode() {
            var elementById = document.getElementById("email");
            $.post(
                "/user/getForgetCode.do",
                {email:elementById.value},
                function (data) {
                    alert(data);
                },
                "text"
            );
        }
    </script>
</c:if>


</body>
</html>
