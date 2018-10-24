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
            <td class="fieldName">户型</td>
            <td class="fieldValue"> <tags:dataDict dataDict="户型" value="${house.houseType}"/> </td>
            <td class="fieldName">建筑面积</td>
            <td class="fieldValue"> ${house.buildArea} </td>
        </tr>
        <tr>
            <td class="fieldName">实测建筑面积</td>
            <td class="fieldValue" colspan="3"> ${house.sjBuildArea} </td>
        </tr>
        <c:if test="${house.houseStatus ne 1}">
            <tr>
                <td class="fieldName">购房人</td>
                <td class="fieldValue"> ${house.hPerson} </td>
                <td class="fieldName">购房人身份证号</td>
                <td class="fieldValue"> ${house.hIdCard} </td>
            </tr>
            <tr>
                <td class="fieldName">操作人员</td>
                <td class="fieldValue"> ${house.opName} </td>
                <td class="fieldName">操作日期</td>
                <td class="fieldValue"> <fmt:formatDate value="${house.opDate}" pattern="yyyy-MM-dd" /> </td>
            </tr>
            <tr>
                <td class="fieldName">入住经办人</td>
                <td class="fieldValue"> ${house.rzName} </td>
                <td class="fieldName">入住日期</td>
                <td class="fieldValue"> <fmt:formatDate value="${house.rzDate}" pattern="yyyy-MM-dd" /> </td>
            </tr>
        </c:if>
        </tbody>
    </table>
</form>