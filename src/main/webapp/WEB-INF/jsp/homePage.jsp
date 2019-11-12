<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/20
  Time: 20:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <title>水果蔬菜专卖商城</title>
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.0.0.min.js" type="text/javascript"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js" type="text/javascript"></script>
</head>
<body>
<!-- 引入header.jsp -->
<jsp:include page="header.jsp"></jsp:include>

<br>
<%--引入轮播图--%>
<jsp:include page="mainScreen.jsp"></jsp:include>
<!-- 引入header.jsp -->
<jsp:include page="footer.jsp"></jsp:include>

<script>
    <%--function registerSuccess() {--%>

        <%--alert(${message});--%>
    <%--}--%>
    <%--window.onload=registerSuccess();--%>
</script>
</body>
</html>
