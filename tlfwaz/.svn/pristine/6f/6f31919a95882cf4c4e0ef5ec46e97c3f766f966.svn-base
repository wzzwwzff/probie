<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.app.common.model.DataDict" %>
<%@ page import="com.sqds.utils.StringUtils" %>

<%
    List list = (List) request.getAttribute("list");
    Map data = (Map) request.getAttribute("data");
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>数据字典管理</title>
    <%@include file="/static/common/common.jsp"%>
</head>
<body>
<div class="title"><h5>数据字典管理</h5></DIV>
<div class="content">
    <c:if test="${not empty message}">
        <div id="message" class="alert alert-success">
            <button data-dismiss="alert" class="close">×</button>
                ${message}
        </div>
    </c:if>
    <div class="search">
        <button class="btn btn-sm btn-primary" onclick="location.href='form'">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>添加
        </button>
    </div>
    <table class="table table-bordered table-hover">
        <thead>
        <tr>
            <th class="text-center" width="5%">序号</th>
            <th class="text-center" width="20%">名称</th>
            <th class="text-center">数据</th>
            <th class="text-center" width="5%">操作</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (int i = 0; i < list.size(); i++) {
                DataDict dd = (DataDict) list.get(i);
                List items = (List) data.get(dd.getId());
        %>
        <tr>
            <td height="23" class="text-center"><%=i + 1%>
            </td>
            <td class="text-center"><%=dd.getAttributeName()%>
            </td>
            <td class="text-left">
                <%
                    for (int j = 0; j < items.size(); j++) {
                        DataDict ddItems = (DataDict) items.get(j);
                        if (ddItems.getValidFlag() != null && ddItems.getValidFlag().intValue() == 0) {
                            out.print("<span class=\"badge badge-warning\">禁</span>");
                        }
                        String attributeName = StringUtils.getNotNullString(ddItems.getAttributeName());
                        if (StringUtils.isNotEmpty(ddItems.getAttributeColor())) {
                            attributeName = "<font color='" + ddItems.getAttributeColor() + "'>" + attributeName + "</font>";
                        }
                        attributeName += "(" + ddItems.getAttributeValue() + ")";
                        out.print(attributeName);
                        if ((j + 1) < items.size()) {
                            out.print(",");
                        }
                    }
                %>
            </td>
            <td class="text-center">
                <a href="form?id=<%=dd.getId()%>"><img src="/static/image/edit.gif"></a>
                <a href="javascript:deleteData('<%=dd.getId()%>')"><img src="/static/image/delete.gif"></a>
            </td>
        </tr>
        <%}%>
        </tbody>
    </table>
</div>
</body>
</html>
