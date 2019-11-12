<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/27
  Time: 20:35
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
        var elementById = document.getElementById("details");
        var cid = document.getElementById("commodityId");
        cid.value=id;
        elementById.submit();
    }
    function FCLremove(id) {
        var elementById = document.getElementById("FCLdo");
        elementById.action="/favoritesCommoditylist/remove.do";
        var cid = document.getElementById("FCLcommodityId");
        cid.value=id;
        elementById.submit();
    }
    function FCLbuy(id) {
        var elementById = document.getElementById("FCLdo");
        var cid = document.getElementById("FCLcommodityId");
        cid.value=id;
        elementById.action="/shoppingCart/addCart.do";
        elementById.submit();
    }
</script>
<body>
<jsp:include page="header.jsp"></jsp:include>
<br><br><br><br>
<ul class="nav nav-pills nav-justified">
    <li role="presentation" class="active"><a onclick="favoritesCommodity()" style="cursor: pointer">&nbsp;&nbsp;收藏的宝贝&nbsp;&nbsp;</a></li>
    <li role="presentation"><a onclick="favoritesStore()"style="cursor: pointer">&nbsp;&nbsp;收藏的店铺&nbsp;&nbsp;</a></li>
</ul>
<br><br>
<c:forEach items="${commodityList}" var="f">
    <div class="col-sm-4 col-md-4"style="width: 255px;height: 400px;margin-top: 20px;margin-left: 20px;">
        <div class="thumbnail"style="width: 255px;height: 400px" >
            <form action="/commodity/commodityDetail.do" method="post" id="details">
                <input type="hidden" name="commodityId" id="commodityId" >
            </form>
            <form method="post" id="FCLdo">
                <input type="hidden" name="userId" value="${user.id}">
                <input type="hidden" name="commodityId" id="FCLcommodityId">
                <input type="hidden" name="commodityNumber"  value="1">
            </form>
            <a onclick="details(${f.commodity.commodityId})" style="cursor: pointer"><img src="/static/commodity/commodityPictures/${f.commodity.commodityPicture}.jpg" alt="..." style="height: 220px;width: 300px" ></a>
            <div style="margin-top: -10px">
                <h3 style="color:#337ab7 ">￥: ${f.commodity.commodityCurrentprice}</h3>
                <a onclick="details(${f.commodity.commodityId})" style="cursor: pointer;">
                    <p style="color:darkorange">${f.commodity.commodityName}</p></a>
                <p style="color:darkorange">销量：${f.commodity.commoditySalesvolume}</p>
                <p><a onclick="FCLbuy(${f.commodity.commodityId})" class="btn btn-primary" role="button">等不及了，立即购买</a> <a onclick="FCLremove(${f.commodity.commodityId})" class="btn btn-default" role="button"style="cursor: pointer">残忍删除</a></p>
            </div>

            </div>
        </div>
    </div>
</c:forEach>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
