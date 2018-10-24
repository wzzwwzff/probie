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
            <td class="fieldName">居室</td>
            <td class="fieldValue"> <tags:dataDict dataDict="居室" value="${house.houseType}"/> </td>
            <td class="fieldName">建筑面积</td>
            <td class="fieldValue"> ${house.buildArea} </td>
        </tr>
        <c:if test="${house.status ne 1}">
            <tr>
                <td class="fieldName">申请编号</td>
                <td class="fieldValue"> ${contract.familyCode} </td>
                <td class="fieldName">合同编号</td>
                <td class="fieldValue"> ${contract.contractCode} </td>
            </tr>
            <tr>
                <td class="fieldName">产权人姓名</td>
                <td class="fieldValue"> ${contract.name} </td>
                <td class="fieldName">身份号码</td>
                <td class="fieldValue"> ${contract.idCard} </td>
            </tr>
            <tr>
                <td class="fieldName">合同签订日期</td>
                <td class="fieldValue"> <fmt:formatDate value="${contract.signDate}" pattern="yyyy-MM-dd" /> </td>
                <td class="fieldName">经办人</td>
                <td class="fieldValue"> ${contract.person} </td>
            </tr>
            <tr>
                <td class="fieldName">销售价格</td>
                <td class="fieldValue"> ${contract.price} </td>
                <td class="fieldName">产权比例</td>
                <td class="fieldValue"> ${contract.propertyRight} </td>
            </tr>
        </c:if>
        </tbody>
    </table>
</form>