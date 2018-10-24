<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div style="text-align: center;margin-left:10px;border:solid 1px;">
    <table id="myData" border="1" cellspacing="4" cellpadding="4" style="width: 100%;">
        <tr>
            <td style="font-size: 40px;width: 5%">家庭编号</td>
            <td style="font-size: 40px;width: 5%">姓名</td>
            <td style="font-size: 40px;width: 10%">项目</td>
            <td style="font-size: 40px;width: 5%">楼号</td>
            <td style="font-size: 40px;width: 3%">单元</td>
            <td style="font-size: 40px;width: 5%">房号</td>
            <td style="font-size: 40px;width: 10%">户型</td>
        </tr>
        <c:forEach items="${pageInfo.result}" var="house" varStatus="status">
            <tr style="line-height: 65px">
                <td style="color: yellow;font-size: 40px;width: 5%">${house.family.familyCode}</td>
                <td style="color: yellow;font-size: 40px;width: 5%">${house.family.name}</td>
                <td style="color: yellow;font-size: 40px;width: 10%">${house.azProject.projectName}</td>
                <td style="color: yellow;font-size: 40px;width: 5%">${house.buildNum}</td>
                <td style="color: yellow;font-size: 40px;width: 3%">${house.unitNum}</td>
                <td style="color: yellow;font-size: 40px;width: 5%">${house.houseNum}</td>
                <td style="color: yellow;font-size: 40px;width: 10%"><tags:dataDict dataDict="户型"
                                                                                    value="${house.houseType}"/></td>
            </tr>
        </c:forEach>
    </table>
</div>