<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<%--
  Created by IntelliJ IDEA.
  User: jmdf
  Date: 2018/3/13
  Time: 9:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>未签约情况查询</title>
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
                    name: "未签约情况统计",
                    filename: "未签约情况统计",
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
    <h5>未签约情况统计</h5>
</div>
<div class="content">
    <table class="table table-bordered table-hover table-striped">
        <thead>
        <tr>
            <th class="text-center">组别</th>
            <th class="text-center">总户数</th>
            <th class="text-center">未签约/户</th>
            <th class="text-center">比例/%</th>
        </tr>
        </thead>
        <c:set var="allCount" value="0"/> <!--总户数-->

        <c:set var="allWqyCount" value="0"/> <!--未签约户数-->


        <c:forEach items="${dataDictList1}" var="dataDict1" >
            <c:set var="valueMap" value="${map[dataDict1.attributeValue]}"/>
            <c:set var="allCount" value="${allCount + valueMap['allCount']}"/> <!--总户数-->
            <c:set var="allWqyCount" value="${allWqyCount + valueMap['allWqyCount']}"/> <!--未户数-->

            <tr>
                <td>${dataDict1.attributeName}</td>
                <td>${valueMap["allCount"]}</td>
                <td><a href="noSignList?search_eq_string_groupCode=${dataDict1.attributeValue}">${valueMap["allWqyCount"]}</a></td>
                <td><fmt:formatNumber type="percent" maxFractionDigits="2" value="${valueMap['allWqyCount']/valueMap['allCount']}"/> </td>
            </tr>
        </c:forEach>
        <tr>
            <td>合计</td>
            <td>${allCount}</td>
            <td><a href="noSignList">${allWqyCount}</a></td>
            <td><fmt:formatNumber type="percent" maxFractionDigits="2" value="${allWqyCount/allCount}"/></td>

        </tr>
    </table>
</div>
<div class="footer resizeLayout">
    <button class="btn btn-primary" id="excelBtn" style="width: 120px;letter-spacing: 2px;"><i class="fa fa-file-excel-o"></i>&nbsp;导出Excel</button>
</div>
</body>
</html>
