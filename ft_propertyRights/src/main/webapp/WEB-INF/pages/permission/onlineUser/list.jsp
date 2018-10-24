<%@ page import="com.app.permission.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.app.permission.model.Department" %>
<%@ page contentType="text/html; charset=utf-8"%>
<%
List<User> userList = (List)request.getAttribute("userList");
%>
<HTML>
<HEAD><TITLE>内容模型管理</TITLE>

<META content="MSHTML 6.00.6000.17092" name=GENERATOR>
<style type="text/css">
<!--
.STYLE2 {color: #00CC00}
.STYLE3 {color: #FF0000}
-->
</style>
</HEAD>
<BODY>
<DIV id=nav>
<DIV id=local>[权限管理]-[在线用户列表]</DIV>
</DIV>
<div id="title">在线用户列表</div>
<TABLE id=data_table cellSpacing=1 cellPadding=1>
  <TBODY>
  <TR class=title>
    <TD width="5%">序号</TD>
    <td width="30%">部门</td>
    <TD width="30%">用户</TD>
    <TD width="30%">活动时间</TD>
    </TR>

  <%
    for(int i=0;i<userList.size();i++){
        User user = userList.get(i);
  %>
  <TR class=row>
    <TD><%=i+1%></TD>
    <td><%
        Department department = user.getDepartment();
        if(department!=null){
            out.println(department.getDepartmentName());
        }
    %></td>
    <TD><%=user.getRealName()%></TD>
    <TD><%
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        if(user.getLastUpdateTime()!=null){
            out.print(simpleDateFormat.format(user.getLastUpdateTime()));;
        }
    %></TD>
    </TR>
    <%}%>
</TBODY></TABLE>
</BODY>
</HTML>

