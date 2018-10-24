<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>合同情况统计</title>
    <%@include file="/static/common/common.jsp" %>
    <script src="/static/plugin/highcharts/highcharts.js"></script>
    <style>
        html, body {
            overflow-x: auto;
        }
    </style>
</head>
<body>
<div class="title">
    <h4>合同情况统计</h4>
</div>
<div class="content">
    <table class="table table-bordered table-hover">
        <thead>
        <tr>
            <th class="text-center" style="vertical-align: middle">项目名称</th>
            <th class="text-center" style="vertical-align: middle">家庭类别</th>
            <th class="text-center" style="vertical-align: middle">总户数</th>
            <th class="text-center" style="vertical-align: middle">未锁定</th>
            <th class="text-center" style="vertical-align: middle">已上报</th>
            <th class="text-center" style="vertical-align: middle">已锁定</th>
            <th class="text-center" style="vertical-align: middle">退回</th>
        </tr>
        </thead>
        <tbody>
    <c:forEach items="${totalMap}" var="totalMap" varStatus="status">
        <tr>
            <td class="text-center" style="vertical-align: middle;" rowspan="6">${totalMap.key}</td>
            <td class="text-center">本市户籍</td>
            <td class="text-center">${totalMap.value["1"][0]}</td>
            <td class="text-center">${totalMap.value["1"][1]}</td>
            <td class="text-center">${totalMap.value["1"][2]}</td>
            <td class="text-center">${totalMap.value["1"][3]}</td>
            <td class="text-center">${totalMap.value["1"][4]}</td>
        </tr>
        <tr>
            <td class="text-center">持有效证</td>
            <td class="text-center">${totalMap.value["2"][0]}</td>
            <td class="text-center">${totalMap.value["2"][1]}</td>
            <td class="text-center">${totalMap.value["2"][2]}</td>
            <td class="text-center">${totalMap.value["2"][3]}</td>
            <td class="text-center">${totalMap.value["2"][4]}</td>
        </tr>
        <tr>
            <td class="text-center">驻京部队现役军人或武警</td>
            <td class="text-center">${totalMap.value["3"][0]}</td>
            <td class="text-center">${totalMap.value["3"][1]}</td>
            <td class="text-center">${totalMap.value["3"][2]}</td>
            <td class="text-center">${totalMap.value["3"][3]}</td>
            <td class="text-center">${totalMap.value["3"][4]}</td>
        </tr>
        <tr>
            <td class="text-center">缴社保</td>
            <td class="text-center">${totalMap.value["4"][0]}</td>
            <td class="text-center">${totalMap.value["4"][1]}</td>
            <td class="text-center">${totalMap.value["4"][2]}</td>
            <td class="text-center">${totalMap.value["4"][3]}</td>
            <td class="text-center">${totalMap.value["4"][4]}</td>
        </tr>
        <tr>
            <td class="text-center">缴个税</td>
            <td class="text-center">${totalMap.value["5"][0]}</td>
            <td class="text-center">${totalMap.value["5"][1]}</td>
            <td class="text-center">${totalMap.value["5"][2]}</td>
            <td class="text-center">${totalMap.value["5"][3]}</td>
            <td class="text-center">${totalMap.value["5"][4]}</td>
        </tr>
        <tr>
            <td class="text-center" style="vertical-align: middle;">合计</td>
            <td class="text-center">${totalMap.value["1"][0] + totalMap.value["2"][0] + totalMap.value["3"][0] + totalMap.value["4"][0] +totalMap.value["5"][0]}</td>
            <td class="text-center">${totalMap.value["1"][1] + totalMap.value["2"][1] + totalMap.value["3"][1] + totalMap.value["4"][1] +totalMap.value["5"][1]}</td>
            <td class="text-center">${totalMap.value["1"][2] + totalMap.value["2"][2] + totalMap.value["3"][2] + totalMap.value["4"][2] +totalMap.value["5"][2]}</td>
            <td class="text-center">${totalMap.value["1"][3] + totalMap.value["2"][3] + totalMap.value["3"][3] + totalMap.value["4"][3] +totalMap.value["5"][3]}</td>
            <td class="text-center">${totalMap.value["1"][4] + totalMap.value["2"][4] + totalMap.value["3"][4] + totalMap.value["4"][4] +totalMap.value["5"][4]}</td>
        </tr>
    </c:forEach>
    <tr style="color: green;">
            <td class="text-center" colspan="2">合计</td>
            <td class="text-center">${contractStatisticsTotal["totalCount"]}</td>
            <td class="text-center">${contractStatisticsTotal["counttype1"]}</td>
            <td class="text-center">${contractStatisticsTotal["counttype2"]}</td>
            <td class="text-center">${contractStatisticsTotal["counttype3"]}</td>
            <td class="text-center">${contractStatisticsTotal["counttype4"]}</td>
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
                name: "合同情况统计表",
                filename: "合同情况统计表",
                exclude_img: true,
                exclude_links: true,
                exclude_inputs: true
            });
        });
    });
</script>
</body>
</html>