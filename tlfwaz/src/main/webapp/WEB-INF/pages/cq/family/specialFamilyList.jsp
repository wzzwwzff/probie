<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>特殊家庭管理列表</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="content">
    <ul class="nav nav-tabs">
        <li>
            <a href="specialList">特殊家庭入口</a>
        </li>
        <li class="active">
            <a href="specialFamilyList">特殊家庭列表</a>
        </li>
    </ul>
    <div class="search_content resizeLayout" style="margin-top: 5px;">
        <form class="form-inline" role="form" id="search">
            <%@include file="/WEB-INF/pages/cq/common/search/search.jsp" %>
            <button type="submit" class="btn btn-primary btn-sm"><i class="fa fa-search"></i>&nbsp;查询</button>&nbsp;&nbsp;
        </form>
    </div>
    <table class="table table-bordered table-hover table-striped">
        <thead>
        <tr>
            <th rowspan="2">序号</th>
            <th colspan="7">基本信息</th>
        </tr>
        <tr>
            <th>所属地块</th>
            <th>项目名称</th>
            <th>家庭编号</th>
            <th>被征收人</th>
            <th>身份证号</th>
            <th>房屋坐落</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach varStatus="status1" var="family" items="${pageInfo.result}">
                <tr>
                    <td>${status1.index+1}</td>
                    <td>${family.area.areaName}</td>
                    <td>${family.project.projectName}</td>
                    <td>${family.familyCode}</td>
                    <td>${family.name}</td>
                    <td>${family.idCard}</td>
                    <td>${family.fwzl}</td>
                    <td>
                        <a href="/cq/common/view/main?familyId=${family.id}&<tags:searchParams></tags:searchParams>"><i class="fa fa-eye"></i>查看</a>&nbsp;&nbsp;
                        <a href="specialForm?familyId=${family.id}&${pageInfo.searchParams}"><i class="fa fa-edit"></i>修改</a>
                    </td>
                </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div class="footer resizeLayout"><tags:pageInfo/></div>
</body>
</html>