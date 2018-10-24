<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>常用sql统计列表</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="title">
    <h5>SQL日常统计管理</h5>
</div>
<div class="content">
    <div class="search_button resizeLayout">
        <button type="button" class="btn btn-sm btn-primary" onclick="location.href='sql';"><i class="fa fa-search"></i>
            添加
        </button>
    </div>
    <table class="table table-bordered table-hover" style="table-layout: fixed;">
        <thead>
        <tr>
            <th width="5%" class="text-center">序号</th>
            <th class="text-center" style="width: 20%;">SQL语句功能名称</th>
            <th class="text-center">SQL语句</th>
            <th width="5%" class="text-center">维护</th>
            <th width="5%" class="text-center">执行</th>
        </tr>
        </thead>
        <c:forEach items="${pageInfo.result}" var="s" varStatus="status">
            <tr>
                <td class="text-center">${status.index+1}</td>
                <td class="text-center">${s.sqlTitle}</td>
                <td class="text-center" style="text-overflow: ellipsis;white-space: nowrap;overflow: hidden;">${s.sqlExecute}</td>
                <td class="text-center"><a href="sql?id=${s.id}">维护</a></td>
                <td class="text-center"><a href="result?id=${s.id}">执行</a></td>
            </tr>
        </c:forEach>
    </table>
    <div class="footer resizeLayout">
        <tags:pageInfo></tags:pageInfo>
    </div>
</div>
</body>
</html>
