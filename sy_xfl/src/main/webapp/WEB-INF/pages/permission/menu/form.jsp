<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="com.app.permission.model.Role" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Vector" %>
<%@page import="com.app.permission.model.Menu" %>
<%@ page import="com.app.permission.model.User" %>
<%
    List<Role> roleList = (List) request.getAttribute("roleList");
    List<Role> checkRoleList = (List) request.getAttribute("checkRoleList");
    Menu menu = (Menu) request.getAttribute("menu");
    User loginUser = (User) request.getAttribute("loginUser");
%>
<form id="inputForm" action="save" method="post">
    <input type="hidden" name="parentId" value="${parentMenu.id}"/>
    <input type="hidden" name="id" value="${menu.id}"/>
    <br>
    <table class="table table-bordered">
        <tbody>
        <tr>
            <td class="fieldName">菜单名称</td>
            <td class="fieldValue"><input type="text" name="name" id="name" size="35" value="${menu.name}" class="required"><span class="require">*</span>
            </td>
        </tr>
        <tr>
            <td class="fieldName">链接地址</td>
            <td class="fieldValue"><input type="text" size='45' name="menuUrl" value="${menu.menuUrl}"></td>
        </tr>
        <%--<tr>--%>
            <%--<td class="fieldName">资源地址</td>--%>
            <%--<td class="fieldValue"><input type="text" name="resourceUrl" value="${menu.resourceUrl}" size="45"></td>--%>
        <%--</tr>--%>
        <%
            if (loginUser.getUserLevel() != null && (loginUser.getUserLevel().intValue() == 0 || loginUser.getUserLevel().intValue() == 1)) {
        %>
        <tr>
            <td class="fieldName">菜单级别</td>
            <td class="fieldValue">
                <select name="menuLevel" id="menuLevel">
                    <%
                        for (int i = 0; i < 10; i++) {
                            String selected = "";
                            if (menu.getMenuLevel() != null && menu.getMenuLevel().intValue() == i) {
                                selected = "selected";
                            }
                    %>
                    <option value="<%=i%>" <%=selected%>><%=i%>
                    </option>
                    <%}%>
                </select>&nbsp;菜单级别 0-9，0为最高级别
            </td>
        </tr>
        <%}%>
        <tr>
            <td class="fieldName">顺序号</td>
            <td class="fieldValue"><input type="text" name="orderIndex" value="${menu.orderIndex}" class="required"><span class="require">*</span>
            </td>
        </tr>
        <tr>
            <td class="fieldName">是否有效</td>
            <td class="fieldValue">
                <input type="radio" name="activeFlag" value="1" id="activeFlag1" <%if(menu.getActiveFlag()==null||menu.getActiveFlag()==1){out.println("checked");} %>>有效&nbsp;&nbsp;
                <input type="radio" name="activeFlag" value="0" <%if(menu.getActiveFlag()!=null&&menu.getActiveFlag()==0){out.println("checked");} %>>无效
            </td>
        </tr>
        <tr>
            <td class="fieldName">设定角色</td>
            <td class="fieldValue">
                <%
                    for (Role role : roleList) {
                        String checked = "";
                        for (Role checkRole : checkRoleList) {
                            if (role.getId().intValue() == checkRole.getId().intValue()) {
                                checked = " checked ";
                            }
                        }
                        out.println("<input type=\"checkbox\" name=\"roleId\" value='" + role.getId() + "' " + checked + "/>");
                        out.println(role.getRoleName());
                        out.println("&nbsp;");
                    }
                %>
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
