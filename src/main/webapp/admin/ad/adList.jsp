<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/6/3
  Time: 8:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/Style1.css"
          rel="stylesheet" type="text/css" />
</head>
<script>
    function AdUI(id) {
        var elementById = document.getElementById("AdUI");
        var id1 = document.getElementById("adId");
        id1.value=id;
        elementById.submit();
    }
</script>
<body>
<form action="/admin/modifyAdUI.do" method="post" id="AdUI">
    <input type="hidden" name="adId" id="adId">
</form>
<div>
    <INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回"/>
    <table cellSpacing="1" cellPadding="0" width="100%" align="center"
           bgColor="#f5fafe" border="0">
        <TBODY>
        <tr>
            <td class="ta_01" align="center" bgColor="#afd1f3"><strong>广告列表</strong>
            </TD>
        </tr>
        <tr>
            <td class="ta_01" align="center" bgColor="#f5fafe">
                <table cellspacing="0" cellpadding="1" rules="all"
                       bordercolor="gray" border="1" id="DataGrid1"
                       style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
                    <tr
                            style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">

                        <td align="center" width="10%">序号</td>
                        <td align="center" width="40%">广告图片</td>
                        <td align="center" width="30%">广告链接</td>
                        <td width="20%" align="center">更改</td>
                    </tr>
                    <c:forEach items="${adList}" var="ad">
                        <tr onmouseover="this.style.backgroundColor = 'white'" onmouseout="this.style.backgroundColor = '#F5FAFE';">
                            <td style="CURSOR: hand; HEIGHT: 22px" align="center" width="10%">${ad.adId}</td>
                            <td style="CURSOR: hand; HEIGHT: 200px" align="center" width="40%">
                                <img width="400px" height="200px" src="/static/ad/${ad.adImg}.jpg">
                            </td>
                            <td style="CURSOR: hand; HEIGHT: 200px" align="center" width="30%">
                                ${ad.adUrl}
                            </td>
                            <td align="center" style="HEIGHT: 24px">
                                <a onclick="AdUI(${ad.adId})" style="cursor: pointer;">
                                    <img src="${pageContext.request.contextPath}/static/adminImages/i_edit.gif" border="0" style="CURSOR: hand">
                                </a>
                            </td>

                        </tr>
                    </c:forEach>

                </table>
            </td>
        </tr>
        </TBODY>
    </table>
</div>

</body>
</html>
