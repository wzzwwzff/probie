<%@ page import="com.app.permission.utils.DepartmentUtils" %>
<%@ page import="com.app.permission.model.Department" %>
<%@ page import="com.app.permission.model.Role" %>
<%@ page import="java.util.List" %>
<%@ page import="com.app.permission.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%
    User user = (User) request.getAttribute("user");
%>
<form id="inputForm" action="save?<tags:searchParams/>" method="post">
    <input type="hidden" name="id" value="${user.id}"/>
    <table class="table table-bordered">
        <tbody>
        <tr>
            <td class="fieldName">所属部门</td>
            <td class="fieldValue">
                <select name="departmentId" id="departmentId" class="required">
                    <option value="">-请选择-</option>
                    <%
                        Integer dptId = user.getDepartment() == null ? 0 : user.getDepartment().getId();
                        Department department = (Department) request.getAttribute("department");
                        StringBuffer sb = new StringBuffer("");
                        DepartmentUtils.departmentOption(department, sb, dptId + "", "id", 0);
                        out.println(sb.toString());
                    %>
                </select><span class="require">*</span>
            </td>
        </tr>
        <tr>
            <td class="fieldName">真实姓名</td>
            <td class="fieldValue"><input type="text" name="realName" value="${user.realName}" class="required"/><span class="require">*</span></td>
        </tr>
        <tr>
            <td class="fieldName">用户名</td>
            <td class="fieldValue"><input type="text" name="username" id="username" value="${user.username}" class="required"/><span class="require">*</span></td>
        </tr>
        <tr>
            <td class="fieldName">密码</td>
            <td class="fieldValue"><input type="text" name="password" value="${user.password}" class="required"/><span class="require">*</span></td>
        </tr>
        <tr>
            <td class="fieldName">用户级别</td>
            <td class="fieldValue">
                <select name="userLevel">
                    <%
                        Integer userLevel = user.getUserLevel();
                        for (int i = 0; i <= 9; i++) {
                            String selected = "";
                            if (userLevel != null && userLevel.intValue() == i) {
                                selected = "selected";
                            }
                            out.println("<option value='" + i + "' " + selected + ">" + i + "</option>");
                        }
                    %>
                </select>&nbsp; 级别 0-9 0为最高级,0,1级别可以设定下属人员的级别，默认为5
            </td>
        </tr>
        <tr>
            <td class="fieldName">角色</td>
            <td class="fieldValue">
                <%
                    List<Role> roleList = (List<Role>) request.getAttribute("roleList");
                    for (Role role : roleList) {
                        String checked = "";
                        List<Role> userRoleList = user.getRoles();
                        if (userRoleList != null && userRoleList.size() > 0) {
                            for (Role userRole : userRoleList) {
                                if (role.getId().intValue() == userRole.getId().intValue()) {
                                    checked = "checked";
                                }
                            }
                        }
                        out.println("<input name=\"roleId\" class='roleId'  type=\"checkbox\" value=\"" + role.getId() + "\" " + checked + ">" + role.getRoleName());
                    }
                %>
            </td>
        </tr>
        <tr>
            <td class="fieldName">编号(PIN)</td>
            <td class="fieldValue"><input type="text" name="pin" value="${user.pin}"></td>
        </tr>
        <tr>
            <td class="fieldName">标示号码(GUID)</td>
            <td class="fieldValue"><input type="text" name="guid" value="${user.guid}"></td>
        </tr>
        <tr>
            <td class="fieldName">密钥(UKEY)</td>
            <td class="fieldValue"><input type="text" name="ukey" value="${user.ukey}"></td>
        </tr>
        <tr>
            <td class="fieldName">是否有效</td>
            <td class="fieldValue" style="text-align: left">
                <input type="radio" name="activeFlag" value="1" checked="checked">有效&nbsp;&nbsp;
                <input type="radio" name="activeFlag" value="2" <%=user.getActiveFlag() != null && user.getActiveFlag().intValue() == 2 ? "checked" : ""%>/>无效
            </td>
        </tr>
        </tbody>
    </table>
    <script>
        $(document).ready(function () {
            $("#inputForm").validate({
                rules: {
                    username: {
                        remote: "/permission/user/validationUsername?userId=${user.id}"
                    }
                },
                messages: {
                    username: {
                        remote: "用户名已经存在"
                    }
                }
            });
        });
    </script>
</form>

