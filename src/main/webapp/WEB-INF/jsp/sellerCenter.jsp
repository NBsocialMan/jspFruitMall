
<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/5/18
  Time: 19:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8" %>
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
    <script  src="${pageContext.request.contextPath}/static/js/echarts.min.js" ></script>
</head>
<%--上传图片的显示问题--%>
<script type="text/javascript">
    //添加input框的onChange事件
    function display(obj) {
        var file = obj.files[0];

        console.log(obj);console.log(file);
        console.log("file.size = " + file.size);  //file.size 单位为byte

        var reader = new FileReader();

        //注册相关的回调
        //成功后的回调，最重要的一个
        reader.onload = function (e) {
            //展示
            var img = document.getElementById("displayImg");
            img.src = e.target.result;
        }

        //读取
        reader.readAsDataURL(file)
    }
</script>

<script>

    function jump() {
        var form = document.getElementById("jumpform");
        form.submit();
    }
    function skip(current) {
        var form = document.getElementById("form");
        var currentid = document.getElementById("currentid");

        currentid.value = current;
        form.submit();
    }

    function orderDetails(id) {
        var elementById = document.getElementById("orderDetailsForm");
        var id1 = document.getElementById("detailsOrderId");
        id1.value=id;
        elementById.submit();
    }

    function deleteCommodity(id) {
        var a = window.confirm("确定要删除这个商品吗？删除后所有关于该商品的信息都会被删除且不可恢复！");
        if(a==true){
            var elementById = document.getElementById("deleteForm");
            var id1 = document.getElementById("deleteCommodityId");
            id1.value=id;
            elementById.submit();
        }
    }

    function deliverCommodity(id) {
        var elementById = document.getElementById("deliver");
        var id1 = document.getElementById("deliverOrderId");
        id1.value=id;
        elementById.submit();
    }
    function modifyCommodity(id) {
        var elementById = document.getElementById("modifyForm");
        var id1 = document.getElementById("modifyCommodityId");
        id1.value=id;
        elementById.submit();
    }
    $(document).ready(function () {
        <%--alert(${store.storeId})--%>
    })
</script>
<body>
<jsp:include page="header.jsp"></jsp:include>
<br><br><br>
<form id="form" action="/store/commodityManagementUI.do" method="post">
    <input id="currentid" type="hidden" name="currentPage"  >
</form>
<form id="deleteForm" action="/store/deleteCommodity.do" method="post">
    <input name="commodityId" type="hidden" id="deleteCommodityId">
</form>
<form id="modifyForm" action="/store/modifyCommodityUI.do" method="post">
    <input name="commodityId" type="hidden" id="modifyCommodityId">
</form>
<form id="orderDetailsForm" action="/store/orderDetails.do" method="post">
    <input name="orderId" type="hidden" id="detailsOrderId">
</form>
<form action="/store/deliverCommodity.do" method="post" id="deliver">
    <input name="currentPage" value="${orderListPage.currentPage}" type="hidden">
    <input name="orderId" type="hidden" id="deliverOrderId">
</form>
<c:if test="${success==1}">
    <div class="alert alert-success alert-dismissible" role="alert" style="margin: auto;width: 1000px;height: 70px;margin-top: -30px">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <strong>订单处理成功，已发货</strong> <br>
    </div>
</c:if>
<c:if test="${fail==1}">
    <div class="alert alert-warning alert-dismissible" role="alert" style="margin: auto;width: 1000px;height: 70px;margin-top: -30px">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <strong>订单处理失败，你的库存不足，发货失败,请先增加你的商品库存。</strong> <br>
    </div>
