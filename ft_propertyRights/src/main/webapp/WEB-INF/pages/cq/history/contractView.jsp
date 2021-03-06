<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>合同信息查看</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="content">
    <fieldset>
        <legend>一、合同信息</legend>
        <table class="table table-bordered">
            <tbody>
            <c:forEach items="${contractList}" var="contract" varStatus="status">
            <tr>
                <td class="fieldName">申请编号：</td>
                <td class="fieldValue">
                    ${contract.familyCode}
                        <%--<c:if test="${compareUtils.show(contract.familyCode,contract1.familyCode)}"><font--%>
                                <%--style="color: red">（${contract1.familyCode}）</font></c:if>--%>
                </td>
                <td class="fieldName">合同编号：</td>
                <td class="fieldValue">
                   ${contract.contractCode}
                       <%--<c:if test="${compareUtils.show(contract.contractCode,contract1.contractCode)}"><font--%>
                               <%--style="color: red">（${contract1.contractCode}）</font></c:if>--%>
                </td>
            </tr>
            <tr>
                <td class="fieldName">产权人姓名：</td>
                <td class="fieldValue">
                    ${contract.name}
                        <%--<c:if test="${compareUtils.show(contract.name,contract1.name)}"><font--%>
                                <%--style="color: red">（${contract1.name}）</font></c:if>--%>
                </td>
                <td class="fieldName">身份证号：</td>
                <td class="fieldValue">
                   ${contract.idCard}
                       <%--<c:if test="${compareUtils.show(contract.idCard,contract1.idCard)}"><font--%>
                               <%--style="color: red">（${contract1.idCard}）</font></c:if>--%>
                </td>
            </tr>
            <tr>
                <td class="fieldName">项目名称：</td>
                <td class="fieldValue">
                    <tags:dataDict dataDict="项目名称" value="${contract.family.projectName}"/>
                    <%--<c:if test="${compareUtils.show(contract.family.projectName,contract1.family.projectName)}"><font--%>
                            <%--style="color: red">（<tags:dataDict dataDict="项目名称" value="${contract1.family.projectName}"/>）</font></c:if>--%>
                </td>
                <td class="fieldName">楼号：</td>
                <td class="fieldValue">
                   ${contract.house.buildNum}
                       <%--<c:if test="${compareUtils.show(contract.house.buildNum,contract1.house.buildNum)}"><font--%>
                               <%--style="color: red">（${contract1.house.buildNum}）</font></c:if>--%>
                </td>
            </tr>
            <tr>
                <td class="fieldName">单元：</td>
                <td class="fieldValue">
                    ${contract.house.unitNum}
                        <%--<c:if test="${compareUtils.show(contract.house.unitNum,contract1.house.unitNum)}"><font--%>
                                <%--style="color: red">（${contract1.house.unitNum}）</font></c:if>--%>
                </td>
                <td class="fieldName">房号：</td>
                <td class="fieldValue">
                   ${contract.house.houseNum}
                       <%--<c:if test="${compareUtils.show(contract.house.houseNum,contract1.house.houseNum)}"><font--%>
                               <%--style="color: red">（${contract1.house.houseNum}）</font></c:if>--%>
                </td>
            </tr>
            <tr>
                <td class="fieldName">建筑面积（㎡）：</td>
                <td class="fieldValue">
                   ${contract.house.buildArea}
                       <%--<c:if test="${compareUtils.show(contract.house.buildArea,contract1.house.buildArea)}"><font--%>
                               <%--style="color: red">（${contract1.house.buildArea}）</font></c:if>--%>
                </td>
                <td class="fieldName">居室：</td>
                <td class="fieldValue">
                    <tags:dataDict dataDict="居室" value="${contract.house.houseType}"/>
                    <%--<c:if test="${compareUtils.show(contract.house.houseType,contract1.house.houseType)}"><font--%>
                            <%--style="color: red">（<tags:dataDict dataDict="居室" value="${contract1.house.houseType}"/>）</font></c:if>--%>
                </td>
            </tr>
            <tr>
                <td class="fieldName">销售价格：</td>
                <td class="fieldValue">
                    ${contract.price}
                        <%--<c:if test="${compareUtils.show(contract.price,contract1.price)}"><font--%>
                                <%--style="color: red">（${contract1.price}）</font></c:if>--%>
                </td>
                <td class="fieldName">产权比例：</td>
                <td class="fieldValue">
                    ${contract.propertyRight}
                        <%--<c:if test="${compareUtils.show(contract.propertyRight,contract1.propertyRight)}"><font--%>
                                <%--style="color: red">（${contract1.propertyRight}）</font></c:if>--%>
                </td>
            </tr>
            <tr>
                <td class="fieldName">合同签订日期：</td>
                <jsp:useBean id="signDate" class="java.util.Date" />
                <%--<jsp:useBean id="signDate1" class="java.util.Date" />--%>
                <jsp:setProperty name="signDate" property="time" value="${contract.signDate}" />
                <%--<jsp:setProperty name="signDate1" property="time" value="${contract1.signDate}" />--%>
                <td class="fieldValue">
                    <fmt:formatDate value="${signDate}" type="date" dateStyle="long" pattern="yyyy年MM月dd日"/>
                   <%--<fmt:formatDate value='${contract.signDate}' pattern='yyyy-MM-dd'/>--%>
                    <%--<c:if test="${compareUtils.show(contract.signDate,contract1.signDate)}"><font--%>
                            <%--style="color: red">（<fmt:formatDate value="${signDate1}" type="date" dateStyle="long" pattern="yyyy年MM月dd日"/>）</font></c:if>--%>
                </td>
                <td class="fieldName">经办人：</td>
                <td class="fieldValue">
                   ${contract.person}
                       <%--<c:if test="${compareUtils.show(contract.person,contract1.person)}"><font--%>
                               <%--style="color: red">（${contract1.person}）</font></c:if>--%>
                </td>
            </tr>
            <tr>
                <td class="fieldName">备注：</td>
                <td class="fieldValue" colspan="3">
                   ${contract.memo}
                       <%--<c:if test="${compareUtils.show(contract.memo,contract1.memo)}"><font--%>
                               <%--style="color: red">（${contract1.memo}）</font></c:if>--%>
                </td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
    </fieldset>
</div>
</body>
</html>