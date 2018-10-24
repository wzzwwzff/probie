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
            <th rowspan="3" style="vertical-align: middle">地块</th>
            <th rowspan="3" style="vertical-align: middle">楼号</th>
            <th colspan="8">全部</th>
            <th colspan="8">已选</th>
            <th colspan="8">剩余</th>
        </tr>
        <tr>
            <th colspan="2">一室一厅一卫</th>
            <th colspan="2">一室二厅一卫</th>
            <th colspan="2">二室二厅一卫</th>
            <th colspan="2">三室二厅二卫</th>
            <th colspan="2">一室一厅一卫</th>
            <th colspan="2">一室二厅一卫</th>
            <th colspan="2">二室二厅一卫</th>
            <th colspan="2">三室二厅二卫</th>
            <th colspan="2">一室一厅一卫</th>
            <th colspan="2">一室二厅一卫</th>
            <th colspan="2">二室二厅一卫</th>
            <th colspan="2">三室二厅二卫</th>
        </tr>
        <tr>
            <th>套数</th>
            <th>面积(㎡)</th>
            <th>套数</th>
            <th>面积(㎡)</th>
            <th>套数</th>
            <th>面积(㎡)</th>
            <th>套数</th>
            <th>面积(㎡)</th>
            <th>套数</th>
            <th>面积(㎡)</th>
            <th>套数</th>
            <th>面积(㎡)</th>
            <th>套数</th>
            <th>面积(㎡)</th>
            <th>套数</th>
            <th>面积(㎡)</th>
            <th>套数</th>
            <th>面积(㎡)</th>
            <th>套数</th>
            <th>面积(㎡)</th>
            <th>套数</th>
            <th>面积(㎡)</th>
            <th>套数</th>
            <th>面积(㎡)</th>
        </tr>
        </thead>
        <c:forEach items="${map}" var="projectMap">
            <tr>
                <td rowspan="${fn:length(projectMap.value) + 1}">${projectMap.key}</td>
            </tr>
            <c:forEach items="${projectMap.value}" var="buildNumMap">
                <tr>
                    <td>${buildNumMap.key}</td>
                    <td>${buildNumMap.value['1']['allCount']}</td>
                    <td>${buildNumMap.value['1']['allArea']}</td>
                    <td>${buildNumMap.value['2']['allCount']}</td>
                    <td>${buildNumMap.value['2']['allArea']}</td>
                    <td>${buildNumMap.value['3']['allCount']}</td>
                    <td>${buildNumMap.value['3']['allArea']}</td>
                    <td>${buildNumMap.value['4']['allCount']}</td>
                    <td>${buildNumMap.value['4']['allArea']}</td>
                    <td>${buildNumMap.value['1']['signCount']}</td>
                    <td>${buildNumMap.value['1']['signArea']}</td>
                    <td>${buildNumMap.value['2']['signCount']}</td>
                    <td>${buildNumMap.value['2']['signArea']}</td>
                    <td>${buildNumMap.value['3']['signCount']}</td>
                    <td>${buildNumMap.value['3']['signArea']}</td>
                    <td>${buildNumMap.value['4']['signCount']}</td>
                    <td>${buildNumMap.value['4']['signArea']}</td>
                    <td>${buildNumMap.value['1']['noSignCount']}</td>
                    <td>${buildNumMap.value['1']['noSignArea']}</td>
                    <td>${buildNumMap.value['2']['noSignCount']}</td>
                    <td>${buildNumMap.value['2']['noSignArea']}</td>
                    <td>${buildNumMap.value['3']['noSignCount']}</td>
                    <td>${buildNumMap.value['3']['noSignArea']}</td>
                    <td>${buildNumMap.value['4']['noSignCount']}</td>
                    <td>${buildNumMap.value['4']['noSignArea']}</td>
                </tr>
            </c:forEach>
        </c:forEach>
        <tr>
            <td colspan="2">合计</td>
            <td>${list[0][1]}</td>
            <td>${list[0][2]}</td>
            <td>${list[1][1]}</td>
            <td>${list[1][2]}</td>
            <td>${list[2][1]}</td>
            <td>${list[2][2]}</td>
            <td>${list[3][1]}</td>
            <td>${list[3][2]}</td>
            <td>${list[0][3]}</td>
            <td>${list[0][4]}</td>
            <td>${list[1][3]}</td>
            <td>${list[2][4]}</td>
            <td>${list[2][3]}</td>
            <td>${list[2][4]}</td>
            <td>${list[3][3]}</td>
            <td>${list[3][4]}</td>
            <td>${list[0][5]}</td>
            <td>${list[0][6]}</td>
            <td>${list[1][5]}</td>
            <td>${list[1][6]}</td>
            <td>${list[2][5]}</td>
            <td>${list[2][6]}</td>
            <td>${list[3][5]}</td>
            <td>${list[3][6]}</td>
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
