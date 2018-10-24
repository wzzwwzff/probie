<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>平移情况统计</title>
    <%@include file="/static/common/common.jsp"%>
    <style>
        table tr td{
            text-align: center;
        }
    </style>
    <script>
        $(function () {
            $("#excelBtn").click(function () {
                $(".table").table2excel({
                    exclude: ".noExl",
                    name: "平移情况统计",
                    filename: "平移情况统计",
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
    <h5>平移情况统计</h5>
</div>
<div class="content">
    <table class="table table-bordered table-hover">
        <thead>
        <tr>
            <th rowspan="2" style="vertical-align: middle">日期</th>
            <th colspan="3">签约情况</th>
            <th colspan="3">选房情况</th>
        </tr>
        <tr>
            <th>平移户</th>
            <th>未平移户</th>
            <th>已签约/户</th>
            <th>平移套数</th>
            <th>未平移套数</th>
            <th>已选房/套</th>
        </tr>
        </thead>
        <c:set var="allSign" value="0"/> <!--签约总户数-->
        <c:set var="ypySign" value="0"/> <!--已平移签约户数-->
        <c:set var="wpySign" value="0"/> <!--未平移签约户数-->
        <c:set var="allXf" value="0"/> <!--选房总户数-->
        <c:set var="ypyXf" value="0"/> <!--已平移选房户数-->
        <c:set var="wpyXf" value="0"/> <!--未平移选房户数-->
        <c:forEach items="${signMap}" var="map" varStatus="status">
            <c:set var="valueMap" value="${map.value}"/>
            <c:set var="signNumDate" value="${valueMap['signNumDate']}"/><%--日期--%>
            <c:set var="allSign" value="${allSign + valueMap['allSign']}"/>
            <c:set var="ypySign" value="${ypySign + valueMap['ypySign']}"/>
            <c:set var="wpySign" value="${wpySign + valueMap['wpySign']}"/>
            <c:set var="allXf" value="${allXf + xfMap[signNumDate]['allXf']}"/>
            <c:set var="ypyXf" value="${ypyXf + xfMap[signNumDate]['ypyXf']}"/>
            <c:set var="wpyXf" value="${wpyXf + xfMap[signNumDate]['wpyXf']}"/>
            <tr>
                <td>${valueMap['signNumDate']}</td>
                <td>${valueMap['ypySign']}</td>
                <td>${valueMap['wpySign']}</td>
                <td>${valueMap['allSign']}</td>
                <td>${xfMap[signNumDate]['ypyXf']}</td>
                <td>${xfMap[signNumDate]['wpyXf']}</td>
                <td>${xfMap[signNumDate]['allXf']}</td>
            </tr>
        </c:forEach>
        <tr>
            <td>合计</td>
            <td>${ypySign}</td>
            <td>${wpySign}</td>
            <td>${allSign}</td>
            <td>${ypyXf}</td>
            <td>${wpyXf}</td>
            <td>${allXf}</td>
        </tr>
    </table>
</div>
<div class="footer resizeLayout">
    <button class="btn btn-primary" id="excelBtn" style="width: 120px;letter-spacing: 2px;"><i class="fa fa-file-excel-o"></i>&nbsp;导出Excel</button>
</div>
</body>
</html>
