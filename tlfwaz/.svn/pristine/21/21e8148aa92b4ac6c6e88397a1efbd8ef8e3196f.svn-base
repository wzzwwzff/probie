<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <title>管理员维护列表</title>
    <%@include file="/static/common/common.jsp"%>
</head>
<body>
<div class="title">
    <h5>管理员维护列表</h5>
</div>
<div class="content">
    <div class="search_content resizeLayout">
        <form class="form-inline" role="form" id="search">
            <div class="form-group">
                <%@include file="/WEB-INF/pages/cq/common/search/searchFamily.jsp" %>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">结算状态</div>
                    <tags:searchDataDict name="f.jsStatus" className="form-control" fieldType="integer"
                                         dataDict="结算状态"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">选房状态：</div>
                    <tags:searchDataDict name="f.xfStatus" className="form-control" fieldType="integer" dataDict="选房状态"/>
                </div>
                <button type="submit" class="btn btn-primary btn-sm"><i class="fa fa-search"></i>&nbsp;查询</button>
            </div>
        </form>
    </div>
    <table class="table table-bordered table-hover table-striped">
        <thead>
        <tr>
            <th class="text-center" width="5%">序号</th>
            <th class="text-center">项目名称</th>
            <th class="text-center">地块</th>
            <th class="text-center">家庭编号</th>
            <th class="text-center">姓名</th>
            <th class="text-center">身份证号</th>
            <th class="text-center">房屋坐落</th>
            <th class="text-center">选房状态</th>
            <th class="text-center">结算状态</th>
            <th class="text-center">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pageInfo.result}" var="family" varStatus="status">
            <tr>
                <td class="text-center">${status.count}</td>
                <td class="text-center">${family.project.projectName}</td>
                <td class="text-center">${family.area.areaName}</td>
                <td class="text-center">${family.familyCode}</td>
                <td class="text-center">${family.name}</td>
                <td class="text-center">${family.idCard}</td>
                <td class="text-center">${family.fwzl}</td>
                <td class="text-center">
                    <tags:dataDict dataDict="选房状态" value="${family.xfStatus}" />
                </td>
                <td class="text-center">
                    <tags:dataDict dataDict="结算状态" value="${family.jsStatus}" />
                </td>
                <td style="text-align: center;width: 20%">
                    <a href="/cq/common/view/main?familyId=${family.id}&<tags:searchParams></tags:searchParams>"><i class="fa fa-eye"></i>查看</a>&nbsp;&nbsp;
                    <a href="form?familyId=${family.id}"><i class="fa fa-big fa-edit"></i>&nbsp;修改</a>&nbsp;&nbsp;
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="footer resizeLayout"><tags:pageInfo/></div>
</body>
</html>