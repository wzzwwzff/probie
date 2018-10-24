<%@tag pageEncoding="UTF-8"%>
<%@ tag import="com.sqds.utils.StringUtils" %>
<%@ tag import="com.sqds.web.Servlets" %>
<%
    Servlets.setNoCacheHeader(response);
    String message = (String)request.getAttribute("message");
    if(StringUtils.isNotEmpty(message)){
%>
    <div id="message" class="alert alert-success">
        <button data-dismiss="alert" class="close">×</button>
            <%=message%></div>
    <%}%>