<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.sqds.utils.StringUtils"%>
<%@page import="com.app.permission.model.Menu"%>
<%@page import="com.app.permission.model.Role"%>
<%@page import="com.app.permission.model.User"%>
<%@page import="com.app.permission.model.Department"%>
<%@page import="com.app.permission.utils.DepartmentUtils"%>
<%
Department department = (Department)request.getAttribute("department");
Department rootDepartment= (Department)request.getAttribute("rootDepartment");
%>
<html>
  <body>
  <form name="change_form" id="change_form" method="post">
  	<input type="hidden" name="code" value="<%=department.getDepartmentCode() %>">
	<table id="form_table" cellpadding="1" cellspacing="1">
		<tr bgcolor="#FFFFFF"> 
           <td class="name1">当前部门</td>
           <td class="filed1"><%=StringUtils.getNotNullString(department.getDepartmentName()) %></td>
         </tr>
		<tr bgcolor="#FFFFFF">
			<td class="name1">调整至部门</td>
			<td class="filed1">
       			<select name="departmentId" id="departmentId">
                    <option value="">-请选择-</option>
                    <%
                        StringBuffer stringBuffer = new StringBuffer();
                        DepartmentUtils.departmentOption(rootDepartment, stringBuffer, "", "id", 0);
                        out.println(stringBuffer.toString());
                    %>
                </select>
			</td>
		</tr>
     </table>
   </form>
  </body>
</html>
