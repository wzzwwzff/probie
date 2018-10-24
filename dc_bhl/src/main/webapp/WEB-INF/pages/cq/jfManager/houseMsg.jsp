<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<form id="myForm">
    <table class="table table-bordered">
        <tbody>
        <tr>
            <td class="fieldName">项目名称</td>
            <td class="fieldValue"> ${project.projectName} </td>
            <td class="fieldName">楼号</td>
            <td class="fieldValue"> ${house.buildNum} </td>
        </tr>
        <tr>
            <td class="fieldName">单元</td>
            <td class="fieldValue"> ${house.unitNum} </td>
            <td class="fieldName">房号</td>
            <td class="fieldValue"> ${house.houseNum} </td>
        </tr>
        <tr>
            <td class="fieldName">房屋户型</td>
            <td class="fieldValue"> <tags:dataDict dataDict="房屋户型" value="${house.houseHold}"/> </td>
            <td class="fieldName">建筑面积</td>
            <td class="fieldValue"> ${house.buildArea} </td>
        </tr>
        <tr>
            <td class="fieldName">房屋居室</td>
            <td class="fieldValue"> <tags:dataDict dataDict="房屋居室" value="${house.houseType}"/> </td>
            <td class="fieldName">房屋状态</td>
            <td class="fieldValue"><tags:dataDict dataDict="房屋状态" value="${house.houseStatus}"/></td>
        </tr>
        <tr>
            <td class="fieldName">备注</td>
            <td class="fieldValue" colspan="3">${house.memo}</td>
        </tr>
        </tbody>
    </table>
</form>