<%@ page import="com.sqds.utils.CookieUtils" %>
<%@ page import="com.app.permission.utils.UserSession" %>
<%@ page import="com.app.permission.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User user = UserSession.getUserFromSession(request);
    if (user == null) {
        CookieUtils.setCookie(response, "userId", "1");
    }
%>
<html>
<head>
    <title></title>
    <%@include file="/static/common/common.jsp" %>
    <style>
        ul li {
            font-size: 50px;
        }
    </style>
</head>
<body>
<ul>
    <li><a href="/adminLogin/login">后台登录</a></li>
</ul>
</body>
</html>
