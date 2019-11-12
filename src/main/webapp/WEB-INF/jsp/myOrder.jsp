
<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/5/17
  Time: 10:48
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
    function cancelOrder(id) {
        var a = window.confirm("确定要取消订单吗");
        if(a==true){
            var elementById = document.getElementById("cancelOrder");
            var id1 = document.getElementById("orderId");
            id1.value=id;
            elementById.submit();
        }
    }
    function paymentUI(id) {
        var elementById = document.getElementById("paymentUI");
        var id1 = document.getElementById("paymentOrderId");
        id1.value=id;
        elementById.submit();
    }
    function storeDetails(id) {
        var elementById = document.getElementById("storeDetails");
        var id1 = document.getElementById("storeId");
        id1.value=id;
        elementById.submit();
    }
    function orderDetails(id) {
        var elementById = document.getElementById("orderDetails");
        var id1 = document.getElementById("detailsOrderId");
        id1.value=id;
        elementById.submit();
    }

    function receivingGoods(id) {
        var a = window.confirm("确定要收货吗？");
        if(a){
            var elementById = document.getElementById("receivingGoods");
            var id1 = document.getElementById("receivingOrderId");
            id1.value=id;
            elementById.submit();
        }
    }
    
</script>
<body>
<jsp:include page="header.jsp"></jsp:include>
<br><br><br>
<c:if test="${message==1}">
    <div class="alert alert-success alert-dismissible" role="alert" style="margin: auto;width: 1000px;height: 70px">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <strong>付款成功！</strong> <br>
    </div>
</c:if>
<c:if test="${message==3}">
    <div class="alert alert-success alert-dismissible" role="alert" style="margin: auto;width: 1000px;height: 70px">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <strong>您已确认收货！</strong> <br>
    </div>
</c:if>
<c:if test="${message==2}">
    <div class="alert alert-warning alert-dismissible" role="alert" style="margin: auto;width: 1000px;height: 70px">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <strong>卖家已经发货！您现在不能取消订单，如有问题请联系卖家！</strong> <br>
    </div>
</c:if>
<c:if test="${message==0}">
    <div class="alert alert-warning alert-dismissible" role="alert" style="margin: auto;width: 1000px;height: 70px">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <strong>订单已取消！</strong> <br>
    </div>
</c:if>

<form id="receivingGoods" action="/order/receivingGoods.do" method="post">
    <input name="userId" value="${user.id}" type="hidden">
    <input name="orderId" id="receivingOrderId" type="hidden">
</form>
<form id="paymentUI" action="/order/paymentUI.do"method="post">
    <input name="orderId" id="paymentOrderId" type="hidden">
</form>
<form action="/store/storeDetails.do" id="storeDetails">
    <input type="hidden" name="storeId" id="storeId">
</form>
<form action="/order/cancelOrder.do" id="cancelOrder" method="post">
    <input name="userId" value="${user.id}" type="hidden">
    <input name="orderId" id="orderId" type="hidden">
</form>
<form action="/order/orderDetails.do" id="orderDetails" method="post">
    <input name="orderId" id="detailsOrderId" TYPE="hidden">
