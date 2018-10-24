<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>项目户型统计</title>
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
        <div class="col-lg-12 text-center" style="font-size: 35px;font-weight: bold;margin-bottom: 10px;">项目户型统计展示</div>
    </div>
    <div class="row" style="margin-top: 10px;">
        <div class="col-lg-12 text-center">
            <div id="chart1" style="height: 600px;"></div>
        </div>
    </div>
</div>
<script>
    $(function () {
        $('#chart1').highcharts({
            chart: {
                type: 'column',
                style: {
                    overflow: "none"
                },
                events: {
                    load: function () {
                        var chart = this;
                        loadHouse(chart);
//                        定时器 10秒刷新一次
                        setInterval(function () {
                            loadHouse(chart);
                        }, parseInt(10000));
                    }
                }
            },
            title: {
                text: ''
            },
            credits: {//去掉右下角标识
                text: ''
            },
            xAxis: {
                //type: 'category',
                categories: [/*'一居室','二居室','三居室'*/${groupArray}],
                //crosshair: true,
                labels: {
                    //rotation: -45, // 设置轴标签旋转角度
                    style: {
                        fontSize: '20',
                        fontWeight: 'bold'
                    }
                }
            },
            colors: ['#66B3FF','#FF8F59','#ADADAD'],
            yAxis: {
//                tickPositions: [0,10,20,30],// 指定竖轴坐标点的值
                allowDecimals: false,
                min: 0,
                title: {
                    text: '',
                    style:{
                        fontSize:'25px',
                        fontWeight:'bold'
                    }
                }
            },
            plotOptions: {
                column: {
                    stacking: 'normal',
                    animation: false,
                    pointWidth:65, //柱子宽度
                    dataLabels: {
                        useHTML:false,
                        style: {fontSize: '20px'},
                        enabled: false,
                        rotation: -90,
                        color: '#000000'
                    }
                },
                series: {
                    borderWidth: 0,
                    dataLabels: {
                        enabled: true,
                        format: '{point.y}套'
                    }
                }
            }
        })

        function loadHouse(chart) {
            var series = chart.series;
            while (series.length > 0) {//移除原始数据
                series[0].remove(false);
            }
            $.ajax({
                url: "/cq/statistics/getHouseMsg",
                success: function (dataJson) {
                    var data = dataJson;
                    for (var i = 0, len = data.length; i < len; i++) {
                        data[i].data = JSON.parse(data[i].data);
                        chart.addSeries(data[i]);
                    }
                }
            });
        }
    });
</script>
</body>
</html>