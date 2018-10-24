<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>动作历史记录</title>
    <%@include file="/static/common/common.jsp"%>
    <style>
        .footer2 {
            text-align: center;
            position: fixed;
            width: 100%;
            bottom: 0px;
            left: 0px;
            right: 0px;
            color: inherit;
            border: 1px solid #e7eaec;
            background: #f5f5f6;
            padding: 8px 0 5px 0;
        }
    </style>
</head>
<body>
<div class="title">
    <h5>动作历史记录</h5>
</div>
<div class="content">
    <div class="search_content resizeLayout">
        <form class="form-inline" role="form" id="search">
            <div class="form-group">
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">操作类型</div>
                    <input type="hidden" name="familyId" value="${familyId}">
                    <tags:searchInput name="a.operateType" fieldType="string" operator="like" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">操作用户名</div>
                    <tags:searchInput name="a.person" fieldType="string" operator="like" className="form-control"/>
                </div>
                <button type="submit" class="btn btn-primary btn-sm"><i class="fa fa-search"></i>&nbsp;查询</button>
                <button class="btn btn-white btn-sm" type="button" onclick="location.href='list'"><i
                        class="fa fa-backward"></i>&nbsp;返回
                </button>
            </div>
        </form>
    </div>
        <table class="table table-bordered table-hover">
            <thead>
            <tr>
                <th class="text-center" width="5%">序号</th>
                <th class="text-center">操作类型</th>
                <th class="text-center">操作电脑IP</th>
                <th class="text-center">操作用户名</th>
                <th class="text-center">操作时间</th>
            </tr>
            </thead>
            <c:forEach items="${pageInfo.result}" var="action" varStatus="status">
            <tr>
                <td class="text-center">${status.count}</td>
                <td class="text-center">${action.operateType}</td>
                <td class="text-center">${action.computerId}</td>
                <td class="text-center">${action.person}</td>
                <td class="text-center">${action.formatDoDate}</td>
            </tr>
            </c:forEach>
        </table>
    <tags:pageInfo/>
</div>
</body>
</html>