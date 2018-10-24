<%--
  Created by IntelliJ IDEA.
  User: jmdf
  Date: 2018/8/24
  Time: 17:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>弃房率统计</title>
    <%@include file="/static/common/common.jsp" %>
    <style>
        html, body {
            overflow-x: auto;
        }
    </style>
</head>
<body>
<div class="title">
    <h4>弃房率统计</h4>
</div>
<div class="content">
    <table class="table table-bordered table-hover">
        <thead>
        <tr>
            <th class="text-center" style="vertical-align: middle" >项目名称</th>
            <th class="text-center" style="vertical-align: middle" >审核通过家庭</th>
            <th class="text-center" style="vertical-align: middle" >摇号结果</th>
            <th class="text-center" style="vertical-align: middle" >房间套数</th>
            <th class="text-center" style="vertical-align: middle" >弃房率(%)</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${discardingStatistics}" var="totalMap" varStatus="status">
            <tr>
                <td class="text-center" style="vertical-align: middle;">${totalMap.key}</td>
                <td class="text-center">${totalMap.value[0]}</td>
                <td class="text-center">${totalMap.value[1]}</td>
                <td class="text-center">${totalMap.value[2]}</td>
                <td class="text-center">${totalMap.value[3]}</td>
            </tr>
        </c:forEach>
        <tr style="color: green;">
            <td class="text-center">合计</td>
            <td class="text-center">${discardingTotalCount[0]}</td>
            <td class="text-center">${discardingTotalCount[1]}</td>
            <td class="text-center">${discardingTotalCount[2]}</td>
            <td class="text-center">${discardingTotalCount[3]}</td>
        </tr>
        </tbody>
    </table>
</div>
<div class="footer">
    <button class="btn btn-primary btn-sm" id="excelBtn"><i class="fa fa-file-excel-o"></i>&nbsp;导出Excel
    </button>
</div>
<script>
    $(function () {
        $("#excelBtn").click(function () {
            $(".table").table2excel({
                exclude: ".noExl",
                name: "弃房率统计表",
                filename: "弃房率统计表",
                exclude_img: true,
                exclude_links: true,
                exclude_inputs: true
            });
        });
    });
</script>
</body>
</html>