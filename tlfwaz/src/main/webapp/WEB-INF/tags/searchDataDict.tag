<%@tag pageEncoding="UTF-8"%>
<%@ tag trimDirectiveWhitespaces="true" %>
<%@ tag import="com.sqds.page.PageInfo" %>
<%@ tag import="com.app.common.utils.DataDictUtils" %>
<%@ tag import="com.app.common.model.DataDict" %>
<%@ tag import="java.util.List" %>
<%@ tag import="org.apache.logging.log4j.util.Strings" %>
<%@ attribute name="name" type="java.lang.String" required="true"%>
<%@ attribute name="fieldType" type="java.lang.String" required="true"%>
<%@ attribute name="dataDict" type="java.lang.String" required="true"%>
<%@ attribute name="className" type="java.lang.String" required="false" %>
<%
    PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
    List<DataDict> dataDictList = DataDictUtils.getDataDictList(request,dataDict);
    String allName = "search_eq_"+fieldType+"_"+name;

    String postValue = "";
    if(pageInfo!=null){
        Object postObject = pageInfo.search(allName);
        if(postObject!=null){
            postValue = postObject+"";
        }
    }
    StringBuffer classStr = new StringBuffer("");

    if (Strings.isNotEmpty(className)) {
        classStr.append(className);
    }
%>

<select <%=classStr.length() > 0 ? "class='" + classStr.toString() + "'" : ""%> name="<%=allName%>" id="<%=allName%>">
    <option value="">-全部-</option>
    <%
    for(DataDict dataDictObject : dataDictList){
    %>
    <option value="<%=dataDictObject.getAttributeValue()%>" <%if(postValue.equals(dataDictObject.getAttributeValue())){out.print("selected");}%>><%=dataDictObject.getAttributeName()%></option>
    <%}%>
</select>