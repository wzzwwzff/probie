<%--
  Created by IntelliJ IDEA.
  User: jmdf
  Date: 2018/8/29
  Time: 14:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    table tr td{
        font-size: 25px;
        font-weight: bolder;
        border-color: #0f0f0f;
        padding: 0px;
    }
</style>
<c:set var="name" value="入户"/>
<c:set var="lastName" value="剩余户"/>
<c:choose>
    <c:when test="${type eq 'qy'}">
        <c:set var="name" value="签约"/>
    </c:when>
</c:choose>
<table class="table table-bordered">
    <tr>
        <td style="width: 16%">组别</td>
        <td style="width: 16%">总户数</td>
        <td style="width: 16%">今日${name}</td>
        <td style="width: 16%">累计${name}</td>
        <td style="width: 16%">${lastName}</td>
        <td style="width: 18%">${name}比例</td>
    </tr>
    <fmt:parseNumber var="all" value="0"/>
    <fmt:parseNumber var="sign" value="0"/>
    <fmt:parseNumber var="today" value="0"/>
    <c:forEach items="${dataDictList}" var="dataDict" varStatus="status">
        <tr>
            <td class="aa">${dataDict.attributeName}</td>
            <fmt:parseNumber var="allCount" value="${map[dataDict.attributeValue]['allCount']}"/>
            <c:if test="${type eq 'rh'}">
                <fmt:parseNumber var="allCount" value="${dataDict.attributeColor}"/>
            </c:if>
            <fmt:parseNumber var="all" value="${all + allCount}"/>
            <td>
                <c:if test="${allCount ne null}">${allCount}</c:if>
                <c:if test="${allCount eq null}">0</c:if>
            </td>
            <td>
                <c:if test="${map[dataDict.attributeValue]['todayCount'] ne null}">${map[dataDict.attributeValue]['todayCount']}</c:if>
                <c:if test="${map[dataDict.attributeValue]['todayCount'] eq null}">0</c:if>
            </td>
            <fmt:parseNumber var="today" value="${today + map[dataDict.attributeValue]['todayCount']}"/>
            <td>
                <c:if test="${map[dataDict.attributeValue]['signCount'] ne null}">${map[dataDict.attributeValue]['signCount']}</c:if>
                <c:if test="${map[dataDict.attributeValue]['signCount'] eq null}">0</c:if>
            </td>
            <td>
                <c:if test="${map[dataDict.attributeValue]['signCount'] ne null}">${allCount-map[dataDict.attributeValue]['signCount']}</c:if>
                <c:if test="${map[dataDict.attributeValue]['signCount'] eq null}">${allCount}</c:if>
            </td>
            <fmt:parseNumber var="sign" value="${sign + map[dataDict.attributeValue]['signCount']}"/>
            <td>
                <c:if test="${allCount == 0}">
                    <fmt:formatNumber minFractionDigits="2" value="0" type="percent"/>
                </c:if>
                <c:if test="${allCount > 0}">
                    <fmt:formatNumber minFractionDigits="2" value="${map[dataDict.attributeValue]['signCount']/allCount}" type="percent"/>
                </c:if>
            </td>
        </tr>
    </c:forEach>
    <tr>
        <td>合计</td>
        <td>${all}</td>
        <td>${today}</td>
        <td>${sign}</td>
        <td>${all-sign}</td>
        <td><fmt:formatNumber minFractionDigits="2"  value="${sign/all}" type="percent"/></td>
    </tr>
</table>
