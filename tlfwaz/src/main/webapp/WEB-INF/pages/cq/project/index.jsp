<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>项目信息首页</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<%@include file="navigation.jsp"%>
<div class="content">
    <div class="center" style="margin-top: 50px;margin-left: 300px;">
        <c:forEach items="${projectList}" var="project">
            <a href='/main/main' title="进入项目"><img src="/static/image/dhy.jpg" style="width: 200px;">
            <br/><font style="font-size: 35px;">${project.projectName}项目</font></a>
        </c:forEach>
    </div>
</div>
</body>
</html>