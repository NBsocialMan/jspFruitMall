<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
	<head>
        <title>商城管理系统</title>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style>
		body
		{
			SCROLLBAR-ARROW-COLOR: #ffffff;  SCROLLBAR-BASE-COLOR: #dee3f7;
		}
    </style>
  </head>
  
<frameset rows="103,*,43" frameborder=0 border="0" framespacing="0">
  <frame src="/admin/top.jsp" name="topFrame" scrolling="NO" noresize>
  <frameset cols="180,*" frameborder="0" border="0" framespacing="0">
		<frame src="/admin/left.jsp" name="leftFrame" noresize scrolling="YES">
		<frame src="/admin/welcome.jsp" name="mainFrame">
  </frameset>
  <frame src="/admin/bottom.jsp" name="bottomFrame" scrolling="NO" noresize>
</frameset>
</html>
