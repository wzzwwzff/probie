<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>房源信息列表</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="title resizeLayout"><h4>【${project.projectName}】房源信息列表</h4></div>
<div class="content">
    <div class="search_content resizeLayout">
        <form class="form-inline" role="form" id="search">
            <input type="hidden" name="projectId" value="${project.id}">
            <div class="form-group">
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">楼号</div>
                    <tags:searchInput name="h.buildNum" fieldType="string" operator="like" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">单元</div>
                    <tags:searchInput name="h.unitNum" fieldType="string" operator="like" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">房号</div>
                    <tags:searchInput name="h.houseNum" fieldType="string" operator="like" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">居室</div>
                    <tags:searchDataDict name="h.houseType" fieldType="string" dataDict="房屋居室" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">房屋状态</div>
                    <tags:searchDataDict name="h.houseStatus" fieldType="integer" dataDict="房屋状态" className="form-control"/>
                </div>
                <button type="submit" class="btn btn-primary btn-sm"><i class="fa fa-search"></i>&nbsp;查询</button>
                <button type="button" class="btn btn-primary btn-sm" onclick="location.href='houseForm?projectId=${project.id}'"><i class="glyphicon glyphicon-plus"></i>&nbsp;登记</button>
                <button type="button" class="btn btn-danger btn-sm" onclick="location.href='projectList?<tags:searchParams/>'"><i class="fa fa-backward"></i>&nbsp;返回</button>
            </div>
        </form>
    </div>
    <table class="table table-bordered table-hover table-striped">
        <thead>
        <tr>
            <th width="4%" class="text-center">序号</th>
            <th class="text-center">楼号</th>
            <th class="text-center">单元</th>
            <th class="text-center">房号</th>
            <th class="text-center">居室</th>
            <th class="text-center">建筑面积(㎡)</th>
            <th class="text-center">房屋状态</th>
            <th class="text-center">备注</th>
            <th width="15%" class="text-center">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="house" items="${pageInfo.result}" varStatus="status">
            <tr>
                <td>${status.count+(pageInfo.pageNo-1)*pageInfo.pageSize}</td>
                <td>${house.buildNum}</td>
                <td>${house.unitNum}</td>
                <td>${house.houseNum}</td>
                <td><tags:dataDict dataDict="房屋居室" value="${house.houseType}"/></td>
                <td>${house.buildArea}</td>
                <td><tags:dataDict dataDict="房屋状态" value="${house.houseStatus}"/></td>
                <td>${house.memo}</td>
                <td>
                    <a href="houseForm?houseId=${house.id}&projectId=${project.id}"><i class="fa fa-big fa-edit"></i>&nbsp;修改</a>&nbsp;&nbsp;
                    <c:if test="${house.houseStatus eq 1}">
                        <a href="javascript:deleteRow('deleteHouse?houseId=${house.id}')"><i class="fa fa-big fa-trash"></i>&nbsp;删除</a>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div class="footer resizeLayout"><tags:pageInfo/></div>
</body>
</html>