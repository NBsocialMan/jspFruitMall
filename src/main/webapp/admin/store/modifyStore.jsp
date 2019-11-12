<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/6/11
  Time: 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <LINK href="${pageContext.request.contextPath}/static/css/Style1.css" type="text/css" rel="stylesheet">
</head>
<body>
<form id="mForm" action="/admin/modifyStore.do" method="post">
    <input name="storeId" value="${store.storeId}" type="hidden">
    &nbsp;
    <table cellSpacing="1" cellPadding="5" width="100%" align="center" bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
        <tr>
            <td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
                height="26">
                <strong><STRONG>编辑店铺</STRONG>
                </strong>
            </td>
        </tr>


        <tr>
            <td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
                商品是否营业：
            </td>
            <td class="ta_01" bgColor="#ffffff" colspan="3">
                <c:if test="${store.storeState==1}">
                    营业：<input type="radio" name="state" value="1" checked>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    闭店：<input type="radio" name="state" value="0">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    制裁：<input type="radio" name="state" value="2"><br>
                </c:if>
                <c:if test="${store.storeState==0}">
                    营业：<input type="radio" name="state" value="1">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    闭店：<input type="radio" name="state" value="0" checked>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    制裁：<input type="radio" name="state" value="2"><br>
                </c:if>
                <c:if test="${store.storeState==2}">
                    营业：<input type="radio" name="state" value="1">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    闭店：<input type="radio" name="state" value="0">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    制裁：<input type="radio" name="state" value="2" checked><br>
                </c:if>
            </td>
        </tr>
        <tr>
            <td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
                商品是否热门：
            </td>
            <td class="ta_01" bgColor="#ffffff" colspan="3">
                <c:if test="${store.storeHot==1}">
                    是：<input type="radio" name="storeHot" value="1" checked>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    否：<input type="radio" name="storeHot" value="0"><br>
                </c:if>
                <c:if test="${store.storeHot==0}">
                    是：<input type="radio" name="storeHot" value="1">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    否：<input type="radio" name="storeHot" value="0" checked><br>
                </c:if>
            </td>
        </tr>

        <tr>
            <td class="ta_01" style="WIDTH: 100%" align="center"
                bgColor="#f5fafe" colSpan="4">
                <button type="submit" id="userAction_save_do_submit" value="确定" class="button_ok">
                    &#30830;&#23450;
                </button>

                <FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>

                <FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
                <INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回"/>
                <span id="Label1"></span>
            </td>
        </tr>
    </table>
</form>

</body>
</html>
