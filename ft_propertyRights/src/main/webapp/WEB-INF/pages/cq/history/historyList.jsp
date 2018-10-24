<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>历史记录查看</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="title">
    <h5>历史记录查看</h5>
</div>
<div class="content">
    <div class="search_content resizeLayout">
        <form class="form-inline" role="form" id="search">
            <input type="hidden" name="familyId" value="${familyId}">
            <div class="form-group">
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">操作用户</div>
                    <tags:searchInput name="operatePerson" className="form-control" fieldType="string" operator="like"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">操作类型</div>
                    <tags:searchDataDict name="dataPhase" className="form-control" fieldType="integer" dataDict="操作类型"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">操作日期</div>
                    <tags:searchInput name="operateDate" fieldType="date" operator="ge" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">至</div>
                    <tags:searchInput name="operateDate" fieldType="date" operator="lt" className="form-control"/>
                </div>
                <button type="submit" class="btn btn-sm btn-primary"><i class="fa fa-search"></i> 查询</button>&nbsp;&nbsp;
                <button type="button" class="btn btn-white" onclick="location.href='list'"><i class="fa fa-backward"></i> 返回</button>
            </div>
        </form>
    </div>
    <table class="table table-bordered table-hover table-striped">
        <thead>
        <tr>
            <th class="text-center" width="5%">序号</th>
            <th class="text-center">操作用户</th>
            <th class="text-center">操作类型</th>
            <th class="text-center">操作日期</th>
            <th class="text-center">操作IP</th>
            <th class="text-center">操作</th>
        </tr>
        </thead>
        <c:forEach items="${pageInfo.result}" var="history" varStatus="status">
            <tr>
                <td class="text-center">${status.count}</td>
                <td class="text-center">${history.operatePerson}</td>
                <td class="text-center"><tags:dataDict dataDict="操作类型" value="${history.dataPhase}"/> </td>
                <td class="text-center">${history.operateDate}</td>
                <td class="text-center">${history.operateIp}</td>
                <td class="text-center">
                    <a href="view?historyInfoId=${history.id}&datePhase=${history.dataPhase}"><i class="fa fa-eye"></i>查看</a>&nbsp;&nbsp;
                </td>
            </tr>
        </c:forEach>
    </table>
    <div class="footer resizeLayout"><tags:pageInfo/></div>
</div>
</body>
</html>