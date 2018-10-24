<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>项目管理</title>
    <%@include file="/static/common/common.jsp"%>
</head>
<body>
<div class="title">
    <h5>项目管理</h5>
</div>
<div class="content">
    <div class="search_content resizeLayout">
        <form class="form-inline" role="form" id="search">
            <div class="form-group">
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">家庭编号</div>
                    <tags:searchInput name="f.familyCode" fieldType="string" operator="like" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">被拆迁人</div>
                    <tags:searchInput name="f.name" fieldType="string" operator="like" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">地址门牌</div>
                    <tags:searchInput name="f.address" fieldType="string" operator="like" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">房屋产别</div>
                    <tags:searchDataDict name="f.houseType" fieldType="integer" dataDict="房屋产别" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">房屋类型</div>
                    <tags:searchDataDict name="f.houseStyle" fieldType="integer" dataDict="房屋类型" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">数据确认状态</div>
                    <tags:searchDataDict name="f.sureStatus" fieldType="integer" dataDict="确认状态" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">审计初审状态</div>
                    <tags:searchDataDict name="f.firstCheckStatus" fieldType="integer" dataDict="初审状态" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">是否有标准自建</div>
                    <tags:searchDataDict name="f.houseStatus" fieldType="integer" dataDict="是否" className="form-control"/>
                </div>
                <button type="submit" class="btn btn-primary btn-sm"><i class="fa fa-search"></i>&nbsp;查询</button>
                <button type="button" class="btn btn-primary btn-sm" onclick="location.href='form'"><i class="glyphicon glyphicon-plus"></i>&nbsp;登记</button>
            </div>
        </form>
    </div>
    <table class="table table-bordered table-hover">
        <thead>
        <tr>
            <th class="text-center" width="5%">序号</th>
            <th class="text-center">项目编号</th>
            <th class="text-center">项目名称</th>
            <th class="text-center">备注</th>
            <th width="20%" class="text-center">操作</th>
        </tr>
        </thead>
        <c:forEach items="${pageInfo.result}" var="project" varStatus="status">
            <tr>
                <td class="text-center">${status.count}</td>
                <td class="text-center">${project.projectCode}</td>
                <td class="text-center">${project.projectName}</td>
                <td class="text-center">${project.memo}</td>
                <td class="text-center">
                    <a href="form?projectId=${project.id}&${pageInfo.searchParams}"><i class="fa fa-big fa-edit"></i>&nbsp;修改</a>&nbsp;&nbsp;
                    <a href="javascript:deleteRow('delete?projectId=${project.id}')"><i class="fa fa-big fa-trash"></i>&nbsp;删除</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<div class="footer resizeLayout"><tags:pageInfo/></div>
</body>
</html>