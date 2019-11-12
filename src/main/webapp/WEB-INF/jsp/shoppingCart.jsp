<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/22
  Time: 15:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<body>
<jsp:include page="header.jsp"></jsp:include>
<br><br><br>
<script type="text/javascript">
    var totalPrice = 0.0;
    function x(p) {
        totalPrice+=p;
    }
    $(document).ready(function () {
        $("#ttp").val(totalPrice);
        // $("#price").val(totalPrice);
    });
    function removeCart(id){
        var elementById = document.getElementById("rform");
        var id1 = document.getElementById("commodityId");
        id1.value=id;
        elementById.submit();

    }
    function cleanupCart(){
        var a = window.confirm("确定要清空购物车吗");
        if(a==true){
            var elementById = document.getElementById("cleanupCart");
            elementById.submit();
        }
    }
    function newAddOrder() {
        if ($("#ttp").val()==0||$("#ttp").val()==0.0||$("#ttp").val()==undefined){
            alert("啥都没选");
        } else {
            var elementById = document.getElementById("newAddOrder");
            elementById.submit();
        }

    }

    function commodityDetails(id){
        var elementById = document.getElementById("commodityDetails");
        var id1 = document.getElementById("detailsCommodityId");
        id1.value=id;
        elementById.submit();
    }

    function storeDetails(id){
        var elementById = document.getElementById("storeDetails");
        var id1 = document.getElementById("detailsStoreId");
        id1.value=id;
        elementById.submit();
    }

    function commodityJia(id) {
        var elementById = document.getElementById("jiaCommodity");
        var id1 = document.getElementById("jiaCommodityId");
        id1.value=id;
        elementById.submit();
    }

    function commodityJian(id) {
        var elementById = document.getElementById("jianCommodity");
        var id1 = document.getElementById("jianCommodityId");
        id1.value=id;
        elementById.submit();
    }

</script>
<form action="/shoppingCart/commodityJia.do" method="post" id="jiaCommodity">
    <input name="userId" value="${user.id}" type="hidden">
    <input name="commodityId" type="hidden" id="jiaCommodityId">
</form>
<form action="/shoppingCart/commodityJian.do" method="post" id="jianCommodity">
    <input name="userId" value="${user.id}" type="hidden">
    <input name="commodityId" type="hidden" id="jianCommodityId">
</form>
<form id="rform" action="/shoppingCart/removeCart.do" method="post">
    <input type="hidden" name="userId" value="${user.id}">
    <input type="hidden" name="commodityId" id="commodityId" >
</form>
<form id="cleanupCart" action="/shoppingCart/cleanupCart.do" method="post">
    <input type="hidden" name="userId" value="${user.id}">
</form>
<form id="newAddOrder" action="/order/newAddOrder.do" method="post">
    <input type="hidden" name="userId"  value="${user.id}">
</form>
<form id="commodityDetails" action="/commodity/commodityDetail.do" method="post">
    <input type="hidden" name="commodityId" id="detailsCommodityId" >
</form>
<form id="storeDetails" action="/store/storeDetails.do" method="post">
    <input type="hidden" name="storeId" id="detailsStoreId" >
