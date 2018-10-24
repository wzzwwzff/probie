<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>资格核验投诉列表</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="title">
    <h5>资格核验投诉列表</h5>
</div>
<div class="content">
    <div class="search_content resizeLayout">
        <form class="form-inline" role="form" id="search">
            <div class="form-group">
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">投诉人姓名</div>
                    <tags:searchInput name="name" fieldType="string" operator="like" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">现居住地址</div>
                    <tags:searchInput name="address" fieldType="string" operator="like" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">投诉日期</div>
                    <tags:searchInput name="date" fieldType="date" operator="ge" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">至</div>
                    <tags:searchInput name="date" fieldType="date" operator="lt" className="form-control"/>
                </div>
                <button type="submit" class="btn btn-sm btn-primary"><i class="fa fa-search"></i> 查询</button>&nbsp;&nbsp;
                <button type="button" class="btn btn-sm btn-primary" onclick="location.href='appealForm';">
                    <i class="glyphicon glyphicon-plus"></i>登记投诉信息
                </button>
            </div>
        </form>
    </div>
    <table class="table table-bordered table-hover table-striped">
        <thead>
        <tr>
            <th class="text-center" width="5%">序号</th>
            <th class="text-center">投诉人姓名</th>
            <th class="text-center">联系电话</th>
            <th class="text-center">现居住地址</th>
            <th class="text-center">职业</th>
            <th class="text-center">工作单位</th>
            <th class="text-center">投诉事项</th>
            <th class="text-center">投诉日期</th>
            <th class="text-center">操作</th>
        </tr>
        </thead>
        <c:forEach items="${pageInfo.result}" var="complain" varStatus="status">
            <tr>
                <td class="text-center">${status.count}</td>
                <td class="text-center">${complain.name}</td>
                <td class="text-center">${complain.phone}</td>
                <td class="text-center">${complain.address}</td>
                <td class="text-center">${complain.job}</td>
                <td class="text-center">${complain.workUnit}</td>
                <td class="text-center">${complain.matter}</td>
                <td class="text-center"><fmt:formatDate value="${complain.date}" pattern="yyyy年MM月dd日"/></td>
                <td class="text-center">
                    <a href='appealForm?complainId=${complain.id}&<tags:searchParams></tags:searchParams>' title="修改"><i
                            class="fa fa-edit"></i>&nbsp;修改</a>&nbsp;&nbsp;
                    <c:if test="${complain.status ne 2}">
                    <a href="javaScript:deleteRow('delete?complainId=${complain.id}')" title="删除"><i
                                class="fa fa-times-circle"></i>&nbsp;删除</a>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
    </table>
    <div class="footer resizeLayout"><tags:pageInfo/></div>
</div>
</body>
</html>