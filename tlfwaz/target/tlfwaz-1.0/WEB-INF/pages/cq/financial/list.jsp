<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>结算业务管理</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="title">
    <h5> 结算业务管理</h5>
</div>
<div class="content">
    <div class="search_content">
        <form class="form-inline" role="form" id="search">
            <div class="form-group">
                <%@include file="/WEB-INF/pages/cq/common/search/searchFamily.jsp" %>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">结算状态</div>
                    <tags:searchDataDict name="f.jsStatus" className="form-control" fieldType="integer"
                                         dataDict="结算状态"/>
                </div>
                <button type="submit" class="btn btn-sm btn-primary"><i class="fa fa-search"></i>&nbsp;查 询</button>
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
                <td class="text-center">
                    <a href="/cq/common/view/main?familyId=${family.id}"><i class="fa fa-big fa-eye"></i>查看</a>&nbsp;&nbsp;
                    <a href='form?familyId=${family.id}&<tags:searchParams></tags:searchParams>'
                       title="修改"><i class="fa fa-edit"></i>&nbsp;登记结算信息</a>&nbsp;&nbsp;
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