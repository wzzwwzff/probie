<%@tag pageEncoding="UTF-8"%>
<%@ tag trimDirectiveWhitespaces="true" %>
<%@tag import="com.sqds.page.PageInfo" %>
<%@ tag import="org.apache.logging.log4j.util.Strings" %>
<%@ attribute name="name" type="java.lang.String" required="true"%>
<%@ attribute name="fieldType" type="java.lang.String" required="true"%>
<%@ attribute name="operator" type="java.lang.String" required="true"%>
<%@ attribute name="size" type="java.lang.Integer" required="false"%>
<%@ attribute name="className" type="java.lang.String" required="false" %>
<%
    PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
    if(size==null){
        size = 15;
    }
    String postValue = "";
    String allName = "search_"+operator+"_"+fieldType+"_"+name;
    if(pageInfo!=null){
        Object postObject = pageInfo.search(allName);
        if(postObject!=null){
            postValue = postObject+"";
        }
    }

    StringBuffer classStr = new StringBuffer("");

    if (Strings.isNotEmpty(className)) {
        classStr.append(className).append(" ");
    }

    if (fieldType.equals("date")) {
        classStr.append("form-date-time dateISO").append(" ");
    }
%>
<input type="text" name="<%=allName%>" value="<%=postValue%>" size="<%=size%>" <%=classStr.length() > 0 ? "class='" + classStr.toString() + "'" : ""%>/>