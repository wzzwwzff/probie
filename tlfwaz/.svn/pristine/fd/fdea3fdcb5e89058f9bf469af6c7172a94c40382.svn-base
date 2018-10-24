<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html>
<head>
    <title>结算业务管理</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="content">
    <div class="form-inline" id="hideCls" style="padding-bottom: 5px;">
        <ul class="nav nav-tabs">
            <li><a href="startList">财务批次管理</a></li>
            <li class="active"><a href="list">结算业务办理</a></li>
        </ul>
    </div>
    <div class="search_content">
        <form class="form-inline" role="form" id="search">
            <div class="form-group">
                <%@include file="/WEB-INF/pages/cq/common/search/searchFamily.jsp" %>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">结算状态</div>
                    <tags:searchDataDict name="f.jsStatus" className="form-control" fieldType="integer"
                                         dataDict="结算状态"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">财务批次</div>
                    <tags:searchInput name="f.financeBatch" fieldType="integer" operator="eq" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">财务批次区间</div>
                    <tags:searchInput name="f.financeBatch" fieldType="integer" operator="ge" className="form-control"/><br/>
                </div>
                <div class="input-group input-group-sm">
                    <tags:searchInput name="f.financeBatch" fieldType="integer" operator="le" className="form-control"/><br/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">批次时间：</div>
                    <tags:searchInput name="cwBatchDate" fieldType="date" operator="ge"/>
                    至
                    <tags:searchInput name="cwBatchDate" fieldType="date" operator="le"/>
                </div>
                <button type="submit" class="btn btn-sm btn-primary"><i class="fa fa-search"></i>&nbsp;查 询</button>&nbsp;&nbsp;
                <button type="button" class="btn btn-sm btn-primary" onclick="location.reload();"><i
                        class="fa fa-refresh"></i>&nbsp;刷新
                </button>
            </div>
        </form>
    </div>
    <table class="table table-bordered table-hover table-striped">
        <thead>
        <tr>
            <th width="4%" class="text-center">序号</th>
            <th class="text-center">项目名称</th>
            <th class="text-center">地块</th>
            <th class="text-center">家庭编号</th>
            <th class="text-center">姓名</th>
            <th class="text-center">房屋坐落</th>
            <th class="text-center">购房指标</th>
            <th class="text-center">已选房套数</th>
            <th class="text-center">已选房面积</th>
            <th class="text-center">总购房款</th>
            <th class="text-center">结算款</th>
            <th class="text-center">财务批次</th>
            <th class="text-center">批次时间</th>
            <th class="text-center">操作</th>
        </tr>
        </thead>
        <c:forEach items="${pageInfo.result}" var="family" varStatus="status">
            <tr>
                <td class="text-center">${status.count}</td>
                <td class="text-center">${family.project.projectName}</td>
                <td class="text-center">${family.area.areaName}</td>
                <td class="text-center">${family.familyCode}</td>
                <td class="text-center">${family.name}</td>
                <td class="text-center">${family.fwzl}</td>
                <td class="text-center">${family.gfArea}</td>
                <td class="text-center">${family.houseNum}</td>
                <td class="text-center">${family.azArea}</td>
                <td class="text-center">${family.totalHouseMoney}</td>
                <td class="text-center">${family.jsMoney}</td>
                <td class="text-center">${family.financeBatch}</td>
                <td class="text-center"><fmt:formatDate value="${family.cwBatchDate}" pattern="yyyy-MM-dd"/></td>
                <td class="text-center">
                    <a href="/cq/common/view/main?familyId=${family.id}"><i class="fa fa-big fa-eye"></i>查看</a>&nbsp;&nbsp;
                    <%--<a href='form?familyId=${family.id}&<tags:searchParams></tags:searchParams>'
                       title="修改"><i class="fa fa-edit"></i>&nbsp;登记结算信息</a>&nbsp;&nbsp;--%>
                    <a href="print?familyId=${family.id}&<tags:searchParams></tags:searchParams>"><i
                            class="fa fa-big fa-print"></i>结算证明</a>&nbsp;&nbsp;
                </td>
            </tr>
        </c:forEach>
    </table>
    <div class="footer resizeLayout"><tags:pageInfo/></div>
</div>
</body>
</html>