<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/6/20
  Time: 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>订单管理</title>
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/Style1.css"
          rel="stylesheet" type="text/css" />
</head>
<script>
    function skip(current) {
        var form = document.getElementById("form");
        var currentid = document.getElementById("currentid");

        currentid.value = current;
        form.submit();
    }
    function jump() {
        var form = document.getElementById("jumpform");
        form.submit();
    }
    function orderDetails(id) {
        var elementById = document.getElementById("orderDetails");
        var id1 = document.getElementById("orderId");
        id1.value=id;
        elementById.submit();
    }
</script>
<body>

<form id="form" action="/admin/getOrderList.do" method="post">
    <input id="currentid" type="hidden" name="currentPage"  >
</form>
<form id="orderDetails" action="/admin/orderDetails.do" method="post">
    <input id="orderId" type="hidden" name="orderId"  >
</form>
<br>

<table cellSpacing="1" cellPadding="0" width="100%" align="center"
       bgColor="#f5fafe" border="0">
    <TBODY>
    <tr>
        <td class="ta_01" align="center" bgColor="#afd1f3"><strong>订单列表</strong>
        </TD>
    </tr>
    <tr>
        <td class="ta_01" align="right">

        </td>
    </tr>
    <tr>
        <td class="ta_01" align="center" bgColor="#f5fafe">
            <table cellspacing="0" cellpadding="1" rules="all"
                   bordercolor="gray" border="1" id="DataGrid1"
                   style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
                <tr style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
                    <td align="center" width="5%">订单序号</td>
                    <td align="center" width="17%">订单时间</td>
                    <td align="center" width="10%">订单店铺</td>
                    <td align="center" width="10%">订单详情</td>
                    <td align="center" width="10%">订单金额</td>
                    <td align="center" width="10%">订单状态</td>
                    <%--<td width="7%" align="center">编辑</td>--%>
                    <%--<td width="7%" align="center">删除</td>--%>
                </tr>
                <c:forEach items="${orderList.list}" var="order">


                    <tr onmouseover="this.style.backgroundColor = 'white'"
                        onmouseout="this.style.backgroundColor = '#F5FAFE';">
                        <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                            width="5%">${order.orderId}</td>
                        <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                            width="10%">${order.orderTime}</td>
                        <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                            width="17%">${order.store.storeName}</td>
                        <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                            width="17%"><a onclick="orderDetails(${order.orderId})">查看详情</a></td>
                        <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                            width="17%">${order.orderPrice}</td>
                        <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                            width="5%">
                            <c:if test="${order.orderState==1}">
                                <font style="color: green">已付款</font>
                            </c:if>
                            <c:if test="${order.orderState==0}">
                                <font style="color: darkorange">未付款</font>
                            </c:if>
                            <c:if test="${order.orderState==2}">
                                <font style="color: red">待发货</font>
                            </c:if>
                        </td>
                        <%--<td align="center" style="HEIGHT: 22px"><a--%>
                                <%--onclick="modifyStoreUI(${store.storeId})" style="cursor: pointer">--%>
                            <%--<img src="${pageContext.request.contextPath}/static/adminImages/i_edit.gif"--%>
                                    <%--border="0" style="CURSOR: hand">--%>
                        <%--</a></td>--%>

                        <%--<td align="center" style="HEIGHT: 22px"><a onclick="delOrder(${order.orderId})"> <img--%>
                                <%--src="${pageContext.request.contextPath}/static/adminImages/i_del.gif"--%>
                                <%--width="16" height="16" border="0" style="CURSOR: hand">--%>
                        <%--</a></td>--%>
                        <form action="/admin/delOrder.do" method="post" id="delOrderForm">
                            <input name="orderId" id="delOrderId" type="hidden">
                        </form>
                        <script>
                            function delOrder(id) {
                                var a = window.confirm("尊敬的管理员,\u000d确定要删除订单号为"+id+"的订单吗？\u000d这是一个不可撤销的操作,请谨慎操作！");
                                if(a==true){
                                    var elementById = document.getElementById("delOrderForm");
                                    var id1 = document.getElementById("delOrderId");
                                    id1.value=id;
                                    elementById.submit();
                                }
                            }
                        </script>
                    </tr>
                </c:forEach>
            </table>
        </td>
    </tr>

    </TBODY>
</table>
<div style="width: 600px;  margin-top: 90px;margin-left:50px">


    <ul class="pagination" style="width:560px;text-align: center; margin-top: 10px;margin-left: 450px;">
        <%--首页--%>
        <li class=""><a onclick="skip(1)" href="javascript:;" aria-label="Previous">首页</a></li>
        <%--左键--%>
        <c:if test="${orderList.currentPage == 1} ">
            <li class="disabled"><a href="#" aria-label="Previous"><span
                    aria-hidden="true">&laquo;</span></a></li>
        </c:if>
        <c:if test="${orderList.currentPage != 1}">
            <li class=""><a onclick="skip(${orderList.currentPage-1})" href="javascript:;" aria-label="Previous"><span
                    aria-hidden="true">&laquo;</span></a></li>
        </c:if>


        <%--中间页码--%>
        <c:forEach var="p"  begin="${orderList.currentPage-2>0 ? orderList.currentPage-2 : 1 }" end="${orderList.currentPage+2<orderList.pageTotal ? orderList.currentPage+2 :orderList.pageTotal}">
            <c:if test="${p == orderList.currentPage}">
                <li class="active"><a href="javascript:;">${p}</a></li>
            </c:if>
            <c:if test="${p != orderList.currentPage}">
                <li class=""><a onclick="skip(${p})" href="javascript:;" aria-label="Previous">${p}</a></li>
            </c:if>
        </c:forEach>

        <%--右键--%>
        <c:if test="${orderList.currentPage == orderList.pageTotal}}">
            <li class="disabled"><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
            </a></li>
        </c:if>
        <c:if test="${orderList.currentPage != orderList.pageTotal}">
            <li class=""><a onclick="skip(${orderList.currentPage+1})" aria-label="Next" href="javascript:;"> <span aria-hidden="true">&raquo;</span>
            </a></li>
        </c:if>

        <%--尾页--%>
        <li class=""><a onclick="skip(${orderList.pageTotal})" href="javascript:;" aria-label="Previous">尾页</a></li>

        <%--显示页码的总页数--%>
        <li ><a >共${orderList.pageTotal}页</a></li>
        <%--跳转--%>

        <div class="input-group" style="width: 100px">
            <form id="jumpform" action="/admin/getOrderList.do">
                <input type="text" name="currentPage" class="form-control" placeholder="跳到" style="width: 60px">
            </form>
            <span class="input-group-btn" style="width: 50px">
        <button class="btn btn-default" type="button" onclick="jump()">Go!</button>
      </span>
        </div>

        <!-- /input-group --><!-- /.col-lg-6 -->

    </ul>

</div>

</body>
</html>
