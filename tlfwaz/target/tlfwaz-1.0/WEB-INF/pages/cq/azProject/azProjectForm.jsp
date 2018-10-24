<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <title>安置项目信息登记</title>
    <%@include file="/static/common/common.jsp" %>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>
<body style="overflow:hidden;">
<div class="title">
    <h4>安置项目登记</h4>
</div>
<div class="content">
    <div class=" doc-contentInfo">
        <form id="inputForm" action="azProjectSave" method="post" class="form-inline">
            <input type="hidden" name="projectId" id="projectId" value="${project.id}"/>
            <table class="table table-bordered">
                <tbody>
                <tr>
                    <td class="fieldName"><span class="require">*</span>项目名称：</td>
                    <td class="fieldValue">
                        <input class="form-control required" name="projectName" placeholder="必填项" type="text" size="50" value="${project.projectName}">
                    </td>
                    <td class="fieldName">项目位置：</td>
                    <td class="fieldValue">
                        <input class="form-control" name="address" type="text" size="50" value="${project.address}">
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">项目东至：</td>
                    <td class="fieldValue">
                        <input class="form-control" name="east" type="text" size="50" value="${project.east}">
                    </td>
                    <td class="fieldName">项目西至：</td>
                    <td class="fieldValue">
                        <input class="form-control" name="west" type="text" size="50" value="${project.west}">
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">项目南至：</td>
                    <td class="fieldValue">
                        <input class="form-control" name="south" type="text" size="50" value="${project.south}">
                    </td>
                    <td class="fieldName">项目北至：</td>
                    <td class="fieldValue">
                        <input class="form-control" name="north" type="text" size="50" value="${project.north}">
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">备注：</td>
                    <td class="fieldValue" colspan="3">
                        <textarea  class="form-control" name="memo" id="memo" cols="93" rows="3">${project.memo}</textarea>
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="text-center">
                <button type="submit" class="btn btn-primary save"><i class="fa fa-save"></i>
                    保存
                </button>
                <button type="button" class="btn btn-white" onclick="history.back();"><i class="fa fa-backward"></i>
                    返回
                </button>
            </div>
        </form>
    </div>
</div>
<script>
    $(function () {
        $("#inputForm").valid();
    });
</script>
</body>
</html>