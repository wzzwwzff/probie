<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>修改记录列表</title>
    <%@include file="/static/common/common.jsp"%>
</head>
<body>
<div class="title">
    <h5>【${family.name}】修改记录列表</h5>
</div>
<div class="content">
    <div class="search form-inline">
        <table class="table table-bordered table-hover">
            <thead>
            <tr>
                <th class="text-center" width="5%">序号</th>
                <th class="text-center">操作电脑IP</th>
                <th class="text-center">操作用户名</th>
                <th class="text-center">操作时间</th>
                <th class="text-center">操作类型</th>
                <th width="15%" class="text-center">查看</th>
            </tr>
            </thead>
            <c:forEach items="${historyInfoList}" var="historyInfo" varStatus="status">
                <tr>
                    <td class="text-center">${status.count}</td>
                    <td class="text-center">${historyInfo.computerId}</td>
                    <td class="text-center">${historyInfo.operatePerson}</td>
                    <td class="text-center"><fmt:formatDate value="${historyInfo.operateDate}" pattern="yyyy年MM月dd日 HH:mm:ss"/></td>
                    <td class="text-center"><tags:dataDict dataDict="操作类型" value="${historyInfo.type}" /></td>
                    <td class="text-center">
                        <a href="viewHistoryInfo?historyInfoId=${historyInfo.id}"><i class="fa fa-big fa-eye"></i> 查看</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="footer resizeLayout">
        <button class="btn btn-primary btn-sm" type="button" onclick="history.back()"><i class="fa fa-backward"></i>&nbsp;返回</button>
    </div>
</div>
</body>
</html>