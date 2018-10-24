<%--
  Created by IntelliJ IDEA.
  User: jmdf
  Date: 2018/7/21
  Time: 16:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="name" value="入户"/>
<c:set var="lastName" value="剩余户"/>
<c:choose>
    <c:when test="${type eq 'qy'}">
        <c:set var="name" value="签约"/>
    </c:when>
    <c:when test="${type eq 'jf'}">
        <c:set var="name" value="交房"/>
    </c:when>
    <c:when test="${type eq 'cc'}">
        <c:set var="name" value="拆除"/>
    </c:when>
</c:choose>
<table class="table-bordered" style="width: 95%;margin: auto;">
    <tr >
        <td style="width: 16%;text-align: left;padding-left: 15px;">组别</td>
        <td style="width: 16%;text-align: left;padding-left: 10px;">总户数</td>
        <td style="width: 16%;text-align: left;padding-left: 10px;">今日${name}</td>
        <td style="width: 16%;text-align: left;padding-left: 10px;">累计${name}</td>
        <td style="width: 16%;text-align: left;padding-left: 10px;">${lastName}</td>
        <td style="width: 16%;text-align: left;padding-left: 10px;">${name}比例</td>
    </tr>
    <fmt:parseNumber var="all" value="0"/>
    <fmt:parseNumber var="sign" value="0"/>
    <fmt:parseNumber var="today" value="0"/>
    <c:forEach items="${dataDictList}" var="dataDict" varStatus="status">
        <tr>
            <td class="aa" style="text-align: left;padding-left: 15px;">${dataDict.attributeName}</td>
            <fmt:parseNumber var="allCount" value="${map[dataDict.attributeValue]['allCount']}"/>
            <c:if test="${type eq 'rh'}">
                <fmt:parseNumber var="allCount" value="${dataDict.attributeColor}"/>
            </c:if>
            <fmt:parseNumber var="all" value="${all + allCount}"/>
            <td style="text-align: left;padding-left: 15px;">
                <c:if test="${allCount ne null}">${allCount}</c:if>
                <c:if test="${allCount eq null}">0</c:if>
            </td>
            <td style="text-align: left;padding-left: 15px;">
                <c:if test="${map[dataDict.attributeValue]['todayCount'] ne null}">${map[dataDict.attributeValue]['todayCount']}</c:if>
                <c:if test="${map[dataDict.attributeValue]['todayCount'] eq null}">0</c:if>
            </td>
            <fmt:parseNumber var="today" value="${today + map[dataDict.attributeValue]['todayCount']}"/>
            <td style="text-align: left;padding-left: 15px;">
                <c:if test="${map[dataDict.attributeValue]['signCount'] ne null}">${map[dataDict.attributeValue]['signCount']}</c:if>
                <c:if test="${map[dataDict.attributeValue]['signCount'] eq null}">0</c:if>
            </td>
            <td style="text-align: left;padding-left: 15px;">
                <c:if test="${map[dataDict.attributeValue]['signCount'] ne null}">${allCount-map[dataDict.attributeValue]['signCount']}</c:if>
                <c:if test="${map[dataDict.attributeValue]['signCount'] eq null}">${allCount}</c:if>
            </td>
            <fmt:parseNumber var="sign" value="${sign + map[dataDict.attributeValue]['signCount']}"/>
            <td style="text-align: left;padding-left: 10px;"><fmt:formatNumber minFractionDigits="2" value="${map[dataDict.attributeValue]['signCount']/allCount}" type="percent"/> </td>
        </tr>
    </c:forEach>
    <tr>
        <td style="text-align: left;padding-left: 15px;">合计</td>
        <td style="text-align: left;padding-left: 15px;">${all}</td>
        <td style="text-align: left;padding-left: 15px;">${today}</td>
        <td style="text-align: left;padding-left: 15px;">${sign}</td>
        <td style="text-align: left;padding-left: 15px;">${all-sign}</td>
        <td style="text-align: left;padding-left: 10px;"><fmt:formatNumber minFractionDigits="2"  value="${sign/all}" type="percent"/></td>
    </tr>
</table>