</form>
<div class="container">
    <div class="row">

        <div style="margin:0 auto; margin-top:10px;width:1100px;">
            <INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回"/>
            <strong style="font-size:16px;margin:5px 0;">我的购物车</strong><br>
            <button class="btn btn-danger btn-zan" type="button" onclick="allcheck(${user.id})">
                全选
            </button>
            <button class="btn btn-primary btn-zan" type="button" onclick="reallcheck(${user.id})">
                全不选
            </button>
            <table class="table table-bordered">
                <tbody>
                <tr class="warning">
                    <th>checked</th>
                    <th>商品图片</th>
                    <th>商品店铺</th>
                    <th>商品</th>
                    <th>价格</th>
                    <th>数量</th>
                    <th>小计</th>
                    <th>操作</th>
                </tr>
                <script>
                    $.ajaxSetup({
                        async : false
                    });
                    function check(e,id) {
                        var url = "/shoppingCart/analysisCheck.do";//1
                        var params = {spId:id};//2
                        var e = $(e);
                        $.post(url, params,
                            function (data) {
                                if(data=='yes') {
                                    e.innerText = "已选";
                                    $(e).removeClass("btn-primary");
                                    $(e).addClass("btn-danger");
                                }
                                if(data=='no') {
                                    e.innerText = "选中";
                                    $(e).removeClass("btn-danger");
                                    $(e).addClass("btn-primary");
                                }
                            },
                            "text"
                        );
                        $.post("/shoppingCart/getPrice.do",
                            null,
                            function (data) {
                                $("#ttp").val(data);
                                $("#price").val(data);
                            },
                            "text"
                        );
                    }
                    function allcheck(id) {
                        var url = "/shoppingCart/allCheck.do";//1
                        var params = {userId:id};//2
                        var Element = $(".btn-check");
                        // var Element = $("#b");
                        $.post(url, params,
                            function (data) {
                                    Element.innerText = "已选";
                                    Element.removeClass("btn'-primary");
                                    Element.addClass("btn-danger");
                                $("#ttp").val(data);
                                $("#price").val(data);
                            },
                            "text"
                        );
                    }

                    function reallcheck(id) {
                        var url = "/shoppingCart/reallCheck.do";//1
                        var params = {userId:id};//2
                        var Element = $(".btn-check");
                        // var Element = $("#b");
                        $.post(url, params,

                            function (data) {
                                    Element.innerText = "选中";
                                    Element.removeClass("btn-danger");
                                    Element.addClass("btn-primary");
                                $("#ttp").val(data);
                                $("#price").val(data);
                            },
                            "text"
                        );
                    }
                </script>
                <%--遍历购物项集合--%>
                <c:forEach items="${shoppingCartList}" var="shoppingCart">

                    <tr class="active">
                        <td>
                            <c:if test="${shoppingCart.checked==0}">
                                <button class="btn btn-primary btn-check" type="button" onclick="check(this,${shoppingCart.spId})">
                                   check
                                </button>
                            </c:if>
                            <c:if test="${shoppingCart.checked==1}">
                            <button  class="btn btn-danger btn-check" type="button" onclick="check(this,${shoppingCart.spId})">
                                check
                            </button>
                            </c:if>
                        </td>
                        <td width="60" width="40%">
                            <input type="hidden" name="id" value="22">
                            <a onclick="commodityDetails(${shoppingCart.commodity.commodityId})" style="cursor: pointer"><img src="/static/commodity/commodityPictures/${shoppingCart.commodity.commodityPicture}.jpg" width="70" height="70"></a>
                        </td>
                        <td width="30%">
                            <a target="_blank" onclick="storeDetails(${shoppingCart.commodity.store.storeId})" style="cursor: pointer">${shoppingCart.commodity.store.storeName}</a>
                        </td>
                        <td width="30%">
                            <a target="_blank" onclick="commodityDetails(${shoppingCart.commodity.commodityId})" style="cursor: pointer">${shoppingCart.commodity.commodityName}</a>
                        </td>
                        <td width="10%">
                            ￥${shoppingCart.commodity.commodityCurrentprice}
                        </td>
                        <td width="10%">
                            <c:choose>
                                <c:when test="${shoppingCart.commodityNumber<=1}">
                                    <img width="40px" height="30px" src="/static/images/jia.jpg" onclick="commodityJia(${shoppingCart.commodityId})" style="cursor: pointer" >
                                    <%--<input type="text" name="quantity" disabled value="${citem.num}" maxlength="4" size="10">--%>
                                    <input type="text" name="quantity" disabled value="${shoppingCart.commodityNumber}" maxlength="4" size="5">
                                    <a href="javascript:void(0);"><img width="40px" height="40px" src="/static/images/jian.jpg" ></a>
                                </c:when>
                                <c:otherwise>
                                    <img width="40px" height="30px" src="/static/images/jia.jpg" onclick="commodityJia(${shoppingCart.commodityId})" style="cursor: pointer">
                                    <%--<input type="text" name="quantity" disabled value="${citem.num}" maxlength="4" size="10">--%>
                                    <input type="text" name="quantity" disabled value="${shoppingCart.commodityNumber}" maxlength="4" size="5">
                                    <img width="40px" height="40px" src="/static/images/jian.jpg" onclick="commodityJian(${shoppingCart.commodityId})" style="cursor: pointer">
                                </c:otherwise>
                            </c:choose>


                        </td>
                        <td width="10%">
                            <%--<span class="subtotal">￥${citem.subtotal}</span>--%>
                            <span class="subtotal">￥:${shoppingCart.commodity.commodityCurrentprice*shoppingCart.commodityNumber}</span>

                        </td>
                        <td width="10%">
                            <a onclick="removeCart(${shoppingCart.commodity.commodityId})" style="cursor:pointer;">删除</a>
                        </td>
                    </tr>
                    <script>
                        <c:if test="${shoppingCart.checked==1}">
                        x(${shoppingCart.commodity.commodityCurrentprice*shoppingCart.commodityNumber});
                        </c:if>

                    </script>
                </c:forEach>

                </tbody>
            </table>
        </div>
    </div>

    <div style="margin-right:60px;">
        <div style="text-align:right;">
            <form id="form1">
                <strong style="color:#ff6600;" > &nbsp; 商品金额￥: <input type="text" name="ttp" id="ttp" maxlength="4" size="10" disabled value=""></strong>
            </form>
        </div>
        <div style="text-align:right;margin-top:10px;margin-bottom:10px;">
            <a onclick="cleanupCart()" style="cursor: pointer" >清空购物车</a>
            <a onclick="newAddOrder()"style="cursor: pointer">
                <input type="button" width="100" value="提交订单" border="0" style="background: url('${pageContext.request.contextPath}/static/images/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0);
                        height:35px;width:100px;color:white;">
            </a>
        </div>
    </div>

</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
