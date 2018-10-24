<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>安置房整体情况统计</title>
    <%@include file="/static/common/common.jsp" %>
    <style>
        table tr td {
            text-align: center;
        }
    </style>
    <script>
        $(function () {
            $("#excelBtn").click(function () {
                $(".table").table2excel({
                    exclude: ".noExl",
                    name: "安置房整体情况统计",
                    filename: "安置房整体情况统计",
                    exclude_img: true,
                    exclude_links: true,
                    exclude_inputs: true
                });
            });
        });
    </script>
</head>
<body>
<div class="title">
    <h5>安置房整体情况统计</h5>
</div>
<div class="content">
    <table class="table table-bordered table-hover">
        <thead>
        <tr>
            <th rowspan="3" style="vertical-align: middle">项目名称</th>
            <th rowspan="3" style="vertical-align: middle">楼号</th>
            <th colspan="6">全部</th>
            <th colspan="6">已选</th>
            <th colspan="6">剩余</th>
        </tr>
        <tr>
            <th colspan="2">一居室</th>
            <th colspan="2">二居室</th>
            <th colspan="2">三居室</th>
            <th colspan="2">一居室</th>
            <th colspan="2">二居室</th>
            <th colspan="2">三居室</th>
            <th colspan="2">一居室</th>
            <th colspan="2">二居室</th>
            <th colspan="2">三居室</th>
        </tr>
        <tr>
            <th>套数</th>
            <th>实测面积(㎡)</th>
            <th>套数</th>
            <th>实测面积(㎡)</th>
            <th>套数</th>
            <th>实测面积(㎡)</th>
            <th>套数</th>
            <th>实测面积(㎡)</th>
            <th>套数</th>
            <th>实测面积(㎡)</th>
            <th>套数</th>
            <th>实测面积(㎡)</th>
            <th>套数</th>
            <th>实测面积(㎡)</th>
            <th>套数</th>
            <th>实测面积(㎡)</th>
            <th>套数</th>
            <th>实测面积(㎡)</th>
        </tr>
        </thead>
    <c:forEach items="${totalMap}" var="projectMap" varStatus="status">
            <tr>
                <td rowspan="${fn:length(projectMap.value)}">${projectMap.key}</td>
        <c:forEach items="${projectMap.value}" var="buildMap" varStatus="status1">
                <td>${buildMap.key}</td>
            <c:set value="${buildMap.value}" var="houseTypeMap"></c:set>
                    <td>${empty houseTypeMap['11']['totalCount'] ? "0" : houseTypeMap['11']['totalCount']}</td>
                    <td>${empty houseTypeMap['11']['totalArea'] ? "0" : houseTypeMap['11']['totalArea']}</td>
                    <td>${empty houseTypeMap['21']['totalCount'] ? "0" : houseTypeMap['21']['totalCount']}</td>
                    <td>${empty houseTypeMap['21']['totalArea'] ? "0" : houseTypeMap['21']['totalArea']}</td>
                    <td>${empty houseTypeMap['31']['totalCount'] ? "0" : houseTypeMap['31']['totalCount']}</td>
                    <td>${empty houseTypeMap['31']['totalArea'] ? "0" : houseTypeMap['31']['totalArea']}</td>
                    <td>${empty houseTypeMap['11']['checkedCount'] ? "0" : houseTypeMap['11']['checkedCount']}</td>
                    <td>${empty houseTypeMap['11']['checkedArea'] ? "0" : houseTypeMap['11']['checkedArea']}</td>
                    <td>${empty houseTypeMap['21']['checkedCount'] ? "0" : houseTypeMap['21']['checkedCount']}</td>
                    <td>${empty houseTypeMap['21']['checkedArea'] ? "0" : houseTypeMap['21']['checkedArea']}</td>
                    <td>${empty houseTypeMap['31']['checkedCount'] ? "0" : houseTypeMap['31']['checkedCount']}</td>
                    <td>${empty houseTypeMap['31']['checkedArea'] ? "0" : houseTypeMap['31']['checkedArea']}</td>
                    <td>${empty houseTypeMap['11']['noCheckCount'] ? "0" : houseTypeMap['11']['noCheckCount']}</td>
                    <td>${empty houseTypeMap['11']['noCheckArea'] ? "0" : houseTypeMap['11']['noCheckArea']}</td>
                    <td>${empty houseTypeMap['21']['noCheckCount'] ? "0" : houseTypeMap['21']['noCheckCount']}</td>
                    <td>${empty houseTypeMap['21']['noCheckArea'] ? "0" : houseTypeMap['21']['noCheckArea']}</td>
                    <td>${empty houseTypeMap['31']['noCheckCount'] ? "0" : houseTypeMap['31']['noCheckCount']}</td>
                    <td>${empty houseTypeMap['31']['noCheckArea'] ? "0" : houseTypeMap['31']['noCheckArea']}</td>
            </tr>
        </c:forEach>
    </c:forEach>
        <tr>
            <td colspan="2">合计</td>
            <td>${list[0][0]}</td>
            <td>${list[0][1]}</td>
            <td>${list[0][2]}</td>
            <td>${list[0][3]}</td>
            <td>${list[0][4]}</td>
            <td>${list[0][5]}</td>
            <td>${list[0][6]}</td>
            <td>${list[0][7]}</td>
            <td>${list[0][8]}</td>
            <td>${list[0][9]}</td>
            <td>${list[0][10]}</td>
            <td>${list[0][11]}</td>
            <td>${list[0][12]}</td>
            <td>${list[0][13]}</td>
            <td>${list[0][14]}</td>
            <td>${list[0][15]}</td>
            <td>${list[0][16]}</td>
            <td>${list[0][17]}</td>
        </tr>
    </table>
</div>
<div class="footer resizeLayout">
    <button class="btn btn-primary" id="excelBtn" style="width: 120px;letter-spacing: 2px;"><i
            class="fa fa-file-excel-o"></i>&nbsp;导出Excel
    </button>
</div>
</body>
</html>
