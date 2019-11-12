<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/6/20
  Time: 14:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.0.0.min.js" type="text/javascript"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery.validate.min.js" type="text/javascript"></script>
    <script  src="${pageContext.request.contextPath}/static/js/echarts.min.js" ></script>
</head>
<script>
    function details(id) {
        var form = document.getElementById("details");
        var hiddenid = document.getElementById("commodityId");
        hiddenid.value=id;
        form.submit();
    }
</script>
<body>
<jsp:include page="header.jsp"></jsp:include>
<br><br><br>
<form id="storeDetails" action="/store/storeDetails.do">
    <input name="storeId" type="hidden" id="storeId">
</form>
<script>
    function storeDetails(id) {
        var elementById = document.getElementById("storeDetails");
        var id1 = document.getElementById("storeId");
        id1.value=id;
        elementById.submit();
    }
</script>
<div style="margin-left: 40px;margin-top: 30px">
    <strong style="font-size:16px;margin:5px 0;margin-left: 50px;margin-top: 40px">我购买过</strong>
</div>

<div style="margin-left: 50px">
    <c:forEach items="${purchaseHistory}" var="details">
        <div class="col-sm-4 col-md-4"style="width: 255px;height: 400px;margin-top: 20px;margin-left: 20px;">
            <div class="thumbnail"style="width: 255px;height: 400px" >
                <form action="/commodity/commodityDetail.do" method="post" id="details">
                    <input type="hidden" name="commodityId" id="commodityId">
                </form>
                <a onclick="details(${details.commodity.commodityId})" style="cursor: pointer"><img src="/static/commodity/commodityPictures/${details.commodity.commodityPicture}.jpg" alt="..." style="height: 230px;width: 270px;margin-top: -10px;"></a>
                <div style="margin-top: -10px">
                    <h3 style="color:#337ab7 ">￥: ${details.commodity.commodityCurrentprice}</h3>
                    <a onclick="details(${details.commodity.commodityId})" style="cursor: pointer;">
                        <p style="color:darkorange">${details.commodity.commodityName}</p></a>
                    <p style="color:darkorange">销量：${details.commodity.commoditySalesvolume}</p>
                    <h4><a onclick="storeDetails(${details.commodity.store.storeId})" style="cursor: pointer"><span class="label label-primary"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;${details.commodity.store.storeName}</span></a>&nbsp;${details.commodity.store.storeAddress}</h4>

                </div>
            </div>
        </div>
    </c:forEach>
</div>
</body>
</html>
