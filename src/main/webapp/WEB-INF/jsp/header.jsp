<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/17
  Time: 19:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form id="shoppingCart" action="/shoppingCart/getCommodityListByUserIdInshoppingCart.do" method="post">
    <input name="userId" type="hidden" id="userId" value="${user.id}">
</form>
<form id="favoritesCommodity" action="/favoritesCommoditylist/getList.do" method="post">
    <input name="userId" type="hidden"  value="${user.id}">
</form>
<form id="favoritesStore" action="/favoritesStorelist/getList.do" method="post">
    <input name="userId" type="hidden"  value="${user.id}">
</form>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" >蔬菜水果专卖店</a>
        </div>


        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li ><a href="/user/index.do"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;&nbsp;首页<span class="sr-only">(current)</span></a></li>

                    <li ><a onclick="shoppingCart()" style="cursor:pointer;"><span class="glyphicon glyphicon-shopping-cart "></span>&nbsp;&nbsp;&nbsp;购物车</a></li>
                <li class="dropdown">
                    <a onclick="favoritesCommodity()" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                        <span class="glyphicon glyphicon-bookmark"></span>
                &nbsp;&nbsp;&nbsp;收藏夹 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a onclick="favoritesCommodity()"style="cursor: pointer">收藏的宝贝</a></li>
                        <li><a onclick="favoritesStore()"style="cursor: pointer">收藏的店铺</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">我是收藏夹</a></li>
                    </ul>
                </li>
            </ul>
            <form id="searchform" name="searchform" class="navbar-form navbar-left"  method="post">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="开始搜索" name="searchName"
                    value="${searchName}" style="width: 300px">
                </div>
                <div class="btn-group" role="group" aria-label="...">
                    <button type="button" class="btn btn-default" onclick="searchWhat('/commodity/myGetCommodityList.do')">搜索商品</button>
                    <button type="button" class="btn btn-default" onclick="searchWhat('/store/myGetStoreList.do')">搜索店铺</button>
                </div>

            </form>
            <ul class="nav navbar-nav navbar-right">
                <c:if test="${empty user}">
                    <li><a href="/store/storeInformationUI.do">卖家中心</a></li>
                    <li><a href="/user/registerUI.do">免费注册</a></li>
                    <li><a href="/user/loginUI.do"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;&nbsp;已有账号,直接登陆</a></li>
                </c:if>
                <c:if test="${not empty user}">
                    <li><a href="/store/storeInformationUI.do">卖家中心</a></li>
                    <%--<li><a href="javascript:;">Welcome:</a></li>--%>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                            <span class="glyphicon glyphicon-user"></span>
                            &nbsp;&nbsp;&nbsp;${user.name} <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="/user/individualInformationUI.do">账号管理</a></li>
                            <li><a href="/order/myOrder.do" >我的订单</a></li>
                            <li><a href="/commodity/getPurchaseHistory.do">我的足迹</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="/user/logout.do">退出</a></li>
                        </ul>
                    </li>
                </c:if>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<script>
    $('li.dropdown').mouseover(function() {
        $(this).addClass('open');    }).mouseout(function() {        $(this).removeClass('open');    });

    function searchWhat(s) {
        var form = document.getElementById("searchform");
        form.action=s;
       form.submit();
    }

    function shoppingCart() {
        var form = document.getElementById("shoppingCart");
        form.submit();
    }

    function favoritesCommodity() {
        var elementById = document.getElementById("favoritesCommodity");
        elementById.submit();

    }
    function favoritesStore() {
        var elementById = document.getElementById("favoritesStore");
        elementById.submit();

    }

</script>