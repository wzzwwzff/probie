<%@ tag import="java.text.SimpleDateFormat" %>
<%@ tag import="java.util.Date" %>
<%@tag pageEncoding="UTF-8" %>
<%@tag trimDirectiveWhitespaces="true" %>

<%@attribute name="name" type="java.lang.String" required="false" %>
<%@attribute name="value" type="java.lang.Long" required="true" %>

<%
    if (value != null & value != 0) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年MM月dd日 HH时mm分ss.SSS秒");
        Date date =new Date(value);
        out.print(simpleDateFormat.format(date));
    }
%>