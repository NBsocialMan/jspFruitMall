<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/7/3
  Time: 8:39
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
<body>
<jsp:include page="header.jsp"></jsp:include>
<br><br><br>
<a href="/user/findPassword.do">发送邮件</a>
<div class="col-md-13 column row" >
    <div class="col-md-4 column" style="background-color:#5bc0de;height: 600px">
        <ul class="list-group" style="margin-top: 50px;margin-left: 100px;width: 300px">
            <c:if test="${individualState==1}">
                <li class="list-group-item" >账号管理&nbsp;&nbsp;&nbsp;&nbsp;ACCOUNT MANAGEMENT</li>
                <a href="/user/securitySettingUI.do"><li class="list-group-item">安全设置</li></a>
                <li class="list-group-item active" >个人资料</li>
                <a href="/user/receiveAddressSettingUI.do"> <li class="list-group-item">收货地址</li></a>
            </c:if>
            <c:if test="${individualState==0}">
                <li class="list-group-item" >账号管理&nbsp;&nbsp;&nbsp;&nbsp;ACCOUNT MANAGEMENT</li>
                <li class="list-group-item active">安全设置</li>
                <a href="/user/individualInformationUI.do"> <li class="list-group-item " >个人资料</li></a>
                <a href="/user/receiveAddressSettingUI.do"><li class="list-group-item">收货地址</li></a>
            </c:if>
            <c:if test="${individualState==2}">
                <li class="list-group-item" >账号管理&nbsp;&nbsp;&nbsp;&nbsp;ACCOUNT MANAGEMENT</li>
                <a href="/user/securitySettingUI.do"><li class="list-group-item">安全设置</li></a>
                <a href="/user/individualInformationUI.do"> <li class="list-group-item " >个人资料</li></a>
                <li class="list-group-item active">收货地址</li>
            </c:if>

        </ul>
    </div>
    <div class="col-md-8 column" style="background-color:#afd9ee; height: 600px;">
        <c:if test="${individualState==1}">
            <div style="margin-left: 350px;margin-top: 90px">
                <form action="/user/modifyIndividualInformation.do" method="post">
                    <input type="hidden" name="id" value="${user.id}">
                    &nbsp;昵&nbsp;&nbsp;&nbsp;&nbsp;称：&nbsp;&nbsp;<input type="text" name="name" value="${user.name}" style="width:150px"><br><br>

                    <c:if test="${user.gender=='男'}">
                        &nbsp;性&nbsp;&nbsp;&nbsp;&nbsp;别：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        男：<input type="radio" name="gender" value="男" checked>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        女：<input type="radio" name="gender" value="女" ><br><br>
                    </c:if>
                    <c:if test="${user.gender=='女'}">
                        &nbsp;性&nbsp;&nbsp;&nbsp;&nbsp;别：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        男：<input type="radio" name="gender" value="男">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        女：<input type="radio" name="gender" value="女" checked><br><br>
                    </c:if>
                    <c:if test="${user.gender==null}">
                        &nbsp;性&nbsp;&nbsp;&nbsp;&nbsp;别：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        男：<input type="radio" name="gender" value="男">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        女：<input type="radio" name="gender" value="女"><br><br>
                    </c:if>
                    出生日期：<input type="date" name="birthday" value="${user.birthday}" style="width:150px"><br><br><br>
                    真实姓名：<input type="text" name="realname" value="${user.realname}" style="width: 150px;"><br><br><br>
                    &nbsp;居&nbsp;住&nbsp;地：&nbsp;<input type="text" name="placeOfResidence" value="${user.placeOfResidence}" style="width:150px"><br><br><br>
                    <input type="submit" width="100" value="保存信息" name="submit" border="0" style="background: url('${pageContext.request.contextPath}/static/images/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0);
                            height:35px;width:100px;color:white;margin-left: 70px;margin-top: 10px;">
                </form>
            </div>
        </c:if>
        <c:if test="${individualState==0}">
            <div style="margin-left: 350px;margin-top: 90px">
                邮箱：<input name="email" type="text" disabled value="${handleEmail}" ><br><br>
            </div>
            <div style="margin-left: 350px;margin-top: 90px;">
                <a href="/user/findPW.do">修改密码</a>
            </div>
        </c:if>
        <c:if test="${individualState==2}">
            <div style="margin-left: 350px;margin-top: 90px">
                <form action="/user/modifyReceiveAddress.do" method="post">
                    <input name="id" value="${user.id}" type="hidden">
                    &nbsp;收&nbsp;货&nbsp;地&nbsp;址：&nbsp;<input name="receiveAddress" type="text" value="${user.receiveAddress}" ><br><br><br>
                    &nbsp;邮&nbsp;政&nbsp;编&nbsp;码：&nbsp;<input name="postCode" type="text" value="${user.postCode}" ><br><br><br>
                    &nbsp;收货人姓名：&nbsp;<input name="receiver" type="text" value="${user.receiver}" ><br><br><br>
                    &nbsp;手&nbsp;机&nbsp;号&nbsp;码：&nbsp;<input name="telephone" type="text" value="${user.telephone}" ><br><br><br>
                    <input type="submit" width="100" value="修改地址" name="submit" border="0" style="background: url('${pageContext.request.contextPath}/static/images/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0);
                            height:35px;width:100px;color:white;margin-left: 90px;margin-top: 40px;">
                </form>
            </div>
        </c:if>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
