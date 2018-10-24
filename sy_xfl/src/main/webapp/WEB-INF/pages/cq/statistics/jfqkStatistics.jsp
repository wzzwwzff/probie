<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>交房情况统计</title>
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
                    name: "交房情况统计",
                    filename: "交房情况统计",
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
    <h5>交房情况统计</h5>
</div>
<div class="content">
    <form action="jfqkStatistics" method="post">
        <div>交房时间：<input type="text" class="form-date-time" style="height: 30px;width: 150px;" name="date"  value="${date}"/>

            <button class="btn btn-primary">查询</button>
        </div>
    </form>
    <table class="table table-bordered table-hover table-striped">
        <thead>
        <tr>
            <th class="text-center" rowspan="2" style="vertical-align: middle">组别</th>
            <th class="text-center" colspan="4">户数</th>
            <th class="text-center" colspan="4">建筑面积（包含合法宅基地范围内正式房屋建筑面积和合法宅基地外的房屋建筑面积）</th>
        </tr>
        <tr>
            <td>总户数/户</td>
            <td>今日交房/户</td>
            <td>累计交房/户</td>
            <td>交房比例/户</td>
            <td>总建筑面积/㎡</td>
            <td>今日交房/㎡</td>
            <td>累计交房/㎡</td>
            <td>交房比例/%</td>
        </tr>
        </thead>
        <c:set var="allCount" value="0"/> <!--总户数-->
        <fmt:parseNumber var="allArea" value="0"/> <!--总面积-->
        <c:set var="allTodayJfCount" value="0"/> <!--今日交房户数-->
        <fmt:parseNumber var="allTodayJfArea" value="0"/> <!--今日交房面积-->
        <c:set var="allJfCount" value="0"/> <!--交房户数-->
        <fmt:parseNumber var="allJfArae" value="0"/> <!--交房面积-->
        <c:forEach items="${dataDictList1}" var="dataDict1" >
            <c:set var="valueMap" value="${map[dataDict1.attributeValue]}"/>
            <c:set var="allCount" value="${allCount + valueMap['allCount']}"/> <!--总户数-->
            <fmt:parseNumber var="allArea" value="${allArea + valueMap['allArea']}"/> <!--总面积-->
            <c:set var="allTodayJfCount" value="${allTodayJfCount + valueMap['todayJfCount']}"/> <!--今日交房户数-->
            <fmt:parseNumber var="allTodayJfArea" value="${allTodayJfArea + valueMap['todayJfArea']}"/> <!--今日交房面积-->
            <c:set var="allJfCount" value="${allJfCount + valueMap['jfCount']}"/> <!--交房户数-->
            <fmt:parseNumber var="allJfArea" value="${allJfArea + valueMap['jfArea']}"/> <!--交房面积-->
            <tr>
                <td>${dataDict1.attributeName}</td>
                <td>${valueMap["allCount"]}</td>
                <td>${valueMap["todayJfCount"]}</td>
                <td>${valueMap["jfCount"]}</td>
                <td>
                    <c:if test="${valueMap['allCount'] gt 0}">
                        <fmt:formatNumber type="percent" maxFractionDigits="2"
                                          value="${valueMap['jfCount']/valueMap['allCount']}"/>
                    </c:if>
                </td>
                <td>${valueMap["allArea"]}</td>
                <td>${valueMap["todayJfArea"]}</td>
                <td>${valueMap["jfArea"]}</td>
                <td>
                    <c:if test="${valueMap['allArea'] gt 0}">
                        <fmt:formatNumber type="percent" maxFractionDigits="2" value="${valueMap['jfArea']/valueMap['allArea']}"/>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
        <tr>
            <td>合计</td>
            <td>${allCount}</td>
            <td>${allTodayJfCount}</td>
            <td>${allJfCount}</td>
            <td>
                <c:if test="${allCount gt 0}">
                    <fmt:formatNumber type="percent" maxFractionDigits="2" value="${allJfCount/allCount}"/>
                </c:if>
            </td>
            <td>${allArea}</td>
            <td>${allTodayJfArea}</td>
            <td>${allJfArea}</td>
            <td>
                <c:if test="${allArea gt 0}">
                    <fmt:formatNumber type="percent" maxFractionDigits="2" value="${allJfArea/allArea}"/>
                </c:if>
            </td>
        </tr>
    </table>
</div>
<div class="footer resizeLayout">
    <button class="btn btn-primary" id="excelBtn" style="width: 120px;letter-spacing: 2px;"><i class="fa fa-file-excel-o"></i>&nbsp;导出Excel</button>
</div>
</body>
</html>
