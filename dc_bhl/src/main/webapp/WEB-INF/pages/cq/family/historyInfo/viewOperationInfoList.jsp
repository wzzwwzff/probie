<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>操作记录列表</title>
    <%@include file="/static/common/common.jsp"%>
</head>
<body>
<div class="title">
    <h5>【${family.name}】操作记录列表</h5>
</div>
<div class="content">
    <table class="table table-bordered table-hover">
        <thead>
        <tr>
            <th class="text-center" width="5%">序号</th>
            <th class="text-center" width="10%">操作用户名</th>
            <th class="text-center" width="20%">操作时间</th>
            <th class="text-center" width="65%">操作类型</th>
        </tr>
        </thead>
        <c:forEach items="${operationInfoList}" var="operationInfo" varStatus="status">
            <tr>
                <td class="text-center">${status.count}</td>
                <td class="text-center">${operationInfo.operatePerson}</td>
                <td class="text-center"><fmt:formatDate value="${operationInfo.operateDate}" pattern="yyyy年MM月dd日 HH:mm:ss"/></td>
                <td class="text-center">${operationInfo.memo}</td>
            </tr>
        </c:forEach>
    </table>
</div>
<div class="footer resizeLayout">
    <button class="btn btn-primary btn-sm" type="button" onclick="history.back()"><i class="fa fa-backward"></i>&nbsp;返回</button>
</div>
</body>
</html>