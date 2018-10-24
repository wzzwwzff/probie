<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>综合情况统计</title>
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
                    name: "综合情况统计",
                    filename: "综合情况统计",
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
    <h5>综合情况统计</h5>
</div>
<div class="content">
    <table class="table table-bordered table-hover table-striped">
        <thead>
        <tr>
            <th class="text-center" rowspan="2" style="vertical-align: middle">组别</th>
            <th class="text-center" rowspan="2" style="vertical-align: middle">总户数</th>
            <th class="text-center" colspan="2">评估数据</th>
            <th class="text-center" colspan="2">拆迁数据</th>
            <th class="text-center" colspan="2">测绘数据</th>
            <th class="text-center" colspan="2">签约情况</th>
            <th class="text-center" colspan="2">交房情况</th>
            <th class="text-center" colspan="2">拆除情况</th>
            <th class="text-center" colspan="2">财务结算情况</th>
        </tr>
        <tr>
            <th class="text-center">已上报/户</th>
            <th class="text-center">上报比例/%</th>
            <th class="text-center">已上报/户</th>
            <th class="text-center">上报比例/%</th>
            <th class="text-center">已上报/户</th>
            <th class="text-center">上报比例/%</th>
            <th class="text-center">已签约/户</th>
            <th class="text-center">签约比例/%</th>
            <th class="text-center">已交房/户</th>
            <th class="text-center">交房比例/%</th>
            <th class="text-center">已拆除/户</th>
            <th class="text-center">拆除比例/%</th>
            <th class="text-center">已结算/户</th>
            <th class="text-center">结算比例/%</th>
        </tr>
        </thead>
        <c:set var="allCount" value="0"/> <!--总户数-->
        <c:set var="pgCount" value="0"/> <!--评估已审核数量-->
        <c:set var="cqCount" value="0"/> <!--拆迁已审核数量-->
        <c:set var="chCount" value="0"/> <!--测绘已审核数量-->
        <c:set var="qyCount" value="0"/> <!--已签约数量-->
        <c:set var="jfCount" value="0"/> <!--已交房数量-->
        <c:set var="ccCount" value="0"/> <!--已拆除数量-->
        <c:set var="jsCount" value="0"/> <!--已结算数量-->
        <c:forEach items="${dataDictList1}" var="dataDict1" >
            <c:set var="valueMap" value="${map[dataDict1.attributeValue]}"/>
            <c:set var="allCount" value="${allCount + valueMap['allCount']}"/> <!--总户数-->
            <c:set var="pgCount" value="${pgCount + valueMap['pgCount']}"/> <!--评估审核数量-->
            <c:set var="cqCount" value="${cqCount + valueMap['cqCount']}"/> <!--拆迁审核数量-->
            <c:set var="chCount" value="${chCount + valueMap['chCount']}"/> <!--测绘审核数量-->
            <c:set var="qyCount" value="${qyCount + valueMap['qyCount']}"/> <!--签约数量-->
            <c:set var="jfCount" value="${jfCount + valueMap['jfCount']}"/> <!--交房数量-->
            <c:set var="ccCount" value="${ccCount + valueMap['ccCount']}"/> <!--拆除数量-->
            <c:set var="jsCount" value="${jsCount + valueMap['jsCount']}"/> <!--结算数量-->
            <tr>
                <td>${dataDict1.attributeName}</td>
                <td>${valueMap["allCount"]}</td>
                <td>${valueMap["pgCount"]}</td>
                <td><fmt:formatNumber type="percent" maxFractionDigits="2" value="${valueMap['pgCount']/valueMap['allCount']}"/> </td>
                <td>${valueMap["cqCount"]}</td>
                <td><fmt:formatNumber type="percent" maxFractionDigits="2" value="${valueMap['cqCount']/valueMap['allCount']}"/> </td>
                <td>${valueMap["chCount"]}</td>
                <td><fmt:formatNumber type="percent" maxFractionDigits="2" value="${valueMap['chCount']/valueMap['allCount']}"/> </td>
                <td>${valueMap["qyCount"]}</td>
                <td><fmt:formatNumber type="percent" maxFractionDigits="2" value="${valueMap['qyCount']/valueMap['allCount']}"/> </td>
                <td>${valueMap["jfCount"]}</td>
                <td><fmt:formatNumber type="percent" maxFractionDigits="2" value="${valueMap['jfCount']/valueMap['allCount']}"/> </td>
                <td>${valueMap["ccCount"]}</td>
                <td><fmt:formatNumber type="percent" maxFractionDigits="2" value="${valueMap['ccCount']/valueMap['allCount']}"/> </td>
                <td>${valueMap["jsCount"]}</td>
                <td><fmt:formatNumber type="percent" maxFractionDigits="2" value="${valueMap['jsCount']/valueMap['allCount']}"/> </td>
            </tr>
        </c:forEach>
        <tr>
            <td>合计</td>
            <td>${allCount}</td>
            <td>${pgCount}</td>
            <td><fmt:formatNumber type="percent" maxFractionDigits="2" value="${pgCount/allCount}"/></td>
            <td>${cqCount}</td>
            <td><fmt:formatNumber type="percent" maxFractionDigits="2" value="${cqCount/allCount}"/> </td>
            <td>${chCount}</td>
            <td><fmt:formatNumber type="percent" maxFractionDigits="2" value="${chCount/allCount}"/> </td>
            <td>${qyCount}</td>
            <td><fmt:formatNumber type="percent" maxFractionDigits="2" value="${qyCount/allCount}"/> </td>
            <td>${jfCount}</td>
            <td><fmt:formatNumber type="percent" maxFractionDigits="2" value="${jfCount/allCount}"/> </td>
            <td>${ccCount}</td>
            <td><fmt:formatNumber type="percent" maxFractionDigits="2" value="${ccCount/allCount}"/> </td>
            <td>${jsCount}</td>
            <td><fmt:formatNumber type="percent" maxFractionDigits="2" value="${jsCount/allCount}"/> </td>

        </tr>
    </table>
</div>
<div class="footer resizeLayout">
    <button class="btn btn-primary" id="excelBtn" style="width: 120px;letter-spacing: 2px;"><i class="fa fa-file-excel-o"></i>&nbsp;导出Excel</button>
</div>
</body>
</html>
