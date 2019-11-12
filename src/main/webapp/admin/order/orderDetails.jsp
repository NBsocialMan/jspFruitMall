<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/6/20
  Time: 10:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/Style1.css"
          rel="stylesheet" type="text/css" />
</head>
<body>
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

</body>
</html>
