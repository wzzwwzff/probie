<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>签约日报表</title>
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
                    name: "签约日报表",
                    filename: "签约日报表",
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
    <h5>签约日报表</h5>
</div>
<div class="content">
    <table class="table table-bordered table-hover">
        <thead>
        <tr>
            <td colspan="34">
                <fmt:parseNumber var="all" value="${list[0][0]}"/>
                <fmt:parseNumber var="sign" value="${list[0][1]}"/>
                总户数：${all}户，截止到【${date}】已签约户数：${sign}户，
                签约比例：<c:if test="${all eq 0}">0%</c:if> <c:if test="${all ne 0}"><fmt:formatNumber type="percent" maxFractionDigits="2" value="${sign/all}"/> </c:if>
            </td>
        </tr>
        <tr>
            <th rowspan="2" style="vertical-align: middle;text-align: center">序号</th>
            <th rowspan="2" style="vertical-align: middle;text-align: center">年月</th>
            <th rowspan="2" style="vertical-align: middle;text-align: center">分类</th>
            <th colspan="31" style="text-align: center;">日</th>
        </tr>
        <tr>
            <c:forEach var="day" begin="1" end="31">
                <th>${day}</th>
            </c:forEach>
        </tr>
        </thead>
       <c:forEach items="${map}" var="yearMonthMap" varStatus="status">
           <c:forEach items="${dataDictList1}" varStatus="statusCount" var="dataDict">
               <tr>
                   <c:if test="${statusCount.count eq 1}">
                       <td rowspan="${fn:length(dataDictList1)+1}" style="vertical-align: middle;text-align: center">${status.count}</td>
                       <td rowspan="${fn:length(dataDictList1)+1}" style="vertical-align: middle;text-align: center">${yearMonthMap.key}</td>
                   </c:if>
                   <td>${dataDict.attributeName}</td>
                   <c:set var="groupCodeMap" value="${yearMonthMap.value[dataDict.attributeValue]}"/>
                   <c:forEach var="day" begin="1" end="31">
                       <c:set var="key" value="${day}${''}"/>
                       <td>${groupCodeMap[key]}</td>
                   </c:forEach>
               </tr>
           </c:forEach>
           <tr>
               <td>小计</td>
               <c:set var="allMap" value="${yearMonthMap.value['小计']}"/>
               <c:forEach var="day" begin="1" end="31">
                   <c:set var="key" value="${day}${''}"/>
                   <td>${allMap[key]}</td>
               </c:forEach>

           </tr>
       </c:forEach>
    </table>
</div>
<div class="footer resizeLayout">
    <button class="btn btn-primary" id="excelBtn" style="width: 120px;letter-spacing: 2px;"><i class="fa fa-file-excel-o"></i>&nbsp;导出Excel</button>
</div>
</body>
</html>
