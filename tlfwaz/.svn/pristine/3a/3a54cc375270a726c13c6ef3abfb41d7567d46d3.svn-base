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
    <legend>二、财务信息</legend>
    <table class="table table-bordered">
        <tbody>
        <tr>
            <td class="fieldName">结算状态</td>
            <td class="fieldValue">
                <tags:dataDict dataDict="结算状态" value="${family.jsStatus}"/>
            </td>
            <td class="fieldName">结算时间</td>
            <td class="fieldValue">
                <fmt:formatDate pattern="yyyy-MM-dd" value="${family.jsDate}"/>
            </td>
        </tr>
        <tr>
            <td class="fieldName">结算经办人</td>
            <td class="fieldValue" colspan="3">${family.jsPerson}</td>
        </tr>
        </tbody>
    </table>
</fieldset>