</form>
<div class="row">
   <c:choose>
       <c:when test="${empty state}">
           <div style="margin:0 auto; margin-top:10px;width:1100px;">
               <INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回"/>
               <strong style="font-size:16px;margin:5px 0;">我的订单</strong>
               <table class="table table-bordered">
                   <tbody>
                   <tr class="warning">
                       <th>订单店铺</th>
                       <th>订单时间</th>
                       <th>订单详情</th>
                       <th>订单金额</th>
                       <th>订单状态</th>
                       <th>操作</th>
                   </tr>

                       <%--遍历购物项集合--%>
                   <c:forEach items="${orderMyPage.list}" var="order">

                       <tr class="active">
                           <td width="20%">
                               <a target="_blank" onclick="storeDetails(${order.store.storeId})" style="cursor: pointer">${order.store.storeName}</a>
                           </td>
                           <td width="28%">
                                   ${order.orderTime}
                           </td>

                           <td width="9%">
                               <span class="subtotal"><a ONCLICK="orderDetails(${order.orderId})" style="cursor: pointer">查看详情</a></span>
                           </td>

                           <td width="10%">
                               <span class="subtotal">￥:${order.orderPrice}</span>
                           </td>

                           <td width="15%">
                                   <%--<span class="subtotal">￥${citem.subtotal}</span>--%>
                               <c:choose>
                                   <c:when test="${order.orderState==0}">
                                       未付款
                                   </c:when>
                                   <c:when test="${order.orderState==1}">
                                       已付款，待发货
                                   </c:when>
                                   <c:when test="${order.orderState==2}">
                                       已发货，待收货
                                   </c:when>
                                   <c:when test="${order.orderState==3}">
                                       已收货，待评价
                                   </c:when>
                                   <c:when test="${order.orderState==4}">
                                       已评价
                                   </c:when>

                               </c:choose>

                           </td>
                           <td width="15%">
                               <c:choose>
                                   <c:when test="${order.orderState==0}">
                                       <a onclick="paymentUI(${order.orderId})"style="cursor: pointer">立即付款</a>
                                       <a onclick="cancelOrder(${order.orderId})" style="cursor:pointer;">取消订单</a>
                                   </c:when>
                                   <c:when test="${order.orderState==1}">
                                       <a onclick="cancelOrder(${order.orderId})" style="cursor:pointer;">取消订单</a>
                                   </c:when>
                                   <c:when test="${order.orderState==2}">
                                       <a onclick="receivingGoods(${order.orderId})" style="cursor:pointer;">确认收货</a>
                                   </c:when>
                                   <c:when test="${order.orderState==3}">
                                       <a onclick="orderDetails(${order.orderId})" style="cursor:pointer;">评价</a>
                                   </c:when>
                                   <c:when test="${order.orderState==4}">
                                       <a style="color: green">订单已完成</a>
                                   </c:when>
                               </c:choose>
                           </td>
                       </tr>
                       <script>
                           x(${shoppingCart.commodity.commodityCurrentprice*shoppingCart.commodityNumber});
                       </script>
                   </c:forEach>

                   </tbody>
               </table>
           </div>
       </c:when>
       <c:when test="${state==0}">
           <div style="margin:0 auto; margin-top:10px;width:1100px;">
               <INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回"/>
               <strong style="font-size:16px;margin:5px 0;">我的未付款订单</strong>
               <table class="table table-bordered">
                   <tbody>
                   <tr class="warning">
                       <th>订单店铺</th>
                       <th>订单时间</th>
                       <th>订单详情</th>
                       <th>订单金额</th>
                       <th>订单状态</th>
                       <th>操作</th>
                   </tr>

                       <%--遍历购物项集合--%>
                   <c:forEach items="${orderList}" var="order">

                       <tr class="active">
                           <td width="20%">
                               <a target="_blank" onclick="storeDetails(${order.store.storeId})" style="cursor: pointer">${order.store.storeName}</a>
                           </td>
                           <td width="28%">
                                   ${order.orderTime}
                           </td>

                           <td width="9%">
                               <span class="subtotal"><a ONCLICK="orderDetails(${order.orderId})" style="cursor: pointer">查看详情</a></span>
                           </td>

                           <td width="10%">
                               <span class="subtotal">￥:${order.orderPrice}</span>
                           </td>

                           <td width="15%">
                                   <%--<span class="subtotal">￥${citem.subtotal}</span>--%>
                               <c:choose>
                                   <c:when test="${order.orderState==0}">
                                       未付款
                                   </c:when>
                                   <c:when test="${order.orderState==1}">
                                       已付款，待发货
                                   </c:when>
                                   <c:when test="${order.orderState==2}">
                                       已发货，待收货
                                   </c:when>
                                   <c:when test="${order.orderState==3}">
                                       已收货，待评价
                                   </c:when>
                                   <c:when test="${order.orderState==4}">
                                       已评价
                                   </c:when>

                               </c:choose>

                           </td>
                           <td width="15%">
                               <c:choose>
                                   <c:when test="${order.orderState==0}">
                                       <a onclick="paymentUI(${order.orderId})"style="cursor: pointer">立即付款</a>
                                       <a onclick="cancelOrder(${order.orderId})" style="cursor:pointer;">取消订单</a>
                                   </c:when>
                                   <c:when test="${order.orderState==1}">
                                       <a onclick="cancelOrder(${order.orderId})" style="cursor:pointer;">取消订单</a>
                                   </c:when>
                                   <c:when test="${order.orderState==2}">
                                       <a onclick="receivingGoods(${order.orderId})" style="cursor:pointer;">确认收货</a>
                                   </c:when>
                                   <c:when test="${order.orderState==3}">
                                       <a onclick="orderDetails(${order.orderId})" style="cursor:pointer;">评价</a>
                                   </c:when>
                                   <c:when test="${order.orderState==4}">
                                       <a style="color: green">订单已完成</a>
                                   </c:when>
                               </c:choose>
                           </td>
                       </tr>
                       <script>
                           x(${shoppingCart.commodity.commodityCurrentprice*shoppingCart.commodityNumber});
                       </script>
                   </c:forEach>

                   </tbody>
               </table>
           </div>
       </c:when>
       <c:when test="${state==1}">
           <div style="margin:0 auto; margin-top:10px;width:1100px;">
               <INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回"/>
               <strong style="font-size:16px;margin:5px 0;">等待卖家发货订单</strong>
               <table class="table table-bordered">
                   <tbody>
                   <tr class="warning">
                       <th>订单店铺</th>
                       <th>订单时间</th>
                       <th>订单详情</th>
                       <th>订单金额</th>
                       <th>订单状态</th>
                       <th>操作</th>
                   </tr>

                       <%--遍历购物项集合--%>
                   <c:forEach items="${orderList}" var="order">

                       <tr class="active">
                           <td width="20%">
                               <a target="_blank" onclick="storeDetails(${order.store.storeId})" style="cursor: pointer">${order.store.storeName}</a>
                           </td>
                           <td width="28%">
                                   ${order.orderTime}
                           </td>

                           <td width="9%">
                               <span class="subtotal"><a ONCLICK="orderDetails(${order.orderId})" style="cursor: pointer">查看详情</a></span>
                           </td>

                           <td width="10%">
                               <span class="subtotal">￥:${order.orderPrice}</span>
                           </td>

                           <td width="15%">
                                   <%--<span class="subtotal">￥${citem.subtotal}</span>--%>
                               <c:choose>
                                   <c:when test="${order.orderState==0}">
                                       未付款
                                   </c:when>
                                   <c:when test="${order.orderState==1}">
                                       已付款，待发货
                                   </c:when>
                                   <c:when test="${order.orderState==2}">
                                       已发货，待收货
                                   </c:when>
                                   <c:when test="${order.orderState==3}">
                                       已收货，待评价
                                   </c:when>
                                   <c:when test="${order.orderState==4}">
                                       已评价
                                   </c:when>

                               </c:choose>

                           </td>
                           <td width="15%">
                               <c:choose>
                                   <c:when test="${order.orderState==0}">
                                       <a onclick="paymentUI(${order.orderId})"style="cursor: pointer">立即付款</a>
                                       <a onclick="cancelOrder(${order.orderId})" style="cursor:pointer;">取消订单</a>
                                   </c:when>
                                   <c:when test="${order.orderState==1}">
                                       <a onclick="cancelOrder(${order.orderId})" style="cursor:pointer;">取消订单</a>
                                   </c:when>
                                   <c:when test="${order.orderState==2}">
                                       <a onclick="receivingGoods(${order.orderId})" style="cursor:pointer;">确认收货</a>
                                   </c:when>
                                   <c:when test="${order.orderState==3}">
                                       <a onclick="orderDetails(${order.orderId})" style="cursor:pointer;">评价</a>
                                   </c:when>
                                   <c:when test="${order.orderState==4}">
                                       <a style="color: green">订单已完成</a>
                                   </c:when>
                               </c:choose>
                           </td>
                       </tr>
                       <script>
                           x(${shoppingCart.commodity.commodityCurrentprice*shoppingCart.commodityNumber});
                       </script>
                   </c:forEach>

                   </tbody>
               </table>
           </div>
       </c:when>
       <c:when test="${state==2}">
           <div style="margin:0 auto; margin-top:10px;width:1100px;">
               <INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回"/>
               <strong style="font-size:16px;margin:5px 0;">等待收货订单</strong>
               <table class="table table-bordered">
                   <tbody>
                   <tr class="warning">
                       <th>订单店铺</th>
                       <th>订单时间</th>
                       <th>订单详情</th>
                       <th>订单金额</th>
                       <th>订单状态</th>
                       <th>操作</th>
                   </tr>

                       <%--遍历购物项集合--%>
                   <c:forEach items="${orderList}" var="order">

                       <tr class="active">
                           <td width="20%">
                               <a target="_blank" onclick="storeDetails(${order.store.storeId})" style="cursor: pointer">${order.store.storeName}</a>
                           </td>
                           <td width="28%">
                                   ${order.orderTime}
                           </td>

                           <td width="9%">
                               <span class="subtotal"><a ONCLICK="orderDetails(${order.orderId})" style="cursor: pointer">查看详情</a></span>
                           </td>

                           <td width="10%">
                               <span class="subtotal">￥:${order.orderPrice}</span>
                           </td>

                           <td width="15%">
                                   <%--<span class="subtotal">￥${citem.subtotal}</span>--%>
                               <c:choose>
                                   <c:when test="${order.orderState==0}">
                                       未付款
                                   </c:when>
                                   <c:when test="${order.orderState==1}">
                                       已付款，待发货
                                   </c:when>
                                   <c:when test="${order.orderState==2}">
                                       已发货，待收货
                                   </c:when>
                                   <c:when test="${order.orderState==3}">
                                       已收货，待评价
                                   </c:when>
                                   <c:when test="${order.orderState==4}">
                                       已评价
                                   </c:when>

                               </c:choose>

                           </td>
                           <td width="15%">
                               <c:choose>
                                   <c:when test="${order.orderState==0}">
                                       <a onclick="paymentUI(${order.orderId})"style="cursor: pointer">立即付款</a>
                                       <a onclick="cancelOrder(${order.orderId})" style="cursor:pointer;">取消订单</a>
                                   </c:when>
                                   <c:when test="${order.orderState==1}">
                                       <a onclick="cancelOrder(${order.orderId})" style="cursor:pointer;">取消订单</a>
                                   </c:when>
                                   <c:when test="${order.orderState==2}">
                                       <a onclick="receivingGoods(${order.orderId})" style="cursor:pointer;">确认收货</a>
                                   </c:when>
                                   <c:when test="${order.orderState==3}">
                                       <a onclick="orderDetails(${order.orderId})" style="cursor:pointer;">评价</a>
                                   </c:when>
                                   <c:when test="${order.orderState==4}">
                                       <a style="color: green">订单已完成</a>
                                   </c:when>
                               </c:choose>
                           </td>
                       </tr>
                       <script>
                           x(${shoppingCart.commodity.commodityCurrentprice*shoppingCart.commodityNumber});
                       </script>
                   </c:forEach>

                   </tbody>
               </table>
           </div>
       </c:when>
       <c:when test="${state==3}">
           <div style="margin:0 auto; margin-top:10px;width:1100px;">
               <INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回"/>
               <strong style="font-size:16px;margin:5px 0;">待评价订单</strong>
               <table class="table table-bordered">
                   <tbody>
                   <tr class="warning">
                       <th>订单店铺</th>
                       <th>订单时间</th>
                       <th>订单详情</th>
                       <th>订单金额</th>
                       <th>订单状态</th>
                       <th>操作</th>
                   </tr>

                       <%--遍历购物项集合--%>
                   <c:forEach items="${orderList}" var="order">

                       <tr class="active">
                           <td width="20%">
                               <a target="_blank" onclick="storeDetails(${order.store.storeId})" style="cursor: pointer">${order.store.storeName}</a>
                           </td>
                           <td width="28%">
                                   ${order.orderTime}
                           </td>

                           <td width="9%">
                               <span class="subtotal"><a ONCLICK="orderDetails(${order.orderId})" style="cursor: pointer">查看详情</a></span>
                           </td>

                           <td width="10%">
                               <span class="subtotal">￥:${order.orderPrice}</span>
                           </td>

                           <td width="15%">
                                   <%--<span class="subtotal">￥${citem.subtotal}</span>--%>
                               <c:choose>
                                   <c:when test="${order.orderState==0}">
                                       未付款
                                   </c:when>
                                   <c:when test="${order.orderState==1}">
                                       已付款，待发货
                                   </c:when>
                                   <c:when test="${order.orderState==2}">
                                       已发货，待收货
                                   </c:when>
                                   <c:when test="${order.orderState==3}">
                                       已收货，待评价
                                   </c:when>
                                   <c:when test="${order.orderState==4}">
                                       已评价
                                   </c:when>

                               </c:choose>

                           </td>
                           <td width="15%">
                               <c:choose>
                                   <c:when test="${order.orderState==0}">
                                       <a onclick="paymentUI(${order.orderId})"style="cursor: pointer">立即付款</a>
                                       <a onclick="cancelOrder(${order.orderId})" style="cursor:pointer;">取消订单</a>
                                   </c:when>
                                   <c:when test="${order.orderState==1}">
                                       <a onclick="cancelOrder(${order.orderId})" style="cursor:pointer;">取消订单</a>
                                   </c:when>
                                   <c:when test="${order.orderState==2}">
                                       <a onclick="receivingGoods(${order.orderId})" style="cursor:pointer;">确认收货</a>
                                   </c:when>
                                   <c:when test="${order.orderState==3}">
                                       <a onclick="orderDetails(${order.orderId})" style="cursor:pointer;">评价</a>
                                   </c:when>
                                   <c:when test="${order.orderState==4}">
                                       <a style="color: green">订单已完成</a>
                                   </c:when>
                               </c:choose>
                           </td>
                       </tr>
                       <script>
                           x(${shoppingCart.commodity.commodityCurrentprice*shoppingCart.commodityNumber});
                       </script>
                   </c:forEach>

                   </tbody>
               </table>
           </div>
       </c:when>
   </c:choose>

