<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fieldset>
    <legend>一、基本信息</legend>
    <table class="table table-bordered">
        <tbody>
        <tr>
            <td class="fieldName">所属项目：</td>
            <td class="fieldValue">
                ${family.project.projectName}
            </td>
            <td class="fieldName">所属地块：</td>
            <td class="fieldValue">
                ${family.area.areaName}
            </td>
        </tr>
        <tr>
            <td class="fieldName">档案编号：</td>
            <td class="fieldValue">
                ${family.familyCode}
            </td>
            <td class="fieldName">姓名：</td>
            <td class="fieldValue">
                ${family.name}
            </td>
        </tr>
        <tr>
            <td class="fieldName">性别：</td>
            <td class="fieldValue">
                <div style="float: left">
                    <tags:dataDict value="${family.sex}" dataDict="性别"/>
                </div>
            </td>
            <td class="fieldName">身份证号：</td>
            <td class="fieldValue">
                ${family.idCard}
            </td>
        </tr>
        <tr>
            <td class="fieldName">年龄：</td>
            <td class="fieldValue">${family.age}</td>
            <td class="fieldName">联系电话：</td>
            <td class="fieldValue">${family.phone}</td>
        </tr>
        <tr>
            <td class="fieldName">联系地址：</td>
            <td class="fieldValue">${family.address}</td>
            <td class="fieldName">房屋坐落：</td>
            <td class="fieldValue">${family.fwzl}</td>
        </tr>
        </tbody>
    </table>
</fieldset>
<fieldset>
    <legend>二、安置房屋信息</legend>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th width="10%" class="text-center">安置项目</th>
            <th width="6%" class="text-center">楼号</th>
            <th width="6%" class="text-center">单元</th>
            <th width="6%" class="text-center">房号</th>
            <th width="6%" class="text-center">居室</th>
            <th width="6%" class="text-center">建筑面积</th>
            <th width="6%" class="text-center">产权人</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${houseList}" var="house">
            <tr>
                <td class="text-center">${house.azProject.projectName}</td>
                <td class="text-center">${house.buildNum}</td>
                <td class="text-center">${house.unitNum}</td>
                <td class="text-center">${house.houseNum}</td>
                <td class="text-center"><tags:dataDict dataDict="户型" value="${house.houseType}"/></td>
                <td class="text-center">${house.buildArea}</td>
                <td class="text-center">${house.hPerson}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</fieldset>