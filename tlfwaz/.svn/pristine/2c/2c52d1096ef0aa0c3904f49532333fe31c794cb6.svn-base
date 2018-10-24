<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <title>项目信息登记</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="title">
    <h5>项目信息登记</h5>
</div>
<div class="content">
    <form class="form-inline" id="inputForm" action="save?<tags:searchParams />" method="post">
        <table class="table table-bordered">
            <tbody>
            <input type="hidden" name="id" value="${project.id}"/>
            <tr>
                <td class="fieldName">项目名称：</td>
                <td class="fieldValue"><input class="form-control required" name="projectName" type="text" size="30"
                                              value="${project.projectName}"><span class="require">*</span></td>
            </tr>
            <tr>
                <td class="fieldName">地块：</td>
                <td class="fieldValue">
                    <table class="table table-bordered" id="personTable">
                        <thead>
                        <tr>
                            <th class="text-center">地块名称</th>
                            <th class="text-center">备注</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach begin="0" end="${1+fn:length(areaList)}" var="i" varStatus="status">
                            <tr id="${status.count}_tr">
                                <td class="text-center">
                                    <input type="hidden" name="a_id" value="${areaList[i].id}"/>
                                    <input type="text" id="a_areaName${status.count}" name="a_areaName" class="form-control"
                                           value="${areaList[i].areaName}">
                                </td>
                                <td class="text-center"><input type="text" name="a_memo" class="form-control"
                                                               value="${areaList[i].memo}"></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div align="center">
                        <button type="button" class="btn btn-sm btn-primary" onclick="addRow();">添加新行</button>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="fieldName" style="width: 15%">备注：</td>
                <td class="fieldValue" style="width: 85%"><textarea class="form-control" rows="3" cols="80"
                                                                    name="memo">${project.memo}</textarea></td>
            </tr>
            </tbody>
        </table>
        <div class="footer">
            <button class="btn btn-primary save" type="submit"><i class="fa fa-save"></i>&nbsp;保 存</button>
            <button class="btn btn-white" type="button" onclick="history.back();"><i class="fa fa-backward"></i>&nbsp;取
                消
            </button>
        </div>
    </form>
</div>
</body>
<script>
    $("#inputForm").validate();
    function addRow() {
        var rowIndex = $("#personTable tr").length - 1;
        $("#personTable tr:last").clone().insertAfter($("#personTable tr:eq(" + rowIndex + ")"))
        $("#personTable tr:last input").each(function () {
            $(this).val("");
        });
    }

    function deleteTr(obj,name) {//删除行
        obj.parent().parent().remove();
    }
</script>
</html>
