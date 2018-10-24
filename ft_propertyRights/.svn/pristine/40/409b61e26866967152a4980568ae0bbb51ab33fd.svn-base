<%@tag pageEncoding="UTF-8" %>
<%@ tag trimDirectiveWhitespaces="true" %>
<%@ tag import="com.app.common.model.DataDict" %>
<%@ tag import="com.app.common.utils.DataDictUtils" %>
<%@ tag import="java.util.List" %>

<%@ attribute name="name" type="java.lang.String" required="true" %>
<%@ attribute name="type" type="java.lang.String" required="false" %>
<%@ attribute name="dataDict" type="java.lang.String" required="true" %>
<%@ attribute name="value" type="java.lang.String" required="false" %>
<%@ attribute name="firstValue" type="java.lang.String" required="false" %>
<%@ attribute name="className" type="java.lang.String" required="false" %>
<%@ attribute name="idName" type="java.lang.String" required="false" %>
<%
    //TODO 是否必选问题
    StringBuffer stringBuffer = new StringBuffer();
    List<DataDict> dataDictList = DataDictUtils.getDataDictList(request, dataDict);
    String classStr = "";
    if (className != null && !className.equals("")) {
        classStr = "class='" + className + "'";
    }
    String idStr = "";
    if (idName != null && !idName.equals("")) {
        idStr = "id='" + idName + "'";
    }
    if (type == null || type.equals("") || type.equals("select")) {
        stringBuffer.append("<select name=\"" + name + "\" id=\"" + name + "\" "+classStr+" "+idStr+">");
        if (firstValue != null && !"".equals(firstValue)) {
            stringBuffer.append("<option value=\"\">" + firstValue + "</option>");
        }
        for (DataDict dataDict1 : dataDictList) {
            String selected = "";
            if (value != null && dataDict1.getAttributeValue().equals(value)) {
                selected = " selected";
            }
            stringBuffer.append("<option value=\"" + dataDict1.getAttributeValue() + "\" " + selected + ">" + dataDict1.getAttributeName() + "</option>");
        }
        stringBuffer.append("</select>");
    } else {
        int index = 0;
        for (DataDict dataDict1 : dataDictList) {
            index++;
            String selected = "";
            if (value != null && !"".equals(value)) {
                if (dataDict1.getAttributeValue().equals(value)) {
                    selected = "checked";
                } else {
                    if (index == 1) {
                        selected = "checked";
                    }
                }
            } else {
                if (index == 1) {
                    selected = "checked";
                }
            }
            stringBuffer.append("<label><input type=\"" + type + "\" name=\"" + name + "\" id=\"" + name + "\" value=\"" + dataDict1.getAttributeValue() + "\" " + selected + " "+classStr+">" + dataDict1.getAttributeName() + "</label>&nbsp;&nbsp;");
        }
    }

    out.print(stringBuffer.toString());
%>