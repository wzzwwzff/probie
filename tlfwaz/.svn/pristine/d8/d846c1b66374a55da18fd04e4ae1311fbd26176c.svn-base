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
            <th rowspan="3" style="vertical-align: middle">楼号</th>
            <th colspan="9">全部</th>
            <th colspan="9">已选</th>
            <th colspan="9">剩余</th>
        </tr>
        <tr>
            <th colspan="3">一居室</th>
            <th colspan="3">二居室</th>
            <th colspan="3">三居室</th>
            <th colspan="3">一居室</th>
            <th colspan="3">二居室</th>
            <th colspan="3">三居室</th>
            <th colspan="3">一居室</th>
            <th colspan="3">二居室</th>
            <th colspan="3">三居室</th>
        </tr>
        <tr>
            <th>套数</th>
            <th>预测面积(㎡)</th>
            <th>实测面积(㎡)</th>
            <th>套数</th>
            <th>预测面积(㎡)</th>
            <th>实测面积(㎡)</th>
            <th>套数</th>
            <th>预测面积(㎡)</th>
            <th>实测面积(㎡)</th>
            <th>套数</th>
            <th>预测面积(㎡)</th>
            <th>实测面积(㎡)</th>
            <th>套数</th>
            <th>预测面积(㎡)</th>
            <th>实测面积(㎡)</th>
            <th>套数</th>
            <th>预测面积(㎡)</th>
            <th>实测面积(㎡)</th>
            <th>套数</th>
            <th>预测面积(㎡)</th>
            <th>实测面积(㎡)</th>
            <th>套数</th>
            <th>预测面积(㎡)</th>
            <th>实测面积(㎡)</th>
            <th>套数</th>
            <th>预测面积(㎡)</th>
            <th>实测面积(㎡)</th>
        </tr>
        </thead>
    <c:forEach items="${buildNumMap}" var="buildMap" varStatus="status">
            <tr>
                <td>${buildMap.key}</td>
            <%--<c:forEach items="${buildMap.value}" var="houseTypeMap">--%>
                <c:set value="${buildMap.value}" var="houseTypeMap" />
                    <td>${empty houseTypeMap['1']['allCount'] ? "0" : houseTypeMap['1']['allCount']}</td>
                    <td>${empty houseTypeMap['1']['allArea'] ? "0" : houseTypeMap['1']['allArea']}</td>
                    <td>${empty houseTypeMap['1']['allSjArea'] ? "0" : houseTypeMap['1']['allSjArea']}</td>
                    <td>${empty houseTypeMap['3']['allCount'] ? "0" : houseTypeMap['3']['allCount']}</td>
                    <td>${empty houseTypeMap['3']['allArea'] ? "0" : houseTypeMap['3']['allArea']}</td>
                    <td>${empty houseTypeMap['3']['allSjArea'] ? "0" : houseTypeMap['3']['allSjArea']}</td>
                    <td>${empty houseTypeMap['4']['allCount'] ? "0" : houseTypeMap['4']['allCount']}</td>
                    <td>${empty houseTypeMap['4']['allArea'] ? "0" : houseTypeMap['4']['allArea']}</td>
                    <td>${empty houseTypeMap['4']['allSjArea'] ? "0" : houseTypeMap['4']['allSjArea']}</td>
                    <td>${empty houseTypeMap['1']['signCount'] ? "0" : houseTypeMap['1']['signCount']}</td>
                    <td>${empty houseTypeMap['1']['signArea'] ? "0" : houseTypeMap['1']['signArea']}</td>
                    <td>${empty houseTypeMap['1']['signSjArea'] ? "0" : houseTypeMap['1']['signSjArea']}</td>
                    <td>${empty houseTypeMap['3']['signCount'] ? "0" : houseTypeMap['3']['signCount']}</td>
                    <td>${empty houseTypeMap['3']['signArea'] ? "0" : houseTypeMap['3']['signArea']}</td>
                    <td>${empty houseTypeMap['3']['signSjArea'] ? "0" : houseTypeMap['3']['signSjArea']}</td>
                    <td>${empty houseTypeMap['4']['signCount'] ? "0" : houseTypeMap['4']['signCount']}</td>
                    <td>${empty houseTypeMap['4']['signArea'] ? "0" : houseTypeMap['4']['signArea']}</td>
                    <td>${empty houseTypeMap['4']['signSjArea'] ? "0" : houseTypeMap['4']['signSjArea']}</td>
                    <td>${empty houseTypeMap['1']['noSignCount'] ? "0" : houseTypeMap['1']['noSignCount']}</td>
                    <td>${empty houseTypeMap['1']['noSignArea'] ? "0" : houseTypeMap['1']['noSignArea']}</td>
                    <td>${empty houseTypeMap['1']['noSignSjArea'] ? "0" : houseTypeMap['1']['noSignSjArea']}</td>
                    <td>${empty houseTypeMap['3']['noSignCount'] ? "0" : houseTypeMap['3']['noSignCount']}</td>
                    <td>${empty houseTypeMap['3']['noSignArea'] ? "0" : houseTypeMap['3']['noSignArea']}</td>
                    <td>${empty houseTypeMap['3']['noSignSjArea'] ? "0" : houseTypeMap['3']['noSignSjArea']}</td>
                    <td>${empty houseTypeMap['4']['noSignCount'] ? "0" : houseTypeMap['4']['noSignCount']}</td>
                    <td>${empty houseTypeMap['4']['noSignArea'] ? "0" : houseTypeMap['4']['noSignArea']}</td>
                    <td>${empty houseTypeMap['4']['noSignSjArea'] ? "0" : houseTypeMap['4']['noSignSjArea']}</td>
                </tr>
            <%--</c:forEach>--%>
    </c:forEach>
        <tr>
            <td>合计</td>
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
            <td>${list[0][18]}</td>
            <td>${list[0][19]}</td>
            <td>${list[0][20]}</td>
            <td>${list[0][21]}</td>
            <td>${list[0][22]}</td>
            <td>${list[0][23]}</td>
            <td>${list[0][24]}</td>
            <td>${list[0][25]}</td>
            <td>${list[0][26]}</td>
        </tr>
    </table>
</div>
<br/>
<div class="footer resizeLayout">
    <button class="btn btn-primary" id="excelBtn" style="width: 120px;letter-spacing: 2px;"><i
            class="fa fa-file-excel-o"></i>&nbsp;导出Excel
    </button>
</div>
</body>
</html>
