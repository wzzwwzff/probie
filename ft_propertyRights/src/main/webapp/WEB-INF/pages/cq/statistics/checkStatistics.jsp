<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>核验情况统计</title>
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
    <h4>核验情况统计</h4>
</div>
<div class="content">
    <table class="table table-bordered table-hover">
        <thead>
        <tr>
            <th class="text-center" style="vertical-align: middle" rowspan="3">项目名称</th>
            <th class="text-center" style="vertical-align: middle" rowspan="3">家庭类别</th>
            <th class="text-center" style="vertical-align: middle" rowspan="3">总户数</th>
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
    <c:forEach items="${totalMap}" var="totalMap" varStatus="status">
        <tr>
            <td class="text-center" style="vertical-align: middle;" rowspan="6">${totalMap.key}</td>
            <td class="text-center">本市户籍</td>
            <td class="text-center">${totalMap.value["1"][0]}</td>
            <td class="text-center">${totalMap.value["1"][1]}</td>
            <td class="text-center">${totalMap.value["1"][2]}</td>
            <td class="text-center">${totalMap.value["1"][3]}</td>
            <td class="text-center">${totalMap.value["1"][4]}</td>
            <td class="text-center">${totalMap.value["1"][5]}</td>
            <td class="text-center">${totalMap.value["1"][6]}</td>
            <td class="text-center">${totalMap.value["1"][7]}</td>
            <td class="text-center">${totalMap.value["1"][8]}</td>
        </tr>
        <tr>
            <td class="text-center">持有效证</td>
            <td class="text-center">${totalMap.value["2"][0]}</td>
            <td class="text-center">${totalMap.value["2"][1]}</td>
            <td class="text-center">${totalMap.value["2"][2]}</td>
            <td class="text-center">${totalMap.value["2"][3]}</td>
            <td class="text-center">${totalMap.value["2"][4]}</td>
            <td class="text-center">${totalMap.value["2"][5]}</td>
            <td class="text-center">${totalMap.value["2"][6]}</td>
            <td class="text-center">${totalMap.value["2"][7]}</td>
            <td class="text-center">${totalMap.value["2"][8]}</td>
        </tr>
        <tr>
            <td class="text-center">驻京部队现役军人或武警</td>
            <td class="text-center">${totalMap.value["3"][0]}</td>
            <td class="text-center">${totalMap.value["3"][1]}</td>
            <td class="text-center">${totalMap.value["3"][2]}</td>
            <td class="text-center">${totalMap.value["3"][3]}</td>
            <td class="text-center">${totalMap.value["3"][4]}</td>
            <td class="text-center">${totalMap.value["3"][5]}</td>
            <td class="text-center">${totalMap.value["3"][6]}</td>
            <td class="text-center">${totalMap.value["3"][7]}</td>
            <td class="text-center">${totalMap.value["3"][8]}</td>
        </tr>
        <tr>
            <td class="text-center">缴社保</td>
            <td class="text-center">${totalMap.value["4"][0]}</td>
            <td class="text-center">${totalMap.value["4"][1]}</td>
            <td class="text-center">${totalMap.value["4"][2]}</td>
            <td class="text-center">${totalMap.value["4"][3]}</td>
            <td class="text-center">${totalMap.value["4"][4]}</td>
            <td class="text-center">${totalMap.value["4"][5]}</td>
            <td class="text-center">${totalMap.value["4"][6]}</td>
            <td class="text-center">${totalMap.value["4"][7]}</td>
            <td class="text-center">${totalMap.value["4"][8]}</td>
        </tr>
        <tr>
            <td class="text-center">缴个税</td>
            <td class="text-center">${totalMap.value["5"][0]}</td>
            <td class="text-center">${totalMap.value["5"][1]}</td>
            <td class="text-center">${totalMap.value["5"][2]}</td>
            <td class="text-center">${totalMap.value["5"][3]}</td>
            <td class="text-center">${totalMap.value["5"][4]}</td>
            <td class="text-center">${totalMap.value["5"][5]}</td>
            <td class="text-center">${totalMap.value["5"][6]}</td>
            <td class="text-center">${totalMap.value["5"][7]}</td>
            <td class="text-center">${totalMap.value["5"][8]}</td>
        </tr>
        <tr>
            <td class="text-center" style="vertical-align: middle;">合计</td>
            <td class="text-center">${totalMap.value["1"][0] + totalMap.value["2"][0] + totalMap.value["3"][0] + totalMap.value["4"][0] +totalMap.value["5"][0]}</td>
            <td class="text-center">${totalMap.value["1"][1] + totalMap.value["2"][1] + totalMap.value["3"][1] + totalMap.value["4"][1] +totalMap.value["5"][1]}</td>
            <td class="text-center">${totalMap.value["1"][2] + totalMap.value["2"][2] + totalMap.value["3"][2] + totalMap.value["4"][2] +totalMap.value["5"][2]}</td>
            <td class="text-center">${totalMap.value["1"][3] + totalMap.value["2"][3] + totalMap.value["3"][3] + totalMap.value["4"][3] +totalMap.value["5"][3]}</td>
            <td class="text-center">${totalMap.value["1"][4] + totalMap.value["2"][4] + totalMap.value["3"][4] + totalMap.value["4"][4] +totalMap.value["5"][4]}</td>
            <td class="text-center">${totalMap.value["1"][5] + totalMap.value["2"][5] + totalMap.value["3"][5] + totalMap.value["4"][5] +totalMap.value["5"][5]}</td>
            <td class="text-center">${totalMap.value["1"][6] + totalMap.value["2"][6] + totalMap.value["3"][6] + totalMap.value["4"][6] +totalMap.value["5"][6]}</td>
            <td class="text-center">${totalMap.value["1"][7] + totalMap.value["2"][7] + totalMap.value["3"][7] + totalMap.value["4"][7] +totalMap.value["5"][7]}</td>
            <td class="text-center">${totalMap.value["1"][8] + totalMap.value["2"][8] + totalMap.value["3"][8] + totalMap.value["4"][8] +totalMap.value["5"][8]}</td>
        </tr>
    </c:forEach>
    <tr style="color: green;">
            <td class="text-center" colspan="2">合计</td>
            <td class="text-center">${checkStatisticsTotal["totalCount"]}</td>
            <td class="text-center">${checkStatisticsTotal["notCheck"]}</td>
            <td class="text-center">${checkStatisticsTotal["houseCheck"]}</td>
            <td class="text-center">${checkStatisticsTotal["socialCheck"]}</td>
            <td class="text-center">${checkStatisticsTotal["marriageCheck"]}</td>
            <td class="text-center">${checkStatisticsTotal["ageCheck"]}</td>
            <td class="text-center">${checkStatisticsTotal["educationCheck"]}</td>
            <td class="text-center">${checkStatisticsTotal["otherCheck"]}</td>
            <td class="text-center">${checkStatisticsTotal["checked"]}</td>
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
                name: "核验情况统计表",
                filename: "核验情况统计表",
                exclude_img: true,
                exclude_links: true,
                exclude_inputs: true
            });
        });
    });
</script>
</body>
</html>