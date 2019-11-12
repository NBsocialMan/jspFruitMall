<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<html>
	<head>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<style type="text/css">
BODY {
	MARGIN: 0px;
	BACKGROUND-COLOR: #ffffff
}

BODY {
	FONT-SIZE: 12px;
	COLOR: #000000
}

TD {
	FONT-SIZE: 12px;
	COLOR: #000000
}

TH {
	FONT-SIZE: 12px;
	COLOR: #000000
}
</style>
		<link href="${pageContext.request.contextPath}/static/css/Style1.css" rel="stylesheet" type="text/css">
	</HEAD>
	<body>

		<div>
			<img src="${pageContext.request.contextPath}/static/adminImages/top_100.jpg" width="1540px" height="75px">
		</div>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="30" valign="bottom" background="${pageContext.request.contextPath}/static/adminImages/mis_01.jpg">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="85%" align="left">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</td>
							<td width="15%">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="16"
											background="${pageContext.request.contextPath}/static/adminImages/mis_05b.jpg">
											<img
												src="${pageContext.request.contextPath}/static/adminImages/mis_05a.jpg"
												width="6" height="18">
										</td>
										<td width="155" valign="bottom"
											background="${pageContext.request.contextPath}/static/adminImages/mis_05b.jpg">
											用户名：
												<font color="blue" >${admin.name}</font>

										</td>
										<td width="10" align="right"
											background="${pageContext.request.contextPath}/static/adminImages/mis_05b.jpg">
											<img src="${pageContext.request.contextPath}/static/adminImages/mis_05c.jpg" width="6" height="18">
										</td>
									</tr>
								</table>
							</td>
							<td align="right" width="5%">
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</HTML>
