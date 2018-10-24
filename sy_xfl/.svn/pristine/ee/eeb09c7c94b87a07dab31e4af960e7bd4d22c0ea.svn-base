<%@tag pageEncoding="UTF-8"%>
<%@ tag import="com.sqds.page.PageInfo" %>
<%@ tag trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
    int paginationSize = 10;
    int current =  pageInfo.getPageNo() ;
    int begin = Math.max(1, current - paginationSize/2);
    int end = Math.min(begin + (paginationSize - 1), pageInfo.getTotalPages());

    request.setAttribute("current", current);
    request.setAttribute("begin", begin);
    request.setAttribute("end", end);
%>

<div>
    <div class="col-xs-4 text-left">
        当前第${pageInfo.pageNo}页，共${pageInfo.totalPages}页，共${pageInfo.totalCount}条记录
    </div>
    <div class="col-xs-8 text-right">
        <div class="" id="editable_paginate">

            <ul class="pagination">
                <% if (pageInfo.hasPreviousPage()){%>
                <li><a href="?_pageNo=1&_orderField=${pageInfo.orderField}&_orderType=${pageInfo.orderType}&${pageInfo.searchParams}">首 页</a></li>
                <li><a href="?_pageNo=${current-1}&_orderField=${pageInfo.orderField}&_orderType=${pageInfo.orderType}&${pageInfo.searchParams}">上一页</a></li>
                <%}else{%>
                <li class="disabled"><a href="#">首 页</a></li>
                <li class="disabled"><a href="#">上一页</a></li>
                <%} %>

                <c:forEach var="i" begin="${begin}" end="${end}">
                    <c:choose>
                        <c:when test="${i == current}">
                            <li class="active"><a href="?_pageNo=${i}&_orderField=${pageInfo.orderField}&_orderType=${pageInfo.orderType}&${pageInfo.searchParams}">${i}</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="?_pageNo=${i}&_orderField=${pageInfo.orderField}&_orderType=${pageInfo.orderType}&${pageInfo.searchParams}">${i}</a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <% if (pageInfo.hasNextPage()){%>
                <li><a href="?_pageNo=${current+1}&_orderField=${pageInfo.orderField}&_orderType=${pageInfo.orderType}&${pageInfo.searchParams}">下一页</a></li>
                <li><a href="?_pageNo=<%=pageInfo.getTotalPages()%>&_orderField=${pageInfo.orderField}&_orderType=${pageInfo.orderType}&${pageInfo.searchParams}">末 页</a></li>
                <%}else{%>
                    <li class="disabled"><a href="#">下一页</a></li>
                    <li class="disabled"><a href="#">末 页</a></li>
                <%}%>
            </ul>
        </div>
    </div>
</div>
