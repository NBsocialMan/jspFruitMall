<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/23
  Time: 19:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.0.0.min.js" type="text/javascript"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- 引入自定义css文件 style.css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css" type="text/css" />
    <script src="${pageContext.request.contextPath}/static/kindeditor/kindeditor-all.js" type="text/javascript"></script>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/static/js/kindeditor-all-min.js" type="text/javascript" />--%>
</head>
<style>
    body {
        margin-top: 20px;
        margin: 0 auto;
    }

    .carousel-inner .item img {
        width: 100%;
        height: 300px;
    }



    *{margin:0;padding:0;list-style-type:none;}
    a,img{border:0;}
    img{vertical-align:middle;}
    #QuacorGrading input{background:url('${pageContext.request.contextPath}/static/images/star.png') no-repeat scroll right center;cursor:pointer;height:30px;width:30px;padding:0;border:0;}

    #AOLIGEI input{background:url('${pageContext.request.contextPath}/static/images/star.png') no-repeat scroll left center;cursor:pointer;height:30px;width:30px;padding:0;border:0;}





</style>
</head>
<script>
    var editor;
    KindEditor.ready(function(K) {
        editor = K.create('#content', {
            allowImageUpload: true, //上传图片框本地上传的功能，false为隐藏，默认为true
            allowImageRemote : true, //上传图片框网络图片的功能，false为隐藏，默认为true
            allowFileManager : true, //浏览图片空间
            items:['undo', 'redo', 'cut', 'copy', 'justifyleft', 'justifycenter', 'justifyright','justifyfull', 'insertorderedlist', 'insertunorderedlist','formatblock', 'fontname', 'fontsize', 'forecolor', 'hilitecolor', 'bold','italic', 'underline', 'strikethrough', 'lineheight','hr', 'removeformat', 'pagebreak', 'anchor', 'link', 'unlink', 'about','clearhtml'],
            height: '280px',
            width: '100%',
            resizeType:0,

            afterBlur: function(){this.sync()},
            afterChange : function() {
            }
        });
    });
</script>
<%--<script>--%>
    <%--$(function() {--%>
        <%--var editor = KindEditor.create('#content');--%>
    <%--});--%>
<%--</script>--%>
<script >


     $(document).ready(function () {



         if (${not empty ms}){
             alert("你不能添加自己的商品！");
         }
         var GradList = document.getElementById("QuacorGrading").getElementsByTagName("input");
         for(var di=0;di<parseInt(document.getElementById("QuacorGradingValue").getElementsByTagName("font")[0].innerHTML);di++){
             GradList[di].style.backgroundPosition = 'left center';
         }


         for(var i=0;i < GradList.length;i++){
             GradList[i].onmouseover = function(){
                 for(var Qi=0;Qi<GradList.length;Qi++){
                     GradList[Qi].style.backgroundPosition = 'right center';
                 }
                 for(var Qii=0;Qii<this.name;Qii++){
                     GradList[Qii].style.backgroundPosition = 'left center';
                 }
                 document.getElementById("QuacorGradingValue").innerHTML = '<b><font size="5" color="#fd7d28">'+this.name+'</font></b>分';
                 document.getElementById("score").value=this.name;
             }
         }

     });


     </script>



<body>
<input type="hidden" id="cnm" >
<!-- 引入header.jsp -->
<jsp:include page="header.jsp"></jsp:include>
<br><br><br><br>
<form id="storeDetails" action="/store/storeDetails.do">
    <input name="storeId" type="hidden" id="storeId">
</form>
<script>
    function storeDetails(id) {
        var elementById = document.getElementById("storeDetails");
        var id1 = document.getElementById("storeId");
        id1.value=id;
        elementById.submit();
    }
</script>

