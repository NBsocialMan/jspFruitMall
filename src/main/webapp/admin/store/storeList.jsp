<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/6/11
  Time: 9:42
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
    function modifyStoreUI(id) {
        var elementById = document.getElementById("modifyForm");
        var id1 = document.getElementById("storeId");
        id1.value=id;
        elementById.submit();
    }
    function storeBT(id) {
        var elementById = document.getElementById("btForm");
        var id1 = document.getElementById("btstoreId");
        id1.value=id;
        elementById.submit();
    }
</script>
<body>
<form id="form" action="/admin/getStoreList.do" method="post">
    <input type="hidden" name="searchName" value="${searchName}"  >
    <input id="currentid" type="hidden" name="currentPage"  >
</form>
<form id="modifyForm" method="post" action="/admin/modifyStoreUI.do">
    <input type="hidden" name="storeId" id="storeId">
</form>
<form id="btForm" method="post" action="/admin/storeBT.do">
    <input type="hidden" name="storeId" id="btstoreId">
</form>
<br>

<table cellSpacing="1" cellPadding="0" width="100%" align="center"
       bgColor="#f5fafe" border="0">
    <TBODY>
    <tr>
        <td class="ta_01" align="center" bgColor="#afd1f3"><strong>店铺列表</strong>
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

                    <td align="center" width="5%">序号</td>
                    <td align="center" width="5%">店铺图片</td>
                    <td align="center" width="17%">店铺名称</td>
                    <td align="center" width="10%">所在地</td>
                    <td align="center" width="10%">是否营业</td>
                    <td align="center" width="10%">销售图</td>
                    <td width="7%" align="center">是否热门</td>
                    <td width="7%" align="center">编辑</td>
                </tr>
                <c:forEach items="${storeList.list}" var="store">


                    <tr onmouseover="this.style.backgroundColor = 'white'"
                        onmouseout="this.style.backgroundColor = '#F5FAFE';">
                        <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                            width="5%">${store.storeId}</td>
                        <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                            width="5%"><img width="40" height="45" src="/static/store/storePictures/${store.storePicture}.jpg"></td>
                        <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                            width="17%">${store.storeName}</td>
                        <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                            width="10%">${store.storeAddress}</td>
                        <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                            width="5%">
                            <c:if test="${store.storeState==1}">
                                <font style="color: green">营业中</font>
                            </c:if>
                            <c:if test="${store.storeState==0}">
                                <font style="color: darkorange">闭店中</font>
                            </c:if>
                            <c:if test="${store.storeState==2}">
                                <font style="color: red">制裁中</font>
                            </c:if>
                        </td>
                        <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                            width="10%"><a onclick="storeBT(${store.storeId})">查看</a></td>
                        <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                            width="10%">
                            <c:if test="${store.storeHot==0}">
                                否
                            </c:if>
                            <c:if test="${store.storeHot==1}">
                                是
                            </c:if>
                        </td>
                        <td align="center" style="HEIGHT: 22px"><a
                                onclick="modifyStoreUI(${store.storeId})" style="cursor: pointer">
                            <img
                                    src="${pageContext.request.contextPath}/static/adminImages/i_edit.gif"
                                    border="0" style="CURSOR: hand">
                        </a></td>

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
            <form id="jumpform" action="/admin/getStoreList.do">
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
