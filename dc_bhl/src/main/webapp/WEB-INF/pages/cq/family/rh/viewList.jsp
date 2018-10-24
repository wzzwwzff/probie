<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>住宅数据查看</title>
    <%@include file="/static/common/common.jsp"%>
</head>
<body>
<div class="title">
    <h5>住宅数据查看</h5>
</div>
<div class="content">
    <div class="search_content resizeLayout">
        <form class="form-inline" role="form" id="search">
            <div class="form-group">
                <%@include file="/WEB-INF/pages/cq/common/mainHead/mainHead.jsp"%>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">是否有标准自建</div>
                    <tags:searchDataDict name="f.houseStatus" fieldType="integer" dataDict="是否" className="form-control"/>
                </div>
                <button type="submit" class="btn btn-primary btn-sm"><i class="fa fa-search"></i>&nbsp;查询</button>
            </div>
        </form>
    </div>
    <table class="table table-bordered table-hover">
        <thead>
        <tr>
            <th class="text-center" width="5%">序号</th>
            <th class="text-center">分指</th>
            <th class="text-center">组别</th>
            <th class="text-center">家庭编号</th>
            <th class="text-center">被拆迁人</th>
            <th class="text-center">地址门牌</th>
            <th class="text-center">房屋产别</th>
            <th class="text-center">房屋类型</th>
            <th class="text-center">建筑面积/㎡</th>
            <th class="text-center">是否有标准自建</th>
            <th class="text-center">数据锁定状态</th>
            <th class="text-center">审计初审状态</th>
            <th width="20%" class="text-center">操作</th>
        </tr>
        </thead>
        <c:forEach items="${pageInfo.result}" var="family" varStatus="status">
            <tr>
                <td class="text-center">${status.count+(pageInfo.pageNo-1)*pageInfo.pageSize}</td>
                <td class="text-center"><tags:dataDict dataDict="分指" value="${family.bdCode}"/></td>
                <td class="text-center"><tags:dataDict dataDict="组别" value="${family.groupCode}"/></td>
                <td class="text-center">${family.familyCode}</td>
                <td class="text-center">${family.name}</td>
                <td class="text-center">${family.address}</td>
                <td class="text-center"><tags:dataDict dataDict="房屋产别" value="${family.houseType}"/></td>
                <td class="text-center"><tags:dataDict dataDict="房屋类型" value="${family.houseStyle}"/></td>
                <td class="text-center">${family.buildArea}</td>
                <td class="text-center"><tags:dataDict dataDict="是否" value="${family.houseStatus}"/></td>
                <td class="text-left"><tags:dataDict dataDict="锁定状态" value="${family.sureStatus}"/></td>
                <td class="text-center"><tags:dataDict dataDict="初审状态" value="${family.firstCheckStatus}"/></td>
                <td class="text-center">
                    <a href="/cq/family/common/view/main?familyId=${family.id}"><i class="fa fa-big fa-eye"></i>&nbsp;查看</a>&nbsp;&nbsp;
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<div class="footer resizeLayout"><tags:pageInfo/></div>
</body>
</html>