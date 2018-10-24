<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <meta charset="UTF-8">
    <title>影像资料审阅列表</title>
    <meta http-equiv=X-UA-Compatible content="IE=edge,chrome=1">
    <meta content=always name=referrer>
    <meta name="renderer" content="webkit">

    <%@include file="/static/common/common.jsp" %>
</head>
<body style="overflow: hidden;">
<div class="title">
    <h4>影像资料审阅列表</h4>
</div>
<div class="content">
    <div class="search_content">
        <div style="float: left">
            <form class="form-inline" role="form">
                <%@include file="/WEB-INF/pages/cq/common/file/fileSel.jsp" %>
                家庭类型：<tags:searchDataDict className="form-control" name="familyType" fieldType="integer"
                                          dataDict="家庭类型"/>
                <button class="btn btn-primary btn-sm" type="submit"><i class="fa fa-search"></i> 查询</button>
            </form>
        </div>
    </div>
    <table class="table table-bordered table-striped table-hover">
        <thead>
        <tr>
            <th style="text-align: center;" width="5%">序号</th>
            <th style="text-align: center;">项目名称</th>
            <th style="text-align: center;">申请编号</th>
            <th style="text-align: center;">申请人</th>
            <th style="text-align: center;">申请日期</th>
            <th style="text-align: center;">学历信息</th>
            <th style="text-align: center;">婚姻状况</th>
            <th style="text-align: center;">家庭类型</th>
            <th style="text-align: center;">数据状态</th>
            <th style="text-align: center;">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pageInfo.result}" var="family" varStatus="status">
            <tr>
                <td style="text-align: center;">${status.count}</td>
                <td style="text-align: center;"><tags:dataDict dataDict="项目名称" value="${family.projectName}" /></td>
                <td style="text-align: center;">${family.familyCode}</td>
                <td style="text-align: center;">${family.name}</td>
                <td style="text-align: center;"><fmt:formatDate value="${family.applyDate}" pattern="yyyy-MM-dd"/></td>
                <td style="text-align: center;">
                    <tags:dataDict dataDict="学历层次" value="${family.education}"/>
                </td>
                <td style="text-align: center;">
                    <tags:dataDict dataDict="婚姻状况" value="${family.marryStatus}"/>
                </td>
                <td style="text-align: center;">
                    <tags:dataDict dataDict="家庭类型" value="${family.familyType}"/>
                </td>
                <td style="text-align: center;">
                    <tags:dataDict dataDict="数据状态" value="${family.dataStatus}"/>
                </td>
                <td style="text-align: center;">
                    <a href="/cq/family/view?familyId=${family.id}"><i class="fa fa-eye"></i>查看</a>&nbsp;&nbsp;
                    <a href="fileCheckUpload?uuid=${family.id}&companyType=01" title="影像资料上报"><i
                            class="fa fa-hand-o-up"></i>&nbsp;影像资料上报</a>&nbsp;&nbsp;
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