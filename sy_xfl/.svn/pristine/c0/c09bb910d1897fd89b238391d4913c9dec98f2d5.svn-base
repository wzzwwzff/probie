<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>数据修改历史记录</title>
    <%@include file="/static/common/common.jsp"%>
</head>
<body>
<div class="title">
    <h5>数据修改历史记录</h5>
</div>
<div class="content">
    <div class="search_content resizeLayout">
        <form class="form-inline" role="form" id="search">
            <div class="form-group">
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">组别</div>
                    <tags:searchDataDict className="form-control" name="groupCode" fieldType="string" dataDict="组别"  />
                </div>

                <div class="input-group input-group-sm">
                    <div class="input-group-addon">编号</div>
                    <tags:searchInput name="f.familyCode" fieldType="string" operator="like" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">姓名</div>
                    <tags:searchInput name="f.name" fieldType="string" operator="like" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">房屋坐落</div>
                    <tags:searchInput name="f.houseAddress" fieldType="string" operator="like" className="form-control"/>
                </div>
                <button type="submit" class="btn btn-primary btn-sm"><i class="fa fa-search"></i>&nbsp;查询</button>
            </div>
        </form>
    </div>
        <table class="table table-bordered table-hover">
            <thead>
            <tr>
                <th class="text-center" width="5%">序号</th>
                <th class="text-center">编号</th>
                <th class="text-center">组别</th>
                <th class="text-center">姓名</th>
                <th class="text-center">身份证号</th>
                <th class="text-center">房屋坐落</th>
                <th width="6%" class="text-center">查看</th>
            </tr>
            </thead>
            <c:forEach items="${pageInfo.result}" var="family" varStatus="status">
            <tr>
                <td class="text-center">${status.count}</td>
                <td class="text-center">${family.familyCode}</td>
                <td class="text-center"><tags:dataDict dataDict="组别" value="${family.groupCode}"/></td>
                <td class="text-center">${family.name}</td>
                <td class="text-center">${family.idCard}</td>
                <td class="text-left">${family.houseAddress}</td>
                <td class="text-center">
                    <a href="viewTableList?familyId=${family.id}"><i class="fa fa-big fa-eye"></i> 查看</a>
                </td>
            </tr>
            </c:forEach>
        </table>
        <tags:pageInfo/>
</div>
</body>
</html>