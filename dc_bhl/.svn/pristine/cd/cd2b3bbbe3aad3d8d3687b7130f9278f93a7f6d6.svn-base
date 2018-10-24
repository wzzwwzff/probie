<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>楼盘销控查看</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div style="width: 100%;text-align: center;font-weight: bold;font-size: 30px;margin-top: 0px;"
     id="buildInfoTitle">
</div>
<div style="text-align: center;" id="buildInfoDiv"></div>
<script>
    var index = 0;
    var len = 0;
    var array = new Array();
    <c:forEach items="${resultList}" var="result">
    array.push(new Array("${result[0]}", "${result[1]}", "${result[2]}"));
    </c:forEach>
    len = array.length;
    function loadBuildInfo1() {
        if (len == index) {
            index = 0;
        }
        var projectName = array[index][0];
        var projectId = array[index][1];
        var buildNum = array[index][2];
        $("#buildInfoTitle").html(projectName + "&nbsp;<font style='color: green;font-size: 35px;'>" + buildNum + "</font>&nbsp;号楼");
        $("#buildInfoDiv").html("加载中，请稍后...");
        var url = "housePicItem";
        $.get(url, {
            searchProject: projectId,
            searchBuildNum: buildNum,
            _time: new Date().getTime()
        }, function (data) {
            $("#buildInfoDiv").html(data);
        });
        index++;
        setTimeout('loadBuildInfo1()', ${times*1000});
    }
    window.onload = loadBuildInfo1;
</script>
</body>
</html>
