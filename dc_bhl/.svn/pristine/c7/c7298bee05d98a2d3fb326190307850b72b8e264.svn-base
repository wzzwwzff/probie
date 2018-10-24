<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.app.permission.model.*" %>
<%
PermissionConfig pc = (PermissionConfig)request.getAttribute("permissionConfig");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>权限验证管理</title>
<link href="/styles/cms.css" rel="stylesheet" type="text/css">
<link href="/styles/css.css" rel="stylesheet" type="text/css">
<link href="/styles/thickbox.css" rel="stylesheet" type="text/css">
</head>
<body>

<form id="form1" name="form1" method="post" action="save.do">
 <DIV id=title>权限验证管理</DIV>
		<table id="data_table" cellpadding="0" cellspacing="1">
			<tr class="row">
				<td width="15%" height="30">是否打开权限验证</td>
				<td align="left" style="text-align:left">&nbsp;<input type="radio" name="activeFlag" id="radio" value="1" <c:if test="${permissionConfig.activeFlag==1}">checked</c:if>/>打开
				<input type="radio" name="activeFlag" id="radio" value="0" <c:if test="${permissionConfig.activeFlag==0}">checked</c:if>/>关闭
				</td>
			</tr>
			<tr class="row">
				<td width="15%" height="30">权限验证规则</td>
				<td align="left"  style="text-align:left">
				请填写验证规则，只有符合验证规则，才进行权限验证。可以使用“**”，“*”通配符。<br>
				<c:forEach var="url" items="${urls}" varStatus="i"> 
				&nbsp;<input name="url" type="text" id="textfield" size="40" value="${url}"><br>
				</c:forEach>
				&nbsp;<input name="url" type="text" id="textfield" size="40"><br>
				&nbsp;<input name="url" type="text" id="textfield" size="40"><br>
				&nbsp;<input name="url" type="text" id="textfield" size="40"><br>
				&nbsp;<input name="url" type="text" id="textfield" size="40"><br>
				&nbsp;<input name="url" type="text" id="textfield" size="40"><br>
				</td>
			</tr>
		</table>
    <div>
    <input type="submit" name="button" id="button" value="保存" />
        </div>
</form>
</body>
</html>
