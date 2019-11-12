<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/22
  Time: 20:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>${searchName}的搜索结果</title>
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.0.0.min.js" type="text/javascript"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js" type="text/javascript"></script>
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>
<form id="form" action="/commodity/myGetCommodityList.do" method="post">
    <input type="hidden" name="searchName" value="${searchName}"  >
    <input id="currentid" type="hidden" name="currentPage"  >
</form>
<form id="formDefault" action="/commodity/myGetCommodityListDefault.do" method="post">
    <input type="hidden" name="searchName" value="${searchName}"  >
    <input id="currentidDefault" type="hidden" name="currentPage"  >
</form>
<form id="ASCform" action="/commodity/getCommodityListASC.do" method="post">
    <input type="hidden" name="searchName" value="${searchName}"  >
    <input id="ASCcurrentid" type="hidden" name="currentPage"  >
</form>
<form id="DESCform" action="/commodity/getCommodityListDESC.do" method="post">
    <input type="hidden" name="searchName" value="${searchName}"  >
    <input id="DESCcurrentid" type="hidden" name="currentPage"  >
</form>
<form id="SALESVOLUMEform" action="/commodity/getCommodityListSalesvolume.do" method="post">
    <input type="hidden" name="searchName" value="${searchName}"  >
    <input id="SALESVOLUMEcurrentid" type="hidden" name="currentPage"  >
</form>

<script>
    function skip(current) {
        var form = document.getElementById("form");
        var currentid = document.getElementById("currentid");

        currentid.value = current;
        form.submit();
    }
    function ASCskip(current) {
        var form = document.getElementById("ASCform");
        var currentid = document.getElementById("ASCcurrentid");

        currentid.value = current;
        form.submit();
    }
    function SALESVOLUMEskip(current) {
        var form = document.getElementById("SALESVOLUMEform");
        var currentid = document.getElementById("SALESVOLUMEcurrentid");

        currentid.value = current;
        form.submit();
    }
    function DESCskip(current) {
        var form = document.getElementById("DESCform");
        var currentid = document.getElementById("DESCcurrentid");

        currentid.value = current;
        form.submit();
    }
    function BETWEENskip(current) {
        var form = document.getElementById("BETWEENform");
        var currentid = document.getElementById("BETWEENcurrentid");

        currentid.value = current;
        form.submit();
    }
    function jump() {
        var form = document.getElementById("jumpform");
        form.submit();
    }
    function SALESVOLUMEjump() {
        var form = document.getElementById("SALESVOLUMEjumpform");
        form.submit();
    }
    function ASCjump() {
        var form = document.getElementById("ASCjumpform");
        form.submit();
    }
    function DESCjump() {
        var form = document.getElementById("DESCjumpform");
        form.submit();
    }
    function BETWEENjump() {
        var form = document.getElementById("BETWEENjumpform");
        form.submit();
    }
    function details(id) {
        var form = document.getElementById("details");
        var hiddenid = document.getElementById("commodityId");
        hiddenid.value=id;
        form.submit();
    }
    function searchASC() {
        var form = document.getElementById("searchformASC");
        form.submit();
    }
    function searchDESC() {
        var form = document.getElementById("searchformDESC");
        form.submit();
    }
    function searchDefault() {
        var form = document.getElementById("formDefault");
        form.submit();
    }
    function searchSalesvolume() {
        var form = document.getElementById("searchformSalesvolume");
        form.submit();
    }

    function storeDetails(id) {
        var form = document.getElementById("storeDetails");
        var hiddenid = document.getElementById("storeId");
        hiddenid.value=id;
        form.submit();
    }
</script>
<form action="/store/storeDetails.do" method="post" id="storeDetails">
    <input type="hidden" name="storeId" id="storeId">
</form>
<form id="searchformASC" name="searchformASC" action="/commodity/getCommodityListASC.do"  method="post">
        <input type="hidden"  name="searchName" value="${searchName}" >
