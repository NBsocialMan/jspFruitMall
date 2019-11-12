
<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/26
  Time: 10:50
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>店铺搜索结果</title>
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.0.0.min.js" type="text/javascript"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js" type="text/javascript"></script>
</head>

<body>
<form id="form" action="/store/myGetStoreList.do" method="post">
    <input type="hidden" name="storeName" value="${storeName}"  >
    <input id="currentid" type="hidden" name="currentPage"  >
</form>
<form action="/commodity/commodityDetail.do" method="post" id="detailsfromStore">
    <input type="hidden" name="commodityId" id="commodityIdfromStore">
</form>
<form action="/store/storeDetails.do" method="post" id="storeDetails">
    <input type="hidden" name="storeId" id="storeId">
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
    function details(id) {
        var form = document.getElementById("detailsfromStore");
        var hiddenid = document.getElementById("commodityIdfromStore");
        hiddenid.value=id;
        form.submit();
    }
    function storeDetails(id) {
        var form = document.getElementById("storeDetails");
        var hiddenid = document.getElementById("storeId");
        hiddenid.value=id;
        form.submit();
    }
</script>
<jsp:include page="header.jsp"></jsp:include>
<c:if test="${storeList.pageTotal > 0}">
<div class="row clearfix">
<div class="col-sm-9" style="margin-left:20px;margin-top: 80px">
        <c:forEach items="${storeList.list}" var="store">
            <div class="thumbnail " style="height:200px;margin-left: 50px;margin-bottom: 30px">
                <div class=" row clearfix col-sm-4">
                    <div class="col-sm-4 column">
                        <a onclick="storeDetails(${store.storeId})" style="cursor: pointer"><img style="width: 80px;height: 80px;margin-left: 20px" src="/static/store/storePictures/${store.storePicture}.jpg"></a>
                    </div>
                    <div class="col-sm-8 column">
                        <h4><a onclick="storeDetails(${store.storeId})" style="cursor: pointer"><span class="label label-primary"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;${store.storeName}</span></a></h4>
                        <h4>${store.storeAddress}</h4>

                    </div>
                    <div class="col-sm-12">
                        <h5>${store.storeIntroduction}</h5>
                    </div>

                </div>
                <div class=" col-sm-8 ">
                    <div class="row clearfix col-sm-14 ">
                        <c:forEach items="${store.commodityList}" var="commodity" begin="0" end="3">
                            <a onclick="details(${commodity.commodityId})" style="cursor:pointer;">
                            <div class="col-sm-2 column" style="margin-left: 40px;margin-top: 10px">
                                <img style="width: 140px;height: 140px;margin-left: 1px" src="/static/commodity/commodityPictures/${commodity.commodityPicture}.jpg">
                                <h5>￥:${commodity.commodityCurrentprice}</h5>
                            </div>
                            </a>
                        </c:forEach>
                    </div>
                </div>

            </div>
        </c:forEach>
    </div>
    <div class="thumbnail col-sm-3"style="width:300px;height:2050px;margin-top: 80px">
        <h1>&nbsp;&nbsp;
            &nbsp;
            <span class="label label-danger" style="margin-left: -20px">&nbsp;&nbsp;<span class="glyphicon glyphicon-fire"></span>&nbsp;&nbsp;热门店铺&nbsp;&nbsp;&nbsp;&nbsp;</span></h1><br>
        <c:forEach items="${hotStoreList}" var="store">
        <div class="thumbnail"style="width: 160px;height: 160px;margin-left: 60px" >
            <a onclick="storeDetails(${store.storeId})" style="cursor:pointer;"><img src="/static/store/storePictures/${store.storePicture}.jpg" alt="..." style="height: 100px;width: 100px" ></a>
            <div class="caption" style="margin-left: 5px;margin-top: -5px;">
                <a onclick="storeDetails(${store.storeId})" style="cursor: pointer;">
                <h5><span class="label label-primary"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;${store.storeName}</span></h5>
                </a>
            </div>
        </div>
        </c:forEach>
    </div>
</div>
    <!--分页 -->
    <div style="width: 600px;  margin-top: 90px;margin-left:550px">


        <ul class="pagination" style="width:550px;text-align: center; margin-top: 10px;">
                <%--首页--%>
            <li class=""><a onclick="skip(1)" href="javascript:;" aria-label="Previous">首页</a></li>
                <%--左键--%>
            <c:if test="${storeList.currentPage == 1} ">
                <li class="disabled"><a href="#" aria-label="Previous"><span
                        aria-hidden="true">&laquo;</span></a></li>
            </c:if>
            <c:if test="${storeList.currentPage != 1}">
                <li class=""><a onclick="skip(${storeList.currentPage-1})" href="javascript:;" aria-label="Previous"><span
                        aria-hidden="true">&laquo;</span></a></li>
            </c:if>


                <%--中间页码--%>
            <c:forEach var="p"  begin="${storeList.currentPage-2>0 ? storeList.currentPage-2 : 1 }" end="${storeList.currentPage+2<storeList.pageTotal ? storeList.currentPage+2 :storeList.pageTotal}">
                <c:if test="${p == storeList.currentPage}">
                    <li class="active"><a href="javascript:;">${p}</a></li>
                </c:if>
                <c:if test="${p != storeList.currentPage}">
                    <li class=""><a onclick="skip(${p})" href="javascript:;" aria-label="Previous">${p}</a></li>
                </c:if>
            </c:forEach>

                <%--右键--%>
            <c:if test="${storeList.currentPage == storeList.pageTotal}}">
                <li class="disabled"><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                </a></li>
            </c:if>
            <c:if test="${storeList.currentPage != storeList.pageTotal}">
                <li class=""><a onclick="skip(${storeList.currentPage+1})" aria-label="Next" href="javascript:;"> <span aria-hidden="true">&raquo;</span>
                </a></li>
            </c:if>

                <%--尾页--%>
            <li class=""><a onclick="skip(${storeList.pageTotal})" href="javascript:;" aria-label="Previous">尾页</a></li>

                <%--显示页码的总页数--%>
            <li ><a >共${storeList.pageTotal}页</a></li>
                <%--跳转--%>

            <div class="input-group" style="width: 100px">
                <form id="jumpform" action="/store/myGetStoreList.do">
                    <input type="text" name="currentPage" class="form-control" placeholder="跳到" style="width: 60px">
                    <input type="hidden" name="commodityName" value="${storeName}"  >
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

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
