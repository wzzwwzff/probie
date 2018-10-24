<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>评估数据录入</title>
    <%@include file="/static/common/common.jsp"%>
    <script>
        $(document).ready(function () {
            $("#pgForm").validate({});
        });
    </script>
</head>
<body>
<div class="title">
    <h5>评估数据录入</h5>
</div>
<form id="pgForm" class="form-inline" method="post" action="pgSave?<tags:searchParams/>">
    <input type="hidden" name="familyId" id="familyId" value="${family.id}"/>
    <div class="content">
        <%@include file="/WEB-INF/pages/cq/family/common/form/pgForm.jsp"%>
    </div><br/><br/><br/>
    <div class="footer resizeLayout">
        <button class="btn btn-primary btn-sm" type="submit"><i class="fa fa-save"></i>&nbsp;保存</button>
        &nbsp;&nbsp;
        <button class="btn btn-white btn-sm" type="button" onclick="history.back()"><i class="fa fa-backward"></i>&nbsp;返回</button>
    </div>
</form>
</body>
</html>
