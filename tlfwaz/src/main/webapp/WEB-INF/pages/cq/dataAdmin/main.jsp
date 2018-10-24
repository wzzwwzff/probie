<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<ul class="nav nav-tabs">
    <li <c:if test="${pageName eq 'form'}"> class="active" </c:if>><a href="javascript:void(0);" page="form">基础信息修改</a></li>
    <li <c:if test="${pageName eq 'jsForm'}"> class="active" </c:if>><a href="javascript:void(0);" page="jsForm">结算信息修改</a></li>
</ul>
<script>
    $(".nav li a").click(function () {
        var page = $(this).attr("page");
        window.location.href = page + "?familyId=${family.id}";
    })
</script>




<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

</body>
</html>
