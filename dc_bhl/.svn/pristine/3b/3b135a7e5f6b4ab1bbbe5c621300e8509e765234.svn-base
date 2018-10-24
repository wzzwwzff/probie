<%--
  Created by IntelliJ IDEA.
  User: jmdf
  Date: 2018/9/18
  Time: 18:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <title>数据退回列表</title>
    <%@include file="/static/common/common.jsp"%>
</head>
<body>
<div class="title">
    <h5> 数据退回列表</h5>
</div>
<div class="content">
    <div class="search form-inline" >
        <%--<div class="search">--%>
            <%--<div class="search_content">--%>
                <%--<form id="search" class="form-search">--%>
                    <%--<div class="form-group">--%>
                        <%--<div class="input-group input-group-sm">--%>
                            <%--<div class="input-group-addon">编号</div>--%>
                            <%--<tags:searchInput name="f.familyCode" fieldType="string" operator="like" className="form-control"/>--%>
                        <%--</div>--%>
                        <%--<div class="input-group input-group-sm">--%>
                            <%--<div class="input-group-addon">姓名</div>--%>
                            <%--<tags:searchInput name="f.name" fieldType="string" operator="like" className="form-control"/>--%>
                        <%--</div>--%>
                        <%--<div class="input-group input-group-sm">--%>
                            <%--<div class="input-group-addon">审核状态</div>--%>
                            <%--<tags:searchDataDict className="form-control" name="checkState" fieldType="integer" dataDict="审核状态"/>--%>
                        <%--</div>--%>
                        <%--<button type="submit" class="btn btn-primary btn-sm"><i class="fa fa-search"></i>&nbsp;查询</button>--%>
                    <%--</div>--%>
                <%--</form>--%>
            <%--</div>--%>
        <%--</div>--%>
        <table class="table table-bordered table-hover table-striped">
            <thead>
            <tr>
                <th class="text-center" width="5%">序号</th>
                <th class="text-center">家庭编号</th>
                <th class="text-center">被拆迁人</th>
                <th class="text-center">退回时间</th>
                <th class="text-center">退回原因</th>
                <%--<th class="text-center">退回类型</th>--%>
            </tr>
            </thead>
            <c:forEach items="${pageInfo.result}" var="backInfo" varStatus="status">
                <tr>
                    <td class="text-center">${status.count+(pageInfo.pageNo-1)*pageInfo.pageSize}</td>
                    <td class="text-center">${backInfo.family.familyCode}</td>
                    <td class="text-center">${backInfo.family.name}</td>
                    <td class="text-center"><fmt:formatDate value="${backInfo.backDate}" pattern="yyyy-MM-dd HH:mm:ss" /> </td>
                    <td class="text-center">${backInfo.problem}</td>
                    <%--<td class="text-center"><tags:dataDict dataDict="退回类型" value="${backInfo.backType}" /></td>--%>
                </tr>
            </c:forEach>
        </table>
        <tags:pageInfo/>
    </div>
</div>
</body>
</html>
