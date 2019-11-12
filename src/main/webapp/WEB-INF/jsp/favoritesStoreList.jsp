<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/5/6
  Time: 9:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.0.0.min.js" type="text/javascript"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js" type="text/javascript"></script>
</head>
<script>
    function details(id) {
        var elementById = document.getElementById("details");
        var id1 = document.getElementById("storeId");
        id1.value =id;
        elementById.submit();
    }
    function FSLremove(id) {
        var elementById = document.getElementById("FSLdo");
        var id1 = document.getElementById("FCLstoreId");
        id1.value=id;
        elementById.submit();
    }
</script>
<body>
<jsp:include page="header.jsp"></jsp:include>
<br><br><br>
<form action="/store/storeDetails.do" method="post" id="details">
    <input type="hidden" name="storeId" id="storeId" >
</form>
<form method="post" id="FSLdo" action="/favoritesStorelist/remove.do">
    <input type="hidden" name="userId" value="${user.id}">
    <input type="hidden" name="storeId" id="FCLstoreId">
</form>
<ul class="nav nav-pills nav-justified">
    <li role="presentation" ><a onclick="favoritesCommodity()">&nbsp;&nbsp;收藏的宝贝&nbsp;&nbsp;</a></li>
    <li role="presentation"class="active"><a onclick="favoritesStore()">&nbsp;&nbsp;收藏的店铺&nbsp;&nbsp;</a></li>
</ul>
<br><br>

<c:forEach items="${storeList}" var="store">
    <div class="thumbnail row clearfix col-sm-5" style="height:200px;margin-left: 90px;margin-bottom: 30px">
        <div class=" row clearfix ">
            <div class="col-sm-4 column">
                <img style="width: 80px;height: 80px;margin-left: 20px" src="/static/store/storePictures/${store.store.storePicture}.jpg">
            </div>
            <div class="col-sm-8 column">
                <h4><span class="label label-primary"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;${store.store.storeName}</span></h4>
                <h4>${store.store.storeAddress}</h4>
            </div>
            <div class="col-sm-12">
                <h5>${store.store.storeIntroduction}</h5>
            </div>
            <div class="col-sm-12">
                <p><a onclick="details(${store.store.storeId})" class="btn btn-primary" role="button">进店逛逛</a> <a onclick="FSLremove(${store.store.storeId})" class="btn btn-default" role="button">残忍删除</a></p>
            </div>

        </div>

    </div>
</c:forEach>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
