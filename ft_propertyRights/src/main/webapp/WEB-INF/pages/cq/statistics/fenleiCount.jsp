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
    <title>分类统计</title>
    <%@include file="/static/common/common.jsp" %>
    <style>
        html, body {
            overflow-x: auto;
        }
    </style>
</head>
<body>
<div class="title">
    <h4>分类统计</h4>
</div>
<div class="content">
    <table class="table table-bordered table-hover">
        <thead>
        <tr>
            <th class="text-center" style="vertical-align: middle" rowspan="3">项目名称</th>
            <th class="text-center" style="vertical-align: middle" rowspan="3">总数量</th>
            <th class="text-center" style="vertical-align: middle" rowspan="3">本市户籍家庭数量</th>
            <th class="text-center" style="vertical-align: middle" rowspan="3">持有效证家庭数量</th>
            <th class="text-center" style="vertical-align: middle" rowspan="3">驻京现役军人或武警家庭数量</th>
            <th class="text-center" style="vertical-align: middle" rowspan="3">5年及以上缴纳社保家庭数量</th>
            <th class="text-center" style="vertical-align: middle" rowspan="3">5年及以上缴纳个税家庭数量</th>
            <th class="text-center" style="vertical-align: middle" rowspan="3">是本区数量</th>
            <th class="text-center" style="vertical-align: middle" rowspan="3">不是本区数量</th>
            <th class="text-center" style="vertical-align: middle" rowspan="3">是园区数量</th>
            <th class="text-center" style="vertical-align: middle" rowspan="3">不是园区数量</th>
            <th class="text-center" style="vertical-align: middle" rowspan="3">本科数量</th>
            <th class="text-center" style="vertical-align: middle" rowspan="3">硕士研究生数量</th>
            <th class="text-center" style="vertical-align: middle" rowspan="3">博士研究生数量</th>
            <th class="text-center" style="vertical-align: middle" rowspan="3">优先组数量</th>
            <th class="text-center" style="vertical-align: middle" rowspan="3">普通组数量</th>
            <th class="text-center" style="vertical-align: middle" rowspan="3">未审核</th>
            <th class="text-center" style="vertical-align: middle" colspan="7">已审核</th>
        </tr>
        <tr>
            <th class="text-center" colspan="6">累计审核不通过</th>
            <th class="text-center" rowspan="2">累计审核通过</th>
        </tr>
        <tr>
            <th class="text-center">住房审核不通过</th>
            <th class="text-center">社保审核不通过</th>
            <th class="text-center">婚姻审核不通过</th>
            <th class="text-center">年龄审核不通过</th>
            <th class="text-center">学历审核不通过</th>
            <th class="text-center">其他审核不通过</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${fenleiStatistics}" var="totalMap" varStatus="status">
            <tr>
                <td class="text-center" style="vertical-align: middle;">${totalMap.key}</td>
                <td class="text-center">${totalMap.value[0]}</td>
                <td class="text-center">${totalMap.value[1]}</td>
                <td class="text-center">${totalMap.value[2]}</td>
                <td class="text-center">${totalMap.value[3]}</td>
                <td class="text-center">${totalMap.value[4]}</td>
                <td class="text-center">${totalMap.value[5]}</td>
                <td class="text-center">${totalMap.value[6]}</td>
                <td class="text-center">${totalMap.value[7]}</td>
                <td class="text-center">${totalMap.value[8]}</td>
                <td class="text-center">${totalMap.value[9]}</td>
                <td class="text-center">${totalMap.value[10]}</td>
                <td class="text-center">${totalMap.value[11]}</td>
                <td class="text-center">${totalMap.value[12]}</td>
                <td class="text-center">${totalMap.value[13]}</td>
                <td class="text-center">${totalMap.value[14]}</td>
                <td class="text-center">${totalMap.value[15]}</td>
                <td class="text-center">${totalMap.value[16]}</td>
                <td class="text-center">${totalMap.value[17]}</td>
                <td class="text-center">${totalMap.value[18]}</td>
                <td class="text-center">${totalMap.value[19]}</td>
                <td class="text-center">${totalMap.value[20]}</td>
                <td class="text-center">${totalMap.value[21]}</td>
                <td class="text-center">${totalMap.value[22]}</td>
            </tr>
        </c:forEach>
        <tr style="color: green;">
            <td class="text-center">合计</td>
            <td class="text-center">${fenLeiTotalCount[0]}</td>
            <td class="text-center">${fenLeiTotalCount[1]}</td>
            <td class="text-center">${fenLeiTotalCount[2]}</td>
            <td class="text-center">${fenLeiTotalCount[3]}</td>
            <td class="text-center">${fenLeiTotalCount[4]}</td>
            <td class="text-center">${fenLeiTotalCount[5]}</td>
            <td class="text-center">${fenLeiTotalCount[6]}</td>
            <td class="text-center">${fenLeiTotalCount[7]}</td>
            <td class="text-center">${fenLeiTotalCount[8]}</td>
            <td class="text-center">${fenLeiTotalCount[9]}</td>
            <td class="text-center">${fenLeiTotalCount[10]}</td>
            <td class="text-center">${fenLeiTotalCount[11]}</td>
            <td class="text-center">${fenLeiTotalCount[12]}</td>
            <td class="text-center">${fenLeiTotalCount[13]}</td>
            <td class="text-center">${fenLeiTotalCount[14]}</td>
            <td class="text-center">${fenLeiTotalCount[15]}</td>
            <td class="text-center">${fenLeiTotalCount[16]}</td>
            <td class="text-center">${fenLeiTotalCount[17]}</td>
            <td class="text-center">${fenLeiTotalCount[18]}</td>
            <td class="text-center">${fenLeiTotalCount[19]}</td>
            <td class="text-center">${fenLeiTotalCount[20]}</td>
            <td class="text-center">${fenLeiTotalCount[21]}</td>
            <td class="text-center">${fenLeiTotalCount[22]}</td>
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
                name: "分类统计表",
                filename: "分类统计表",
                exclude_img: true,
                exclude_links: true,
                exclude_inputs: true
            });
        });
    });
</script>
</body>
</html>