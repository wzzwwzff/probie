<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>入住业务管理</title>
    <%@include file="/static/common/common.jsp" %>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>
<body>
<div class="title"><h5>入住业务管理</h5></div>
<div class="content">
    <div class="search_content resizeLayout" style="margin-top: 5px;">
        <form class="form-inline" role="form" id="search">
            <%@include file="/WEB-INF/pages/cq/common/search/search.jsp" %>
            <button class="btn btn-primary btn-sm" type="submit"><i class="fa fa-search"></i>&nbsp;查询</button>&nbsp;&nbsp;
            <a href="excelForm" class="btn btn-primary btn-sm"><i class="fa fa-file-excel-o"></i>&nbsp;入住信息导出</a>&nbsp;&nbsp;
            <a href="statusUpdate" class="btn btn-primary btn-sm"><i class="fa fa-file-excel-o"></i>&nbsp;入住状态更新</a>&nbsp;&nbsp;
        </form>
    </div>
    <table class="table table-bordered table-hover table-striped">
        <thead>
        <tr>
            <th rowspan="2">序号</th>
            <th colspan="4">基本信息</th>
            <th colspan="8">选房信息</th>
            <th colspan="2" rowspan="2">操作</th>
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
            <th>居室面积/㎡</th>
            <th>选房时间</th>
            <th>入住状态</th>
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
                        <td rowspan="${lenth}">${family.fwzl}</td>
                    </c:if>
                    <td>${house.azProject.projectName}</td>
                    <td>${house.buildNum}</td>
                    <td>${house.unitNum}</td>
                    <td>${house.houseNum}</td>
                    <td><tags:dataDict dataDict="户型" value="${fn:trim(house.houseType)}"/></td>
                    <td><fmt:formatNumber value="${house.buildArea}" pattern="##.00"/></td>
                    <td><fmt:formatDate value="${house.chooseDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td><tags:dataDict dataDict="入住状态" value="${house.rzStatus}" /></td>
                    <%--<c:if test="${status2.index eq 0}">
                        <td rowspan="${lenth}">
                            <a href="/cq/common/view/main?familyId=${family.id}"><i class="fa fa-big fa-eye"></i>查看</a>&nbsp;&nbsp;
                            <a href="printrzReport?familyId=${family.id}"><i class="fa fa-print"></i>打印入住通知书</a>
                        </td>
                    </c:if>--%>
                    <td>
                        <a href="printrzReport?familyId=${family.id}&houseId=${house.id}"><i class="fa fa-print"></i>打印入住通知书</a>
                    </td>
                    <c:if test="${status2.index eq 0}">
                        <td rowspan="${lenth}">
                            <a href="/cq/common/view/main?familyId=${family.id}"><i class="fa fa-big fa-eye"></i>查看</a>&nbsp;&nbsp;
                        </td>
                    </c:if>
                </tr>
            </c:forEach>
        </c:forEach>
        </tbody>
    </table>
</div>
<div class="footer resizeLayout">
    <tags:pageInfo></tags:pageInfo>
</div>
</body>
</html>

