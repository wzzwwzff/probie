<%--
  Created by IntelliJ IDEA.
  User: jmdf
  Date: 2018/3/15
  Time: 14:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>签约、交房、拆除情况统计</title>
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
                    name: "情况统计",
                    filename: "情况统计",
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
    <h5>情况统计</h5>
</div>
<div class="content">
    <form action="qkTj" method="post">
        <div>查询时间：<input type="text" class="form-date-time" style="height: 30px;width: 150px;" name="date"  value="${date}"/>

            <button type="submit" class="btn btn-primary">查询</button>
        </div>
    </form>
    <table class="table table-bordered table-hover table-striped">

        <thead>
        <tr>
            <th class="text-center" rowspan="2" style="vertical-align: middle">组别</th>
            <th class="text-center" rowspan="2" style="vertical-align: middle">总户数</th>
            <th class="text-center" colspan="3">签约情况</th>
            <th class="text-center" colspan="3">交房情况</th>
            <th class="text-center" colspan="3">拆除情况</th>

        </tr>
        <tr>
            <th class="text-center">今日签约/户</th>
            <th class="text-center">累计签约/户</th>
            <th class="text-center">签约比例/%</th>

            <th class="text-center">今日交房/户</th>
            <th class="text-center">累计交房/户</th>
            <th class="text-center">交房比例/%</th>

            <th class="text-center">今日拆除/户</th>
            <th class="text-center">累计拆除/户</th>
            <th class="text-center">拆除比例/%</th>

        </tr>
        </thead>
        <c:set var="allCount" value="0"/> <!--总户数-->
        <c:set var="allTodayQyCount" value="0"/> <!--当日签约户数-->
        <c:set var="allQyCount" value="0"/> <!--总签约户数-->
        <c:set var="allTodayJfCount" value="0"/> <!--当日交房户数-->
        <c:set var="allJfCount" value="0"/> <!--总交房户数-->
        <c:set var="allTodayCcCount" value="0"/> <!--当日拆除户数-->
        <c:set var="allCcCount" value="0"/> <!--总拆除户数-->
        <c:forEach items="${dataDictList1}" var="dataDict1" >
            <c:set var="valueMap" value="${map[dataDict1.attributeValue]}"/>
            <c:set var="allCount" value="${allCount + valueMap['allCount']}"/> <!--总户数-->
            <c:set var="allTodayQyCount" value="${allTodayQyCount + valueMap['todayQyCount']}"/> <!--今日签约户数-->
            <c:set var="allQyCount" value="${allQyCount + valueMap['qyCount']}"/> <!--签约户数-->
            <c:set var="allTodayJfCount" value="${allTodayJfCount + valueMap['todayJfCount']}"/> <!--今日交房户数-->
            <c:set var="allJfCount" value="${allJfCount + valueMap['jfCount']}"/> <!--交房户数-->
            <c:set var="allTodayCcCount" value="${allTodaCcyCount + valueMap['todayCcCount']}"/> <!--今日交房户数-->
            <c:set var="allCcCount" value="${allCcCount + valueMap['ccCount']}"/> <!--拆除户数-->

            <tr>
                <td>${dataDict1.attributeName}</td>
                <td>${valueMap["allCount"]}</td>
                <td>${valueMap["todayQyCount"]}</td>
                <td>${valueMap["qyCount"]}</td>
                <td><fmt:formatNumber type="percent" maxFractionDigits="2" value="${valueMap['qyCount']/valueMap['allCount']}"/> </td>

                <td>${valueMap["todayJfCount"]}</td>
                <td>${valueMap["jfCount"]}</td>
                <td><fmt:formatNumber type="percent" maxFractionDigits="2" value="${valueMap['jfCount']/valueMap['allCount']}"/> </td>

                <td>${valueMap["todayCcCount"]}</td>
                <td>${valueMap["ccCount"]}</td>
                <td><fmt:formatNumber type="percent" maxFractionDigits="2" value="${valueMap['ccCount']/valueMap['allCount']}"/> </td>


            </tr>
        </c:forEach>
        <tr>
            <td>合计</td>
            <td>${allCount}</td>
            <td>${allTodayQyCount}</td>
            <td>${allQyCount}</td>
            <td><fmt:formatNumber type="percent" maxFractionDigits="2" value="${allQyCount/allCount}"/></td>

            <td>${allTodayJfCount}</td>
            <td>${allJfCount}</td>
            <td><fmt:formatNumber type="percent" maxFractionDigits="2" value="${allJfCount/allCount}"/></td>

            <td>${allTodayCcCount}</td>
            <td>${allCcCount}</td>
            <td><fmt:formatNumber type="percent" maxFractionDigits="2" value="${allCcCount/allCount}"/></td>

        </tr>

    </table>
</div>
<div class="footer resizeLayout">
    <button class="btn btn-primary" id="excelBtn" style="width: 120px;letter-spacing: 2px;"><i class="fa fa-file-excel-o"></i>&nbsp;导出Excel</button>
</div>
</body>
</html>
