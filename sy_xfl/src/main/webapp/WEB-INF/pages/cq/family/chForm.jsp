<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>测绘数据登记</title>
    <%@include file="/static/common/common.jsp"%>
    <script src="/static/bigDecimal/BigDecimal-all-last.min.js" type="text/javascript"></script>
</head>
<body>
<div class="title">
    <h5>测绘数据登记</h5>
</div>
<div class="content">
    <form class="form-horizontal" id="inputForm" method="post" action="chSave?<tags:searchParams/>">
        <input type="hidden" name="familyId" id="familyId" value="${family.id}"/>
        <%@include file="/WEB-INF/pages/cq/common/form/chForm.jsp" %>
        <div class="footer">
            <button class="btn btn-primary btn-sm" type="submit"><i class="fa fa-save"></i>&nbsp;保存</button>
            &nbsp;&nbsp;
            <button class="btn btn-white btn-sm" type="button" onclick="javascript:history.back()"><i class="fa fa-backward"></i>&nbsp;返回</button>
        </div>
    </form>
    <br>

</div>
<script>
    $(function(){
        $("#inputForm").valid();
    })
</script>
</body>
</html>
