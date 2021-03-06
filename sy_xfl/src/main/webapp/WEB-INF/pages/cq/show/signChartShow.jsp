<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>签约情况公示</title>
    <%@include file="/static/common/common.jsp" %>
    <script src="/static/plugin/highcharts/highcharts.js"></script>
    <style>
        .chart_content .div3 {
            position: absolute;
            top: 660px;
            float: left;
            width: 100%;
            height: 50px;
            left: 0;
            margin-top: 10px;
        }

        .ul {
            list-style: none;
        }

        #data table td{
            font-size: 25px;
            font-weight: bolder;
            border-color: #0f0f0f;
        }

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
<body style="overflow-y: hidden;">
<div class="container-fluid">
    <div class="row" style="margin-top: 50px;">
        <div class="col-lg-12 text-center" style="font-size: 45px;font-weight: bold;margin-bottom: 10px;">顺义区马坡镇西丰乐村棚户区改造土地开发项目签约情况公示</div>
    </div>
    <div class="row">
        <div class="col-lg-8 text-center">
            <div id="data"  style="padding-left: 20px;padding-top:10px;"></div>
        </div>
        <div class="col-lg-4 text-center">
            <div id="chart2" style="height: 440px"></div>
        </div>
    </div>
    <div class="row" style="margin-top: 10px;">
        <div class="col-lg-12 text-center">
            <div id="chart1" style="height: 440px"></div>
        </div>

    </div>
</div>
<script>
    $(function () {
        $('#chart2').highcharts({
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false,
                size: 5000,
                events: {
                    load: function () {
                        var chart = this;
                        loadSignJson2(chart);
                        //定时器 10秒刷新一次
                        setInterval(function () {
                            loadSignJson2(chart);
                        }, 50000);
                    }
                }
            },
            title: {
                text: '',
                x: 0,
                y: 10,
                style: {
                    color: "#000",
                    fontSize: 18,
                    fontWeight: "bold",
                }
            },
            colors: ['#ff5151', '#1E90FF'],
            credits: {
                text: ''
            },//去掉右下角标识
            tooltip: {
                pointFormat: '{series.name}:{point.percentage:.1f}%',
                enabled: false
            }
            ,
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    size: 390,
                    animation: false,
                    dataLabels: {
                        useHTML:true,
                        enabled: true,
                        color: '#000000',
                        connectorColor: '#000000',
                        distance: -100,
                        style: {
                            fontSize: "25px"
                        },
                        formatter: function () {
                            //'{point.name}: {point.percentage:.1f} %'
                            if (this.point.name == '已签约') {
                                return "<center>" + "已签约:" + this.y + "户<br/>比例:" + this.point.percentage.toFixed(2) + "%</center>";
                            }
                            if (this.point.name == '未签约') {
                                return "<center>" + "未签约:" + this.y + "户<br/>比例:" + this.point.percentage.toFixed(2) + "%</center>";
                            }
                        }
                    },
                    showInLegend: false
                }
            }
        });
        $('#chart1').highcharts({
            chart: {
                type: 'column',
                style: {
                    overflow: "none"
                },
                events: {
                    load: function () {
                        var chart = this;
                        loadSignJson1(chart);
                        //定时器 10秒刷新一次
                        setInterval(function () {
                            loadSignJson1(chart);
                        }, 50000);
                    }
                }
            },
            colors: ['#1E90FF', '#ff5151'],
            title: {
                text: '',
                x: 0,
                y: 20,
                style: {
                    color: "#000",
                    fontSize: 22,
                    fontWeight: "bold",
                }
            },
            credits: {//去掉右下角标识
                text: ''
            },
            legend: {
                enabled: false,
                align: 'right',
                x: 0,
                verticalAlign: 'top',
                y: -120,
                floating: true,
                backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColorSolid) || 'white',
                borderColor: '#CCC',
                borderWidth: 1,
                useHTML: true
            },
            xAxis: {
                categories: [${groupArray}],
                rotation: 0,
                labels: {
                    useHTML: true,
                    style: {
                        fontSize: '28px',
                        fontWeight: 'bold',
                        color: "#000"
                    }
                }
            },
            legend: {
                enabled: false,
                align: 'right',
                x: 0,
                verticalAlign: 'top',
                y: -120,
                floating: true,
                backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColorSolid) || 'white',
                borderColor: '#CCC',
                borderWidth: 1,
                useHTML: true
            },
            yAxis: {
                allowDecimals: false,
                min: 0,
                stackLabels: {
                    y: 0,
                    enabled: true,
                    style: {
                        fontSize: '24px',
                        fontWeight: 'bold',
                        color: '#000000'
                    },
                    useHTML: true,
                    formatter: function () {
                        return this.total;
                    }
                },
                title: {
                    style: {
                        fontSize: 30,
                        color: '#000000',
                        fontWeight: 'bold'
                    },
                    text: ''
                }
            },

            tooltip: {
                formatter: function () {
                    return '<b>' + this.x + '</b><br/>' +
                            this.series.name + ': ' + this.y + '<br/>' +
                            '共: ' + this.point.stackTotal + "户";
                },
                enabled: false
            },
            plotOptions: {
                column: {
                    stacking: 'percent',
                    borderWidth: 0,
                    pointWidth: 125,
                    animation: false,
                    dataLabels: {
                        useHTML:true,
                        style: {fontSize: '30px'},
                        enabled: true,
                        color: '#000000',
                        formatter: function () {
                            console.log(this);
                            if (this.series.name == "已签约") {
                                if (this.y != 0){
                                    return "<center>"+this.y + '户<br>' + this.percentage.toFixed(2) + "%</center>";
                                }else {
                                    return "<center>"+ 0 + '户<br>' + this.percentage.toFixed(2) + "%</center>";
                                }
                            }
                        }
                    }

                },
                series: {
                    borderColor: '#000'
                }
            }
        });
    });
    function loadSignJson1(chart) {
        var series = chart.series;
        while (series.length > 0) {//移除原始数据
            series[0].remove(false);
        }
        $.ajax({
            url: "getSignJson1",
            success: function (dataJson) {
                var data = dataJson;
                for (var i = 0, len = data.length; i < len; i++) {
                    data[i].data = JSON.parse(data[i].data);
                    chart.addSeries(data[i]);
                }
            }
        });
    }
    function loadSignJson2(chart) {
        var series = chart.series;
        while (series.length > 0) {//移除原始数据
            series[0].remove(false);
        }
        $.ajax({
            url: 'getSignJson2',
            success: function (dataJson) {
                var data = dataJson;
                data.data = JSON.parse(data.data);
                chart.addSeries(data);
            }
        });
    }
    function getData(){
        $.get("dataTable",{type:'qy',myTime:new Date().getTime()},function(data){
            $("#data").html(data);
        })
        setTimeout("getData()",5000);
    }
    $(function(){
        getData();
    })
</script>
</body>
</html>