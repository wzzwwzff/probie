<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <meta charset="UTF-8">
    <title>5年及以上缴纳社保家庭信息列表</title>
    <meta http-equiv=X-UA-Compatible content="IE=edge,chrome=1">
    <meta content=always name=referrer>
    <meta name="renderer" content="webkit">

    <%@include file="/static/common/common.jsp" %>
</head>
<body style="overflow: hidden;">
<div class="title">
    <h4 style="color: #0d88cc">5年及以上缴纳社保家庭信息列表</h4>
</div>
<div class="content">
            <div class="search_content resizeLayout">
                <form class="form-inline" role="armyForm">
                    <%@include file="/WEB-INF/pages/cq/common/file/fileSel.jsp"%>
                    <button class="btn btn-primary btn-sm" type="submit"><i class="fa fa-search"></i> 查询</button>
                    <a href="socialForm" class="btn btn-primary btn-sm"><i class="glyphicon glyphicon-plus"></i>登记5年及以上缴纳社保家庭信息</a>
                    <a href="excelForm?familyType=4" class="btn btn-primary btn-sm"><i
                            class="fa fa-file-excel-o"></i> 导出家庭信息台账</a>&nbsp;&nbsp;
                    <a href="/cq/compareInfo/innerExcelIndex?familyType=4" class="btn btn-primary btn-sm"><i class="fa fa-file-excel-o"></i>批量导入数据</a>
                    <a href="/cq/compareInfo/innerExcelIndex3" class="btn btn-primary btn-sm"><i class="fa fa-file-excel-o"></i>批量导入家庭成员</a>
                </form>
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
                    <td style="text-align: center;"><fmt:formatDate value="${family.applyDate}" pattern="yyyy-MM-dd" /></td>
                    <td style="text-align: center;"><tags:dataDict dataDict="学历层次" value="${family.education}" /></td>
                    <td style="text-align: center;">
                        <tags:dataDict dataDict="婚姻状况" value="${family.marryStatus}" />
                    </td>
                    <td style="text-align: center;">
                        <tags:dataDict dataDict="数据状态" value="${family.dataStatus}" />
                    </td>
                    <td style="text-align: center;width: 20%">
                        <c:if test="${family.dataStatus < 2}">
                            <a href="view?familyId=${family.id}&<tags:searchParams></tags:searchParams>"><i class="fa fa-eye"></i>查看</a>&nbsp;&nbsp;
                            <a href="socialForm?familyId=${family.id}&<tags:searchParams></tags:searchParams>"><i class="fa fa-edit"></i>修改</a>&nbsp;&nbsp;
                            <a href="javaScript:deleteRow('delete?familyId=${family.id}')" style="color: #cc5965"  title="删除"><i class="fa fa-delicious"></i>&nbsp;删除</a>&nbsp;&nbsp;
                            <a href='checkSocialForm?familyId=${family.id}&<tags:searchParams></tags:searchParams>' style="color: #00B83F"
                               title="上报"><i class="fa fa-edit"></i>&nbsp;上报
                            </a>
                        </c:if>
                        <c:if test="${family.dataStatus eq 2 }">
                            <a href="view?familyId=${family.id}"><i class="fa fa-eye"></i>查看</a>&nbsp;&nbsp;
                            <a href="javaScript:cancelCheck('${family.id}')" title="撤销上报"><i class="fa fa-close"></i>&nbsp;撤销上报
                            </a>
                        </c:if>
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
    function cancelCheck(familyId) {
        if (confirm("确认撤销复核上报吗？\n撤销后数据将可以修改！")) {
            $.get("cancelCheck", {familyId: familyId, myTime: new Date().getTime()}, function (data) {
                if (data.code == "0000") {
                    location.reload();
                } else {
                    alert(data.message);
                }
            })
        }
    }
</script>
</html>