<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <title>房源销控列表</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="title">
    <h4 style="color: #0d88cc">房源销控列表</h4>
    <div id="printButton" style="position: absolute;top: 8px;right: 15px;">
        <button type="button" class="btn btn-sm btn-primary" onclick="location.reload();"><i
                class="fa fa-refresh"></i>&nbsp;重新加载
        </button>
    </div>

</div>
<div class="content">
    <table class="table table-bordered table-hover table-striped">
        <thead>
        <tr>
            <th style="font-size: 30px;width: 5%">序号</th>
            <th style="font-size: 30px;width: 5%">家庭编号</th>
            <th style="font-size: 30px;width: 5%">姓名</th>
            <th style="font-size: 30px;width: 10%">项目</th>
            <th style="font-size: 30px;width: 5%">楼号</th>
            <th style="font-size: 30px;width: 3%">单元</th>
            <th style="font-size: 30px;width: 5%">房号</th>
            <th style="font-size: 30px;width: 10%">户型</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pageInfo.result}" var="house" varStatus="status">
            <tr style="line-height: 65px">
                <th style="font-size: 30px;width: 5%">${status.count}</th>
                <th style="font-size: 30px;width: 5%">${house.family.familyCode}</th>
                <th style="font-size: 30px;width: 5%">${house.family.name}</th>
                <th style="font-size: 30px;width: 10%">${house.azProject.projectName}</th>
                <th style="font-size: 30px;width: 5%">${house.buildNum}</th>
                <th style="font-size: 30px;width: 3%">${house.unitNum}</th>
                <th style="font-size: 30px;width: 5%">${house.houseNum}</th>
                <th style="font-size: 30px;width: 10%"><tags:dataDict dataDict="户型"
                                                                                    value="${house.houseType}"/></th>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>