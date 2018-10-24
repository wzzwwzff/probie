<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <meta charset="UTF-8">
    <title>创建文件夹</title>
    <%@include file="/static/common/common.jsp" %>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>
<body>
<div class="title">
    <h4>创建文件夹</h4>
</div>
<div class="content">
        <form class="form-horizontal" id="inputForm" action="projectFileSave?proFileId=${projectFile.id}&<tags:searchParams></tags:searchParams>" method="post" autocomplete="off">
            <input type="hidden" name="id" value="${projectFile.id}">
            <input type="hidden" name="projectId" value="${projectId}">
            <table class="table table-bordered">
                <tbody>
                <tr>
                    <td class="fieldName">文件夹名称：</td>
                    <td class="fieldValue">
                        <input class="String" type="text" name="fileName"  size="20" value="${projectFile.fileName}"/>
                    </td>
                    <td class="fieldName">是否有效：</td>
                    <td class="fieldValue">
                        <tags:dataDictRadio name="validFlag" dataDict="是否" value="${projectFile.validFlag}"/>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">创建时间：</td>
                    <td class="fieldValue" colspan="3"><input type="text" name="uploadDate" class="form-date-time dateISO " value="<fmt:formatDate value='${projectFile.uploadDate}' pattern="yyyy-MM-dd"/>"/>
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="text-center">
                <input type="submit" style="width: 70px" class="btn  btn-primary" value="保存" />
                &nbsp;&nbsp;
                <input type="button" style="width: 70px" class="btn btn-primary" onclick="history.back();" value="返回"/>
            </div>
        </form>
    </div>
</body>
</html>
<script>
    //日期控件
    $('.form-date-time').on('changeDate', function (ev) {
        $(this).datepicker('hide');
    });

    $('.form-date-time').datepicker({
        minViewMode: 'months',
        format: 'yyyy-mm-dd',
        autoclose: true
    });
</script>