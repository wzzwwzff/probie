<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <meta charset="UTF-8">
    <title>本市户籍家庭信息列表</title>
    <%@include file="/static/common/common.jsp" %>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>
<body style="overflow: hidden;">
<div class="title">
    <h4> <b>家庭信息列表</b></h4>
</div>
<div style="position: fixed;top: 10px;right: 10px;">
    <button class="btn btn-primary" onclick="location.href='dataQuery'"><i class="fa fa-backward"></i>&nbsp;返回</button>
</div>
<div class="content">

        <table class="table table-bordered">
            <thead>
            <tr>
                <th style="text-align: center;" width="5%">序号</th>
                <th style="text-align: center;">项目名称</th>
                <th style="text-align: center;">申请编号</th>
                <th style="text-align: center;">申请人</th>
                <th style="text-align: center;">申请日期</th>
                <th style="text-align: center;">户籍类型</th>
                <th style="text-align: center;">学历信息</th>
                <%--<th style="text-align: center;">社保信息</th>--%>
                <th style="text-align: center;">婚姻状态</th>
                <th style="text-align: center;">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${pageInfo.result}" var="family" varStatus="status">
            <tr>
                <td style="text-align: center;">${status.index+1}</td>
                <td style="text-align: center;"><tags:dataDict dataDict="项目名称" value="${family.projectName}" /></td>
                <td style="text-align: center;">${family.familyCode}</td>
                <td style="text-align: center;">${family.name}</td>
                <td style="text-align: center;"><fmt:formatDate value="${family.applyDate}" pattern="yyyy-MM-dd" /></td>
                <td style="text-align: center;"><tags:dataDict dataDict="家庭类型" value="${family.familyType}" /></td>
                <td style="text-align: center;"><tags:dataDict dataDict="学历层次" value="${family.education}" /></td>
                <%--<td style="text-align: center;">${family.familyCode}</td>--%>
                <td style="text-align: center;"><tags:dataDict dataDict="婚姻状况" value="${family.marryStatus}" /></td>
                <td style="text-align: center;">
                    <a href="mainView?familyId=${family.id}"><i class="fa fa-eye"></i>查看</a>
                </td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
    <div class="footer resizeLayout"><tags:pageInfo/></div>
</div>
</body>
<script>
    //日期控件
    $('.form-date-time').on('changeDate', function (ev) {
        $(this).datepicker('hide');
    });

    $('.form-date-time').datepicker({
        minViewMode: 'hours',
        format: 'yyyy-mm-dd',
        autoclose: true,
    });
</script>
</html>