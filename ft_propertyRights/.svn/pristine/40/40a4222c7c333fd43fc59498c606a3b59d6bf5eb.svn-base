<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String classify = (String) request.getAttribute("classify");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>分类统计</title>
    <%@include file="/static/common/common.jsp" %>
    <script src="${ctx}/static/plugin/highcharts/highcharts.js"></script>
    <style>
        .ul li {
            float: left;
            margin-left: 45px;
        }

        .ul li img {
            width: 35px;
            height: 35px;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row" style="margin-top: 50px;">
        <div class="col-lg-12 text-center" style="font-size: 35px;font-weight: bold;margin-bottom: 10px;">分类统计展示</div>
    </div>
    <div class="row" style="margin-top: 10px;">
        <div class="col-lg-12 text-center">
            <div id="container" style="height:600px"></div>
        </div>
    </div>
</div>
<script>
        var chart = Highcharts.chart('container', {
            chart: {
                type: 'column',
                events: {
                    load: function () {
                        var chart = this;
                        loadFenlei(chart);
//                        定时器 10秒刷新一次
                        setInterval(function () {
                         loadFenlei(chart);
                         }, parseInt(10000));
                    }
                }
            },
            title: {//标题
                text: ''
            },
            credits: {//右下角标识
                text: ''
            },
            xAxis: {
                categories:<%=classify%>
            },
            yAxis: {//坐标title标题
                allowDecimals: false,
                min: 0,
                title: {
                    text: ''
                }
            },
            tooltip: {
                formatter: function () {
                    return '<b>' + this.x + '</b><br/>' +
                            this.series.name + ': ' + this.y + '<br/>' +
                            '总量: ' + this.point.stackTotal;
                }
            },
            plotOptions: {
                column: {
                    stacking: 'normal'
                }
            },
            colors: ['red', 'orange','yellow', 'green','cyan', 'blue','purple', 'gray','pink', 'khaki','brown', 'lawngreen','#0099FF', 'coral']
            /*series: [{
                name: '小张',
                data: [5, 3, 4, 7, 2],
                stack: 'male' // stack 值相同的为同一组
            }, {
                name: '小潘',
                data: [3, 4, 4, 2, 5],
                stack: 'male'
            }, {
                name: '小彭',
                data: [2, 5, 6, 2, 1],
                stack: 'male'
            }, {
                name: '小王',
                data: [3, 0, 4, 4, 3],
                stack: 'male'
            }]*/
        });

        function loadFenlei(chart) {
            var series = chart.series;
            while (series.length > 0) {//移除原始数据
                series[0].remove(false);
            }
            $.ajax({
                url: "/cq/statistics/getFenleiMsg",
                success: function (dataJson) {
                    var data = dataJson;
                    for (var i = 0, len = data.length; i < len; i++) {
                        data[i].data = JSON.parse(data[i].data);
                        chart.addSeries(data[i]);
                    }
                }
            });
        }
</script>
</body>
</html>