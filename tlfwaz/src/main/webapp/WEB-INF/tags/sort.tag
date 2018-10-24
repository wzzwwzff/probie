<%@tag pageEncoding="UTF-8"%>
<%@ tag trimDirectiveWhitespaces="true" %>
<%@ tag import="com.sqds.page.PageInfo" %>
<%@ attribute name="name" type="java.lang.String" required="true"%>
<%
    PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
    String orderField = "";
    String orderType = "";
    if(pageInfo!=null){
        orderField = pageInfo.getOrderField();
        orderType = pageInfo.getOrderType();
    }
    String className = "sort_default";
    String type = "desc";
    if(orderField!=null && name.equals(orderField) && orderType!=null){
        if(orderType.equals("asc")){
            className = "sort_asc";
            type = "desc";
        }else if(orderType.equals("desc")){
            className = "sort_desc";
            type = "asc";
        }
    }
%>
class="<%=className%>" onclick="sortList('<%=name%>','<%=type%>');"
