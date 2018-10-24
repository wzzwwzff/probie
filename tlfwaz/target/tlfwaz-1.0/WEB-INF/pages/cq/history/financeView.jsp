<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<fieldset>
    <%--<legend>二、财务信息</legend>--%>
    <table class="table table-bordered">
        <tbody>
        <tr>
            <td class="fieldName">结算状态</td>
            <td class="fieldValue">
                <tags:dataDict dataDict="结算状态" value="${family.jsStatus}"/>
                <c:if test="${compareUtils.show(family.jsStatus,family1.jsStatus)}"><font
                        style="color: red">（<tags:dataDict dataDict="结算状态" value="${family1.jsStatus}"/>）</font></c:if>
            </td>
            <td class="fieldName">结算时间</td>
            <td class="fieldValue">
                <fmt:formatDate pattern="yyyy-MM-dd" value="${family.jsDate}"/>
                <c:if test="${compareUtils.show(family.jsStatus,family1.jsStatus)}">
                        <span style="color: red">
                            （<fmt:formatDate pattern="yyyy-MM-dd" value="${family1.jsDate}"/>）
                        </span>
                </c:if>
            </td>
        </tr>
        <tr>
            <td class="fieldName">结算经办人</td>
            <td class="fieldValue" colspan="3">${family.jsPerson}
                <c:if test="${compareUtils.show(family.jsPerson,family1.jsPerson)}">
                        <span style="color: red">
                            （${family1.jsPerson}）
                        </span>
                </c:if>
            </td>
        </tr>
        </tbody>
    </table>
</fieldset>