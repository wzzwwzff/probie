<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>拆除情况统计</title>
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
                    name: "拆除情况统计",
                    filename: "拆除情况统计",
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
    <h5>拆除情况统计</h5>
</div>
<div class="content">
    <form action="ccqkStatistics" method="post">
        <div>拆除时间：<input type="text" class="form-date-time" style="height: 30px;width: 150px;" name="date"  value="${date}"/>
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
            <td>今日拆除/户</td>
            <td>累计拆除/户</td>
            <td>拆除比例/户</td>
            <td>总建筑面积/㎡</td>
            <td>今日拆除/㎡</td>
            <td>累计拆除/㎡</td>
            <td>拆除比例/%</td>
        </tr>
        </thead>
        <c:set var="allCount" value="0"/> <!--总户数-->
        <fmt:parseNumber var="allArea" value="0"/> <!--总面积-->
        <c:set var="allTodayCcCount" value="0"/> <!--今日交房户数-->
        <fmt:parseNumber var="allTodayCcArea" value="0"/> <!--今日交房面积-->
        <c:set var="allCcCount" value="0"/> <!--交房户数-->
        <fmt:parseNumber var="allCcArae" value="0"/> <!--交房面积-->
        <c:forEach items="${dataDictList1}" var="dataDict1" >
            <c:set var="valueMap" value="${map[dataDict1.attributeValue]}"/>
            <c:set var="allCount" value="${allCount + valueMap['allCount']}"/> <!--总户数-->
            <fmt:parseNumber var="allArea" value="${allArea + valueMap['allArea']}"/> <!--总面积-->
            <c:set var="allTodayCcCount" value="${allTodayCcCount + valueMap['todayCcCount']}"/> <!--今日交房户数-->
            <fmt:parseNumber var="allTodayCcArea" value="${allTodayCcArea + valueMap['todayCcArea']}"/> <!--今日交房面积-->
            <c:set var="allCcCount" value="${allCcCount + valueMap['ccCount']}"/> <!--交房户数-->
            <fmt:parseNumber var="allCcArea" value="${allCcArea + valueMap['ccArea']}"/> <!--交房面积-->
            <tr>
                <td>${dataDict1.attributeName}</td>
                <td>${valueMap["allCount"]}</td>
                <td>${valueMap["todayCcCount"]}</td>
                <td>${valueMap["ccCount"]}</td>
                <td>
                    <c:if test="${valueMap['allCount'] gt 0}">
                        <fmt:formatNumber type="percent" maxFractionDigits="2"
                                          value="${valueMap['ccCount']/valueMap['allCount']}"/>
                    </c:if>
                </td>
                <td>${valueMap["allArea"]}</td>
                <td>${valueMap["todayCcArea"]}</td>
                <td>${valueMap["ccArea"]}</td>
                <td>
                    <c:if test="${valueMap['allArea'] gt 0}">
                        <fmt:formatNumber type="percent" maxFractionDigits="2" value="${valueMap['ccArea']/valueMap['allArea']}"/>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
        <tr>
            <td>合计</td>
            <td>${allCount}</td>
            <td>${allTodayCcCount}</td>
            <td>${allCcCount}</td>
            <td>
                <c:if test="${allCount gt 0}">
                    <fmt:formatNumber type="percent" maxFractionDigits="2" value="${allCcCount/allCount}"/>
                </c:if>
            </td>
            <td>${allArea}</td>
            <td>${allTodayCcArea}</td>
            <td>${allCcArea}</td>
            <td>
                <c:if test="${allArea gt 0}">
                    <fmt:formatNumber type="percent" maxFractionDigits="2" value="${allCcArea/allArea}"/>
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
