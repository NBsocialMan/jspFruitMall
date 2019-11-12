<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/5/8
  Time: 11:30
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
</head>
<script>
    function details(id) {
        var form = document.getElementById("details");
        var hiddenid = document.getElementById("commodityId");
        hiddenid.value=id;
        form.submit();
    }
    function addF() {
        var form = document.getElementById("addFS");
        form.submit();
    }
</script>
<body>
<jsp:include page="header.jsp"></jsp:include>
<br><br><br>

<form id="addFS" action="/favoritesStorelist/add.do" method="post">
    <input type="hidden" name="userId" value="${user.id}">
    <input type="hidden" name="storeId"  value="${store.storeId}">
</form>
<div class="well" style="height: 100px">
    <div class="col-sm-1" style="margin-top: -10px">
        <img style="width: 80px;height: 80px;margin-left: 20px" src="/static/store/storePictures/${store.storePicture}.jpg">
    </div>
<div class="col-sm-11" style="margin-top: -30px">
    <h2><span class="label label-primary"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;${store.storeName}</span>&nbsp;</h2>
    <h4>${store.storeAddress}&nbsp;&nbsp;&nbsp;<a onclick="addF()" style="cursor: pointer"><span class="label label-primary">收藏店铺</span></a></h4>
</div>

</div>
<div class="well">${store.storeIntroduction}</div>
<c:if test="${not empty store.storePosterPicture1}">
    <img  src="/static/store/storePosterPictures/${store.storePosterPicture1}.jpg" style="height: 500px;width:800px;margin-left: 300px">
</c:if>
<c:if test="${not empty store.storePosterPicture2}">
    <img  src="/static/store/storePosterPictures/${store.storePosterPicture2}.jpg" style="height: 500px;width:800px;margin-left: 300px">
</c:if>
<c:if test="${not empty store.storePosterPicture3}">
    <img  src="/static/store/storePosterPictures/${store.storePosterPicture3}.jpg" style="height: 500px;width:800px;margin-left: 300px">
</c:if>

<c:if test="${not empty store.commodityList}">
    <div style="margin-left: 50px">
        <c:forEach items="${store.commodityList}" var="commodity">
            <div class="col-sm-4 col-md-4"style="width: 255px;height: 400px;margin-top: 20px;margin-left: 20px;">
                <div class="thumbnail"style="width: 255px;height: 400px" >
                    <form action="/commodity/commodityDetail.do" method="post" id="details">
                        <input type="hidden" name="commodityId" id="commodityId">
                    </form>
                    <a onclick="details(${commodity.commodityId})" style="cursor: pointer"><img src="/static/commodity/commodityPictures/${commodity.commodityPicture}.jpg" style="height: 220px;width: 300px" ></a>
                    <div style="margin-top: -10px">
                        <h3 style="color:#337ab7 ">￥: ${commodity.commodityCurrentprice}</h3>
                        <a onclick="details(${commodity.commodityId})" style="cursor: pointer;">
                            <p style="color:darkorange">${commodity.commodityName}</p></a>
                        <p style="color:darkorange">销量：${commodity.commoditySalesvolume}</p>

                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</c:if>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
