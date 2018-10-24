<%@ page import="com.sqds.utils.StringUtils" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Map<String, String> map = (Map<String, String>) request.getAttribute("map");
    String systemName = StringUtils.getNotNullString(map.get("系统名称"));
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv=X-UA-Compatible content="IE=edge,chrome=1">
    <meta content=always name=referrer>
    <meta name="renderer" content="webkit">

    <title><%=systemName%></title>
</head>
<frameset rows="60,*" cols="*" framespacing="0" frameborder="no" border="0">
    <frame src="header" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" />
    <frameset rows="*" cols="200,*" id="menu">

        <frame src="menu" name="menuFrame" id="menuFrame" scrolling="auto"/>
        <frame src="/cq/desk/dashboard" id="mainFrame" name="mainFrame"/>
    </frameset>
</frameset>
<noframes>
    <body>
    </body>
</noframes>
</html>
