<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <meta charset="UTF-8">
    <title>学历信息列表</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body style="overflow: hidden;">
<div class="title">
    <h5>学历信息列表</h5>
</div>
<div class="content">
    <div class=" doc-content" style="position: relative;">
        <div class="search_content">
            <div style="float: left">
                <form class="form-inline" role="form">
                    <%@include file="/WEB-INF/pages/cq/common/file/educationListSel.jsp"%>
                    <button class="btn btn-primary btn-sm" type="submit"><i class="fa fa-search"></i> 查询</button>
                </form>
            </div>
        </div>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th style="text-align: center;" width="5%">序号</th>
                <th style="text-align: center;">姓名</th>
                <th style="text-align: center;">更新日期</th>
                <th style="text-align: center;">性别</th>
                <th style="text-align: center;">学历类别</th>
                <th style="text-align: center;">学历层次</th>
                <th style="text-align: center;">学习形式</th>
                <th style="text-align: center;">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${pageInfo.result}" var="education" varStatus="status">
                <tr>
                    <td style="text-align: center;">${status.count}</td>
                    <td style="text-align: center;">${education.name}</td>
                    <td style="text-align: center;"><fmt:formatDate value="${education.updateDate}" pattern="yyyy-MM-dd" /></td>
                    <td style="text-align: center;"><tags:dataDict dataDict="性别" value="${education.sex}" /></td>
                    <td style="text-align: center;">${education.educationCategory}</td>
                    <td style="text-align: center;">${education.level}</td>
                    <td style="text-align: center;">${education.learning}</td>
                    <td style="text-align: center;">
                        <a href="educationView?educationId=${education.id}"><i class="fa fa-eye"></i>&nbsp;查看</a>&nbsp;&nbsp;
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="footer resizeLayout"><tags:pageInfo/></div>
</div>
</body>
</html>