</form>
<form id="searchformDESC" name="searchformDESC" action="/commodity/getCommodityListDESC.do"  method="post">
    <input type="hidden"  name="searchName" value="${searchName}" >
</form>
<form id="searchformSalesvolume" name="searchformSalesvolume" action="/commodity/getCommodityListSalesvolume.do"  method="post">
    <input type="hidden"  name="searchName" value="${searchName}" >
</form>
<c:if test="${commodityList.pageTotal > 0}">
    <div class="col-md-12 column" style="background-color:#afd9ee;width: 1355px;margin-left: 85px;height: 50px;margin-top: -10px">
        <ul class="nav nav-pills">
            <li role="presentation" ><a onclick="searchDefault()" style="cursor: pointer">默认排序</a></li>
            <li role="presentation" ><a onclick="searchSalesvolume()" style="cursor: pointer">销量从高到低</a></li>
            <li role="presentation" ><a onclick="searchASC()" style="cursor: pointer">价格从低到高</a></li>
            <li role="presentation" ><a ONCLICK="searchDESC()" style="cursor: pointer">价格从高到低</a></li>
            <form id="BETWEENform" class="navbar-form navbar-left"  action="/commodity/getCommodityListPlus.do" method="post">
                按价格区间搜索：
                <div class="form-group">
                    <input type="hidden"  name="searchName" value="${searchName}" >
                    <input id="BETWEENcurrentid" type="hidden" name="currentPage"  >
                    <input type="text" value="${commodityPrice1}" name="commodityPrice1" class="form-control" placeholder="￥" style="width: 80px">
                    -
                    <input type="text" value="${commodityPrice2}" name="commodityPrice2" class="form-control" placeholder="￥"style="width: 80px">
                </div>
                <button type="submit" class="btn btn-default">确定</button>
            </form>
        </ul>
    </div>
<div style="margin-left: 50px">
    <c:forEach items="${commodityList.list}" var="commodity">
        <div class="col-sm-4 col-md-4"style="width: 255px;height: 400px;margin-top: 20px;margin-left: 20px;">
            <div class="thumbnail"style="width: 255px;height: 400px" >
                <form action="/commodity/commodityDetail.do" method="post" id="details">
                    <input type="hidden" name="commodityId" id="commodityId">
                </form>
                <a onclick="details(${commodity.commodityId})" style="cursor: pointer"><img src="/static/commodity/commodityPictures/${commodity.commodityPicture}.jpg" alt="..." style="height: 230px;width: 270px;margin-top: -10px;"></a>
                <div style="margin-top: -10px">
                    <h3 style="color:#337ab7 ">￥: ${commodity.commodityCurrentprice}</h3>
                    <a onclick="details(${commodity.commodityId})" style="cursor: pointer;">
                        <p style="color:darkorange">${commodity.commodityName}</p></a>
                    <p style="color:darkorange">销量：${commodity.commoditySalesvolume}</p>
                    <h4><a onclick="storeDetails(${commodity.store.storeId})" style="cursor: pointer"><span class="label label-primary"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;${commodity.store.storeName}</span></a>&nbsp;${commodity.store.storeAddress}</h4>

                </div>
            </div>
        </div>
    </c:forEach>
</div>


