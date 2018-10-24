<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <title>安置项目信息登记</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="title">
    <h5>安置项目信息登记</h5>
</div>
<div class="content">
        <form id="inputForm" action="azProjectSave" method="post" class="form-inline">
            <table class="table table-bordered">
                <tbody>
                <input type="hidden" name="projectId" id="projectId" value="${project.id}"/>
                <tr>
                    <td class="fieldName"><span class="require">*</span>项目名称：</td>
                    <td class="fieldValue">
                        <input class="form-control required" name="projectName" type="text" size="50" value="${project.projectName}" />
                    </td>
                    <td class="fieldName">项目位置：</td>
                    <td class="fieldValue">
                        <input class="form-control" name="address" type="text" size="50" value="${project.address}"/>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">项目东至：</td>
                    <td class="fieldValue">
                        <input class="form-control" name="east" type="text" size="50" value="${project.east}"/>
                    </td>
                    <td class="fieldName">项目西至：</td>
                    <td class="fieldValue">
                        <input class="form-control" name="west" type="text" size="50" value="${project.west}"/>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">项目南至：</td>
                    <td class="fieldValue">
                        <input class="form-control" name="south" type="text" size="50" value="${project.south}"/>
                    </td>
                    <td class="fieldName">项目北至：</td>
                    <td class="fieldValue">
                        <input class="form-control" name="north" type="text" size="50" value="${project.north}"/>
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
</body>
<script>
    $(function () {
        $("#inputForm").validate();
    });
</script>
</html>