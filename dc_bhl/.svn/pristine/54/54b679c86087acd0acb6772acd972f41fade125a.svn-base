<%--
  Created by IntelliJ IDEA.
  User: jmdf
  Date: 2018/8/3
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table id="myData" border="1" cellspacing="4" cellpadding="4" style="width: 98%;margin-top: 0;">
    <tr>
        <td style="width: 10%;">交房顺序</td>
        <td style="width: 25%;">宅基地使用权人姓名</td>
        <td style="width: 15%;">第一轮选房顺序号</td>
        <td style="width: 15%;">第二轮选房顺序号</td>
        <td style="width: 15%;">第三轮选房顺序号</td>
        <%--<td style="width: 30%;">交房时间</td>--%>
    </tr>
    <c:forEach items="${pageInfo.result}" var="family">
        <tr>
            <td><fmt:formatNumber pattern="000" value="${family.jfNumber}"/></td>
            <td style="color: orange;">${family.name}</td>
            <td style="color: red;"> <c:if test="${family.firstXFNum == 0}">/</c:if>
                <c:if test="${family.firstXFNum != 0}"><fmt:formatNumber value="${family.firstXFNum}" pattern="000"/></c:if></td>
            <td style="color:yellow ;"><c:if test="${family.secondXFNum == 0}">/</c:if>
                <c:if test="${family.secondXFNum != 0}"><fmt:formatNumber value="${family.secondXFNum}" pattern="000"/></c:if></td>
            <td style="color:#0FF ;"><c:if test="${family.thirdXFNum == 0}">/</c:if>
                <c:if test="${family.thirdXFNum != 0}"><fmt:formatNumber value="${family.thirdXFNum}" pattern="000"/></c:if></td>
            <%--<td style="color: lawngreen;"><tags:longToDate value="${family.jfNumberDateMillisecond}"/></td>--%>
        </tr>
    </c:forEach>
</table>

