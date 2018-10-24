<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>未交房情况查询</title>
    <%@include file="/static/common/common.jsp"%>
    <style >       table tr td{
        text-align: center;
    }
    </style>
    <script>
        $(function () {
            $("#excelBtn").click(function () {
                $(".table").table2excel({
                    exclude: ".noExl",
                    name: "未交房情况统计",
                    filename: "未交房情况统计",
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
    <h5>未交房情况统计</h5>
</div>
<div class="content">
    <table class="table table-bordered table-hover table-striped">
        <thead>
        <tr>
            <th class="text-center" rowspan="2" style="vertical-align: middle">组别</th>
            <th class="text-center" colspan="3">户数</th>
            <th class="text-center" colspan="3">建筑面积（包含合法宅基地范围内正式房屋建筑面积和合法宅基地外的房屋建筑面积）</th>
        </tr>
        <tr>
            <td>总户数/户</td>
            <td>未交房/户</td>
            <td>未交房比例/户</td>
            <td>总建筑面积/㎡</td>
            <td>未交房/㎡</td>
            <td>未交房比例/%</td>
        </tr>
        </thead>
        <c:set var="allCount" value="0"/> <!--总户数-->
        <fmt:parseNumber var="allArea" value="0"/> <!--总户数-->
        <fmt:parseNumber var="allWjfArea" value="0"/> <!--未交房户数-->
        <c:forEach items="${dataDictList1}" var="dataDict1" >
            <c:set var="valueMap" value="${map[dataDict1.attributeValue]}"/>
            <c:set var="allCount" value="${allCount + valueMap['allCount']}"/> <!--总户数-->
            <fmt:parseNumber var="allArea" value="${allArea + valueMap['allArea']}"/> <!--总户数-->
            <c:set var="allWjfCount" value="${allWjfCount + valueMap['allWjfCount']}"/> <!--未户数-->
            <fmt:parseNumber var="allWjfArea" value="${allWjfArea + valueMap['allWjfArea']}"/> <!--未户数-->
            <tr>
                <td>${dataDict1.attributeName}</td>
                <td>${valueMap["allCount"]}</td>
                <td><a href="wjfList?search_eq_string_groupCode=${dataDict1.attributeValue}">${valueMap["allWjfCount"]}</a></td>
                <td>
                    <c:if test="${valueMap['allCount'] gt 0}">
                        <fmt:formatNumber type="percent" maxFractionDigits="2"
                                          value="${valueMap['allWjfCount']/valueMap['allCount']}"/>
                    </c:if>
                </td>
                <td>${valueMap["allArea"]}</td>
                <td>
                    <a href="wjfList?search_eq_string_groupCode=${dataDict1.attributeValue}">${valueMap["allWjfArea"]}</a>
                </td>
                <td>
                    <c:if test="${valueMap['allArea'] gt 0}">
                        <fmt:formatNumber type="percent" maxFractionDigits="2"
                                          value="${valueMap['allWjfArea']/valueMap['allArea']}"/>
                    </c:if>
                </td>

            </tr>
        </c:forEach>
        <tr>
            <td>合计</td>
            <td>${allCount}</td>
            <td><a href="wjfList">${allWjfCount}</a></td>
            <td>
                <c:if test="${allCount gt 0}">
                    <fmt:formatNumber type="percent" maxFractionDigits="2" value="${allWjfCount/allCount}"/>
                </c:if>
            </td>
            <td> <fmt:formatNumber type="number" value="${allArea}" pattern="0.00" maxFractionDigits="2"/>
            </td>
            <td><a href="wjfList">
                <fmt:formatNumber type="number" value=" ${allWjfArea}" pattern="0.00" maxFractionDigits="2"/>
           </a></td>
            <td>
                <c:if test="${allArea gt 0}">
                    <fmt:formatNumber type="percent" maxFractionDigits="2" value="${allWjfArea/allArea}"/>
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
