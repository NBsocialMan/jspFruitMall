<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/5/22
  Time: 10:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
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
<body>
<jsp:include page="header.jsp"></jsp:include>
<br><br><br>

<div class="col-md-13 column row" style="background-color:#afd9ee;height: 600px">
    <div style="margin-left: 600px;margin-top: 30px;">
        <form action="/store/storeRegister.do" method="post" enctype="multipart/form-data">
            <input type="hidden" name="userId" value="${user.id}">
            店铺名称：<input name="storeName"><br>
            店铺地址：<input name="storeAddress"><br>
            店铺介绍：<input name="storeIntroduction"><br>
            店铺头像：<img id="displayImg" src="/static/store/storePictures/${store.storePicture}.jpg" style="height: 70px;width: 70px;"><br><br>
            店铺图片：<input name="storePicture" type="file" onchange="display(this)"><br>
            <input type="submit" width="100" value="注册店铺" name="submit" border="0" style="background: url('${pageContext.request.contextPath}/static/images/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0);
                    height:35px;width:100px;color:white;margin-left: 70px;margin-top: 10px;">
        </form>
    </div>

</div>
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
