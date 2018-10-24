<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.app.permission.model.User" %>
<%@ page import="com.app.permission.model.Role" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    User loginUser = (User) request.getAttribute("loginUser");
    Role role = (Role) request.getAttribute("role");
%>
<form id="inputForm" action="save?<tags:searchParams/>" method="post">
    <input type="hidden" name="id" value="${role.id}"/>
    <table class="table table-bordered">
        <tbody>
        <tr>
            <td class="fieldName">角色名称</td>
            <td class="fieldValue"><input type="text" name="roleName" size="30" value="${role.roleName}" class="required"><span class="require">*</span></td>
        </tr>
        <tr>
            <td class="fieldName">角色描述</td>
            <td class="fieldValue"><textarea cols="45" rows="3" name="roleDescription">${role.roleDescription}</textarea></td>
        </tr>
        <%
            if (loginUser.getUserLevel() != null && (loginUser.getUserLevel().intValue() == 0 || loginUser.getUserLevel().intValue() == 1)) {
        %>
        <tr>
            <td class="fieldName">角色级别</td>
            <td class="fieldValue">
                <select name="roleLevel" id="roleLevel">
                    <%
                        for (int i = 0; i < 10; i++) {
                            String selected = "";
                            if (role.getRoleLevel() != null && role.getRoleLevel().intValue() == i) {
                                selected = "selected";
                            }
                    %>
                    <option value="<%=i%>" <%=selected%>><%=i%>
                    </option>
                    <%}%>
                </select>
            </td>
        </tr>
        <%}%>
        <tr>
            <td class="fieldName">排序号</td>
            <td class="fieldValue"><input type="text" name="orderIndex" size="8" value="${role.orderIndex}">
            </td>
        </tr>
        <tr>
            <td class="fieldName">是否有效</td>
            <td class="fieldValue" style="text-align: left">
                <input type="radio" name="activeFlag" value="1" checked>有效&nbsp;&nbsp;
                <input type="radio" name="activeFlag" value="0" <c:if test="${role.activeFlag==0}">checked</c:if>>无效
            </td>
        </tr>
        </tbody>
    </table>
</form>
<script>
    $(document).ready(function () {
        $("#inputForm").validate();
    });
</script>