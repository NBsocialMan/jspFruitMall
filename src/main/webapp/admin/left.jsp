<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>菜单</title>
<link href="${pageContext.request.contextPath}/static/css/left.css" rel="stylesheet" type="text/css"/>
<link rel="StyleSheet" href="${pageContext.request.contextPath}/static/css/dtree.css" type="text/css" />
</head>
<body>
<table width="100" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="12"></td>
  </tr>
</table>
<table width="100%" border="0">
  <tr>
    <td>
        <div class="dtree" style="margin-left: 30px;">

            &nbsp;&nbsp;<a href="javascript: d.openAll();">展开所有</a> | <a href="javascript: d.closeAll();">关闭所有</a>

            <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/dtree.js"></script>
            <script type="text/javascript">

                d = new dTree('d');
                d.add('01',-1,'功能管理');//（当前id,父id，名字，跳转地址，备注，跳转的name属性）
                d.add('0101','01','分类管理','','','mainFrame');
                d.add('010101','0101','分类管理','/admin/getCategoryList.do','对商品分类进行增删改','mainFrame');
                d.add('0102','01','商品管理');
                d.add('010201','0102','商品管理','/admin/getCommodityList.do','对商品进行增删改','mainFrame');
                d.add('0103','01','订单管理');
                d.add('010301','0103','订单管理','/admin/getOrderList.do','对商品进行增删改','mainFrame');
                d.add('0104','01','店铺管理');
                d.add('010401','0104','店铺管理','/admin/getStoreList.do','店铺热门','mainFrame');
                d.add('0105','01','商城首页广告管理');
                d.add('010501','0105','广告管理','/admin/getAd.do','对广告图片更改','mainFrame');
                d.add('0106','01','商城月度销售额');
                d.add('010601','0106','商城月度销售额','/admin/dataAnalysisUI.do','商城月度销售额','mainFrame');

                document.write(d);

            </script>
        </div>
    </td>
  </tr>
</table>
</body>
</html>
