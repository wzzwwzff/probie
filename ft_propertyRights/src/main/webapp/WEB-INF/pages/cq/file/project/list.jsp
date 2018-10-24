<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <title>共有产权项目列表</title>
    <%@include file="/static/common/common.jsp" %>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>
<body style="overflow: hidden;">
<div class="title">
    <h4>项目列表</h4>
</div>
<div class="content">
    <div class="search-form form-inline form-group-sm resizeLayout">
        <form id="search">
            <div class="input-group input-group-sm">
                <div class="input-group-addon">项目名称</div>
                <tags:searchInput name="projectName" fieldType="string" operator="like" className="form-control"/>
            </div>
            <div class="input-group input-group-sm">
                <div class="input-group-addon">进展情况</div>
                <tags:searchDataDict name="progress" dataDict="进展情况" fieldType="integer" className="form-control"/>
            </div>
            <button class="btn btn-primary btn-sm" type="submit"><i class="fa fa-search"></i> 查询</button>
            &nbsp;
        </form>
    </div>

    <table class="table table-bordered table-hover table-striped">
        <thead>
        <tr>
            <th style="text-align: center;" width="5%">序号</th>
            <th style="text-align: center;">项目名称</th>
            <th style="text-align: center;">企业名称</th>
            <th style="text-align: center;">项目位置</th>
            <th style="text-align: center;">进展情况</th>
            <th style="text-align: center;">套数</th>
            <th style="text-align: center;">户型面积</th>
            <th style="text-align: center;">销售均价</th>
            <th style="text-align: center;">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="project" items="${pageInfo.result}" varStatus="status">
            <tr>
                <td>${status.count+(pageInfo.pageNo-1)*pageInfo.pageSize}</td>
                <td>${project.projectName}</td>
                <td>${project.enterprise}</td>
                <td>${project.address}</td>
                <td><tags:dataDict dataDict="进展情况" value="${project.progress}"></tags:dataDict></td>
                <td>${project.number}</td>
                <td>${project.houseTypeArea}</td>
                <td>${project.price}</td>
                <td style="text-align: center;">
                    <a href='projectUploadList?projectId=${project.id}'><i class='fa fa-hand-o-up'></i>上传档案资料</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="footer resizeLayout"><tags:pageInfo/></div>
</div>
<script>
    //删除项目
    function delMsg(projectId) {
        if (confirm("确认删除此项目信息吗?")) {
            alert("删除成功");
            location.href = "delProject?projectId=" + projectId;
        }
    }
</script>
</body>
</html>