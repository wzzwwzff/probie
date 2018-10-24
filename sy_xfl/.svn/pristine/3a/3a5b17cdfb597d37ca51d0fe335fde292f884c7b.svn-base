<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/static/common/common.jsp" %>
    <title>评估信息修改</title>
    <style>
        .footer2 {
            text-align: center;
            position: fixed;
            width: 100%;
            bottom: 0px;
            left: 0px;
            right: 0px;
            color: inherit;
            border: 1px solid #e7eaec;
            background: #f5f5f6;
            padding: 8px 0 5px 0;
        }
    </style>
</head>
<body>
<div class="title"><h5>评估信息修改</h5></div>
<form method="post" id="pgForm" class="form-inline">
    <div class="content">
        <input type="hidden" name="familyId" value="${family.id}">
        <%@include file="main.jsp"%>
        <%@include file="/WEB-INF/pages/cq/common/form/pgForm.jsp" %>
    </div>
    <div class="footer2">
        <button class="btn btn-primary btn-sm" type="button" onclick="javascript:pgSave()"><i class="fa fa-save"></i>&nbsp;保存</button>
        &nbsp;&nbsp;
        <button class="btn btn-white btn-sm" type="button" onclick="location.href='list'"><i class="fa fa-backward"></i>&nbsp;返回</button>
    </div>
</form>
<script>
    function pgSave() {
        $.ajax({
            url:"pgSave",
            type: "post",
            data: $("#pgForm").serialize(),
            success:function (data) {
                if (data.code == "0000"){
                    alert("保存成功");
                }else {
                    alert(data.message);
                }
            }
        })
    }
</script>
</body>
</html>

