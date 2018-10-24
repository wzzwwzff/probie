<%@tag pageEncoding="UTF-8"%>
<%@ tag trimDirectiveWhitespaces="true" %>
<%@ tag import="com.app.common.model.DataDict" %>
<%@ tag import="java.util.Map" %>
<%@ tag import="com.app.common.utils.DataDictUtils" %>
<%@ tag import="com.sqds.utils.StringUtils" %>

<%@ attribute name="dataDict" type="java.lang.String" required="true"%>

<%@ attribute name="value" type="java.lang.String" required="false"%>
<%
    Map<String,DataDict> dataDictMap = DataDictUtils.getDataDictMap(request,dataDict);
    DataDict dataDict1 = dataDictMap.get(value);
    if(dataDict1!=null){
        out.print("<span style='color:"+ StringUtils.getNotNullString(dataDict1.getAttributeColor())+"'>"+StringUtils.getNotNullString(dataDict1.getAttributeName())+"</span>");
    }

%>