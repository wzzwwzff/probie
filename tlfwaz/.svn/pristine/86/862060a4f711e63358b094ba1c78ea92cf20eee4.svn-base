<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fieldset>
    <legend>一、安置房信息</legend>
    <table class="table table-bordered table-hover">
        <thead>
        <tr>
            <th width="8%" class="text-center">序号</th>
            <th class="text-center">项目名称</th>
            <th class="text-center">楼号</th>
            <th class="text-center">单元</th>
            <th class="text-center">房号</th>
            <th class="text-center">居室</th>
            <th class="text-center">面积</th>
            <th class="text-center">选房时间</th>
            <th class="text-center">购房人姓名</th>
        </tr>
        </thead>
        <c:forEach items="${houseList}" var="house" varStatus="status">
            <tr>
                <td class="text-center">${status.count}</td>
                <td class="text-center">${house.azProject.projectName}</td>
                <td class="text-center">${house.buildNum}</td>
                <td class="text-center">${house.unitNum}</td>
                <td class="text-center">${house.houseNum}</td>
                <td class="text-center"><tags:dataDict dataDict="户型" value="${house.houseType}"/></td>
                <td class="text-center">${house.buildArea}㎡</td>
                <td>
                    <tags:longToDate value="${house.chooseDate}"/>
                </td>
                <td class="text-center">${house.hPerson}</td>
            </tr>
        </c:forEach>
        <c:if test="${fn:length(houseList) <= 0}">
            <tr>
                <td colspan="9" class="text-center"><span style="color: red">该家庭还未选房</span></td>
            </tr>
        </c:if>
    </table>
</fieldset>
<fieldset>
    <legend>二、修改前安置房信息</legend>
    <table class="table table-bordered table-hover table-striped">
        <thead>
        <tr>
            <th width="8%" class="text-center">序号</th>
            <th class="text-center">项目名称</th>
            <th class="text-center">楼号</th>
            <th class="text-center">单元</th>
            <th class="text-center">房号</th>
            <th class="text-center">居室</th>
            <th class="text-center">面积</th>
            <th class="text-center">选房时间</th>
            <th class="text-center">购房人姓名</th>
        </tr>
        </thead>
        <c:forEach items="${houseList1}" var="house1" varStatus="status1">
            <tr>
                <td class="text-center">${status1.count}</td>
                <td class="text-center">${house1.azProject.projectName}</td>
                <td class="text-center">${house1.buildNum}</td>
                <td class="text-center">${house1.unitNum}</td>
                <td class="text-center">${house1.houseNum}</td>
                <td class="text-center"><tags:dataDict dataDict="户型" value="${house1.houseType}"/></td>
                <td class="text-center">${house1.buildArea}㎡</td>
                <td>
                    <tags:longToDate value="${house1.chooseDate}"/>
                </td>
                <td class="text-center">${house1.hPerson}</td>
            </tr>
        </c:forEach>
        <c:if test="${fn:length(houseList1) <= 0}">
            <tr>
                <td colspan="9" class="text-center"><span style="color: red">该家庭还未选房</span></td>
            </tr>
        </c:if>
    </table>
</fieldset>