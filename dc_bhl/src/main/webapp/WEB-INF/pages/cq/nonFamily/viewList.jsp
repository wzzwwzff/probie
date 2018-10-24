<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>非宅数据查看</title>
    <%@include file="/static/common/common.jsp"%>
</head>
<body>
<div class="title">
    <h5>非宅数据查看</h5>
</div>
<div class="content">
    <div class="search_content resizeLayout">
        <form class="form-inline" role="form" id="search">
            <div class="form-group">
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">分指</div>
                    <tags:searchDataDict name="f.bdCode" fieldType="string" dataDict="分指" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">组别</div>
                    <tags:searchDataDict name="f.groupCode" fieldType="string" dataDict="组别" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">编号</div>
                    <tags:searchInput name="f.familyCode" fieldType="string" operator="like" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">房屋地址门牌</div>
                    <tags:searchInput name="f.address" fieldType="string" size="30" operator="like" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">产权单位名称</div>
                    <tags:searchInput name="f.unitName" fieldType="string" size="30" operator="like" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">单位联系人</div>
                    <tags:searchInput name="f.unitNum" fieldType="string" operator="like" className="form-control"/>
                </div>
                <button type="submit" class="btn btn-primary btn-sm"><i class="fa fa-search"></i>&nbsp;查询</button>
                <button type="button" class="btn btn-primary btn-sm" onclick="location.href='export'"><i class="glyphicon glyphicon-export"></i>&nbsp;导出</button>
            </div>
        </form>
    </div>
    <table class="table table-bordered table-hover">
        <thead>
        <tr>
            <th class="text-center" width="5%">序号</th>
            <th class="text-center">分指</th>
            <th class="text-center">组别</th>
            <th class="text-center">编号</th>
            <th class="text-center">房屋地址门牌</th>
            <th class="text-center">产权单位名称</th>
            <th class="text-center">单位联系人</th>
            <th class="text-center">房屋总建筑面积/㎡</th>
            <th width="15%" class="text-center">操作</th>
        </tr>
        </thead>
        <c:forEach items="${pageInfo.result}" var="nonFamily" varStatus="status">
            <tr>
                <td class="text-center">${status.count+(pageInfo.pageNo-1)*pageInfo.pageSize}</td>
                <td class="text-center"><tags:dataDict dataDict="分指" value="${nonFamily.bdCode}"/></td>
                <td class="text-center"><tags:dataDict dataDict="组别" value="${nonFamily.groupCode}"/></td>
                <td class="text-center">${nonFamily.familyCode}</td>
                <td class="text-center">${nonFamily.address}</td>
                <td class="text-center">${nonFamily.unitName}</td>
                <td class="text-left">${nonFamily.unitMan}</td>
                <td class="text-center">${nonFamily.houseTotalArea}</td>
                <td class="text-center">
                    <a href="view?nonFamilyId=${nonFamily.id}"><i class="fa fa-big fa-eye"></i> 查看</a>&nbsp;&nbsp;
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<div class="footer resizeLayout"><tags:pageInfo/></div>
</body>
</html>