<%@ page import="java.util.List" %>
<%@ page import="com.app.permission.model.Role" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="com.app.permission.model.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<HTML>
<HEAD>
    <TITLE>角色详情（拥有该角色的菜单，拥有该角色的用户）</TITLE>
</HEAD>
<BODY>
<DIV class="title"><h5>拥有"${role.roleName }"角色的用户</h5></DIV>
<DIV class="content">
    <table class="table table-bordered">
        <thead>
        <tr>
            <th width="5%">序号</th>
            <th>真实姓名</th>
            <th>用户帐号</th>
            <th>所在部门</th>
            <th>状态</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${userList }" varStatus="i">
            <tr>
                <td width="5%">${i.index+1}</td>
                <td>${user.realName}</td>
                <td>${user.username}</td>
                <td>${user.department.departmentName}</td>
                <td>
                    <c:if test="${user.activeFlag==1}"><font color="green">有效</font></c:if>
                    <c:if test="${user.activeFlag==2}"><font color="red">无效</font></c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <DIV class="title"><h5>"${role.roleName }"角色的权限</h5></DIV>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th width="5%">序号</th>
            <th>菜单名称</th>
            <th>链接地址</th>
            <th>资源地址</th>
            <th>状态</th>
        </tr>
        <tbody>
        <c:forEach var="menu" items="${menuList}" varStatus="i">
            <tr class="row">
                <td width="5%">${i.index+1}</td>
                <td>${menu.name}</td>
                <td>${menu.menuUrl}</td>
                <td>${menu.resourceUrl}</td>
                <td>
                    <c:if test="${menu.activeFlag==1}"><font color="green">有效</font></c:if>
                    <c:if test="${menu.activeFlag==0}"><font color="red">无效</font></c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</DIV>
</BODY>
</HTML>


