<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>投诉申诉反馈列表</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="title">
    <h5>投诉申诉反馈列表</h5>
</div>
<div class="content">
    <div class="search_content resizeLayout">
        <form class="form-inline" role="form" id="search">
            <div class="form-group">
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">姓名</div>
                    <tags:searchInput name="name" fieldType="string" operator="like" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">申诉/投诉日期</div>
                    <tags:searchInput name="date" fieldType="date" operator="ge" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">至</div>
                    <tags:searchInput name="date" fieldType="date" operator="lt" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">处理状态</div>
                    <tags:searchDataDict className="form-control" name="status" fieldType="integer" dataDict="处理状态"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">处理日期</div>
                    <tags:searchInput name="runDate" fieldType="date" operator="ge" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">至</div>
                    <tags:searchInput name="runDate" fieldType="date" operator="lt" className="form-control"/>
                </div>
                <button type="submit" class="btn btn-sm btn-primary"><i class="fa fa-search"></i> 查询</button>
            </div>
        </form>
    </div>
    <table class="table table-bordered table-hover table-striped">
        <thead>
        <tr>
            <th class="text-center" width="5%">序号</th>
            <th class="text-center">申诉/投诉人姓名</th>
            <th class="text-center">申诉/投诉事项</th>
            <th class="text-center">申诉/投诉日期</th>
            <th class="text-center">经办人</th>
            <th class="text-center">处理状态</th>
            <th class="text-center">处理日期</th>
            <th class="text-center">操作</th>
        </tr>
        </thead>
        <c:forEach items="${pageInfo.result}" var="complain" varStatus="status">
            <tr>
                <td class="text-center">${status.count}</td>
                <td class="text-center">${complain.name}</td>
                <td class="text-center">${complain.matter}</td>
                <td class="text-center"><fmt:formatDate value="${complain.date}" pattern="yyyy年MM月dd日"/></td>
                <td class="text-center">${complain.person}</td>
                <td class="text-center"><tags:dataDict dataDict="处理状态" value="${complain.status}"/> </td>
                <td class="text-center"><fmt:formatDate value="${complain.runDate}" pattern="yyyy年MM月dd日"/></td>
                <td class="text-center">
                    <a href='view?complainId=${complain.id}' title="查看"><i class="fa fa-eye"></i>&nbsp;查看</a>&nbsp;&nbsp;
                    <a href='feedBackForm?complainId=${complain.id}&<tags:searchParams></tags:searchParams>' title="反馈管理"><i
                            class="fa fa-edit"></i>&nbsp;反馈管理</a>&nbsp;&nbsp;
                </td>
            </tr>
        </c:forEach>
    </table>
    <div class="footer resizeLayout"><tags:pageInfo/></div>
</div>
</body>
</html>