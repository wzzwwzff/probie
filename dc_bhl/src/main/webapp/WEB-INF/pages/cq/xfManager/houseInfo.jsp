<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table class="table table-bordered" style="font-size: 20px;">
    <tbody>
    <tr>
        <td class="fieldName">项目名称：</td>
        <td class="fieldValue" colspan="2">${house.project.projectName}</td>
    </tr>
    <tr>
        <td class="fieldName">楼号：</td>
        <td class="fieldValue" colspan="2">${house.buildNum}</td>
    </tr>
    <tr>
        <td class="fieldName">单元：</td>
        <td class="fieldValue" colspan="2">${house.unitNum}单元</td>
    </tr>
    <tr>
        <td class="fieldName">房号：</td>
        <td class="fieldValue" colspan="2">${house.houseNum}</td>
    </tr>
    <tr>
        <td class="fieldName">居室：</td>
        <td class="fieldValue" colspan="2"><tags:dataDict dataDict="房屋居室" value="${house.houseType}"/></td>
    </tr>
    <tr>
        <td class="fieldName">房源面积：</td>
        <td class="fieldValue" colspan="2">${house.buildArea}㎡</td>
    </tr>
    </tbody>
</table>