</c:if>
<div class="col-md-13 column row" style="margin-top: -36px">
    <div class="col-md-3 column" style="background-color:#31b0d5;height: 800px;">
        <ul class="list-group" style="margin-top: 50px;margin-left: 30px;width: 300px">
            <c:choose>
                <c:when test="${user.role!=1}">
                    <li class="list-group-item">店铺管理Store management</li>
                    <li class="list-group-item active">店铺信息</li>
                    <li class="list-group-item">商品管理</li>
                    <li class="list-group-item">订单处理</li>
                    <li class="list-group-item">数据分析</li>
                    <li class="list-group-item">广告管理</li>
                </c:when>
                <c:when test="${sellerCenterState==1}">
                    <li class="list-group-item">店铺管理Store management</li>
                    <li class="list-group-item active">店铺信息</li>
                    <a href="/store/commodityManagementUI.do"><li class="list-group-item">商品管理</li></a>
                    <a href="/store/orderProcessingUI.do"><li class="list-group-item">订单处理</li></a>
                    <a href="/store/dataAnalysisUI.do"><li class="list-group-item">数据分析</li></a>
                    <a href="/store/ADManageUI.do"><li class="list-group-item">广告管理</li></a>
                </c:when>
                <c:when test="${sellerCenterState==0}">
                    <li class="list-group-item">店铺管理Store management</li>
                    <a href="/store/storeInformationUI.do"><li class="list-group-item">店铺信息</li></a>
                    <li class="list-group-item active">商品管理</li>
                    <a href="/store/orderProcessingUI.do"><li class="list-group-item">订单处理</li></a>
                    <a href="/store/dataAnalysisUI.do"><li class="list-group-item">数据分析</li></a>
                    <a href="/store/ADManageUI.do"><li class="list-group-item">广告管理</li></a>
                </c:when>
                <c:when test="${sellerCenterState==100}">
                    <li class="list-group-item">店铺管理Store management</li>
                    <a href="/store/storeInformationUI.do"><li class="list-group-item">店铺信息</li></a>
                    <li class="list-group-item active">商品管理</li>
                    <a href="/store/orderProcessingUI.do"><li class="list-group-item">订单处理</li></a>
                    <a href="/store/dataAnalysisUI.do"><li class="list-group-item">数据分析</li></a>
                    <a href="/store/ADManageUI.do"><li class="list-group-item">广告管理</li></a>
                </c:when>
                <c:when test="${sellerCenterState==10}">
                    <li class="list-group-item">店铺管理Store management</li>
                    <a href="/store/storeInformationUI.do"><li class="list-group-item">店铺信息</li></a>
                    <li class="list-group-item active">商品管理</li>
                    <a href="/store/orderProcessingUI.do"><li class="list-group-item">订单处理</li></a>
                    <a href="/store/dataAnalysisUI.do"><li class="list-group-item">数据分析</li></a>
                    <a href="/store/ADManageUI.do"><li class="list-group-item">广告管理</li></a>
                </c:when>
                <c:when test="${sellerCenterState==2}">
                    <li class="list-group-item">店铺管理Store management</li>
                    <a href="/store/storeInformationUI.do"><li class="list-group-item">店铺信息</li></a>
                    <a href="/store/commodityManagementUI.do"><li class="list-group-item">商品管理</li></a>
                    <li class="list-group-item active">订单处理</li>
                    <a href="/store/dataAnalysisUI.do"><li class="list-group-item">数据分析</li></a>
                    <a href="/store/ADManageUI.do"><li class="list-group-item">广告管理</li></a>
                </c:when>
                <c:when test="${sellerCenterState==20}">
                    <li class="list-group-item">店铺管理Store management</li>
                    <a href="/store/storeInformationUI.do"><li class="list-group-item">店铺信息</li></a>
                    <a href="/store/commodityManagementUI.do"><li class="list-group-item">商品管理</li></a>
                    <li class="list-group-item active">订单处理</li>
                    <a href="/store/dataAnalysisUI.do"><li class="list-group-item">数据分析</li></a>
                    <a href="/store/ADManageUI.do"><li class="list-group-item">广告管理</li></a>
                </c:when>
                <c:when test="${sellerCenterState==21}">
                    <li class="list-group-item">店铺管理Store management</li>
                    <a href="/store/storeInformationUI.do"><li class="list-group-item">店铺信息</li></a>
                    <a href="/store/commodityManagementUI.do"><li class="list-group-item">商品管理</li></a>
                    <li class="list-group-item active">订单处理</li>
                    <a href="/store/dataAnalysisUI.do"><li class="list-group-item">数据分析</li></a>
                    <a href="/store/ADManageUI.do"><li class="list-group-item">广告管理</li></a>
                </c:when>
                <c:when test="${sellerCenterState==3}">
                    <li class="list-group-item">店铺管理Store management</li>
                    <a href="/store/storeInformationUI.do"><li class="list-group-item">店铺信息</li></a>
                    <a href="/store/commodityManagementUI.do"><li class="list-group-item">商品管理</li></a>
                    <a href="/store/orderProcessingUI.do"><li class="list-group-item">订单处理</li></a>
                    <li class="list-group-item active">数据分析</li>
                    <a href="/store/ADManageUI.do"><li class="list-group-item">广告管理</li></a>
                </c:when>
                <c:when test="${sellerCenterState==30}">
                    <li class="list-group-item">店铺管理Store management</li>
                    <a href="/store/storeInformationUI.do"><li class="list-group-item">店铺信息</li></a>
                    <a href="/store/commodityManagementUI.do"><li class="list-group-item">商品管理</li></a>
                    <a href="/store/orderProcessingUI.do"><li class="list-group-item">订单处理</li></a>
                    <li class="list-group-item active">数据分析</li>
                    <a href="/store/ADManageUI.do"><li class="list-group-item">广告管理</li></a>
                </c:when>
                <c:when test="${sellerCenterState==6}">
                    <li class="list-group-item">店铺管理Store management</li>
                    <a href="/store/storeInformationUI.do"><li class="list-group-item">店铺信息</li></a>
                    <a href="/store/commodityManagementUI.do"><li class="list-group-item">商品管理</li></a>
                    <a href="/store/orderProcessingUI.do"><li class="list-group-item">订单处理</li></a>
                    <a href="/store/dataAnalysisUI.do"><li class="list-group-item">数据分析</li></a>
                   <li class="list-group-item  active">广告管理</li>
                </c:when>
            </c:choose>
        </ul>
    </div>

    <div class="col-md-9 column" style="background-color:#afd9ee;height: 800px;">
        <c:if test="${ not empty message}">
            <h1>${message}</h1>
        </c:if>

        <c:if test="${user.role!=1}">
                <h1>你还不是店铺所有者<a href="/store/storeRegisterUI.do">注册店铺</a></h1>
        </c:if>
        <c:if test="${user.role==1}">
            <c:if test="${sellerCenterState==1}">
                <div style="margin-left: 350px;margin-top: 90px">

                    <form action="/store/modifyStoreInformation.do" method="post" enctype="multipart/form-data">
                        店铺头像：<img id="displayImg" src="/static/store/storePictures/${store.storePicture}.jpg" style="height: 70px;width: 70px;"><br><br>
                        更换头像：<input type="file" name="storePicture" onchange="display(this)"><br><br>
                        店铺名称：<input name="storeName" value="${store.storeName}"><br><br>
                        店铺状态：
                            <c:if test="${store.storeState==0}">
                                营业中：<input type="radio" name="storeState" value="1">
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                闭店中：<input type="radio" name="storeState" value="0" checked><br><br>
                            </c:if>
                        <c:if test="${store.storeState==1}">
                            营业中：<input type="radio" name="storeState" value="1" checked>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            闭店中：<input type="radio" name="storeState" value="0"><br><br>
                        </c:if>
                        <c:if test="${store.storeState==2}">
                           <font style="color: red;">店铺被制裁中</font><br><br>
                        </c:if>
                        店铺地址：<input name="storeAddress" value="${store.storeAddress}"><br><br>
                        店铺介绍：<input name="storeIntroduction" value="${store.storeIntroduction}" style="width: 200px;height: 100px"><br><br>
                        <input type="submit" value="提交">
                    </form>

                </div>
            </c:if>
            <c:if test="${sellerCenterState==0}">
                <table cellSpacing="1" cellPadding="0" width="100%" align="center"
                       bgColor="#f5fafe" border="0">
                    <TBODY>
                    <tr>
                        <td class="ta_01" align="center" bgColor="#afd1f3"><strong>我的商品列表</strong>
                        </TD>
                    </tr>
                    <tr>
                        <td class="ta_01" align="right">
                            <c:if test="${store.storeState!=2}">
                                <a href="/store/addCommodityUI.do"><input type="button" value="添加商品">
                                </a>
                                <a href="/store/upperShelf.do"><input type="button" value="一键上架">
                                </a>
                                <a href="/store/lowerShelf.do"><input type="button" value="一键下架">
                                </a>
                            </c:if>
                            <c:if test="${store.storeState==2}">
                                <a href="javascript:void(0);" ><input type="button" value="添加商品">
                                </a>
                                <a href="javascript:void(0);"><input type="button" value="一键上架">
                                </a>
                                <a href="javascript:void(0);"><input type="button" value="一键下架">
                                </a>
                            </c:if>


                        </td>
                    </tr>
                    <tr>
                        <td class="ta_01" align="center" bgColor="#f5fafe">
                            <table cellspacing="0" cellpadding="1" rules="all"
                                   bordercolor="gray" border="1" id="DataGrid1"
                                   style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
                                <tr style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">

                                    <td align="center" width="5%">商品图片</td>
                                    <td align="center" width="17%">商品名称</td>
                                    <td align="center" width="5%">商品现价</td>
                                    <td align="center" width="10%">是否上架</td>
                                    <td align="center" width="5%">库存</td>
                                    <td width="7%" align="center">编辑</td>
                                    <td width="7%" align="center">删除</td>
                                </tr>
                                <c:forEach items="${commodityList.list}" var="commodity">


                                    <tr onmouseover="this.style.backgroundColor = 'white'"
                                        onmouseout="this.style.backgroundColor = '#F5FAFE';">
                                        <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                                            width="5%"><img width="40" height="45" src="/static/commodity/commodityPictures/${commodity.commodityPicture}.jpg"></td>
                                        <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                                            width="17%">${commodity.commodityName}</td>
                                        <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                                            width="5%">
                                            ￥:${commodity.commodityCurrentprice}
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
                                            width="5%">${commodity.commodityStock}</td>
                                        <td align="center" style="HEIGHT: 22px"><a onclick="modifyCommodity(${commodity.commodityId})">
                                            <img src="${pageContext.request.contextPath}/static/images/i_edit.gif"
                                                    border="0" style="CURSOR: hand">
                                        </a></td>

                                        <td align="center" style="HEIGHT: 22px"><a onclick="deleteCommodity(${commodity.commodityId})"> <img
                                                src="${pageContext.request.contextPath}/static/images/i_del.gif"
                                                width="16" height="16" border="0" style="CURSOR: hand">
                                        </a></td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </td>
                    </tr>

                    </TBODY>
                </table>
                <div style="width: 600px;  margin-top: 20px;margin-left:-150px">


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
                            <form id="jumpform" action="/store/commodityManagementUI.do">
                                <input type="text" name="currentPage" class="form-control" placeholder="跳到" style="width: 60px">
                            </form>
                            <span class="input-group-btn" style="width: 50px">
        <button class="btn btn-default" type="button" onclick="jump()">Go!</button>
      </span>
                        </div>

                        <!-- /input-group --><!-- /.col-lg-6 -->

                    </ul>

                </div>
            </c:if>
            <c:if test="${sellerCenterState==100}">
        <INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回"/>
                <div style="margin-left: 350px;margin-top: 30px">
        <form action="/store/addCommodity.do" method="post" enctype="multipart/form-data">
            商品图片：<img id="displayImg" src="/static/commodity/commodityPictures/${commodity.commodityPicture}.jpg" style="height: 130px;width: 130px;"><br>
           <input type="file" name="commodityPicture" onchange="display(this)"><br>
            商品名称：<input name="commodityName" ><br>
            商品分类：
            <select name="commodityCategoryId" >
                <c:forEach items="${allCategory}" var="category">
                    <option value="${category.categoryId}">${category.categoryName}</option>
                </c:forEach>
            </select><br>
            商品介绍：<input name="commodityIntroduce"  style="width: 200px;height: 50px;"><br>
            是否上架：
            <c:if test="${commodity.shelf==1}">
                上架：<input type="radio" name="shelf" value="1" checked>
                &nbsp;&nbsp;&nbsp;&nbsp;
                下架：<input type="radio" name="shelf" value="0"><br>
            </c:if>
            <c:if test="${commodity.shelf==0}">
                上架：<input type="radio" name="shelf" value="1">
                &nbsp;&nbsp;&nbsp;&nbsp;
                下架：<input type="radio" name="shelf" value="0" checked><br>
            </c:if>
            <c:if test="${empty commodity.shelf}">
                上架：<input type="radio" name="shelf" value="1">
                &nbsp;&nbsp;&nbsp;&nbsp;
                下架：<input type="radio" name="shelf" value="0"><br>
            </c:if>
            商品库存：<input name="commodityStock" ><br>
            商品原价：<input name="commodityPrice" ><br>
            商品现价：<input name="commodityCurrentprice" ><br>
            商品标重：<input name="commodityWeight" ><br>
            标重浮动：<input name="commodityFloat" ><br>
            商品品级：<input name="commodityLevel" ><br>
            <input type="submit" width="100" value="确认添加" name="submit" border="0" style="background: url('${pageContext.request.contextPath}/static/images/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0);
                    height:35px;width:100px;color:white;margin-left: 70px;margin-top: 10px;">
        </form>
    </div>
            </c:if>
            <c:if test="${sellerCenterState==2}">
                <div style="margin:0 auto; margin-top:10px;width:1100px;">
                    <strong style="font-size:16px;margin:5px 0;">我的订单</strong>
                    <a href="/store/getOrderWhereState_1.do?currentPage=1"><input type="button" value="未发货订单"></a>
                    <table class="table table-bordered">
                        <tbody>
                        <tr class="warning">
                            <th>订单时间</th>
                            <th>订单详情</th>
                            <th>订单金额</th>
                            <th>配送地址</th>
                            <th>联系人</th>
                            <th>联系电话</th>
                            <th>订单状态</th>
                            <th>操作</th>
                        </tr>

                            <%--遍历购物项集合--%>
                        <c:forEach items="${orderListPage.list}" var="order">

                            <tr class="active">
                                <td width="28%">
                                        ${order.orderTime}
                                </td>

                                <td width="8%">
                                    <span class="subtotal"><a ONCLICK="orderDetails(${order.orderId})" style="cursor: pointer">查看详情</a></span>
                                </td>

                                <td width="10%">
                                    <span class="subtotal">￥:${order.orderPrice}</span>
                                </td>

                                <td width="10%">
                                    <span class="subtotal">${order.address}</span>
                                </td>

                                <td width="6%">
                                    <span class="subtotal">${order.liaison}</span>
                                </td>

                                <td width="5%">
                                    <span class="subtotal">${order.telephone}</span>
                                </td>

                                <td width="15%">
                                        <%--<span class="subtotal">￥${citem.subtotal}</span>--%>
                                    <c:choose>
                                        <c:when test="${order.orderState==0}">
                                            等待买家支付
                                        </c:when>
                                        <c:when test="${order.orderState==1}">
                                            买家已付款，待发货
                                        </c:when>
                                        <c:when test="${order.orderState==2}">
                                            已发货，待买家收货
                                        </c:when>
                                        <c:when test="${order.orderState==3}">
                                           已收货，待评价
                                        </c:when>
                                        <c:when test="${order.orderState==4}">
                                            订单已完成
                                        </c:when>
                                    </c:choose>

                                </td>
                                <td width="15%">
                                    <c:choose>
                                        <c:when test="${order.orderState==0}">
                                           等待买家支付中
                                        </c:when>
                                        <c:when test="${order.orderState==1}">
                                            <a onclick="deliverCommodity(${order.orderId})" style="cursor:pointer;">发货</a>
                                        </c:when>
                                        <c:when test="${order.orderState==2}">
                                            等待买家收货
                                        </c:when>
                                        <c:when test="${order.orderState==3}">
                                            等待买家评论
                                        </c:when>
                                        <c:when test="${order.orderState==4}">
                                            订单已关闭
                                        </c:when>
                                    </c:choose>
                                </td>
                            </tr>

                        </c:forEach>

                        </tbody>
                    </table>
                    <!--分页 -->
                    <script>
                        function orderJump(id) {
                            var elementById = document.getElementById("orderJumpForm");
                            elementById.submit();
                        }
                        function orderSkip(id) {
                            var elementById = document.getElementById("orderSkip");
                            var id1 = document.getElementById("cp");
                            id1.value=id;
                            elementById.submit();
                        }
                    </script>
                    <form id="orderSkip" action="/store/orderProcessingUI.do" method="post">
                        <input name="currentPage" id="cp" type="hidden">
                        <input name="storeId" value="${store.storeId}" type="hidden">
                    </form>
                    <div style="width: 600px;  margin-top: 90px;margin-left:250px">


                        <ul class="pagination" style="width:550px;text-align: center; margin-top: 10px;">
                                <%--首页--%>
                            <li class=""><a onclick="orderSkip(1)" href="javascript:;" aria-label="Previous">首页</a></li>
                                <%--左键--%>
                            <c:if test="${orderListPage.currentPage == 1} ">
                                <li class="disabled"><a href="#" aria-label="Previous"><span
                                        aria-hidden="true">&laquo;</span></a></li>
                            </c:if>
                            <c:if test="${orderListPage.currentPage != 1}">
                                <li class=""><a onclick="orderSkip(${orderListPage.currentPage-1})" href="javascript:;" aria-label="Previous"><span
                                        aria-hidden="true">&laquo;</span></a></li>
                            </c:if>



                                <%--中间页码--%>
                            <c:forEach var="p"  begin="${orderListPage.currentPage-2>0 ? orderListPage.currentPage-2 : 1 }" end="${orderListPage.currentPage+2<orderListPage.pageTotal ? orderListPage.currentPage+2 :orderListPage.pageTotal}">
                                <c:if test="${p == orderListPage.currentPage}">
                                    <li class="active"><a href="javascript:;">${p}</a></li>
                                </c:if>
                                <c:if test="${p != orderListPage.currentPage}">
                                    <li class=""><a onclick="orderSkip(${p})" href="javascript:;" aria-label="Previous">${p}</a></li>
                                </c:if>
                            </c:forEach>

                                <%--右键--%>
                            <c:if test="${orderListPage.currentPage == orderListPage.pageTotal}}">
                                <li class="disabled"><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                                </a></li>
                            </c:if>
                            <c:if test="${orderListPage.currentPage != orderListPage.pageTotal}">
                                <li class=""><a onclick="orderSkip(${orderListPage.currentPage+1})" aria-label="Next" href="javascript:;"> <span aria-hidden="true">&raquo;</span>
                                </a></li>
                            </c:if>

                                <%--尾页--%>
                            <li class=""><a onclick="orderSkip(${orderListPage.pageTotal})" href="javascript:;" aria-label="Previous">尾页</a></li>

                                <%--显示页码的总页数--%>
                            <li ><a >共${orderListPage.pageTotal}页</a></li>
                                <%--跳转--%>

                            <div class="input-group" style="width: 100px">
                                <form id="orderJumpForm" action="/store/orderProcessingUI.do">
                                    <input type="text" name="currentPage" class="form-control" placeholder="跳到" style="width: 60px">
                                    <input type="hidden" name="storeId" value="${store.storeId}"  >
                                </form>
                                <span class="input-group-btn" style="width: 50px">
        <button class="btn btn-default" type="button" onclick="orderJump()">Go!</button>
      </span>
                            </div>

                            <!-- /input-group --><!-- /.col-lg-6 -->

                        </ul>

                    </div>
                    <!-- 分页结束 -->
                </div>
            </c:if>
            <c:if test="${sellerCenterState==21}">
                <INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回"/>
                <div style="margin:0 auto; margin-top:10px;width:1100px;">
                    <strong style="font-size:16px;margin:5px 0;">未发货订单</strong>
                    <table class="table table-bordered">
                        <tbody>
                        <tr class="warning">
                            <th>订单时间</th>
                            <th>订单详情</th>
                            <th>订单金额</th>
                            <th>配送地址</th>
                            <th>联系人</th>
                            <th>联系电话</th>
                            <th>订单状态</th>
                            <th>操作</th>
                        </tr>

                            <%--遍历购物项集合--%>
                        <c:forEach items="${orderListPage.list}" var="order">

                            <tr class="active">
                                <td width="28%">
                                        ${order.orderTime}
                                </td>

                                <td width="8%">
                                    <span class="subtotal"><a ONCLICK="orderDetails(${order.orderId})" style="cursor: pointer">查看详情</a></span>
                                </td>

                                <td width="10%">
                                    <span class="subtotal">￥:${order.orderPrice}</span>
                                </td>

                                <td width="10%">
                                    <span class="subtotal">${order.address}</span>
                                </td>

                                <td width="6%">
                                    <span class="subtotal">${order.liaison}</span>
                                </td>

                                <td width="5%">
                                    <span class="subtotal">${order.telephone}</span>
                                </td>

                                <td width="15%">
                                        <%--<span class="subtotal">￥${citem.subtotal}</span>--%>
                                    <c:choose>
                                        <c:when test="${order.orderState==0}">
                                            等待买家支付
                                        </c:when>
                                        <c:when test="${order.orderState==1}">
                                            买家已付款，待发货
                                        </c:when>
                                        <c:when test="${order.orderState==2}">
                                            已发货，待买家收货
                                        </c:when>
                                        <c:when test="${order.orderState==3}">
                                            已收货，待评价
                                        </c:when>
                                        <c:when test="${order.orderState==4}">
                                            订单已完成
                                        </c:when>
                                    </c:choose>

                                </td>
                                <td width="15%">
                                    <c:choose>
                                        <c:when test="${order.orderState==0}">
                                            等待买家支付中
                                        </c:when>
                                        <c:when test="${order.orderState==1}">
                                            <a onclick="deliverCommodity(${order.orderId})" style="cursor:pointer;">发货</a>
                                        </c:when>
                                        <c:when test="${order.orderState==2}">
                                            等待买家收货
                                        </c:when>
                                        <c:when test="${order.orderState==3}">
                                            等待买家评论
                                        </c:when>
                                        <c:when test="${order.orderState==4}">
                                            订单已关闭
                                        </c:when>
                                    </c:choose>
                                </td>
                            </tr>
                            <%--<script>--%>
                                <%--x(${shoppingCart.commodity.commodityCurrentprice*shoppingCart.commodityNumber});--%>
                            <%--</script>--%>
                        </c:forEach>

                        </tbody>
                    </table>
                    <!--分页 -->
                    <script>
                        function orderState_1_Jump(id) {
                            var elementById = document.getElementById("orderState_1_JumpForm");
                            elementById.submit();
                        }
                        function orderState_1_Skip(id) {
                            var elementById = document.getElementById("orderState_1_Skip");
                            var id1 = document.getElementById("state_1_cp");
                            id1.value=id;
                            elementById.submit();
                        }
                    </script>
                    <form id="orderState_1_Skip" action="/store/getOrderWhereState_1.do" method="post">
                        <input name="currentPage" id="state_1_cp" type="hidden">
                        <input name="storeId" value="${store.storeId}" type="hidden">
                    </form>
                    <div style="width: 600px;  margin-top: 90px;margin-left:250px">


                        <ul class="pagination" style="width:550px;text-align: center; margin-top: 10px;">
                                <%--首页--%>
                            <li class=""><a onclick="orderState_1_Skip(1)" href="javascript:;" aria-label="Previous">首页</a></li>
                                <%--左键--%>
                            <c:if test="${orderListPage.currentPage == 1} ">
                                <li class="disabled"><a href="#" aria-label="Previous"><span
                                        aria-hidden="true">&laquo;</span></a></li>
                            </c:if>
                            <c:if test="${orderListPage.currentPage != 1}">
                                <li class=""><a onclick="orderState_1_Skip(${orderListPage.currentPage-1})" href="javascript:;" aria-label="Previous"><span
                                        aria-hidden="true">&laquo;</span></a></li>
                            </c:if>



                                <%--中间页码--%>
                            <c:forEach var="p"  begin="${orderListPage.currentPage-2>0 ? orderListPage.currentPage-2 : 1 }" end="${orderListPage.currentPage+2<orderListPage.pageTotal ? orderListPage.currentPage+2 :orderListPage.pageTotal}">
                                <c:if test="${p == orderListPage.currentPage}">
                                    <li class="active"><a href="javascript:;">${p}</a></li>
                                </c:if>
                                <c:if test="${p != orderListPage.currentPage}">
                                    <li class=""><a onclick="orderState_1_Skip(${p})" href="javascript:;" aria-label="Previous">${p}</a></li>
                                </c:if>
                            </c:forEach>

                                <%--右键--%>
                            <c:if test="${orderListPage.currentPage == orderListPage.pageTotal}}">
                                <li class="disabled"><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                                </a></li>
                            </c:if>
                            <c:if test="${orderListPage.currentPage != orderListPage.pageTotal}">
                                <li class=""><a onclick="orderState_1_Skip(${orderListPage.currentPage+1})" aria-label="Next" href="javascript:;"> <span aria-hidden="true">&raquo;</span>
                                </a></li>
                            </c:if>

                                <%--尾页--%>
                            <li class=""><a onclick="orderState_1_Skip(${orderListPage.pageTotal})" href="javascript:;" aria-label="Previous">尾页</a></li>

                                <%--显示页码的总页数--%>
                            <li ><a >共${orderListPage.pageTotal}页</a></li>
                                <%--跳转--%>

                            <div class="input-group" style="width: 100px">
                                <form id="orderState_1_JumpForm" action="/store/getOrderWhereState_1.do">
                                    <input type="text" name="currentPage" class="form-control" placeholder="跳到" style="width: 60px">
                                    <input type="hidden" name="storeId" value="${store.storeId}"  >
                                </form>
                                <span class="input-group-btn" style="width: 50px">
        <button class="btn btn-default" type="button" onclick="orderState_1_Jump()">Go!</button>
      </span>
                            </div>

                            <!-- /input-group --><!-- /.col-lg-6 -->

                        </ul>

                    </div>
                    <!-- 分页结束 -->
                </div>
            </c:if>
            <c:if test="${sellerCenterState==10}">
            <div style="margin-left: 350px;margin-top: 30px">
                <INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回"/>
                <form action="/store/modifyCommodity.do" method="post" enctype="multipart/form-data">
                    <input name="commodityId" value="${commodity.commodityId}" type="hidden">
                    商品图片：<img id="displayImg" src="/static/commodity/commodityPictures/${commodity.commodityPicture}.jpg" style="height: 130px;width: 130px;"><br>
                    更换商品图片：<input type="file" name="commodityPicture" onchange="display(this)" >
                    更换商品宣传海报图片1：<input type="file" name="commodityPosterPicture1" >
                    更换商品宣传海报图片2：<input type="file" name="commodityPosterPicture2">
                    更换商品宣传海报图片3：<input type="file" name="commodityPosterPicture3">
                    <br>
                    商品名称：<input name="commodityName" value="${commodity.commodityName}"><br>
                    商品分类：
                    <select name="commodityCategoryId" >
                        <c:forEach items="${allCategory}" var="category">
                            <option value="${category.categoryId}">${category.categoryName}</option>
                        </c:forEach>
                    </select><br>
                    商品介绍：<input name="commodityIntroduce" value="${commodity.commodityIntroduce}" style="width: 200px;height: 50px;"><br>
                    是否上架：
                    <c:if test="${commodity.shelf==1}">
                        上架：<input type="radio" name="shelf" value="1" checked>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        下架：<input type="radio" name="shelf" value="0"><br>
                    </c:if>
                    <c:if test="${commodity.shelf==0}">
                        上架：<input type="radio" name="shelf" value="1">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        下架：<input type="radio" name="shelf" value="0" checked><br>
                    </c:if>
                    <c:if test="${commodity.shelf==2}">
                        <font style="color: red">制裁中,请联系管理员！</font><br>
                    </c:if>
                    商品库存：<input name="commodityStock" value="${commodity.commodityStock}"><br>
                    商品原价：<input name="commodityPrice" value="${commodity.commodityPrice}"><br>
                    商品现价：<input name="commodityCurrentprice" value="${commodity.commodityCurrentprice}"><br>
                    商品标重：<input name="commodityWeight" value="${commodity.commodityWeight}"><br>
                    标重浮动：<input name="commodityFloat" value="${commodity.commodityFloat}"><br>
                    商品品级：<input name="commodityLevel" value="${commodity.commodityLevel}"><br>
                    <input type="submit" width="100" value="确认修改" name="submit" border="0" style="background: url('${pageContext.request.contextPath}/static/images/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0);
                            height:35px;width:100px;color:white;margin-left: 70px;margin-top: 10px;">
                </form>
            </div>
            </c:if>
            <c:if test="${sellerCenterState==20}">
                <div style="margin:0 auto; margin-top:10px;width:1100px;">
                    <INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回"/>
                    <strong style="font-size:16px;margin:5px 0;">订单详情</strong>
                    <table class="table table-bordered">
                        <tbody>
                        <tr class="warning">
                            <th>图片</th>
                            <th>商品</th>
                            <th>价格</th>
                            <th>数量</th>
                            <th>小计</th>
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
                                <td width="25%">
                                        <%--<span class="subtotal">￥${citem.subtotal}</span>--%>
                                    <span class="subtotal">￥:${orderDetails.commodityNumber*orderDetails.commodity.commodityCurrentprice}</span>

                                </td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>
            </c:if>
            <c:if test="${sellerCenterState==3}">
                <a href="/store/dataAnalysisUI.do?sellerCenterState=30" ><input type="button" value="月度销售额柱图"></a>
                <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
                <div id="main" style="width: 1100px;height:1000px;"></div>

                <script type="text/javascript">

                    $(function () {
                        var dom = document.getElementById('main');
                        var myChart = echarts.init(dom);

                        /* 发送ajax请求 */
                        //发送key-value类型的请求数据
                        $.ajax({
                            type: "POST",
                            //当发送json数据时添加：
                            /*  contentType: "application/json; charset=utf-8", */
                            url: "${pageContext.request.contextPath}/store/getChart.do?storeId="+${store.storeId},
                            <%--url: "${pageContext.request.contextPath}/store/getChart.do?"+(new Date()).getTime()?storeId=${store.storeId},--%>
                            dataType: "json",
                            success: function (data) {
                                var n=0;
                                var name = new Array();
                                var values = new Array();
                                var dataValue = new Array();


                                //取出后台map，并把key，value赋给name，value数组
                                $.each(data,function(key,value){
                                    // alert("key: " + key + ", Value: " + value );
                                    name.push(key);
                                    values.push(value);
                                })

                                for(var i = 0;i<name.length;i++) {
                                    var temp = values[i];
                                    var num = parseInt(temp);
                                    /*alert(num);
                                    alert(name[i]);*/
                                    dataValue[i] = {value:values[i],name:name[i]};
                                }

                                //对echarts模板进行数据填充
                                option = {
                                    // backgroundColor: '#ccc',//背景色
                                    title : {
                                        text: '${store.storeName}商品销量统计饼图',
                                        x:'50%'
                                    },
                                    tooltip : {
                                        trigger: 'item',
                                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                                    },
                                    toolbox: {
                                        show : true,
                                        feature : {
                                            mark : {show: true},
                                            restore : {show: true},
                                            saveAsImage : {show: true}
                                        }
                                    },
                                    legend: {
                                        orient : 'vertical',
                                        x : 'left',
                                        data: name
                                    },
                                    calculable : true,
                                    series : [
                                        {
                                            name:'销量',
                                            type:'pie',
                                            radius : '50%',
                                            center: ['60%', '40%'],
                                            data: dataValue
                                        }
                                    ]
                                };

                                if (option && typeof option === "object") {//选项==选择选项==对象
                                    myChart.setOption(option, true);//set Option设置选项
                                }
                            },

                            error: function (data) {
                                alert("数据出错了！" );
                            }

                        });
                    })



                </script>
            </c:if>
            <c:if test="${sellerCenterState==30}">
                <INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回"/>
                <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
                <div id="main" style="width: 900px;height:600px;"></div>

                <div style="width: 800px;height:500px;">

                </div>
                <script type="text/javascript">

                    $(function () {
                        var dom = document.getElementById('main');
                        var myChart = echarts.init(dom);

                        /* 发送ajax请求 */
                        //发送key-value类型的请求数据
                        $.ajax({
                            type: "POST",
                            //当发送json数据时添加：
                            /*  contentType: "application/json; charset=utf-8", */
                            url: "${pageContext.request.contextPath}/store/getChart2.do?storeId="+${store.storeId},
                            <%--url: "${pageContext.request.contextPath}/store/getChart.do?"+(new Date()).getTime()?storeId=${store.storeId},--%>
                            dataType: "json",
                            success: function (data) {
                                var name = new Array();
                                var values = new Array();
                                // var dataValue = new Array();


                                //取出后台map，并把key，value赋给name，value数组
                                $.each(data,function(key,value){
                                    name.push(key);
                                    values.push(value);
                                })
                                // for(var i = 0;i<name.length;i++) {
                                //     var temp = values[i];
                                //     var num = parseInt(temp);
                                //     dataValue[i] = {value:values[i],name:name[i]};
                                // }

                                //对echarts模板进行数据填充
                                option = {
                                    title : {
                                        text: '${store.storeName}月度销售额柱图',
                                        // subtext: '纯属虚构'
                                    },
                                    tooltip : {
                                        trigger: 'axis'
                                    },
                                    legend: {
                                        data:name
                                    },

                                    toolbox: {
                                        show : true,
                                        feature : {
                                            mark : {show: true},
                                            dataView : {show: true, readOnly: false},
                                            magicType : {show: true, type: ['line', 'bar']},
                                            restore : {show: true},
                                            saveAsImage : {show: true}
                                        }
                                    },
                                    calculable : true,
                                    xAxis : [
                                        {
                                            type : 'category',
                                            data : name
                                            // data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
                                        }
                                    ],
                                    yAxis : [
                                        {
                                            type : 'value'
                                        }
                                    ],
                                    series : [
                                        {
                                            name:'销售额',
                                            type:'bar',
                                            data:values,
                                            markPoint : {
                                                data : [
                                                    {type : 'max', name: '最大值'},
                                                    {type : 'min', name: '最小值'}
                                                ]
                                            },
                                            markLine : {
                                                data : [
                                                    {type : 'average', name: '平均值'}
                                                ]
                                            }
                                        },
                                    ]
                                };

                                if (option && typeof option === "object") {//选项==选择选项==对象
                                    myChart.setOption(option, true);//set Option设置选项
                                }
                            },

                            error: function (data) {
                                alert("数据出错了！" );
                            }

                        });

                    })



                </script>
                </c:if>
            <c:if test="${sellerCenterState==6}">
                <div style="margin-left: 350px;margin-top: 90px">
                        <img id="d1" src="/static/store/storePosterPictures/${store.storePosterPicture1}.jpg" style="height: 120px;width:160px;">
                        <img id="d2" src="/static/store/storePosterPictures/${store.storePosterPicture2}.jpg" style="height: 120px;width:160px;">
                        <img id="d3" src="/static/store/storePosterPictures/${store.storePosterPicture3}.jpg" style="height: 120px;width:160px;">

                    <form action="/store/ADManage.do" method="post" enctype="multipart/form-data">
                        更换第一张：<input type="file" name="storePosterPicture1" onchange="d1(this)"><br><br>
                        更换第二张：<input type="file" name="storePosterPicture2" onchange="d2(this)"><br><br>
                        更换第三张：<input type="file" name="storePosterPicture3" onchange="d3(this)"><br><br>
                        <input type="submit" value="提交">
                    </form>
                    <script type="text/javascript">
                        //添加input框的onChange事件
                        function d1(obj) {
                            var file = obj.files[0];

                            console.log(obj);console.log(file);
                            console.log("file.size = " + file.size);  //file.size 单位为byte

                            var reader = new FileReader();

                            //注册相关的回调
                            //成功后的回调，最重要的一个
                            reader.onload = function (e) {
                                //展示
                                var img = document.getElementById("d1");
                                img.src = e.target.result;
                            }

                            //读取
                            reader.readAsDataURL(file)
                        }
                        function d2(obj) {
                            var file = obj.files[0];

                            console.log(obj);console.log(file);
                            console.log("file.size = " + file.size);  //file.size 单位为byte

                            var reader = new FileReader();

                            //注册相关的回调
                            //成功后的回调，最重要的一个
                            reader.onload = function (e) {
                                //展示
                                var img = document.getElementById("d2");
                                img.src = e.target.result;
                            }

                            //读取
                            reader.readAsDataURL(file)
                        }
                        function d3(obj) {
                            var file = obj.files[0];

                            console.log(obj);console.log(file);
                            console.log("file.size = " + file.size);  //file.size 单位为byte

                            var reader = new FileReader();

                            //注册相关的回调
                            //成功后的回调，最重要的一个
                            reader.onload = function (e) {
                                //展示
                                var img = document.getElementById("d3");
                                img.src = e.target.result;
                            }

                            //读取
                            reader.readAsDataURL(file)
                        }
                    </script>

                </div>
            </c:if>
        </c:if>


</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>
