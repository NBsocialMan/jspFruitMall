<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/5/17
  Time: 11:46
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
    <script src="${pageContext.request.contextPath}/static/js/jquery.validate.min.js" type="text/javascript"></script>
</head>
<script>
    function commentUI(id) {
        var elementById = document.getElementById("commentUI");
        var id1 = document.getElementById("commodityId");
        id1.value=id;
        elementById.submit();
    }
    function details(id) {
        var elementById = document.getElementById("details");
        var id1 = document.getElementById("commodityDetailsId");
        id1.value=id;
        elementById.submit();
    }
</script>
<body>
<jsp:include page="header.jsp"></jsp:include>
<br><br><br>
<form action="/orderDetails/commentUI.do" method="post" id="commentUI">
    <input name="commodityId" id="commodityId" type="hidden">
    <input name="orderId" value="${order.orderId}" type="hidden">
    <input name="userId" value="${user.id}" type="hidden">
</form>
<form action="/commodity/commodityDetail.do" method="post" id="details">
    <input name="commodityId" id="commodityDetailsId" type="hidden">
</form>
<c:if test="${order.orderState==3||order.orderState==4}">
<div style="margin:0 auto; margin-top:10px;width:1000px;">
    <INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回订单"/>
    <strong style="font-size:16px;margin:5px 0;">订单详情</strong>
    <table class="table table-bordered">
        <tbody>
        <tr class="warning">
            <th>图片</th>
            <th>商品</th>
            <th>价格</th>
            <th>数量</th>
            <th>小计</th>
            <th>评价状态</th>
        </tr>

        <%--遍历购物项集合--%>
        <c:forEach items="${orderDetailsList}" var="orderDetails">

            <tr class="active">
                <td width="10%">
                    <img src="/static/commodity/commodityPictures/${orderDetails.commodity.commodityPicture}.jpg" width="70" height="70">
                </td>
                <td width="40%">
                    <a target="_blank">${orderDetails.commodity.commodityName}</a>
                </td>
                <td width="20%">
                    ￥${orderDetails.commodity.commodityCurrentprice}
                </td>
                <td width="10%">
                        <%--<input type="text" name="quantity" disabled value="${citem.num}" maxlength="4" size="10">--%>
                    ${orderDetails.commodityNumber}
                </td>
                <td width="10%">
                        <%--<span class="subtotal">￥${citem.subtotal}</span>--%>
                    <span class="subtotal">￥:${orderDetails.commodityNumber*orderDetails.commodity.commodityCurrentprice}</span>

                </td>
                <td width="25%">
                        <%--<input type="text" name="quantity" disabled value="${citem.num}" maxlength="4" size="10">--%>

                    <c:choose>
                        <c:when test="${orderDetails.state==0}">
                            <a onclick="commentUI(${orderDetails.commodityId})" style="color: #ec971f;cursor: pointer">未评价</a>
                        </c:when>
                        <c:when test="${orderDetails.state==1}">
                            商品已评价,<a onclick="details(${orderDetails.commodityId})" style="cursor: pointer">查看评价</a>
                        </c:when>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
    </div>
    <hr />
</c:if>

<c:if test="${order.orderState==0||order.orderState==1||order.orderState==2}">
    <div style="margin:0 auto; margin-top:10px;width:1000px;">
        <INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回订单"/>
        <strong style="font-size:16px;margin:5px 0;">订单详情</strong>
        <table class="table table-bordered">
            <tbody>
            <tr class="warning">
                <th>图片</th>
                <th>商品</th>
                <th>价格</th>
                <th>数量</th>
                <th>小计</th>
            </tr>

                <%--遍历购物项集合--%>
            <c:forEach items="${orderDetailsList}" var="orderDetails">

                <tr class="active">
                    <td width="10%">
                        <img src="/static/commodity/commodityPictures/${orderDetails.commodity.commodityPicture}.jpg" width="70" height="70">
                    </td>
                    <td width="40%">
                        <a target="_blank">${orderDetails.commodity.commodityName}</a>
                    </td>
                    <td width="20%">
                        ￥${orderDetails.commodity.commodityCurrentprice}
                    </td>
                    <td width="10%">
                            <%--<input type="text" name="quantity" disabled value="${citem.num}" maxlength="4" size="10">--%>
                            ${orderDetails.commodityNumber}
                    </td>
                    <td width="25%">
                            <%--<span class="subtotal">￥${citem.subtotal}</span>--%>
                        <span class="subtotal">￥:${orderDetails.commodityNumber*orderDetails.commodity.commodityCurrentprice}</span>

                    </td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>
    <hr />
</c:if>


    <c:if test="${order.orderState==1||order.orderState==2||order.orderState==3}">

        <c:choose>
            <c:when test="${order.orderState==1||order.orderState==2}">
                <div class="alert alert-success" role="alert" style="margin-left: 260px;width: 1000px">
                    <a href="#" class="alert-link">提示！订单信息已经提交，若要更改订单配送信息请联系商家。</a>
                </div>
            </c:when>
            <c:when test="${order.orderState==3}">
                <div class="alert alert-success" role="alert" style="margin-left: 260px;width: 1000px">
                    <a href="#" class="alert-link">提示！订单已收货！</a>
                </div>
            </c:when>
        </c:choose>
        <form class="form-horizontal"
              style="margin-top: 5px; margin-left: 150px;">
            <div class="form-group">
                <label for="address" class="col-sm-2 control-label">收货地址</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="address" name="address"
                           placeholder="收货地址"  disabled value="${order.address}">
                </div>
            </div>
            <div class="form-group">
                <label for="liaison" class="col-sm-2 control-label">收货人</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="liaison" name="liaison"
                           placeholder="收货人" disabled value="${order.liaison}">
                </div>
            </div>
            <div class="form-group">
                <label for="telephone" class="col-sm-2 control-label">联系电话</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="telephone" name="telephone"
                           placeholder="联系方式" disabled value="${order.telephone}">
                </div>
            </div>
        </form>
    </c:if>

    <c:if test="${order.orderState==0}">
        <div class="alert alert-warning" role="alert">
            <a href="#" class="alert-link">提示！ 您还未付款，请于付款页面确定订单配送信息。</a>
        </div>
    </c:if>

</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
