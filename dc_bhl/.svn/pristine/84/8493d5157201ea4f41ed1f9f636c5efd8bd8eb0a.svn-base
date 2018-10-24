<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ tag pageEncoding="UTF-8"%>
<%@ tag trimDirectiveWhitespaces="true" %>
<%@ tag import="com.app.common.model.DataDict" %>
<%@ tag import="com.app.common.utils.DataDictUtils" %>
<%@ tag import="java.util.List" %>

<%@ attribute name="dataDict" type="java.lang.String" required="true"%>
<%@ attribute name="value" type="java.lang.String" required="true"%>
<%@ attribute name="name" type="java.lang.String" required="true"%>
<%--单选按钮 从数据字典取值--%>
<%
    List<DataDict> dataDictList = DataDictUtils.getDataDictList(request, dataDict);
    request.setAttribute("dataDictList",dataDictList);
%>
<c:forEach var="dataDictItem" items="${dataDictList}" varStatus="status">
    <c:set var="checked" value=""/>
    <%--<c:if test="${value eq '' && status.first}">--%>
        <%--<c:set var="checked" value="checked"/>--%>
    <%--</c:if>--%>
    <c:if test="${fn:contains(value,dataDictItem.attributeValue)}">
        <c:set var="checked" value="checked"/>
    </c:if>
    <label class="radio-inline">
    <input type="radio" name="${name}" ${checked} value="${dataDictItem.attributeValue}"/>${dataDictItem.attributeName}
    </label>
</c:forEach>

