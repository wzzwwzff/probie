<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
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
            <td class="fieldValue"><tags:dataDict dataDict="房屋户型" value="${house.houseHold}"/> </td>
            <td class="fieldName">建筑面积</td>
            <td class="fieldValue"> ${house.buildArea} </td>
        </tr>
        <tr>
            <td class="fieldName">房屋居室</td>
            <td class="fieldValue"> <tags:dataDict dataDict="房屋居室" value="${house.houseType}"/> </td>
            <td class="fieldName">房屋状态</td>
            <td class="fieldValue">
                <c:if test="${house.houseStatus eq 1 or house.houseStatus eq 3}">
                    <tags:dataDictInput className="form-control" name="houseStatus" dataDict="房屋状态" value="${house.houseStatus}"/>
                </c:if>
                <c:if test="${house.houseStatus eq 2}">
                    <tags:dataDict dataDict="房屋状态" value="${house.houseStatus}"/>
                </c:if>
            </td>
        </tr>
        <tr>
            <td class="fieldName">备注</td>
            <td class="fieldValue" <c:if test="${house.houseStatus eq 2}">colspan="3"</c:if>>${house.memo}</td>
            <c:if test="${house.houseStatus eq 1 or house.houseStatus eq 3}">
                <td class="fieldName">分配家庭编号</td>
                <td class="fieldValue"><input name="familyCode" value="" style="width: 100px;" class="form-control" /></td>
            </c:if>
        </tr>
        </tbody>
    </table>