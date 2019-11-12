<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/6/3
  Time: 9:22
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
<%--上传图片的显示问题--%>
<script type="text/javascript">
    //添加input框的onChange事件
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



    <form id="userAction_save_do" action="/admin/modifyAd.do" method="post" enctype="multipart/form-data">
        &nbsp;
        <table cellSpacing="1" cellPadding="5" width="100%" align="center" bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
            <tr>
                <td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
                    height="26">
                    <strong><STRONG>编辑广告</STRONG>
                    </strong>
                </td>
            </tr>

            <tr>
                <td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
                    广告id：
                </td>
                <td class="ta_01" bgColor="#ffffff" colspan="3">
                    ${ad.adId}
                    <input name="adId" value="${ad.adId}" type="hidden">
                </td>
            </tr>
            <tr>
                <td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
                    广告图片：
                </td>
                <td class="ta_01" bgColor="#ffffff" colspan="3">
                    <img src="/static/ad/${ad.adImg}.jpg" style="width: 600px;height: 300px" id="displayImg">
                    <input name="adImg" type="file" onchange="display(this)">
                </td>
            </tr>
            <tr>
                <td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
                    广告url：
                </td>
                <td class="ta_01" bgColor="#ffffff" colspan="3">
                    <input type="text" name="adUrl" value="${ad.adUrl}" style="width: 500px">
                </td>
            </tr>

            <tr>
                <td class="ta_01" style="WIDTH: 100%" align="center"
                    bgColor="#f5fafe" colSpan="4">
                    <button type="submit"  value="确定" class="button_ok">
                        &#30830;&#23450;
                    </button>

                    <FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
                    <button type="reset" value="重置" class="button_cancel">&#37325;&#32622;</button>

                    <FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
                    <INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回"/>
                    <span id="Label1"></span>
                </td>
            </tr>
        </table>
    </form>


</body>
</html>
