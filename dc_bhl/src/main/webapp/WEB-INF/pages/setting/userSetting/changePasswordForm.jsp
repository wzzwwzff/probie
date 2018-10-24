<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.app.permission.model.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%
    User user = (User)request.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
    <title>登录密码修改</title>
    <%@include file="/static/common/common.jsp"%>
    <script>
        $(function () {
            $("#inputForm").validate({
                rules: {
                    confirm_password: {
                        equalTo: "#newPassword"
                    }
                }
            });
        })
    </script>
</head>
<body>
<div class="title">
    <h5>登录密码修改</h5>
</div>
<div class="content">
    <c:if test="${not empty message}">
        <div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
    </c:if>
    <form id="inputForm" action="doChangePassword" method="post">
        <table class="table table-bordered">
            <tbody>
            <tr>
                <td class="fieldName">部门：</td>
                <td class="fieldValue"><%=user.getDepartment().getDepartmentName()%></td>
            </tr>
            <tr>
                <td class="fieldName">用户名：</td>
                <td class="fieldValue"><%=user.getUsername()%></td>
            </tr>
            <tr>
                <td class="fieldName">原密码：</td>
                <td class="fieldValue"><input type="password" name="oldPassword" value="" class="required" autocomplete="off"/><span class="require">*</span></td>
            </tr>
            <tr>
                <td class="fieldName">新密码：</td>
                <td class="fieldValue"><input type="password" name="newPassword" id="newPassword" value="" class="required" autocomplete="off" minlength="6"/><span class="require">*</span></td>
            </tr>
            <tr>
                <td class="fieldName">确认密码：</td>
                <td class="fieldValue"><input type="password" name="confirm_password" id="confirm_password" value="" class="required" autocomplete="off"/><span class="require">*</span></td>
            </tr>
            </tbody>
        </table>

        <div class="form_button">
            <button class="btn btn-primary" type="submit">确认修改密码</button>
        </div>
    </form>

</div>

</body>
</html>
