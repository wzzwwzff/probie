<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>桌面文件目录创建</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="title">
    <h5>桌面文件目录创建</h5>
</div>
<div class="content">
    <form class="form-horizontal" id="inputForm" method="post" action="saveDeskCataLog?<tags:searchParams/>">
        <input type="hidden" name="cataId" value="${deskCatalog.id}"/>
        <fieldset>
            <table class="table table-bordered">
                <tbody>
                <tr>
                    <td class="fieldName">目录名称</td>
                    <td class="fieldValue">
                        <input size="90" type="text" name="name" class="required" value="${deskCatalog.name}"/><span class="require">*</span>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">排序号</td>
                    <td class="fieldValue">
                        <input size="20" type="text" name="number" value="${empty deskCatalog.number ? 99 : deskCatalog.number}"/>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">是否有效</td>
                    <td class="fieldValue">
                        <tags:dataDictRadio name="able" dataDict="是否有效" value="${deskCatalog.able}"/>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">创建日期</td>
                    <td class="fieldValue">
                        <jsp:useBean id="date" class="java.util.Date"/>
                        <input style="width: 150px;height: 35px;"
                               class="form-control form-date-time datepicker" name="createDate"
                               value="<fmt:formatDate  value="${empty deskCatalog.createDate ? date: deskCatalog.createDate}" pattern="yyyy-MM-dd" />">
                    </td>
                </tr>
                </tbody>
            </table>
        </fieldset>
        <div class="footer">
            <button class="btn btn-primary btn-sm" type="submit"><i class="fa fa-save"></i>&nbsp;保存</button>
            &nbsp;&nbsp;
            <button class="btn btn-white btn-sm" type="button" onclick="javascript:history.back()"><i class="fa fa-backward"></i>&nbsp;返回</button>
        </div>
    </form>
</div>
</body>
<script>
    $(document).ready(function () {
        $("#inputForm").validate({});
    });
</script>
</html>
