<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="org.apache.logging.log4j.LogManager" %>
<%@ page import="org.apache.logging.log4j.Logger" %>
<%
	//设置返回码200，避免浏览器自带的错误页面
	response.setStatus(200);
	//记录日志
//	Logger logger = LoggerFactory.getLogger("500.jsp");
//	logger.error(exception.getMessage(), exception);
	Logger logger = LogManager.getLogger();
	logger.error(exception.getMessage(), exception);

%>

<!DOCTYPE html>
<html>
<head>
	<title>500 - 系统内部错误</title>
</head>

<body>
<div class="ibox float-e-margins">
	<div class="ibox-content">
		<h2>系统数据出现异常</h2>
		<p><%=exception.getMessage()%>
		</p>
	</div>
	<div class="ibox-footer">
                        <span class="pull-right">
                    </span>
	</div>
</div>
<div style="text-align: center">
	<a href="javascript:history.back();" class="btn btn-primary m-t">返 回</a>
</div>
<!--
<%
Exception ex = (Exception) request.getAttribute("exception");
ex.printStackTrace(new java.io.PrintWriter(out));
%>
-->
</body>
</html>
