<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>签约情况统计</title>
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
                    name: "签约情况统计",
                    filename: "签约情况统计",
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
    <h5>签约情况统计</h5>
</div>
<div class="content">
    <form action="qyqkStatistics" method="post">
        <div>签约时间：<input type="text" class="form-date-time" style="height: 30px;width: 150px;" name="date"  value="${date}"/>
            <button type="submit" class="btn btn-primary">查询</button>
        </div>
    </form>
    <table class="table table-bordered table-hover table-striped">

        <thead>
        <tr>
            <th class="text-center" rowspan="3" style="vertical-align: middle;width: 11%">组别</th>
            <th class="text-center" rowspan="3" style="vertical-align: middle;width: 11%">总户数</th>
            <th class="text-center" colspan="${(fn:length(dataDictList2)+1)*2+1}">签约情况</th>

        </tr>
        <tr>
            <th class="text-center" colspan="${fn:length(dataDictList2)+1}">今日签约/户</th>
            <th class="text-center" colspan="${fn:length(dataDictList2)+1}">累计签约/户</th>
            <th class="text-center" rowspan="2">签约比例/%</th>
        </tr>
        <tr>
            <c:forEach var="dataDict" items="${dataDictList2}">
                <td style="width: 11%">${dataDict.attributeName}</td>
            </c:forEach>
            <td style="width: 11%">合计</td>
            <c:forEach var="dataDict" items="${dataDictList2}">
                <td style="width: 11%">${dataDict.attributeName}</td>
            </c:forEach>
            <td style="width: 11%">合计</td>
        </tr>
        </thead>
        <c:set var="allCount" value="0"/>
        <c:set var="allQyCount" value="0"/>
        <c:set var="allTodayCount" value="0"/>
        <c:forEach items="${dataDictList1}" var="dataDict1" >
            <c:set var="valueMap" value="${map[dataDict1.attributeValue]}"/>
            <tr>
                <td>${dataDict1.attributeName}</td>
                <%--求总户数的循环--%>
                <c:set var="itemAllCount" value="0"/>
                <c:set var="itemAllQyCount" value="0"/>
                <c:set var="itemAllTodayCount" value="0"/>
                <c:forEach var="dataDict" items="${dataDictList2}">
                    <c:set var="value" value="${valueMap[dataDict.attributeValue]}"/>
                    <c:set var="itemAllCount" value="${itemAllCount + value['allCount']}"/>
                    <c:set var="itemAllQyCount" value="${itemAllQyCount + value['qyCount']}"/>
                    <c:set var="itemAllTodayCount" value="${itemAllTodayCount + value['todayQyCount']}"/>
                </c:forEach>
                <c:set var="allCount" value="${allCount+itemAllCount}"/>
                <c:set var="allQyCount" value="${allQyCount+itemAllQyCount}"/>
                <c:set var="allTodayCount" value="${allTodayCount+itemAllTodayCount}"/>
                <td>${itemAllCount}</td>
                <%--输出值的循环--%>
                <c:forEach var="dataDict" items="${dataDictList2}">
                    <c:set var="value" value="${valueMap[dataDict.attributeValue]}"/>
                    <td>${value["todayQyCount"]}</td>
                </c:forEach>
                <td>${itemAllTodayCount}</td>
                <c:forEach var="dataDict" items="${dataDictList2}">
                    <c:set var="value" value="${valueMap[dataDict.attributeValue]}"/>
                    <td>${value["qyCount"]}</td>
                </c:forEach>
                <td>${itemAllQyCount}</td>
                <td>
                    <c:if test="${itemAllCount gt 0}">
                    <fmt:formatNumber type="percent" maxFractionDigits="2" value="${itemAllQyCount/itemAllCount}"/>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
        <tr>
            <c:set var="allMap" value="${map['all']}"/>
            <td>合计</td>
            <td>${allCount}</td>
            <c:forEach var="dataDict" items="${dataDictList2}">
                <c:set var="value" value="${allMap[dataDict.attributeValue]}"/>
                <td>${value["todayQyCount"]}</td>
            </c:forEach>
            <td>${allTodayCount}</td>
            <c:forEach var="dataDict" items="${dataDictList2}">
                <c:set var="value" value="${allMap[dataDict.attributeValue]}"/>
                <td>${value["qyCount"]}</td>
            </c:forEach>
            <td>${allQyCount}</td>
            <td>
                <c:if test="${allCount gt 0}">
                    <fmt:formatNumber type="percent" maxFractionDigits="2" value="${allQyCount/allCount}"/>
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
