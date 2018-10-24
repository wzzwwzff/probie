<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <title>安置项目列表</title>
    <%@include file="/static/common/common.jsp" %>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>
<body style="overflow: hidden;">
<div class="title">
    <h4>安置项目管理</h4>
</div>
<div class="content">
    <div class="search_content resizeLayout" style="margin-top: 5px;">
        <form  class="form-inline" role="form" id="search">
            <div class="input-group input-group-sm">
                <div class="input-group-addon">项目名称</div>
                <tags:searchInput name="projectName" fieldType="string" operator="like" className="form-control"/>
            </div>
            <div class="input-group input-group-sm">
                <div class="input-group-addon">项目位置</div>
                <tags:searchInput name="address" fieldType="string" operator="like" className="form-control"/>
            </div>
            <button class="btn btn-primary btn-sm" type="submit"><i class="fa fa-search"></i> 查询</button>
            &nbsp;
            <a href="azProjectForm" class="btn btn-primary btn-sm"><i class="glyphicon glyphicon-plus"></i> 登记项目</a>
        </form>
    </div>

    <table class="table table-bordered table-hover table-striped">
        <thead>
        <tr>
            <th style="text-align: center;" width="5%">序号</th>
            <th style="text-align: center;">项目名称</th>
            <th style="text-align: center;">项目位置</th>
            <th style="text-align: center;">项目东至</th>
            <th style="text-align: center;">项目西至</th>
            <th style="text-align: center;">项目南至</th>
            <th style="text-align: center;">项目北至</th>
            <th style="text-align: center;">安置房源管理</th>
            <th style="text-align: center;">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="project" items="${pageInfo.result}" varStatus="status">
            <tr>
                <td>${status.count+(pageInfo.pageNo-1)*pageInfo.pageSize}</td>
                <td>${project.projectName}</td>
                <td>${project.address}</td>
                <td>${project.east}</td>
                <td>${project.west}</td>
                <td>${project.south}</td>
                <td>${project.north}</td>
                <td style="text-align: center;"><a href="azHouseList?projectId=${project.id}"><i class="fa fa-edit"></i>房源管理</a>
                </td>
                <td style="text-align: center;">
                    <a href="azProjectView?projectId=${project.id}"><i class="fa fa-eye"></i>查看</a>&nbsp;&nbsp;
                    <a href="azProjectForm?projectId=${project.id}"><i class="fa fa-edit"></i>修改</a>&nbsp;&nbsp;
                    <a href="javascript:delMsg(${project.id})"><i class="a fa-big fa-remove"></i>删除</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div class="footer resizeLayout">
    <tags:pageInfo/>
</div>
<script>
    //删除项目
    function delMsg(projectId) {
        if (confirm("确认删除此项目吗?")) {
            $.get("delazProject", {projectId: projectId, _time: new Date().getTime()}, function (data) {
                if (data.result == 1) {
                    alert("删除成功");
                    location.href = "azProjectList";
                } else {
                    alert("请先删除项目下的房源...");
                }
            });
        }
    }
</script>
</body>
</html>