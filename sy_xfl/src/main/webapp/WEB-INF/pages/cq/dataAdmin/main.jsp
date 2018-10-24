<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <ul class="nav nav-tabs">
        <li <c:if test="${pageName eq 'rhForm'}"> class="active" </c:if>><a href="javascript:void(0);" page="rhForm">入户信息修改</a></li>
        <li <c:if test="${pageName eq 'chForm'}"> class="active" </c:if>><a href="javascript:void(0);" page="chForm">测绘信息修改</a></li>
        <li <c:if test="${pageName eq 'pgForm'}"> class="active" </c:if>><a href="javascript:void(0);" page="pgForm">评估信息修改</a></li>
        <li <c:if test="${pageName eq 'faForm'}"> class="active" </c:if>><a href="javascript:void(0);" page="faForm">方案信息修改</a></li>
    </ul>
<script>
    $(".nav li a").click(function () {
        var page = $(this).attr("page");
        window.location.href = page + "?familyId=${family.id}";
    })
</script>
