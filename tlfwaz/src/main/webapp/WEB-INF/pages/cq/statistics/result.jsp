<%--
  Created by IntelliJ IDEA.
  User: jmdf
  Date: 2018/9/5
  Time: 13:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <title>家庭信息列表</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="title">
    <h4 style="color: #0d88cc">家庭信息列表</h4>
</div>
<div style="position: fixed;top: 10px;right: 10px;">
    <button class="btn btn-primary" onclick="location.href='main'"><i class="fa fa-backward"></i>&nbsp;返回</button>
</div>
<div class="content">
    <table class="table table-bordered table-hover table-striped">
        <thead>
        <tr>
            <th class="text-center" width="5%">序号</th>
            <th class="text-center">项目名称</th>
            <th class="text-center">地块</th>
            <th class="text-center">档案编号</th>
            <th class="text-center">姓名</th>
            <th class="text-center">签约日期</th>
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
                <td class="text-center"><fmt:formatDate value="${family.signNumDate}" pattern="yyyy-MM-dd"/></td>
                <td class="text-center">
                    <tags:dataDict dataDict="选房状态" value="${family.xfStatus}" />
                </td>
                <td class="text-center">
                    <tags:dataDict dataDict="结算状态" value="${family.jsStatus}" />
                </td>
                <td style="text-align: center;width: 20%">
                        <a href="/cq/common/view/main?familyId=${family.id}&<tags:searchParams></tags:searchParams>"><i class="fa fa-eye"></i>查看</a>&nbsp;&nbsp;
               </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="footer resizeLayout"><tags:pageInfo/></div>
</div>
</body>
</html>
