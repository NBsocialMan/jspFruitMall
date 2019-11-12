
<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/5/13
  Time: 13:59
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
</head>
<script>
    function skip(current) {
        var form = document.getElementById("form");
        var currentid = document.getElementById("currentid");

        currentid.value = current;
        form.submit();
    }
    function details(id) {
        var form = document.getElementById("details");
        var hiddenid = document.getElementById("commodityId");
        hiddenid.value=id;
        form.submit();
    }
    function jump() {
        var form = document.getElementById("jumpform");
        form.submit();
    }
    function storeDetails(id) {
        var form = document.getElementById("storeDetails");
        var hiddenid = document.getElementById("storeId");
        hiddenid.value=id;
        form.submit();
    }
    function otherCategory(id) {
        var elementById = document.getElementById("otherCategory");
        var id1 = document.getElementById("categoryId");
        id1.value=id;
        elementById.submit();
    }
</script>
<body>
<form id="otherCategory" action="/category/getCommodityListByCategoryId.do" method="post">
    <input type="hidden" name="categoryId" id="categoryId">
</form>
<form action="/store/storeDetails.do" method="post" id="storeDetails">
    <input type="hidden" name="storeId" id="storeId">
</form>
<form id="form" action="/category/getCommodityListByCategoryId.do" method="post">
    <input type="hidden" name="categoryId" value="${category.categoryId}"  >
    <input id="currentid" type="hidden" name="currentPage"  >
</form>
<jsp:include page="header.jsp"></jsp:include>
<br><br><br><br>
<div >
       <ul class="nav nav-tabs" style="margin-left: 50px">
           <c:forEach items="${allCategory}" var="c">
               <c:choose >
                   <c:when test="${c.categoryName ==category.categoryName}">
                       <li role="presentation" class="active"><a href="#">${c.categoryName}</a></li>
                   </c:when>
                   <c:otherwise>
                       <li role="presentation" ><a onclick="otherCategory(${c.categoryId})" style="cursor: pointer;">${c.categoryName}</a></li>
                   </c:otherwise>

               </c:choose>
           </c:forEach>

       </ul>
    </div>
<c:if test="${commodityList.pageTotal > 0}">
<c:forEach items="${commodityList.list}" var="commodity">
    <div class="col-sm-4 col-md-4"style="width: 255px;height: 400px;margin-top: 20px;margin-left: 30px;">
        <div class="thumbnail"style="width: 255px;height: 400px" >
            <form action="/commodity/commodityDetail.do" method="post" id="details">
                <input type="hidden" name="commodityId" id="commodityId">
            </form>
            <a onclick="details(${commodity.commodityId})" style="cursor: pointer"><img src="/static/commodity/commodityPictures/${commodity.commodityPicture}.jpg" alt="..." style="height: 220px;width: 300px" ></a>
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
                <form id="jumpform" action="/category/getCommodityListByCategoryId.do">
                    <input type="text" name="currentPage" class="form-control" placeholder="跳到" style="width: 60px">
                    <input type="hidden" name="categoryId" value="${category.categoryId}"  >
                </form>
                <span class="input-group-btn" style="width: 50px">
        <button class="btn btn-default" type="button" onclick="jump()">Go!</button>
      </span>
            </div>

            <!-- /input-group --><!-- /.col-lg-6 -->

        </ul>

    </div>
</c:if>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