<!--分页 -->
    <c:if test="${searchState==null}">
        <div style="width: 600px;  margin-top: 90px;margin-left:150px">


            <ul class="pagination" style="width:560px;text-align: center; margin-top: 10px;margin-left: 450px;">
                    <%--首页--%>
                <li class=""><a onclick="skip(1)" href="javascript:;" aria-label="Previous">首页</a></li>
                    <%--左键--%>
                <c:if test="${commodityList.currentPage == 1} ">
                    <li class="disabled"><a href="#" aria-label="Previous"><span
                            aria-hidden="true">&laquo;</span></a></li>
                </c:if>
                <c:if test="${commodityList.currentPage != 1}">
                    <li class=""><a onclick="skip(${commodityList.currentPage-1})" href="javascript:;" aria-label="Previous"><span
                            aria-hidden="true">&laquo;</span></a></li>
                </c:if>


                    <%--中间页码--%>
                <c:forEach var="p"  begin="${commodityList.currentPage-2>0 ? commodityList.currentPage-2 : 1 }" end="${commodityList.currentPage+2<commodityList.pageTotal ? commodityList.currentPage+2 :commodityList.pageTotal}">
                    <c:if test="${p == commodityList.currentPage}">
                        <li class="active"><a href="javascript:;">${p}</a></li>
                    </c:if>
                    <c:if test="${p != commodityList.currentPage}">
                        <li class=""><a onclick="skip(${p})" href="javascript:;" aria-label="Previous">${p}</a></li>
                    </c:if>
                </c:forEach>

                    <%--右键--%>
                <c:if test="${commodityList.currentPage == commodityList.pageTotal}}">
                    <li class="disabled"><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                    </a></li>
                </c:if>
                <c:if test="${commodityList.currentPage != commodityList.pageTotal}">
                    <li class=""><a onclick="skip(${commodityList.currentPage+1})" aria-label="Next" href="javascript:;"> <span aria-hidden="true">&raquo;</span>
                    </a></li>
                </c:if>

                    <%--尾页--%>
                <li class=""><a onclick="skip(${commodityList.pageTotal})" href="javascript:;" aria-label="Previous">尾页</a></li>

                    <%--显示页码的总页数--%>
                <li ><a >共${commodityList.pageTotal}页</a></li>
                    <%--跳转--%>

                <div class="input-group" style="width: 100px">
                    <form id="jumpform" action="/commodity/myGetCommodityList.do">
                        <input id="jumpNum" type="text" name="currentPage" class="form-control" placeholder="跳到" style="width: 60px">
                        <input type="hidden" name="searchName" value="${searchName}"  >
                    </form>
                    <span class="input-group-btn" style="width: 50px">
        <button class="btn btn-default" type="button" onclick="jump()">Go!</button>
      </span>
                </div>

                <!-- /input-group --><!-- /.col-lg-6 -->

            </ul>

        </div>
    </c:if>
    <c:if test="${searchState.equals('ASC')}">
        <div style="width: 600px;  margin-top: 90px;margin-left:150px">


            <ul class="pagination" style="width:560px;text-align: center; margin-top: 10px;margin-left: 450px;">
                    <%--首页--%>
                <li class=""><a onclick="ASCskip(1)" href="javascript:;" aria-label="Previous">首页</a></li>
                    <%--左键--%>
                <c:if test="${commodityList.currentPage == 1} ">
                    <li class="disabled"><a href="#" aria-label="Previous"><span
                            aria-hidden="true">&laquo;</span></a></li>
                </c:if>
                <c:if test="${commodityList.currentPage != 1}">
                    <li class=""><a onclick="ASCskip(${commodityList.currentPage-1})" href="javascript:;" aria-label="Previous"><span
                            aria-hidden="true">&laquo;</span></a></li>
                </c:if>
                    <%--中间页码--%>
                <c:forEach var="p"  begin="${commodityList.currentPage-2>0 ? commodityList.currentPage-2 : 1 }" end="${commodityList.currentPage+2<commodityList.pageTotal ? commodityList.currentPage+2 :commodityList.pageTotal}">
                    <c:if test="${p == commodityList.currentPage}">
                        <li class="active"><a href="javascript:;">${p}</a></li>
                    </c:if>
                    <c:if test="${p != commodityList.currentPage}">
                        <li class=""><a onclick="ASCskip(${p})" href="javascript:;" aria-label="Previous">${p}</a></li>
                    </c:if>
                </c:forEach>

                    <%--右键--%>
                <c:if test="${commodityList.currentPage == commodityList.pageTotal}}">
                    <li class="disabled"><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                    </a></li>
                </c:if>
                <c:if test="${commodityList.currentPage != commodityList.pageTotal}">
                    <li class=""><a onclick="ASCskip(${commodityList.currentPage+1})" aria-label="Next" href="javascript:;"> <span aria-hidden="true">&raquo;</span>
                    </a></li>
                </c:if>

                    <%--尾页--%>
                <li class=""><a onclick="ASCskip(${commodityList.pageTotal})" href="javascript:;" aria-label="Previous">尾页</a></li>

                    <%--显示页码的总页数--%>
                <li ><a >共${commodityList.pageTotal}页</a></li>
                    <%--跳转--%>

                <div class="input-group" style="width: 100px">
                    <form id="ASCjumpform" action="/commodity/getCommodityListASC.do">
                        <input id="jumpNum" type="text" name="currentPage" class="form-control" placeholder="跳到" style="width: 60px">
                        <input type="hidden" name="searchName" value="${searchName}"  >
                    </form>
                    <span class="input-group-btn" style="width: 50px">
        <button class="btn btn-default" type="button" onclick="ASCjump()">Go!</button>
      </span>
                </div>

                <!-- /input-group --><!-- /.col-lg-6 -->

            </ul>

        </div>
    </c:if>
    <c:if test="${searchState.equals('DESC')}">
        <div style="width: 600px;  margin-top: 90px;margin-left:150px">


            <ul class="pagination" style="width:560px;text-align: center; margin-top: 10px;margin-left: 450px;">
                    <%--首页--%>
                <li class=""><a onclick="DESCskip(1)" href="javascript:;" aria-label="Previous">首页</a></li>
                    <%--左键--%>
                <c:if test="${commodityList.currentPage == 1} ">
                    <li class="disabled"><a href="#" aria-label="Previous"><span
                            aria-hidden="true">&laquo;</span></a></li>
                </c:if>
                <c:if test="${commodityList.currentPage != 1}">
                    <li class=""><a onclick="DESCskip(${commodityList.currentPage-1})" href="javascript:;" aria-label="Previous"><span
                            aria-hidden="true">&laquo;</span></a></li>
                </c:if>
                    <%--中间页码--%>
                <c:forEach var="p"  begin="${commodityList.currentPage-2>0 ? commodityList.currentPage-2 : 1 }" end="${commodityList.currentPage+2<commodityList.pageTotal ? commodityList.currentPage+2 :commodityList.pageTotal}">
                    <c:if test="${p == commodityList.currentPage}">
                        <li class="active"><a href="javascript:;">${p}</a></li>
                    </c:if>
                    <c:if test="${p != commodityList.currentPage}">
                        <li class=""><a onclick="DESCskip(${p})" href="javascript:;" aria-label="Previous">${p}</a></li>
                    </c:if>
                </c:forEach>

                    <%--右键--%>
                <c:if test="${commodityList.currentPage == commodityList.pageTotal}}">
                    <li class="disabled"><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                    </a></li>
                </c:if>
                <c:if test="${commodityList.currentPage != commodityList.pageTotal}">
                    <li class=""><a onclick="DESCskip(${commodityList.currentPage+1})" aria-label="Next" href="javascript:;"> <span aria-hidden="true">&raquo;</span>
                    </a></li>
                </c:if>

                    <%--尾页--%>
                <li class=""><a onclick="DESCskip(${commodityList.pageTotal})" href="javascript:;" aria-label="Previous">尾页</a></li>

                    <%--显示页码的总页数--%>
                <li ><a >共${commodityList.pageTotal}页</a></li>
                    <%--跳转--%>

                <div class="input-group" style="width: 100px">
                    <form id="DESCjumpform" action="/commodity/getCommodityListDESC.do">
                        <input id="jumpNum" type="text" name="currentPage" class="form-control" placeholder="跳到" style="width: 60px">
                        <input type="hidden" name="searchName" value="${searchName}"  >
                    </form>
                    <span class="input-group-btn" style="width: 50px">
        <button class="btn btn-default" type="button" onclick="DESCjump()">Go!</button>
      </span>
                </div>

                <!-- /input-group --><!-- /.col-lg-6 -->

            </ul>

        </div>
    </c:if>
    <c:if test="${searchState.equals('SALESVOLUME')}">
        <div style="width: 600px;  margin-top: 90px;margin-left:150px">


            <ul class="pagination" style="width:560px;text-align: center; margin-top: 10px;margin-left: 450px;">
                    <%--首页--%>
                <li class=""><a onclick="SALESVOLUMEskip(1)" href="javascript:;" aria-label="Previous">首页</a></li>
                    <%--左键--%>
                <c:if test="${commodityList.currentPage == 1} ">
                    <li class="disabled"><a href="#" aria-label="Previous"><span
                            aria-hidden="true">&laquo;</span></a></li>
                </c:if>
                <c:if test="${commodityList.currentPage != 1}">
                    <li class=""><a onclick="SALESVOLUMEskip(${commodityList.currentPage-1})" href="javascript:;" aria-label="Previous"><span
                            aria-hidden="true">&laquo;</span></a></li>
                </c:if>
                    <%--中间页码--%>
                <c:forEach var="p"  begin="${commodityList.currentPage-2>0 ? commodityList.currentPage-2 : 1 }" end="${commodityList.currentPage+2<commodityList.pageTotal ? commodityList.currentPage+2 :commodityList.pageTotal}">
                    <c:if test="${p == commodityList.currentPage}">
                        <li class="active"><a href="javascript:;">${p}</a></li>
                    </c:if>
                    <c:if test="${p != commodityList.currentPage}">
                        <li class=""><a onclick="SALESVOLUMEskip(${p})" href="javascript:;" aria-label="Previous">${p}</a></li>
                    </c:if>
                </c:forEach>

                    <%--右键--%>
                <c:if test="${commodityList.currentPage == commodityList.pageTotal}}">
                    <li class="disabled"><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                    </a></li>
                </c:if>
                <c:if test="${commodityList.currentPage != commodityList.pageTotal}">
                    <li class=""><a onclick="SALESVOLUMEskip(${commodityList.currentPage+1})" aria-label="Next" href="javascript:;"> <span aria-hidden="true">&raquo;</span>
                    </a></li>
                </c:if>

                    <%--尾页--%>
                <li class=""><a onclick="SALESVOLUMEskip(${commodityList.pageTotal})" href="javascript:;" aria-label="Previous">尾页</a></li>

                    <%--显示页码的总页数--%>
                <li ><a >共${commodityList.pageTotal}页</a></li>
                    <%--跳转--%>

                <div class="input-group" style="width: 100px">
                    <form id="SALESVOLUMEjumpform" action="/commodity/getCommodityListSalesvolume.do">
                        <input id="jumpNum" type="text" name="currentPage" class="form-control" placeholder="跳到" style="width: 60px">
                        <input type="hidden" name="searchName" value="${searchName}"  >
                    </form>
                    <span class="input-group-btn" style="width: 50px">
        <button class="btn btn-default" type="button" onclick="SALESVOLUMEjump()">Go!</button>
      </span>
                </div>

                <!-- /input-group --><!-- /.col-lg-6 -->

            </ul>

        </div>
    </c:if>
    <c:if test="${searchState.equals('BETWEEN')}">
        <div style="width: 600px;  margin-top: 90px;margin-left:150px">


            <ul class="pagination" style="width:560px;text-align: center; margin-top: 10px;margin-left: 450px;">
                    <%--首页--%>
                <li class=""><a onclick="BETWEENskip(1)" href="javascript:;" aria-label="Previous">首页</a></li>
                    <%--左键--%>
                <c:if test="${commodityList.currentPage == 1} ">
                    <li class="disabled"><a href="#" aria-label="Previous"><span
                            aria-hidden="true">&laquo;</span></a></li>
                </c:if>
                <c:if test="${commodityList.currentPage != 1}">
                    <li class=""><a onclick="BETWEENskip(${commodityList.currentPage-1})" href="javascript:;" aria-label="Previous"><span
                            aria-hidden="true">&laquo;</span></a></li>
                </c:if>
                    <%--中间页码--%>
                <c:forEach var="p"  begin="${commodityList.currentPage-2>0 ? commodityList.currentPage-2 : 1 }" end="${commodityList.currentPage+2<commodityList.pageTotal ? commodityList.currentPage+2 :commodityList.pageTotal}">
                    <c:if test="${p == commodityList.currentPage}">
                        <li class="active"><a href="javascript:;">${p}</a></li>
                    </c:if>
                    <c:if test="${p != commodityList.currentPage}">
                        <li class=""><a onclick="BETWEENskip(${p})" href="javascript:;" aria-label="Previous">${p}</a></li>
                    </c:if>
                </c:forEach>

                    <%--右键--%>
                <c:if test="${commodityList.currentPage == commodityList.pageTotal}}">
                    <li class="disabled"><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                    </a></li>
                </c:if>
                <c:if test="${commodityList.currentPage != commodityList.pageTotal}">
                    <li class=""><a onclick="BETWEENskip(${commodityList.currentPage+1})" aria-label="Next" href="javascript:;"> <span aria-hidden="true">&raquo;</span>
                    </a></li>
                </c:if>

                    <%--尾页--%>
                <li class=""><a onclick="BETWEENskip(${commodityList.pageTotal})" href="javascript:;" aria-label="Previous">尾页</a></li>

                    <%--显示页码的总页数--%>
                <li ><a >共${commodityList.pageTotal}页</a></li>
                    <%--跳转--%>

                <div class="input-group" style="width: 100px">
                    <form id="BETWEENjumpform" action="/commodity/getCommodityListPlus.do">
                        <input id="jumpNum" type="text" name="currentPage" class="form-control" placeholder="跳到" style="width: 60px">
                        <input type="hidden" name="commodityPrice1" value="${commodityPrice1}"  >
                        <input type="hidden" name="commodityPrice2" value="${commodityPrice2}"  >
                        <input type="hidden" name="searchName" value="${searchName}"  >
                    </form>
                    <span class="input-group-btn" style="width: 50px">
        <button class="btn btn-default" type="button" onclick="BETWEENjump()">Go!</button>
      </span>
                </div>

                <!-- /input-group --><!-- /.col-lg-6 -->

            </ul>

        </div>
    </c:if>
