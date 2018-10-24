<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>

<table class="table table-bordered">
    <thead>
    <tr>
        <th class="text-center">序号</th>
        <th class="text-center">家庭编号</th>
        <th class="text-center">姓名</th>
        <th class="text-center">操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${pageInfo.result}" var="family" varStatus="status">
        <tr>
            <td class="text-center">${status.count}</td>
            <td class="text-center">${family.familyCode}</td>
            <td class="text-center">${family.name}</td>
            <td><a href="javascript:add($(this),'${family.id}','${family.name}','${family.familyCode}')"><i class="glyphicon glyphicon-plus"></i>&nbsp;添加</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<tags:pageInfo/>