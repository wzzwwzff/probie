<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>变更购房人管理</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="content">
    <ul class="nav nav-tabs">
        <li>
            <a href="startList">变更购房人入口</a>
        </li>
        <li class="active">
            <a href="list">变更购房人管理</a>
        </li>
    </ul>
    <div class="search_content resizeLayout" style="margin-top: 5px;">
        <form class="form-inline" role="form" id="search">
            <%@include file="/WEB-INF/pages/cq/common/search/searchFamily.jsp" %>
            <div class="input-group input-group-sm">
                <div class="input-group-addon">签约状态</div>
                <tags:searchDataDict name="f.signStatus" fieldType="integer" dataDict="签约状态" className="form-control"/>
            </div>
            <button type="submit" class="btn btn-primary btn-sm"><i class="fa fa-search"></i>&nbsp;查询</button>
            <button type="button" class="btn btn-primary btn-sm" onclick="location.href='export?<tags:searchParams/>'">
                <i class="fa fa-file"></i>&nbsp;导出
            </button>
        </form>
    </div>
    <table class="table table-bordered table-hover table-striped">
        <thead>
        <tr>
            <th rowspan="2">序号</th>
            <th colspan="4">基本信息</th>
            <th colspan="9">选房信息</th>
            <%--<th rowspan="2">打印</th>--%>
        </tr>
        <tr>
            <th>家庭编号</th>
            <th>被征收人</th>
            <th>身份证号</th>
            <th>房屋坐落</th>
            <th>项目名称</th>
            <th>楼号</th>
            <th>单元</th>
            <th>房号</th>
            <th>居室</th>
            <th>建筑面积/㎡</th>
            <th>选房时间</th>
            <th>变更后购房人</th>
            <th>变更</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach varStatus="status1" var="family" items="${pageInfo.result}">
            <c:forEach varStatus="status2" var="house" items="${houseListMap[family.id]}">
                <c:set var="lenth" value="${houseListMap[family.id].size()}"/>
                <tr>
                    <c:if test="${status2.index eq 0}">
                        <td rowspan="${lenth}">${status1.index+1}</td>
                        <td rowspan="${lenth}">${family.familyCode}</td>
                        <td rowspan="${lenth}">${family.name}</td>
                        <td rowspan="${lenth}">${family.idCard}</td>
                        <td rowspan="${lenth}">${family.address}</td>
                    </c:if>
                    <td>${house.azProject.projectName}</td>
                    <td>${house.buildNum}</td>
                    <td>${house.unitNum}</td>
                    <td>${house.houseNum}</td>
                    <td><tags:dataDict dataDict="户型" value="${fn:trim(house.houseType)}"/></td>
                    <td><fmt:formatNumber value="${house.buildArea}" pattern="##.00"/></td>
                    <td><fmt:formatDate value="${house.chooseDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td>${house.hPerson}</td>
                    <td>
                        <a href="choosePeople?familyId=${family.id}&houseId=${house.id}&${pageInfo.searchParams}"><img
                                src="/static/image/edit.gif"></a>
                    </td>
                </tr>
            </c:forEach>
        </c:forEach>
        </tbody>
    </table>
</div>
<div class="footer resizeLayout"><tags:pageInfo/></div>
</body>
</html>