<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<ul class="nav nav-tabs">
    <li ${pageName eq 'printBcxyFrame'? 'class="active"':''}>
        <a href="printBcxyFrame?familyId=${family.id}">补偿安置意向书</a>
    </li>
    <c:if test="${family.signStatus eq 2}">
        <li ${pageName eq 'printNumber'? 'class="active"':''}>
            <a href="printNumber?familyId=${family.id}&status=yes">签约结果告知单</a>
        </li>
    </c:if>
</ul>