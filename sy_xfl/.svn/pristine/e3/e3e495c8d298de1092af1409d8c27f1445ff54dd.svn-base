<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.sqds.utils.StringUtils"%>
<%@page import="com.app.permission.model.Menu"%>
<%@page import="com.app.permission.model.Role"%>
<%@page import="com.app.permission.model.User"%>
<%@page import="com.app.permission.model.Department"%>
<%
List<User> userList = (List<User>)request.getAttribute("userList");
Department department = (Department)request.getAttribute("department");
%>
<html>
  <body>
	<table id="data_table" cellspacing="1" cellpadding="1" style="margin: 5px;width: 98%;">
        <tr bgcolor="#C9E2F1">
            <td height="25" width="5%">序号</td>
            <td>真实姓名</td>
            <td>用户帐号</td>
            <td>部门</td>
            <td>现角色</td>
            <td>状态</td>
        </tr>
        <%
        if(userList!=null&&userList.size()>0){
        	 int index=0;
        	 for(User user:userList){
        		 index++;
        %>
         <tr bgcolor="#ffffff">		 
	         <td width="5%" height="25px"><%=index %></td>
	         <td><%=StringUtils.getNotNullString(user.getRealName()) %></td>
	         <td><%=StringUtils.getNotNullString(user.getUsername()) %></td>
	         <td><%=StringUtils.getNotNullString(user.getDepartment().getDepartmentName()) %></td>
	         <td>
	         	<%List<Role> roleList = user.getRoles();
	         		if(roleList!=null&&roleList.size()>0){
	         			for(Role role:roleList){
	         				out.println(StringUtils.getNotNullString(role.getRoleName())+"&nbsp;&nbsp;");
	         			}
	         		}
	         	%>
	         </td>
	         <td>
	         <%Integer activeFlag = user.getActiveFlag();
	         	if(activeFlag!=null){
	         		if(activeFlag==1){
	         			out.println("<font color='green'>有效</font>");
	         		}else if(activeFlag==2){
	         			out.println("<font color='red'>无效</font>");
	         		}
	         	}
	         %>
	         </td>
	      </tr>
        <%	} }else{
        	out.println("<tr height='25px'  bgcolor='#ffffff'><td colspan='6'>"+department.getDepartmentName()+"暂无用户</td></tr>");
        } 
       %>
    </table>
  </body>
</html>
