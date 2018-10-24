<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <%@include file="/static/common/common.jsp" %>
    <title>签约倒计时</title>
    <style>
        body {
            background-color: #000;
        }

        tr {
            background-color: #000;
            line-height: 60px;
        }

        td {
            color: #FFF;
            font-size: 60px;
            font-family: "宋体";
            font-weight: bold;
            text-align: center;
        }
        .red{
            color: red;
            font-size: 60px;
            font-weight: bold;
            margin-top: 30px;
            text-align: center;
        }
    </style>
</head>
<body>
<div style="text-align: center;font-size: 75px;font-weight: bold;color: #ffffff;padding-top: 120px;margin-bottom: 120px;">
    顺义区马坡镇西丰乐村棚户区改造土地开发项目
</div>

<table cellspacing="50" border="0" align="center" style="margin-top: 60px;">
    <tr>
        <td style="color:#FF0;">当前日期：<span id="nowTime" style="padding: 15px;"></span></td>
    </tr>
    <tr>
        <td style="height: 60px;"></td>
    </tr>
    <tr>
        <td style="height: 100px;color:#0FF;"><span id="qy">签约期第：<span id="qyTime"></span>天</span></td>
    </tr>
    <tr>
        <td style="height: 60px;"></td>
    </tr>
    <tr>
        <td style="height: 100px;color:yellowgreen;">签约比例：<span id="qyBiLi"></span>%</td>
    </tr>
    <tr>
        <td style="height: 60px;"></td>
    </tr>
    <tr>
        <td style="color:#0F0;"><span id="jl">距离<span id="jlText"></span>结束还有：<span id="jlTime" style="color: red;font-size: 66px;"></span></span>
    </tr>
</table>

<script>
    function myrefresh() {
        $.get("getTime", {_time: new Date().getTime()}, function (data) {
            var time = data.time;
            var leftDay = data.leftDay;
            var flag = data.flag;
            var bili = data.bili;
            var jlSecond = data.jlSecond;
            var jlFlag = data.jlFlag;
            $("#nowTime").text(time);
            $("#qyBiLi").text(bili);
            if (flag == "1") {
                $("#qyTime").text(leftDay);
                if (jlFlag == "1" || jlFlag == "2"){
                    jlSecond = Math.floor(jlSecond / 1000);
                    var jldd = "";
                    var jlhh = "";
                    var jlmm = "";
                    var jlss = "";
                    jldd = Math.floor(jlSecond / 60 / 60 / 24)
                    jlhh = Math.floor((jlSecond - jldd * 24 *60 * 60) / 60 / 60);
                    jlmm = Math.floor((jlSecond - jldd * 24 *60 * 60 - jlhh * 60 * 60) / 60);
                    jlss = Math.floor(jlSecond - jldd * 24 *60 * 60 - jlhh * 60 * 60 - jlmm * 60);
                    if (jlFlag == "1") {
                        $("#jlText").text("第一奖励期");
                    } else {
                        $("#jlText").text("第二奖励期");
                    }
                    $("#jlTime").text(jldd+"天"+jlhh+"时"+jlmm+"分"+jlss+"秒");
                }else{
                    $("#jl").text("奖励期结束")
                }
            }else{
                $("#qy").text("签约期结束")
            }
        })
        setTimeout("myrefresh()", 1000); //指定5秒刷新一次
    }

    $(function () {
        myrefresh();
    });
</script>
</body>
</html>
