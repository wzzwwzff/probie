<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>SQL登记管理</title>
    <%@include file="/static/common/common.jsp" %>
    <script>
        $(function (document) {
            $("#inputForm").valid();
        });
    </script>
</head>
<body>
<div class="title">
    <h5>SQL登记管理</h5>
</div>
<div class="content">
    <form id="inputForm" action="save" method="post" class="form-inline">
        <input type="hidden" name="id" value="${sqlExecuteInfo.id}"/>
        <fieldset>
            <table class="table table-bordered">
                <tr>
                    <td class="fieldName" style="width: 15%;">SQL语句功能名称</td>
                    <td class="fieldValue" style="width: 85%;">
                        <input name="sqlTitle" class="form-control required" id="sqlTitle" type="text"
                               value="${sqlExecuteInfo.sqlTitle}"
                               placeholder="必填项" style="width: 450px;"/><span
                            class="require">*</span>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">SQL语句</td>
                    <td class="fieldValue">
                    <textarea name="sqlExecute" class="form-control"
                              style="width: 85%;height: 300px;font-size: 23px;">${sqlExecuteInfo.sqlExecute}</textarea>
                    </td>
                </tr>
            </table>
        </fieldset>
        <div class="footer form_button">
            <button class="btn btn-primary" type="submit">保 存</button>
            <button class="btn btn-white" type="button" onclick="history.back();">返 回</button>
        </div>
    </form>
</div>
</body>
</html>