<!-- 分页结束 -->
    <script>
        var elementById = document.getElementById("jumpNum");
        elementById.onblur=function () {
            if (parseInt(elementById.value)>${commodityList.pageTotal}){
                alert("您所填写的页数超过总页数!");
                elementById.value=1;
            }
        }
    </script>

    <div  class="col-md-offset-1 col-md-10 " style="margin-top: 50px">

        <div id="myCarouse3" class="carousel slide"  style="width: 1300px;height: 160px;">
            <div class="carousel-inner" style="width: 1300px;height: 160px;">
                <ol class="carousel-indicators">
                    <li data-target="#myCarouse3" data-slide-to ="0" class="active" ></li>
                    <li data-target="#myCarouse3" data-slide-to ="1"></li>
                </ol>


                <div class="item active">
                    <a href="#">
                        <img src="/static/images/roll5.jpg" alt="第一张" width="100%">
                    </a>
                </div>
                <div class="item">
                    <a href="#">
                        <img src="/static/images/roll6.jpg" alt="第二张" width="100%">
                    </a>
                </div>
                <a href="#myCarouse3" data-slide="prev" class="carousel-control left"><!-- ‹ -->
                    <span class="glyphicon glyphicon-chevron-left"></span>
                </a><!-- 左箭头 -->
                <a href="#myCarouse3" data-slide="next" class="carousel-control right"><!-- › -->
                    <span class="glyphicon glyphicon-chevron-right"></span>


                </a><!-- 右箭头 -->

            </div>
        </div>
        <c:if test="${guessCommodityList!=null}">
            <c:forEach items="${guessCommodityList}" var="commodity">
                <div class="col-sm-4 col-md-4"style="width: 255px;height: 400px;margin-top: 20px;margin-left: 20px;">
                    <div class="thumbnail"style="width: 255px;height: 400px" >
                        <a onclick="details(${commodity.commodityId})" style="cursor: pointer"><img src="/static/commodity/commodityPictures/${commodity.commodityPicture}.jpg" alt="..." style="height: 220px;width: 300px" ></a>
                        <div style="margin-top: -10px">
                            <h3 style="color:#337ab7 ">￥: ${commodity.commodityCurrentprice}</h3>
                            <a onclick="details(${commodity.commodityId})" style="cursor: pointer;">
                                <p style="color:darkorange">${commodity.commodityName}</p></a>
                            <p style="color:darkorange">销量：${commodity.commoditySalesvolume}</p>
                            <h4><span class="label label-primary"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;${commodity.store.storeName}</span>&nbsp;${commodity.store.storeAddress}</h4>

                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:if>
    </div>
