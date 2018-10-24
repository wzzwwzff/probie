<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>下载数据库</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="title"><h5>下载数据库列表</h5></div>
<div class="content">
    <div class="search_content">
        <form class="form-inline" role="form" id="search">
            <div class="form-group">
                <div class="form-group">
                    <div class="input-group input-group-sm">
                        <div class="input-group-addon">备份日期：</div>
                        <input type="text" name="startDate" style="width: 110px;" value="${startDate}"
                               class="form-control form-date-time dateISO" placeholder="开始日期">
                        <input type="text" name="endDate" style="width: 110px;"
                               class="form-control form-date-time dateISO" placeholder="结束日期"
                               value="${endDate}">
                    </div>
                </div>
            </div>
            <button type="submit" class="btn btn-primary btn-sm"><i class="fa fa-search"></i>&nbsp;查询</button>
            <button type="button" class="btn btn-sm btn-primary" id="myButton" autocomplete="off" data-loading-text="Loading..."><i class="fa fa-file"></i>&nbsp;备份数据库
            </button>
            <button type="button" class="btn btn-sm btn-primary" onclick="location.reload();"><i
                    class="fa fa-refresh"></i>&nbsp;重新加载
            </button>
        </form>
    </div>
    <table class="table table-bordered table-hover">
        <thead>
        <tr>
            <th class="text-center" style="width: 5%;">序号</th>
            <th class="text-center">数据库名称</th>
            <th class="text-center">备份时间</th>
            <th class="text-center">文件大小（MB）</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pageInfo.result}" var="db" varStatus="status">
            <tr>
                <td class="text-center">${status.count}</td>
                <td class="text-center"><a href="downloadFile?url=${db.filePath}&name=${db.fileName}">${db.fileName}</a></td>
                <td class="text-center">${db.fileDate}</td>
                <td class="text-center"><fmt:formatNumber value="${db.fileSize/1024/1024}" maxFractionDigits="2"/></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</div>
<div class="footer">
    <tags:pageInfo></tags:pageInfo>
</div>
<script>
    $('#myButton').on('click', function () {
        var $btn = $(this).button('loading')
        if (confirm("点击“确定”按钮开始备份数据库。\r\r备份期间请耐心等待，不要随意操作其他内容。")) {
            $("#backInfo").html("<img src='/static/images/loading.gif'/>数据库备份中，请稍后...");
            $.get("backDataBase", {_time: new Date().getTime()}, function (data) {
                if (data.success == "0000") {
                    $("#backInfo").html("备份成功");
                    location.reload();
                } else {
                    alert(data.message);
                }
            });
        }
        $btn.button('reset')
    })
</script>
</body>
</html>
