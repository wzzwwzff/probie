<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@page import="com.sqds.utils.StringUtils" %>
<%@page import="com.app.permission.model.Menu" %>
<%@page import="com.app.permission.model.Role" %>
<%@ page import="com.app.permission.model.MenuItem" %>
<%
    Menu menu = (Menu) request.getAttribute("menu");
    List<Role> roleList = (List<Role>) request.getAttribute("roleList");
    List<MenuItem> itemList = (List<MenuItem>) request.getAttribute("itemList");
%>
<!DOCTYPE html>
<%@include file="/static/common/common.jsp"%>
<table class="table table-bordered">
    <tbody>
    <tr>
        <td class="fieldName">菜单名称</td>
        <td class="text-left" class="text-left" class="fieldValue"><%=StringUtils.getNotNullString(menu.getName()) %>
        </td>
        <td class="fieldName">链接地址</td>
        <td class="text-left" class="fieldValue"><%=StringUtils.getNotNullString(menu.getMenuUrl()) %>
        </td>
    </tr>
    <tr>
        </td>
        <td class="fieldName">是否有效</td>
        <td class="text-left" class="fieldValue">
            <%
                int activeFlag = menu.getActiveFlag();
                if (activeFlag == 1) {
                    out.println("<font color='green'>有效</font>");
                } else {
                    out.println("<font color='red'>无效</font>");
                }
            %>
        </td>
        <td class="fieldName">角色</td>
        <td class="text-left" class="fieldValue">
            <%
                if (roleList != null && roleList.size() > 0) {
                    for (Role role : roleList) {
                        out.println(role.getRoleName() + "   ");
                    }
                }
            %>
        </td>
    </tr>
    </tbody>
</table>

