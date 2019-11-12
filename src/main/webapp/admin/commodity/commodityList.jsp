<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/5/23
  Time: 13:54
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
    function modifyCommodityUI(id) {
        var elementById = document.getElementById("modifyForm");
        var id1 = document.getElementById("commodityId");
        id1.value=id;
        elementById.submit();
    }
</script>
<body>
<form id="form" action="/admin/getCommodityList.do" method="post">
    <input type="hidden" name="searchName" value="${searchName}"  >
    <input id="currentid" type="hidden" name="currentPage"  >
</form>
<form id="modifyForm" method="post" action="/admin/modifyCommodityUI.do">
    <input type="hidden" name="commodityId" id="commodityId">
</form>
<br>

    <table cellSpacing="1" cellPadding="0" width="100%" align="center"
           bgColor="#f5fafe" border="0">
        <TBODY>
        <tr>
            <td class="ta_01" align="center" bgColor="#afd1f3"><strong>商品列表</strong>
            </TD>
        </tr>

        <tr>
            <td class="ta_01" align="center" bgColor="#f5fafe">
                <table cellspacing="0" cellpadding="1" rules="all"
                       bordercolor="gray" border="1" id="DataGrid1"
                       style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
                    <tr style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">

                        <td align="center" width="5%">序号</td>
                        <td align="center" width="5%">商品图片</td>
                        <td align="center" width="17%">商品名称</td>
                        <td align="center" width="5%">所属店铺</td>
                        <td align="center" width="5%">商品分类</td>
                        <td align="center" width="10%">是否上架</td>
                        <td align="center" width="10%">是否热门</td>
                        <td width="7%" align="center">编辑</td>
                        <td width="7%" align="center">删除</td>
                    </tr>
                    <c:forEach items="${commodityList.list}" var="commodity">


                    <tr onmouseover="this.style.backgroundColor = 'white'"
                        onmouseout="this.style.backgroundColor = '#F5FAFE';">
                        <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                            width="5%">${commodity.commodityId}</td>
                        <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                            width="5%"><img width="40" height="45" src="/static/commodity/commodityPictures/${commodity.commodityPicture}.jpg"></td>
                        <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                            width="17%">${commodity.commodityName}</td>
                        <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                            width="10%">${commodity.store.storeName}</td>
                        <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                            width="5%">
                                <c:if test="${not empty commodity.commodityCategoryId}">
                                    ${commodity.commodityCategoryId}
                                </c:if>
                            <c:if test="${empty commodity.commodityCategoryId}">
                                无
                            </c:if>
                        </td>
                        <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                            width="10%">
                            <c:if test="${commodity.shelf==0}">
                                <font style="color: darkorange">未上架</font>
                            </c:if>
                            <c:if test="${commodity.shelf==1}">
                                <font style="color: green">上架中</font>
                            </c:if>
                            <c:if test="${commodity.shelf==2}">
                                <font style="color: red">被制裁</font>
                            </c:if>
                        </td>
                        <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                            width="10%">
                            <c:if test="${commodity.commodityHot==1}">
                                是
                            </c:if>
                                <c:if test="${commodity.commodityHot==0}">
                                    否
                                </c:if></td>
                        <td align="center" style="HEIGHT: 22px"><a
                                onclick="modifyCommodityUI(${commodity.commodityId})" style="cursor: pointer">
                            <img
                                    src="${pageContext.request.contextPath}/static/adminImages/i_edit.gif"
                                    border="0" style="CURSOR: hand">
                        </a></td>

                        <td align="center" style="HEIGHT: 22px"><a href="#"> <img
                                src="${pageContext.request.contextPath}/static/adminImages/i_del.gif"
                                width="16" height="16" border="0" style="CURSOR: hand">
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
            <form id="jumpform" action="/admin/getCommodityList.do">
                <input type="text" name="currentPage" class="form-control" placeholder="跳到" style="width: 60px">
                <input type="hidden" name="searchName" value="${searchName}"  >
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
