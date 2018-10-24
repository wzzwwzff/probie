<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/static/common/common.jsp" %>
    <title>东河沿安置选房情况公示(2)</title>
    <style>
        body {
            background-color: #000000;
            font-family: '微软雅黑';
            text-align: center;
            overflow: hidden;
        }

        table {
            background: #ffffff;
            width: 85%;
            border-color: #ffffff;
            border-collapse: collapse;
        }

        table tr td {
            background-color: #000;
            color: #FFF;
            font-size: 45px;
            font-weight: bold;
            text-align: center;
            padding: 10px;
        }

        table .bigClass td {
            font-weight: bold;
            font-size: 30px;
        }
    </style>
</head>
<body>
<div>
    <h1 style="font-size: 60px;color:white;font-weight: 900;font-family: '微软雅黑'">东河沿安置选房情况公示<tags:dataDict dataDict="系统配置" value="统计标题"/></h1>
    <center>
        <div id="charMy">

        </div>
    </center>
</div>
<script>
    var pageSize = 10;
    var pageNo = 1;
    var allCount = 0;
    var allCountNew = 0;
    function sendData() {
        $.get("getHouseCount2", {_date: new Date().getTime()}, function (data) {
            allCountNew = data.houseCount;
        });
        if (allCount != 0 && allCount != allCountNew) {
            pageNo = 0;
        }
        allCount = allCountNew;
        var allPageNo = parseInt(Math.ceil(allCount / pageSize));
        pageNo++;
        if (pageNo > allPageNo) {
            pageNo = 1;
        }
        $.get("houseShowTable2", {pageNo: pageNo, pageSize: pageSize, _date: new Date().getTime()}, function (data) {
            $("#charMy").html(data);
        });
    }
    $(function () {
        sendData();
        setInterval("sendData()", 10000);//间隔10秒刷新
    });
    $("#btnDiv button").click(function () {
        var id = $(this).attr("id");
        if (id == "btnRefresh") {
            location.reload();
        } else if (id == "btnScreen") {
            fullscreen();
        } else if (id == "btnClose") {
            window.close();
        }
    });
</script>
</body>
</html>