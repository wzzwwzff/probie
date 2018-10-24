<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>整体情况统计</title>
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
                    name: "整体情况统计",
                    filename: "整体情况统计",
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
    <h5>整体情况统计</h5>
</div>
<div class="content">
    <table class="table table-bordered table-hover">
        <thead>
        <tr>
            <th rowspan="2" style="vertical-align: middle">地块</th>
            <th rowspan="2" style="vertical-align: middle">总户数</th>
            <th colspan="2">选房批次情况</th>
            <th colspan="2">选房情况</th>
            <th colspan="2">认购协议签订</th>
            <th colspan="2">财务结算</th>
        </tr>
        <tr>
            <th>已设置/户</th>
            <th>设置比例/%</th>
            <th>已选房/户</th>
            <th>选房比例/%</th>
            <th>已签约/户</th>
            <th>签约比例/%</th>
            <th>已结算/户</th>
            <th>结算比例/%</th>
        </tr>
        </thead>
        <c:set var="allCount" value="0"/> <!--总户数-->
        <c:set var="allxfBatch" value="0"/> <!--选房批次设置数量-->
        <c:set var="allHouseCount" value="0"/> <!--选房数量-->
        <c:set var="allSignCount" value="0"/> <!--签约数量-->
        <c:set var="alljsCount" value="0"/> <!--结算数量-->
        <c:forEach items="${map}" var="areMap" >
            <c:set var="valueMap" value="${areMap.value}"/>
            <c:set var="allCount" value="${allCount + valueMap['allCount']}"/> <!--总户数-->
            <c:set var="allxfBatch" value="${allxfBatch + valueMap['xfBatch']}"/> <!--选房批次设置数量-->
            <c:set var="allHouseCount" value="${allHouseCount + valueMap['houseCount']}"/> <!--选房数量-->
            <c:set var="allSignCount" value="${allSignCount + valueMap['signCount']}"/> <!--签约数量-->
            <c:set var="alljsCount" value="${alljsCount + valueMap['jsCount']}"/> <!--结算数量-->
            <tr>
                <td>${valueMap["areaName"]}</td>
                <td>${valueMap["allCount"]}</td>
                <td>${valueMap["xfBatch"]}</td>
                <td><fmt:formatNumber type="percent" maxFractionDigits="2" value="${valueMap['xfBatch']/valueMap['allCount']}"/> </td>
                <td>${valueMap["houseCount"]}</td>
                <td><fmt:formatNumber type="percent" maxFractionDigits="2" value="${valueMap['houseCount']/valueMap['allCount']}"/> </td>
                <td>${valueMap["signCount"]}</td>
                <td><fmt:formatNumber type="percent" maxFractionDigits="2" value="${valueMap['signCount']/valueMap['allCount']}"/> </td>
                <td>${valueMap["jsCount"]}</td>
                <td><fmt:formatNumber type="percent" maxFractionDigits="2" value="${valueMap['jsCount']/valueMap['allCount']}"/> </td>
            </tr>
        </c:forEach>
        <tr>
            <td>合计</td>
            <td>${allCount}</td>
            <td>${allxfBatch}</td>
            <td><fmt:formatNumber type="percent" maxFractionDigits="2" value="${allxfBatch/allCount}"/></td>
            <td>${allHouseCount}</td>
            <td><fmt:formatNumber type="percent" maxFractionDigits="2" value="${allHouseCount/allCount}"/> </td>
            <td>${allSignCount}</td>
            <td><fmt:formatNumber type="percent" maxFractionDigits="2" value="${allSignCount/allCount}"/> </td>
            <td>${alljsCount}</td>
            <td><fmt:formatNumber type="percent" maxFractionDigits="2" value="${alljsCount/allCount}"/> </td>

        </tr>
    </table>
</div>
<div class="footer resizeLayout">
    <button class="btn btn-primary" id="excelBtn" style="width: 120px;letter-spacing: 2px;"><i class="fa fa-file-excel-o"></i>&nbsp;导出Excel</button>
</div>
</body>
</html>
