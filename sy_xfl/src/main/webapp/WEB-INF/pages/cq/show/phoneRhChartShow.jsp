<%@ page import="javax.swing.text.Document" %>
<%@ page import="java.awt.*" %><%--
  Created by IntelliJ IDEA.
  User: jmdf
  Date: 2018/7/19
  Time: 18:15
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>顺义区马坡镇西丰乐村棚户区改造土地开发项目入户情况公示</title>
    <%@include file="/static/common/common.jsp" %>
    <script src="/static/plugin/highcharts/highcharts.js"></script>
</head>
<body style="overflow-y: auto;">
<style>
    tr td{
        <c:if test="${isInIframe == 1}">
                    font-size: 32px;
        </c:if>
        <c:if test="${isInIframe == 0}">
                    font-size: 9px;
        </c:if>
        font-weight: bolder;
        border-color: #0f0f0f;
    }
    table{
        height: 45%;
    }
</style>
<script>
    $(function () {
        var a = '9px';
        var b = '9px';
        var c = '9px';
        var d = 34;
        $("#chart1").css("height","230px");
        $("#chart1").css("margin-top","10px");
        if (${isInIframe == 1}){
            var a = '32px';
            var b = '28px';
            var c = '25px';
            var d = 100;
            $(".container-fluid").css("margin-top","35px");
            $("#titleHead").css("font-size","32px");
            $("#data").css("margin-top","75px");
            $("#chart1").css("margin-top","60px");
            $("#chart1").css("height","500px");
        }

        $('#chart1').highcharts({
            chart: {
                type: 'column',
                style: {
                    overflow: "none"
                },
                events: {
                    load: function () {
                        var chart = this;
                        loadRhJson1(chart);
                        //定时器 10秒刷新一次
                        setInterval(function () {
                            loadRhJson1(chart);
                        }, 5000);
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
                    fontSize: 12,
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
                        fontSize: a,
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
                        fontSize: b,
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
                        fontSize: 10,
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
                    pointWidth: d,
                    animation: false,
                    dataLabels: {
                        useHTML:true,
                        style: {fontSize: c},
                        enabled: true,
                        color: '#000000',
                        formatter: function () {
                            if (this.series.name == "已入户") {
                                if (this.y != 0){
                                    return "<center>"+this.y + '户<br>' + this.percentage.toFixed(2) + "%</center>";
                                }else {
                                    return "<center>" + 0 + '户<br>' + this.percentage.toFixed(2) + "%</center>";
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
    function loadRhJson1(chart) {
        var series = chart.series;
        while (series.length > 0) {//移除原始数据
            series[0].remove(false);
        }
        $.ajax({
            url: "getRhJson1",
            success: function (dataJson) {
                var data = dataJson;
                for (var i = 0, len = data.length; i < len; i++) {
                    data[i].data = JSON.parse(data[i].data);
                    chart.addSeries(data[i]);
                }
            }
        });
    }

    function getData(){
        $.get("dataTablePhone",{type:'rh',myTime:new Date().getTime()},function(data){
            $("#data").html(data);
        })
        setTimeout("getData()",5000);
    }
    $(function(){
        getData();
    })

</script>
<div class="container-fluid">
    <div class="row" style="margin-top: 15px;">
        <div id="titleHead" style="font-size: 12px;font-weight: bold;position:absolute; width: 100%;text-align: center;margin-bottom: 15px;/* left:50%; !* 定位父级的50% *! transform: translate(-50%,-50%); !*自己的50% *!*/ ">顺义区马坡镇西丰乐村棚户区改造土地开发项目入户情况公示</div>
    </div>
    <div class="row">
        <div>
            <div id="data"  style="margin-top: 25px;"></div>
        </div>
    </div>
    <div>
        <div>
            <div id="chart1" style="width: 100%"></div>
        </div>
    </div>
</div>
</body>
</html>
