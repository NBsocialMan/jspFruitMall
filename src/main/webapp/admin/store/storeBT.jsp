<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/7/20
  Time: 8:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.0.0.min.js" type="text/javascript"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery.validate.min.js" type="text/javascript"></script>
    <script  src="${pageContext.request.contextPath}/static/js/echarts.min.js" ></script>
</head>
<body>
<form id="ztForm" method="post" action="/admin/storeZT.do">
    <input type="hidden" name="storeId" id="ztstoreId">
</form>
<script>
    function storeZT(id) {
        var elementById = document.getElementById("ztForm");
        var id1 = document.getElementById("ztstoreId");
        id1.value=id;
        elementById.submit();
    }
</script>
<INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回"/>
    <a onclick="storeZT(${storeId})" ><input type="button" value="月度销售额柱图"></a>
    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main" style="width: 1100px;height:1000px;"></div>

    <script type="text/javascript">

        $(function () {
            var dom = document.getElementById('main');
            var myChart = echarts.init(dom);

            /* 发送ajax请求 */
            //发送key-value类型的请求数据
            $.ajax({
                type: "POST",
                //当发送json数据时添加：
                /*  contentType: "application/json; charset=utf-8", */
                url: "${pageContext.request.contextPath}/store/getChart.do?storeId="+${storeId},
                <%--url: "${pageContext.request.contextPath}/store/getChart.do?"+(new Date()).getTime()?storeId=${store.storeId},--%>
                dataType: "json",
                success: function (data) {
                    var n=0;
                    var name = new Array();
                    var values = new Array();
                    var dataValue = new Array();


                    //取出后台map，并把key，value赋给name，value数组
                    $.each(data,function(key,value){
                        // alert("key: " + key + ", Value: " + value );
                        name.push(key);
                        values.push(value);
                    })

                    for(var i = 0;i<name.length;i++) {
                        var temp = values[i];
                        var num = parseInt(temp);
                        /*alert(num);
                        alert(name[i]);*/
                        dataValue[i] = {value:values[i],name:name[i]};
                    }

                    //对echarts模板进行数据填充
                    option = {
                        // backgroundColor: '#ccc',//背景色
                        title : {
                            text: '${store.storeName}商品销量统计饼图',
                            x:'50%'
                        },
                        tooltip : {
                            trigger: 'item',
                            formatter: "{a} <br/>{b} : {c} ({d}%)"
                        },
                        toolbox: {
                            show : true,
                            feature : {
                                mark : {show: true},
                                restore : {show: true},
                                saveAsImage : {show: true}
                            }
                        },
                        legend: {
                            orient : 'vertical',
                            x : 'left',
                            data: name
                        },
                        calculable : true,
                        series : [
                            {
                                name:'销量',
                                type:'pie',
                                radius : '50%',
                                center: ['60%', '40%'],
                                data: dataValue
                            }
                        ]
                    };

                    if (option && typeof option === "object") {//选项==选择选项==对象
                        myChart.setOption(option, true);//set Option设置选项
                    }
                },

                error: function (data) {
                    alert("数据出错了！" );
                }

            });
        })



    </script>

</body>
</html>
