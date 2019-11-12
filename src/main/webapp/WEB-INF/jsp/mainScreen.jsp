
<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/4/17
  Time: 21:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<br>
<form id="categoryCommodityList" action="/category/getCommodityListByCategoryId.do" method="post">
    <input type="hidden" name="categoryId" id="categoryId">
</form>
<form action="/commodity/commodityDetail.do" method="post" id="details">
    <input type="hidden" name="commodityId" id="commodityId">
</form>
<script>
function getCategoryCommodityList(id) {
    var elementById = document.getElementById("categoryCommodityList");
    var id1 = document.getElementById("categoryId");
    id1.value=id;
    elementById.submit();
}
function details(id) {
    var form = document.getElementById("details");
    var id1 = document.getElementById("commodityId");
    id1.value=id;
    form.submit();
}
</script>
<br>
<div style="margin-left: 50px;margin-top: 20px">
    <div class="col-md-12 column" style="background-color:#afd9ee;width: 1420px">
        <ul class="nav nav-pills">
                <li role="presentation" class="active" style="margin-left: -13px"><a href="#">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-equalizer"></span>
                    &nbsp;&nbsp;主&nbsp;&nbsp;题&nbsp;&nbsp;会&nbsp;&nbsp;场&nbsp;&nbsp;&nbsp;&nbsp;
                    <span class="glyphicon glyphicon-th"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            <c:if test="${categoryList!=null}">
                <c:forEach items="${categoryList}" var="category" >
                    <li role="presentation"><a onclick="getCategoryCommodityList(${category.categoryId})" style="cursor: pointer;">${category.categoryName}</a></li>
                </c:forEach>
            </c:if>
        </ul>

    </div>
    <br>
    <!-- 整个 -->
    <div class="row clearfix" style="margin-top: 50px">
        <!-- 左侧分类 -->
        <div class="col-md-2 column" >

            <div class="panel-group " id="panel-228439">

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <a class="panel-title" href="#all" data-toggle="collapse" data-parent="#panel-228439">鲜果菜蔬</a>
                    </div>
                    <div class="panel-collapse collapse in " id="all">
                        <div class="panel-body">
                            随便逛逛......
                        </div>
                    </div>
                </div>
                <!--春季-->

                <div class="panel panel-success">
                    <div class="panel-heading">
                        <a  href="#spring0" data-toggle="collapse" data-parent="#panel-228439">春季鲜果</a>
                    </div>
                    <div class="panel-collapse collapse" id="spring0">
                        <div class="panel-body">
                            柠檬
                        </div>
                        <div class="panel-body">
                            枇杷
                        </div>
                        <div class="panel-body">
                            圣女果
                        </div>
                        <div class="panel-body">
                            菠萝
                        </div>
                        <div class="panel-body">
                            火龙果
                        </div>
                        <div class="panel-body">
                            草莓
                        </div>
                        <div class="panel-body">
                            荔枝
                        </div>
                        <div class="panel-body">
                            桑葚
                        </div>
                        <div class="panel-body">
                            山竹
                        </div>
                        <div class="panel-body">
                            樱桃
                        </div>
                    </div>
                </div>
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <a  href="#spring1" data-toggle="collapse" data-parent="#panel-228439">春季时蔬</a>
                    </div>
                    <div class="panel-collapse collapse" id="spring1">
                        <div class="panel-body">
                            萝卜
                        </div>
                        <div class="panel-body">
                            菠菜
                        </div>
                        <div class="panel-body">
                            大葱
                        </div>
                        <div class="panel-body">
                            韭菜
                        </div>
                        <div class="panel-body">
                            土豆
                        </div>
                        <div class="panel-body">
                            西兰花
                        </div>
                        <div class="panel-body">
                            白菜
                        </div>
                        <div class="panel-body">
                            彩椒
                        </div>
                    </div>
                </div>

                <!--夏季-->
                <div class="panel panel-danger">
                    <div class="panel-heading">
                        <a class="panel-title" href="#summer0" data-toggle="collapse" data-parent="#panel-228439">夏季鲜果</a>
                    </div>
                    <div class="panel-collapse collapse " id="summer0">
                        <div class="panel-body ">黑莓</div>
                        <div class="panel-body ">蓝莓</div>
                        <div class="panel-body ">榴莲</div>
                        <div class="panel-body ">桃</div>
                        <div class="panel-body ">西瓜</div>
                        <div class="panel-body ">杨梅</div>
                        <div class="panel-body ">椰子</div>
                        <div class="panel-body ">苹果</div>
                        <div class="panel-body ">哈密瓜</div>
                        <div class="panel-body ">芒果</div>
                        <div class="panel-body ">百香果</div>
                        <div class="panel-body ">猕猴桃</div>
                        <div class="panel-body ">葡萄</div>
                        <div class="panel-body ">沙果</div>
                        <div class="panel-body ">无花果</div>
                    </div>
                </div>
                <div class="panel panel-danger">
                    <div class="panel-heading">
                        <a class="panel-title" href="#summer1" data-toggle="collapse" data-parent="#panel-228439">夏季时蔬</a>
                    </div>
                    <div class="panel-collapse collapse" id="summer1">
                        <div class="panel-body">白菜</div>
                        <div class="panel-body ">豆角</div>
                        <div class="panel-body ">冬瓜</div>
                        <div class="panel-body ">黄瓜</div>
                        <div class="panel-body ">红薯</div>
                        <div class="panel-body ">茄子</div>
                        <div class="panel-body ">西红柿</div>
                        <div class="panel-body ">油菜</div>
                    </div>
                </div>

                <!--秋季-->
                <div class="panel panel-warning">
                    <div class="panel-heading">
                        <a class="panel-title" href="#autumn0" data-toggle="collapse" data-parent="#panel-228439">秋季鲜果</a>
                    </div>
                    <div class="panel-collapse collapse" id="autumn0">
                        <div class="panel-body">海棠果</div>
                        <div class="panel-body">蜜柑</div>
                        <div class="panel-body">蟠桃</div>
                        <div class="panel-body">蛇果</div>
                        <div class="panel-body">柿子</div>
                        <div class="panel-body">石榴</div>
                        <div class="panel-body">西柚</div>
                        <div class="panel-body">梨</div>
                        <div class="panel-body">枣</div>
                        <div class="panel-body">橄榄</div>
                        <div class="panel-body">脐橙</div>
                        <div class="panel-body">山楂</div>
                        <div class="panel-body">香蕉</div>
                        <div class="panel-body">柚子</div>
                        <div class="panel-body">甘蔗</div>
                        <div class="panel-body">人参果</div>
                    </div>
                </div>
                <div class="panel panel-warning">
                    <div class="panel-heading">
                        <a class="panel-title" href="#autumn1" data-toggle="collapse" data-parent="#panel-228439">秋季时蔬</a>
                    </div>
                    <div class="panel-collapse collapse" id="autumn1">
                        <div class="panel-body">百合</div>
                        <div class="panel-body">菜花</div>
                        <div class="panel-body">大辣椒</div>
                        <div class="panel-body">大蒜</div>
                        <div class="panel-body">姜</div>
                        <div class="panel-body">木耳</div>
                        <div class="panel-body">油菜</div>
                    </div>
                </div>

                <!--冬季-->
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <a class="panel-title" href="#winter0" data-toggle="collapse" data-parent="#panel-228439">冬季菜蔬</a>
                    </div>
                    <div class="panel-collapse collapse" id="winter0">
                        <div class="panel-body">菠萝</div>
                        <div class="panel-body">甘蔗</div>
                        <div class="panel-body">橘子</div>
                        <div class="panel-body">香蕉</div>
                        <div class="panel-body">柠檬</div>
                        <div class="panel-body">圣女果</div>
                    </div>
                </div>
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <a class="panel-title" href="#winter1" data-toggle="collapse" data-parent="#panel-228439">冬季时蔬</a>
                    </div>
                    <div class="panel-collapse collapse" id="winter1">
                        <div class="panel-body">白菜</div>
                        <div class="panel-body">菠菜</div>
                        <div class="panel-body">彩椒</div>
                        <div class="panel-body">春笋</div>
                        <div class="panel-body">胡萝卜</div>
                        <div class="panel-body">红薯</div>
                        <div class="panel-body">韭菜</div>
                        <div class="panel-body">土豆</div>
                        <div class="panel-body">小白菜</div>
                    </div>
                </div>
            </div>
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
            <div class="thumbnail "style="width:240px;height:2050px;margin-top: 80px;margin-left: -10px">
                <h1>
                    <span class="label label-danger" style="margin-left: 2px">&nbsp;&nbsp;<span class="glyphicon glyphicon-fire"></span>&nbsp;&nbsp;热门店铺&nbsp;&nbsp;&nbsp;&nbsp;</span></h1><br>
                <c:forEach items="${hotStoreList}" var="store">
                    <div class="thumbnail"style="width: 160px;height: 160px;margin-left: 30px" >
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
        <div class="col-md-10 column">
            <div class="col-md-8 column">
                <div id="myCarousel" class="carousel slide"  style="width: 880px;height: 485px;">
                    <div class="carousel-inner" style="width: 880px;height: 485px;">
                        <ol class="carousel-indicators">
                            <li data-target="#myCarousel" data-slide-to ="0" class="active" ></li>
                            <li data-target="#myCarousel" data-slide-to ="1"></li>
                            <li data-target="#myCarousel" data-slide-to ="2"></li>
                            <li data-target="#myCarousel" data-slide-to ="3"></li>
                        </ol>


                        <div class="item active">
                            <a href="${adList.get(0).adUrl}">
                                <img src="/static/ad/${adList.get(0).adImg}.jpg" alt="第一张" width="100%">
                            </a>
                        </div>
                        <div class="item">
                            <a href="${adList.get(1).adUrl}">
                                <img src="/static/ad/${adList.get(1).adImg}.jpg" alt="第二张" width="100%">
                            </a>
                        </div>
                        <div class="item">
                            <a href="${adList.get(2).adUrl}">
                                <img src="/static/ad/${adList.get(2).adImg}.jpg" alt="第三张" width="100%">
                            </a>
                        </div>
                        <div class="item">
                            <a href="${adList.get(3).adUrl}">
                                <img src="/static/ad/${adList.get(3).adImg}.jpg" alt="第四张" width="100%">
                            </a>
                        </div>
                        <a href="#myCarousel" data-slide="prev" class="carousel-control left"><!-- ‹ -->
                            <span class="glyphicon glyphicon-chevron-left"></span>
                        </a><!-- 左箭头 -->
                        <a href="#myCarousel" data-slide="next" class="carousel-control right"><!-- › -->
                            <span class="glyphicon glyphicon-chevron-right"></span>


                        </a><!-- 右箭头 -->

                    </div>
                </div>

            </div>
            <c:if test="${empty user}">
            <div class="col-md-4 column" ><div >
                <div style="margin-left: 50px">
                    <h1><span class="label label-primary" style="margin-left: 130px;"><span class="glyphicon glyphicon-user"></span></span></h1><br>
                    &nbsp;
                    &nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Hi,你好<br>
                </div>

                <div class="btn-group " role="group" aria-label="" style="margin-left: 130px">
                    <button type="button" class="btn btn-default"><a href="/user/registerUI.do">注册</a></button>
                    <button type="button" class="btn btn-default"><a href="/user/loginUI.do">登录</a></button>
                    <button type="button" class="btn btn-default"><a href="/user/loginUI.do">开店</a></button>
                </div>
            </div>
            </c:if>
                <c:if test="${not empty user}">
                <form action="/order/myOrderPlus.do" method="post" id="oderPLUS">
                    <input type="hidden" name="state" id="state">
                </form>
                <script>
                    function oPLUs(sta) {
                        var elementById = document.getElementById("oderPLUS");
                        var s = document.getElementById("state");
                        s.value=sta;
                        elementById.submit();
                    }
                </script>
                <div class="col-md-4 column" style="height: 500px;"><div >
                    <div style="margin-left: 50px">
                        <h1><span class="label label-primary" style="margin-left: 140px;"><span class="glyphicon glyphicon-user"></span></span></h1><br>
                        &nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Hi,你好：${user.name}<br>
                    </div>
                    <div class="btn-group " role="group"  style="margin-left: 70px;width: 320px;margin-top: 30px">
                        <button type="button" class="btn btn-default" onclick="oPLUs(0)" style="width: 80px">待付款
                            <c:if test="${ not empty orderNum0 and orderNum0!=0 }">
                                <span class="badge">${orderNum0}</span>
                            </c:if>
                        </button>
                        <button type="button" class="btn btn-default" onclick="oPLUs(1)" style="width: 80px">待发货
                            <c:if test="${ not empty orderNum1 and orderNum1!=0 }">
                                <span class="badge">${orderNum1}</span>
                            </c:if>
                        </button>
                        <button type="button" class="btn btn-default" onclick="oPLUs(2)" style="width: 80px">待收货
                            <c:if test="${ not empty orderNum2 and orderNum2!=0 }">
                                <span class="badge">${orderNum2}</span>
                            </c:if>
                        </button>
                        <button type="button" class="btn btn-default" onclick="oPLUs(3)" style="width: 80px">待评价
                            <c:if test="${ not empty orderNum3 and orderNum3!=0 }">
                                <span class="badge">${orderNum3}</span>
                            </c:if>
                        </button>
                    </div>
                </div>
                </c:if>
                    <div style="width: 240px;height: 350px;margin-top: 40px;margin-left: 100px">
                        <ul class="nav nav-pills nav-stacked">
                            <li role="presentation" class="active"><a href="#">主题市场</a></li>
                            <form action="/commodity/myGetCommodityList.do" method="post" id="sf">
                                <input name="searchName" type="hidden" id="s">
                            </form>
                            <script>
                                function searchSpecial(n) {
                                    var elementById = document.getElementById("sf");
                                    var byId = document.getElementById("s");
                                    byId.value=n;
                                    elementById.submit();
                                }
                            </script>
                            <li role="presentation"><a onclick="searchSpecial('水果捞')" style="cursor: pointer">水果捞</a></li>
                            <li role="presentation"><a onclick="searchSpecial('水果蛋糕')" style="cursor: pointer">水果蛋糕</a></li>
                            <li role="presentation"><a onclick="searchSpecial('水果罐头')" style="cursor: pointer">水果罐头</a></li>
                            <li role="presentation"><a onclick="searchSpecial('水果冰粉')" style="cursor: pointer">水果冰粉</a></li>
                            <li role="presentation"><a onclick="searchSpecial('水果礼盒')" style="cursor: pointer">水果礼盒</a></li>
                            </li>
                        </ul>
                    </div>



                </div>


                <div class="page-header">
                    <h1>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;热卖商品 &nbsp;<small>
                        Hot commodity</small>
                    </h1>
                </div>
                <div id="myCarouse2" class="carousel slide"  style="width: 1150px;height: 160px;">
                    <div class="carousel-inner" style="width: 1150px;height: 160px;">
                        <ol class="carousel-indicators">
                            <li data-target="#myCarouse2" data-slide-to ="0" class="active" ></li>
                            <li data-target="#myCarouse2" data-slide-to ="1"></li>
                            <li data-target="#myCarouse2" data-slide-to ="2"></li>
                            <li data-target="#myCarouse2" data-slide-to ="3"></li>
                        </ol>


                        <div class="item active">
                            <a href="#">
                                <img src="/static/images/roll1.jpg" alt="第一张" width="100%">
                            </a>
                        </div>
                        <div class="item">
                            <a href="#">
                                <img src="/static/images/roll2.jpg" alt="第二张" width="100%">
                            </a>
                        </div>
                        <div class="item">
                            <a href="#">
                                <img src="/static/images/roll3.jpg" alt="第四张" width="100%">
                            </a>
                        </div>
                        <div class="item">
                            <a href="#">
                                <img src="/static/images/roll4.jpg" alt="第五张" width="100%">
                            </a>
                        </div>
                        <a href="#myCarouse2" data-slide="prev" class="carousel-control left"><!-- ‹ -->
                            <span class="glyphicon glyphicon-chevron-left"></span>
                        </a><!-- 左箭头 -->
                        <a href="#myCarouse2" data-slide="next" class="carousel-control right"><!-- › -->
                            <span class="glyphicon glyphicon-chevron-right"></span>


                        </a><!-- 右箭头 -->

                    </div>
                </div>
                <div class="col-md-12">
                    <c:if test="${hotCommodityList!=null}">
                        <c:forEach items="${hotCommodityList}" var="commodity">
                            <div class="col-sm-4 col-md-4"style="width: 255px;height: 400px;margin-top: 20px;margin-left: 20px;">
                                <div class="thumbnail"style="width: 255px;height: 400px" >

                                    <a onclick="details(${commodity.commodityId})" style="cursor: pointer"><img src="/static/commodity/commodityPictures/${commodity.commodityPicture}.jpg" alt="..." style="height: 220px;width: 300px" ></a>
                                    <div style="margin-top: -10px">
                                        <h3 style="color:#337ab7 ">￥: ${commodity.commodityCurrentprice}</h3>
                                        <a onclick="details(${commodity.commodityId})" style="cursor: pointer;">
                                            <p style="color:darkorange">${commodity.commodityName}</p></a>
                                        <p style="color:red">销量：${commodity.commoditySalesvolume}</p>
                                        <h4><a onclick="storeDetails(${commodity.store.storeId})" style="cursor: pointer"><span class="label label-primary"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;${commodity.store.storeName}</span></a>&nbsp;${commodity.store.storeAddress}</h4>

                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
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
                <div>
                    <c:if test="${guessCommodityList!=null}">
                        <c:forEach items="${guessCommodityList}" var="commodity">
                            <div class="col-sm-4 col-md-4"style="width: 255px;height: 400px;margin-top: 20px;margin-left: 20px;">
                                <div class="thumbnail"style="width: 255px;height: 400px" >
                                    <a onclick="details(${commodity.commodityId})" style="cursor: pointer"><img src="/static/commodity/commodityPictures/${commodity.commodityPicture}.jpg" alt="..." style="height: 220px;width: 300px" ></a>
                                    <div style="margin-top: -10px">
                                        <h3 style="color:#337ab7 ">￥: ${commodity.commodityCurrentprice}</h3>
                                        <a onclick="details(${commodity.commodityId})" style="cursor: pointer;">
                                            <p style="color:darkorange">${commodity.commodityName}</p></a>
                                        <p style="color:red">销量：${commodity.commoditySalesvolume}</p>
                                        <h4><a onclick="storeDetails(${commodity.store.storeId})" style="cursor: pointer"><span class="label label-primary"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;${commodity.store.storeName}</span></a>&nbsp;${commodity.store.storeAddress}</h4>

                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
        </div>

        </div>

    </div>
    </div>
</div>



<script type="text/javascript">
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