</c:if>
<c:if test="${commodityList.pageTotal == 0}">
    <br><br><br>
    <div class="jumbotron">
        <h1>&nbsp;&nbsp;&nbsp;找不到关于“${searchName}”的任何信息</h1>
       <p>换一个试试</p>
        <p><a class="btn btn-primary btn-lg" href="/user/index.do" role="button">去看看别的</a></p>
    </div>

        <div style="width: 1200px;margin: auto">
            <div class="page-header">
                <h1>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;猜你喜欢 &nbsp;<small>
                    Guess you like</small>
                </h1>
            </div>
            <div id="myCarouse3" class="carousel slide"  style="width: 1150px;height: 160px;">
                <div class="carousel-inner" style="width: 1150px;height: 160px;">
                    <ol class="carousel-indicators">
                        <li data-target="#myCarouse3" data-slide-to ="0" class="active" ></li>
                        <li data-target="#myCarouse3" data-slide-to ="1"></li>
                    </ol>


                    <div class="item active">
                        <a href="#">
                            <img src="/static/images/roll5.jpg" alt="第一张" width="100%">
                        </a>
                    </div>
                    <div class="item">
                        <a href="#">
                            <img src="/static/images/roll6.jpg" alt="第二张" width="100%">
                        </a>
                    </div>
                    <a href="#myCarouse3" data-slide="prev" class="carousel-control left"><!-- ‹ -->
                        <span class="glyphicon glyphicon-chevron-left"></span>
                    </a><!-- 左箭头 -->
                    <a href="#myCarouse3" data-slide="next" class="carousel-control right"><!-- › -->
                        <span class="glyphicon glyphicon-chevron-right"></span>


                    </a><!-- 右箭头 -->

                </div>
            </div>
            <c:if test="${guessCommodityList!=null}">
                <c:forEach items="${guessCommodityList}" var="commodity">
                    <div class="col-sm-4 col-md-4"style="width: 255px;height: 400px;margin-top: 20px;margin-left: 20px;">
                        <div class="thumbnail"style="width: 255px;height: 400px" >
                            <a onclick="details(${commodity.commodityId})" style="cursor: pointer"><img src="/static/commodity/commodityPictures/${commodity.commodityPicture}.jpg" alt="..." style="height: 220px;width: 300px" ></a>
                            <div style="margin-top: -10px">
                                <h3 style="color:#337ab7 ">￥: ${commodity.commodityCurrentprice}</h3>
                                <a onclick="details(${commodity.commodityId})" style="cursor: pointer;">
                                    <p style="color:darkorange">${commodity.commodityName}</p></a>
                                <p style="color:darkorange">销量：${commodity.commoditySalesvolume}</p>
                                <h4><span class="label label-primary"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;${commodity.store.storeName}</span>&nbsp;${commodity.store.storeAddress}</h4>

                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
    </div>
</c:if>
<jsp:include page="footer.jsp"></jsp:include>
</body>

<script>
    $(function(){
        //轮播图自动播放
        $('#myCarousel').carousel({
            interval: 2000,//自动播放2s
        });
        $('#myCarouse2').carousel({
            interval: 2000,//自动播放2s
        });
        $('#myCarouse3').carousel({
            interval: 2000,//自动播放2s
        });

    });
</script>
</html>
