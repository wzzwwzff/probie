<%@ tag pageEncoding="UTF-8"%>
<%@ tag trimDirectiveWhitespaces="true" %>

<%@ attribute name="value" type="java.lang.Object" required="true"%>
<%@ attribute name="type" type="java.lang.String" required="false"%>

<%
    String outText = "";

    if(value==null && type==null){
        outText = "0.00";
    }
    if(value==null && type!=null && ((type.equals("long") || type.equals("integer")))) {
        outText = "0";
    }
    if(value!=null){
        outText = value+"";
    }
    out.print(outText);
%>