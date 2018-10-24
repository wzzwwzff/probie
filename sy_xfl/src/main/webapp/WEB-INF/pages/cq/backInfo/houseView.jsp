<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	</tr>
	</thead>
	<c:forEach items="${houseList}" var="house" varStatus="status">
	<tr>
		<td class="text-center">${status.count}</td>
		<td class="text-center">${house.project.projectName}</td>
		<td class="text-center">${house.buildNum}</td>
		<td class="text-center">${house.unit}</td>
		<td class="text-center">${house.showHouseNum}</td>
		<td class="text-center"><tags:dataDict dataDict="房屋居室" value="${house.houseType}"/></td>
		<td class="text-center">${house.buildArea}㎡</td>
	</tr>
	</c:forEach>
	<c:if test="${fn:length(houseList) <= 0}">
		<tr><td colspan="7" class="text-center"><span style="color: red">该家庭还未选房</span></td></tr>
	</c:if>
</table>

