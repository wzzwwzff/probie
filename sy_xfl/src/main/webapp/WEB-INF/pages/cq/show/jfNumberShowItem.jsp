<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table style="margin-bottom: 0;">
    <tr>
        <td style="border: 0px solid #000">总计：${all}户，今日交房：${todaySign}户，累计交房：${sign}户，
            交房比例：<fmt:formatNumber  type="percent" minFractionDigits="2" value="${sign/all}"/></td>
    </tr>
</table>
<table id="myData" border="1" cellspacing="4" cellpadding="4" style="width: 98%;margin-top: 0;">
    <tr>
        <td style="width: 10%;">交房顺序</td>
        <td style="width: 25%;">宅基地使用权人姓名</td>
        <td style="width: 30%;">交房时间</td>
    </tr>
    <c:forEach items="${pageInfo.result}" var="family">
        <tr>
            <td><fmt:formatNumber pattern="000" value="${family.jfNumber}"/></td>
            <td style="color: yellow;">${family.name}</td>
            <td style="color: lawngreen;"><tags:longToDate value="${family.jfNumberDateMillisecond}"/></td>
        </tr>
    </c:forEach>
</table>
