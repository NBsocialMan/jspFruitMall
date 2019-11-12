
<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/5/9
  Time: 14:43
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
    <!-- 引入自定义css文件 style.css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css" type="text/css" />
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<br><br><br>
<div class="container">
    <div class="row">

        <div style="margin: 0 auto; margin-top: 10px; width:1000px;">
            <strong>订单详情</strong>
            <table class="table table-bordered">
                <tbody>
                <tr class="warning">
                    <th colspan="5">订单编号:${order.orderId}</th>
                </tr>
                <tr class="warning">
                    <th>图片</th>
                    <th>商品</th>
                    <th>价格</th>
                    <th>数量</th>
                    <th>小计</th>
                </tr>

                <c:forEach var="orderDetails" items="${order.orderDetailsList}">
                    <tr class="active">
                        <td width="60" width="40%"><input type="hidden" name="id"
                                                          value="22"> <img src="/static/commodity/commodityPictures/${orderDetails.commodity.commodityPicture}.jpg" width="70"
                                                                           height="60"></td>
                        <td width="30%"><a target="_blank"> ${orderDetails.commodity.commodityName}</a></td>
                        <td width="20%">￥${orderDetails.commodity.commodityCurrentprice}</td>
                        <td width="10%">${orderDetails.commodityNumber}</td>
                        <td width="15%"><span class="subtotal">￥${orderDetails.commodityNumber*orderDetails.commodity.commodityCurrentprice}</span></td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
        <div style="text-align: right; margin-right: 120px;">
            商品金额: <strong style="color: #ff6600;">￥${order.orderPrice}元</strong>
        </div>


    </div>

    <div>
        <hr />
        <form class="form-horizontal" action="/order/payment.do" method="post" id="payment"
              style="margin-top: 5px; margin-left: 150px;">
            <input name="userId" value="${user.id}" type="hidden">
            <input name="orderId" value="${order.orderId}" type="hidden">
            <div class="form-group">
                <label for="address" class="col-sm-2 control-label">收货地址</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="address" name="address"
                           placeholder="请输入收货地址" value="${user.receiveAddress}">
                </div>
            </div>
            <div class="form-group">
                <label for="liaison" class="col-sm-2 control-label">收货人</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="liaison" name="liaison"
                           placeholder="请输收货人" value="${user.realname}">
                </div>
            </div>
            <div class="form-group">
                <label for="telephone" class="col-sm-2 control-label">联系电话</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="telephone" name="telephone"
                           placeholder="请输入联系方式" value="${user.telephone}">
                </div>
            </div>
        </form>

        <hr />

        <div style="margin-top: 5px; margin-left: 150px;">
            <strong>付款方式：</strong>
            <p>
                <br />
                <input type="radio" name="pd_FrpId" value="ICBC-NET-B2C" checked="checked" />支付宝支付
                <img src="/static/bank_img/alipay.jpg" align="middle" style="width: 154px;height: 33px;"/>&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="pd_FrpId" value="ICBC-NET-B2C" checked="checked" />微信支付
                <img src="/static/bank_img/wechatpay.jpg" align="middle" style="width: 154px;height: 33px;"/>&nbsp;&nbsp;&nbsp;&nbsp;
                <br>
                <input type="radio" name="pd_FrpId" value="ICBC-NET-B2C"  />工商银行
                <img src="/static/bank_img/icbc.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="pd_FrpId" value="BOC-NET-B2C" />中国银行 <img
                    src="/static/bank_img/bc.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="pd_FrpId" value="ABC-NET-B2C" />农业银行 <img
                    src="/static/bank_img/abc.bmp" align="middle" /> <br /> <br /> <input
                    type="radio" name="pd_FrpId" value="BOCO-NET-B2C" />交通银行 <img
                    src="/static/bank_img/bcc.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="pd_FrpId" value="PINGANBANK-NET" />平安银行
                <img src="/static/bank_img/pingan.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="pd_FrpId" value="CCB-NET-B2C" />建设银行 <img
                    src="/static/bank_img/ccb.bmp" align="middle" /> <br /> <br /> <input
                    type="radio" name="pd_FrpId" value="CEB-NET-B2C" />光大银行 <img
                    src="/static/bank_img/guangda.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="pd_FrpId" value="CMBCHINA-NET-B2C" />招商银行
                <img src="/static/bank_img/cmb.bmp" align="middle" />

            </p>
            <hr />
            <p style="text-align: right; margin-right: 100px;">
                <a href="javascript:document.getElementById('payment').submit();">
                    <img src="/static/images/finalbutton.gif" width="204" height="51"
                         border="0" />
                </a>
            </p>
            <hr />

        </div>
    </div>

</div>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
