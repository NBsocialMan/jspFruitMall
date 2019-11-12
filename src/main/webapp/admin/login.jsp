<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/5/10
  Time: 8:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        body {
            color: white;
        }
    </style>
</head>

<body style="background:#337ab7">
<form method="post" action="/admin/login.do" >
    <table cellspacing="0" cellpadding="0" style="margin-top: 270px" align="center">
        <tr>
            <td style="padding-left: -40px">
                <table>
                    <tr>
                        <td>管理员姓名：</td>
                        <td><input type="text"  name="name" /></td>
                    </tr>
                    <tr>
                        <td>管理员密码：</td>
                        <td><input type="password" name="password" /></td>
                    </tr>
                    <tr><td>&nbsp;</td><td><input type="submit" value="进入管理中心" class="button" /></td></tr>
                </table>
            </td>
        </tr>
    </table>
</form>
<font id="font1" color="red" size="7" style="margin-left: 666px">${message}</font>
</body>
</html>