<div class="container">
    <div class="row">


        <div style="margin: 0 auto; width: 950px;">
            <div class="col-md-6">
                <img style="opacity: 1; width: 400px; height: 350px;"
                     class="medium"
                     src="/static/commodity/commodityPictures/${commodity.commodityPicture}.jpg">
            </div>

            <div class="col-md-6">
                <div >
                    <strong>${commodity.commodityName}</strong>
                </div>
                <div style="border-bottom: 1px dotted #dddddd; width: 350px; margin: 10px 0 10px 0;">
                    商品店铺：<a onclick="storeDetails(${commodity.store.storeId})" style="cursor: pointer">${commodity.store.storeName}</a>
                </div>

                <div style="margin: 10px 0 10px 0;">
                    现价: <strong style="color: #ef0101;">￥：${commodity.commodityCurrentprice}元/份</strong> 参 考 价：
                    <del>￥${commodity.commodityPrice}元/份</del>
                </div>

                <div style="margin: 10px 0 10px 0;">
                    促销: <a target="_blank" title="限时抢购 (2014-07-30 ~ 2015-01-01)"
                           style="background-color: #f07373;">${commodity.category.categoryName}</a>
                </div>

                <div style="padding: 10px; border: 1px solid #e7dbb1; width: 390px; margin: 15px 0 10px 0;; background-color: #fffee6;margin-left: 10px;margin-top: 50px;">
                    <%--<div style="margin: 5px 0 10px 0;">白色</div>--%>

                    <div style="border-bottom: 1px solid #faeac7; margin-top: 20px; padding-left: 10px;">
                        <form action="/shoppingCart/addCart.do" method="post" id="aform">
                            <input type="hidden" name="userId" value="${user.id}">
                            <input type="hidden" name="commodityId" value="${commodity.commodityId}">
                            &nbsp;&nbsp;&nbsp;
                            购买数量: <input id="commodityNumber" name="commodityNumber" value="1"
                                         maxlength="4" size="10" type="text">&nbsp;&nbsp;&nbsp;当前库存:${commodity.commodityStock}件
                        </form>
                        <input id="commodityStock" type="hidden" value="${commodity.commodityStock}">

                        <form action="/favoritesCommoditylist/add.do" method="post" id="addF">
                            <input type="hidden" value="${user.id}" name="userId">
                            <input type="hidden" value="${commodity.commodityId}" name="commodityId">
                        </form>
                    </div>

                    <div style="margin: 20px 0 10px 0;; text-align: center;">
                        <a href="javascript:;" onclick="addCart()">
                            <input style="background: url('${pageContext.request.contextPath}/static/images/product.gif') no-repeat scroll 0 -600px rgba(0, 0, 0, 0); height: 36px; width: 127px;" value="加入购物车" type="button">
                        </a>
                        &nbsp;&nbsp;&nbsp;
                        <a href="javascript:;" onclick="addF()">
                            收藏商品
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="clear"></div>
            <div style="background-color: #d3d3d3; width: 1000px; padding: 10px 10px;margin: 0 auto;">
                <strong>商品参数</strong>
            </div>
            <div style="margin-top: 10px; width: 1000px;margin: 0 auto;">
                <table class="table table-bordered" style="width: 1000px">
                    <tbody>
                    <tr class="active">
                        <th colspan="2">基本参数</th>
                    </tr>
                    <tr>
                        <th width="10%">级别</th>
                        <td width="30%">${commodity.commodityLevel}</td>
                    </tr>
                    <tr>
                        <th width="10%">标重</th>
                        <td>${commodity.commodityWeight}</td>
                    </tr>
                    <tr>
                        <th width="10%">浮动</th>
                        <td>${commodity.commodityFloat}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        <div style="width: 1000px; margin: 0 auto;">
            <div style="background-color: #d3d3d3; width: 1000px; padding: 10px 10px; margin: 10px 0 10px 0;">
                <strong>商品介绍</strong>
            </div>

            <div>
                <c:if test="${empty commodity.commodityPosterPicture1}">
                    <h3>暂时没有商品介绍图</h3>
                </c:if>
                <div style="margin-left: 30px">
                    <c:if test="${not empty commodity.commodityPosterPicture1}" >
                        <img src="/static/commodity/commodityPosterPictures/${commodity.commodityPosterPicture1}.jpg">
                    </c:if>
                    <c:if test="${not empty commodity.commodityPosterPicture2}" >
                        <img
                                src="/static/commodity/commodityPosterPictures/${commodity.commodityPosterPicture2}.jpg">
                    </c:if>
                    <c:if test="${not empty commodity.commodityPosterPicture3}" >
                        <img
                                src="/static/commodity/commodityPosterPictures/${commodity.commodityPosterPicture3}.jpg">
                    </c:if>
                </div>



            </div>



            <div style="background-color: #d3d3d3; width: 1000px;">
                <table class="table table-bordered">
                    <tbody>

                    <c:if test="${commentState==1}">
                        <tr class="active">
                            <th><strong>添加商品评论</strong></th>
                        </tr>
                        <tr style="background-color: snow">
                            <th>
                                <div id="QuacorGrading">
                                    <strong>评分</strong>
                                    <input name="1" type="button" />
                                    <input name="2" type="button" />
                                    <input name="3" type="button" />
                                    <input name="4" type="button" />
                                    <input name="5" type="button" />
                                    <input name="6" type="button" />
                                    <input name="7" type="button" />
                                    <input name="8" type="button" />
                                    <input name="9" type="button" />
                                    <input name="10" type="button" />
                                    <span id="QuacorGradingValue"><b><font size="5" color="#fd7d28">6</font></b>分</span>
                                </div>
                            </th>

                        </tr>
                        <tr class="warning">
                            <th>
                                <form action="/comment/addComment.do" id="newComment" method="post">
                                    <input name="userId" value="${user.id}" type="hidden">
                                    <input name="commodityId" value="${commodity.commodityId}" type="hidden">
                                    <input type="hidden" name="score" id="score">
                                    <input name="orderId" value="${orderId}" type="hidden">
                                    <textarea  id="content" style="width:800px;height: 150px" name="content"></textarea>
                                    <span class="col-lg-8" id="editor"></span>
                                    <input type="submit"value="提交评论">
                                </form>
                            </th>
                        </tr>
                    </c:if>
                    <tr class="active">
                        <div style="background-color: #d3d3d3; width: 1000px; padding: 10px 10px; margin: 10px 0 10px 0;">
                            <strong>商品评论</strong>
                        </div>
                    </tr>
                    <c:if test="${ empty commentList}">
                        <tr class="warning">
                            <th>暂无商品评论信息</th>
                        </tr>
                    </c:if>
                    <c:if test="${not empty commentList}">
                        <tr class="warning">
                            <c:forEach var="comment" items="${commentList}">

                                <tr class="active">
                                    <th><strong>评论用户:${comment.user.name}</strong></th>
                                </tr>
                                <tr class="active">
                                    <th><strong>评论时间:${comment.commentTime}</strong></th>
                                </tr>
                                <tr class="active">
                                    <th><strong>评分:
                                        <div id="AOLIGEI">
                                        <c:forEach begin="1" end="${comment.commentScore}">
                                            <input  type="button" />
                                        </c:forEach>
                                        </div>
                                            ${comment.commentScore}分
                                    </strong></th>
                                </tr>
                                <th>${comment.commentContent}</th>
                            </c:forEach>
                        </tr>
                    </c:if>


                    </tbody>
                </table>
            </div>

        </div>

    </div>
</div>


<!-- 引入footer.jsp -->
<jsp:include page="footer.jsp"></jsp:include>


<script>
    var number = document.getElementById("commodityNumber");
    var stock = document.getElementById("commodityStock");
    number.onblur=function () {
        if(parseInt(number.value)<1||parseInt(number.value)==" "){
            alert("1个起卖");
            number.value=1;
        }
        if (parseInt(number.value)>parseInt(stock.value)){
            alert("您所填写的商品数量超过库存!");
            number.value=1;
        }
    }

    function addCart() {
       var elementById = document.getElementById("aform");
       elementById.submit();

    }
    function addF() {
        var elementById = document.getElementById("addF");
        elementById.submit();
    }

</script>

</body>
</html>