<c:if test="${orderMyPage.pageTotal>0}">
    <form id="form" action="/order/myOrder.do" method="post">
        <input type="hidden" name="userId" value="${user.id}"  >
        <input id="currentid" type="hidden" name="currentPage"  >
    </form>
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
    </script>
    <!--分页 -->
    <div style="width: 600px;  margin-top: 90px;margin-left:550px">


        <ul class="pagination" style="width:550px;text-align: center; margin-top: 10px;">
                <%--首页--%>
            <li class=""><a onclick="skip(1)" href="javascript:;" aria-label="Previous">首页</a></li>
                <%--左键--%>
            <c:if test="${orderMyPage.currentPage == 1} ">
                <li class="disabled"><a href="#" aria-label="Previous"><span
                        aria-hidden="true">&laquo;</span></a></li>
            </c:if>
            <c:if test="${orderMyPage.currentPage != 1}">
                <li class=""><a onclick="skip(${orderMyPage.currentPage-1})" href="javascript:;" aria-label="Previous"><span
                        aria-hidden="true">&laquo;</span></a></li>
            </c:if>


                <%--中间页码--%>
            <c:forEach var="p"  begin="${orderMyPage.currentPage-2>0 ? orderMyPage.currentPage-2 : 1 }" end="${orderMyPage.currentPage+2<orderMyPage.pageTotal ? orderMyPage.currentPage+2 :orderMyPage.pageTotal}">
                <c:if test="${p == orderMyPage.currentPage}">
                    <li class="active"><a href="javascript:;">${p}</a></li>
                </c:if>
                <c:if test="${p != orderMyPage.currentPage}">
                    <li class=""><a onclick="skip(${p})" href="javascript:;" aria-label="Previous">${p}</a></li>
                </c:if>
            </c:forEach>

                <%--右键--%>
            <c:if test="${orderMyPage.currentPage == orderMyPage.pageTotal}}">
                <li class="disabled"><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                </a></li>
            </c:if>
            <c:if test="${orderMyPage.currentPage != orderMyPage.pageTotal}">
                <li class=""><a onclick="skip(${orderMyPage.currentPage+1})" aria-label="Next" href="javascript:;"> <span aria-hidden="true">&raquo;</span>
                </a></li>
            </c:if>

                <%--尾页--%>
            <li class=""><a onclick="skip(${orderMyPage.pageTotal})" href="javascript:;" aria-label="Previous">尾页</a></li>

                <%--显示页码的总页数--%>
            <li ><a >共${orderMyPage.pageTotal}页</a></li>
                <%--跳转--%>

            <div class="input-group" style="width: 100px">
                <form id="jumpform" action="/order/myOrder.do">
                    <input id="jumpNum" type="text" name="currentPage" class="form-control" placeholder="跳到" style="width: 60px">
                </form>
                <span class="input-group-btn" style="width: 50px">
        <button class="btn btn-default" type="button" onclick="jump()">Go!</button>
      </span>
            </div>

            <!-- /input-group --><!-- /.col-lg-6 -->

        </ul>

    </div>
    <!-- 分页结束 -->
</c:if>
</div>
<script>
    var elementById = document.getElementById("jumpNum");
    elementById.onblur=function () {
        if (parseInt(elementById.value)>${orderMyPage.pageTotal}){
            alert("您所填写的页数超过总页数!");
            elementById.value=1;
        }
    }
</script>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
