<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <title>登记安置房源信息</title>
    <%@include file="/static/common/common.jsp" %>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>
<body style="overflow: hidden">
<div class="title">
    <h4>安置房源登记</h4>
</div>
<div class="content">
    <div class=" doc-contentInfo">
        <form id="inputForm" action="azhouseSave" method="post" class="form-inline">
            <input type="hidden" name="projectId" id="projectId" value="${project.id}"/>
            <input type="hidden" name="houseId" id="houseId" value="${house.id}"/>
            <table class="table table-bordered" style="width: 100%;margin-left: auto;margin-right: auto">
                <tbody>
                <tr>
                    <td class="fieldName">项目名称：</td>
                    <td class="fieldValue">
                            ${project.projectName}
                    </td>
                    <td class="fieldName">楼号：</td>
                    <td class="fieldValue">
                        <input class="form-control" name="buildNum" type="text" size="50" value="${house.buildNum}">
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">单元：</td>
                    <td class="fieldValue">
                        <input class="form-control" name="unitNum" type="text" size="50" value="${house.unitNum}">
                    </td>
                    <td class="fieldName">房号：</td>
                    <td class="fieldValue">
                        <input class="form-control" name="houseNum" type="text" size="50" value="${house.houseNum}">
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">户型：</td>
                    <td class="fieldValue">
                        <tags:dataDictInput name="houseType" type="select" dataDict="户型" value="${house.houseType}" className="form-control"/>
                    </td>
                    <td class="fieldName">房屋建筑面积：（㎡）</td>
                    <td class="fieldValue">
                        <input class="form-control" name="buildArea" type="text" size="50" value="${house.buildArea}">
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">单价：</td>
                    <td class="fieldValue">
                        <input class="form-control" name="price" type="text" size="50" value="${house.price}">
                    </td>
                    <td class="fieldName">房屋状态：</td>
                    <td class="fieldValue">
                        <tags:dataDictInput name="houseStatus" type="select" dataDict="房屋状态" value="${house.houseStatus}" className="form-control"/>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">被选日期：</td>
                    <td class="fieldValue">
                        <fmt:formatDate value="${house.chooseDate}" var="chooseDate" pattern="yyyy-MM-dd" />
                        <input type="text" style="width: 130px;height: 33px;" name="chooseDate" value="${chooseDate}" class="form-control form-date-time dateISO"/></td>
                        <%--<input class="form-control" name="chooseDate" type="text" size="50" value="${house.chooseDate}">--%>
                    </td>
                    <td class="fieldName">操作人员：</td>
                    <td class="fieldValue">
                        <input class="form-control" name="opName" type="text" size="50" value="${house.opName}">
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">操作日期：</td>
                    <td class="fieldValue">
                        <fmt:formatDate value="${house.opDate}" var="opDate" pattern="yyyy-MM-dd" />
                        <input type="text" style="width: 130px;height: 33px;" name="opDate" value="${opDate}" class="form-control form-date-time dateISO"/></td>
                        <%--<input class="form-control" name="opDate" type="text" size="50" value="${house.opDate}">--%>
                    </td>
                    <td class="fieldName">购房人：</td>
                    <td class="fieldValue">
                        <input class="form-control" name="hPerson" type="text" size="50" value="${house.hPerson}">
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">购房人身份证号：</td>
                    <td class="fieldValue">
                        <input class="form-control" name="hIdCard" type="text" size="50" value="${house.hIdCard}">
                    </td>
                    <td class="fieldName">入住状态：</td>
                    <td class="fieldValue">
                        <tags:dataDictInput name="rzStatus" type="select" dataDict="入住状态" value="${house.rzStatus}" className="form-control"/>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">入住经办人：</td>
                    <td class="fieldValue">
                        <input class="form-control" name="rzName" type="text" size="50" value="${house.rzName}">
                    </td>
                    <td class="fieldName">入住日期：</td>
                    <td class="fieldValue">
                        <fmt:formatDate value="${house.rzDate}" var="rzDate" pattern="yyyy-MM-dd" />
                        <input type="text" style="width: 130px;height: 33px;" name="rzDate" value="${rzDate}" class="form-control form-date-time dateISO"/></td>
                        <%--<input class="form-control" name="rzDate" type="text" size="50" value="${house.rzDate}">--%>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">备注：</td>
                    <td class="fieldValue" colspan="3">
                        <textarea  class="form-control" name="memo" id="memo" cols="93" rows="3">${house.memo}</textarea>
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="text-center">
                <button type="submit" class="btn btn-primary save"><i class="fa fa-save"></i>
                    保存
                </button>
                <button type="button" class="btn btn-white" onclick="history.back();"><i class="fa fa-backward"></i>
                        返回
                </button>
            </div>
        </form>
    </div>
</div>
</body>
</html>