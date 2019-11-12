<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/7/20
  Time: 8:20
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
<INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回"/>
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div id="main" style="width: 900px;height:600px;"></div>

<div style="width: 800px;height:500px;">

</div>
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
            url: "${pageContext.request.contextPath}/store/getChart2.do?storeId="+${storeId},
            <%--url: "${pageContext.request.contextPath}/store/getChart.do?"+(new Date()).getTime()?storeId=${store.storeId},--%>
            dataType: "json",
            success: function (data) {
                var name = new Array();
                var values = new Array();
                // var dataValue = new Array();


                //取出后台map，并把key，value赋给name，value数组
                $.each(data,function(key,value){
                    name.push(key);
                    values.push(value);
                })
                // for(var i = 0;i<name.length;i++) {
                //     var temp = values[i];
                //     var num = parseInt(temp);
                //     dataValue[i] = {value:values[i],name:name[i]};
                // }

                //对echarts模板进行数据填充
                option = {
                    title : {
                        text: '${store.storeName}月度销售额柱图',
                        // subtext: '纯属虚构'
                    },
                    tooltip : {
                        trigger: 'axis'
                    },
                    legend: {
                        data:name
                    },

                    toolbox: {
                        show : true,
                        feature : {
                            mark : {show: true},
                            dataView : {show: true, readOnly: false},
                            magicType : {show: true, type: ['line', 'bar']},
                            restore : {show: true},
                            saveAsImage : {show: true}
                        }
                    },
                    calculable : true,
                    xAxis : [
                        {
                            type : 'category',
                            data : name
                            // data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
                        }
                    ],
                    yAxis : [
                        {
                            type : 'value'
                        }
                    ],
                    series : [
                        {
                            name:'销售额',
                            type:'bar',
                            data:values,
                            markPoint : {
                                data : [
                                    {type : 'max', name: '最大值'},
                                    {type : 'min', name: '最小值'}
                                ]
                            },
                            markLine : {
                                data : [
                                    {type : 'average', name: '平均值'}
                                ]
                            }
                        },
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