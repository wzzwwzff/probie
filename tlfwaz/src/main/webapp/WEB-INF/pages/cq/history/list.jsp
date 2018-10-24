<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>家庭信息列表</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="title">
    <h5> 家庭信息列表</h5>
</div>
<div class="content">
    <div class="search_content">
        <form class="form-inline" role="form" id="search">
            <div class="form-group">
                <%@include file="/WEB-INF/pages/cq/common/search/searchFamily.jsp" %>
                <button type="submit" class="btn btn-sm btn-primary"><i class="fa fa-search"></i>&nbsp;查 询</button>
            </div>
        </form>
    </div>
    <table class="table table-bordered table-hover table-striped">
        <thead>
        <tr>
            <th width="4%" class="text-center">序号</th>
            <th class="text-center">项目名称</th>
            <th class="text-center">地块</th>
            <th class="text-center">家庭编号</th>
            <th class="text-center">姓名</th>
            <th class="text-center">房屋坐落</th>
            <th class="text-center">人口</th>
            <th class="text-center">购房指标</th>
            <th class="text-center">联系电话</th>
            <th class="text-center">操作</th>
        </tr>
        </thead>
        <c:forEach items="${pageInfo.result}" var="family" varStatus="status">
            <tr>
                <td class="text-center">${status.count}</td>
                <td class="text-center">${family.project.projectName}</td>
                <td class="text-center">${family.area.areaName}</td>
                <td class="text-center">${family.familyCode}</td>
                <td class="text-center">${family.name}</td>
                <td class="text-center">${family.fwzl}</td>
                <td class="text-center">${family.personNum}</td>
                <td class="text-center">${family.gfArea}</td>
                <td class="text-center">${family.phone}</td>
                <td class="text-center">
                    <a href="historyList?familyId=${family.id}"><i class="fa fa-big fa-eye"></i>&nbsp;查看</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <div class="footer resizeLayout"><tags:pageInfo/></div>
</div>
</body>
</html>