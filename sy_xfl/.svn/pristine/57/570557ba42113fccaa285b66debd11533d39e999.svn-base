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
    <title>交房顺序号实时展示</title>
    <style>
        body {
            background-color: #000;
            font-family: '微软雅黑';
            text-align: center;
            overflow: hidden;
        }

        table {
            background: #ffffff;
            width: 85%;
            border-color: #ffffff;
            border-collapse: collapse;
            margin-top: 40px;
        }

        table tr td {
            background-color: #000;
            color: #FFF;
            font-size: 30px;
            font-family: "宋体";
            font-weight: bold;
            text-align: center;
            padding: 15px;
        }

        table .bigClass td {
            font-weight: bold;
            font-size: 30px;
        }
    </style>
</head>
<body>
<c:set var="black" value="#ffffff"/>
<%--<%@include file="currentDate.jsp" %>--%>
<div style="text-align: center;font-size: 45px;font-weight: bold;color: #ffffff;margin: 20px;">
    顺义区马坡镇西丰乐村棚户区改造土地开发项目交房信息展示</div>
<center>
    <div id="charMy" style="width: 100%;"></div>
</center>
<script language="JavaScript">
    var totalCount = 0;
    var pageNo = 0;
    var pageSize = 5;
    function myrefresh() {
        $.get("getJfCount", {_time: new Date().getTime()}, function (data) {
                    var ttCount = data.total;
                    if (totalCount != ttCount) {
                        totalCount = ttCount;
                        pageNo = 1;
                    } else {
                        pageNo = parseInt(pageNo) + 1;
                    }
                    var count = ttCount / pageSize;
                    if (ttCount % pageSize > 0) {
                        count++;
                    }
                    if (parseInt(pageNo) > parseInt(count)) {
                        pageNo = 1;
                    }
                    //window.location.reload();
                    var url = "jfNumberShowItem";
                    $.post(url, {myPageNo: pageNo,myPageSize:pageSize, mydate: new Date().getTime()}, function (data) {
                        $("#charMy").html(data);
                    });
                }
        );
        setTimeout("myrefresh()", 10000); //指定5秒刷新一次
    }
    $(function () {
        myrefresh();
    });
</script>
</body>
</html>
