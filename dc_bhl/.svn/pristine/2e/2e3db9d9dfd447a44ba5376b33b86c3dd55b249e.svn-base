<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>项目登记界面</title>
    <%@include file="/static/common/common.jsp"%>
    <script>
        $(document).ready(function () {
            $("#projectForm").validate({});
        });
    </script>
</head>
<body>
<div class="title">
    <h5>项目登记界面</h5>
</div>
<form id="projectForm" class="form-inline" method="post" action="projectSave?<tags:searchParams/>">
    <input type="hidden" name="projectId" value="${project.id}"/>
    <div class="content">
        <fieldset>
            <table class="table table-bordered">
                <tbody>
                <tr>
                    <td class="fieldName">项目编号</td>
                    <td class="fieldValue">
                        <input type="text" name="projectCode" class="form-control required" value="${project.projectCode}"/><span class="require">*</span>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">项目名称</td>
                    <td class="fieldValue">
                        <input type="text" class="form-control required" name="projectName" size="50" value="${project.projectName}"/><span class="require">*</span>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName" style="width: 15%;">备注</td>
                    <td class="fieldValue" style="width: 85%";>
                        <textarea name="memo" rows="3" class="form-control" style="width: 85%;height: 150px;">${project.memo}</textarea>
                    </td>
                </tr>
                </tbody>
            </table>
        </fieldset>
    </div>
    <div class="footer resizeLayout">
        <button class="btn btn-primary btn-sm" type="submit"><i class="fa fa-save"></i>&nbsp;保存</button>
        &nbsp;&nbsp;
        <button class="btn btn-white btn-sm" type="button" onclick="history.back()"><i class="fa fa-backward"></i>&nbsp;返回</button>
    </div>
</form>
</body>
</html>
