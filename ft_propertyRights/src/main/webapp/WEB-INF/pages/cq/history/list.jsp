<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>历史记录列表</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="title">
    <h5>历史记录列表</h5>
</div>
<div class="content">
    <div class="search_content resizeLayout">
        <form class="form-inline" role="form" id="search">
            <div class="form-group">
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">项目名称：</div>
                    <tags:searchDataDict name="projectName" className="form-control" fieldType="string" dataDict="项目名称"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">申请编号</div>
                    <tags:searchInput name="familyCode" className="form-control" fieldType="string" operator="like"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">姓名</div>
                    <tags:searchInput name="name" className="form-control" fieldType="string" operator="like"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">证件号码</div>
                    <tags:searchInput name="idCard" className="form-control" fieldType="string" operator="like"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">学历信息</div>
                    <tags:searchDataDict name="education" className="form-control" fieldType="integer" dataDict="学历层次"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">申请日期</div>
                    <tags:searchInput name="applyDate" fieldType="date" operator="ge" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">至</div>
                    <tags:searchInput name="applyDate" fieldType="date" operator="lt" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">婚姻状况</div>
                    <tags:searchDataDict name="marryStatus" className="form-control" fieldType="integer" dataDict="婚姻状况"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">数据状态</div>
                    <tags:searchDataDict name="dataStatus" className="form-control" fieldType="integer" dataDict="数据状态"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">家庭类型</div>
                    <tags:searchDataDict name="familyType" className="form-control" fieldType="integer" dataDict="家庭类型"/>
                </div>
                <button type="submit" class="btn btn-sm btn-primary"><i class="fa fa-search"></i> 查询</button>&nbsp;&nbsp;
            </div>
        </form>
    </div>
    <table class="table table-bordered table-hover table-striped">
        <thead>
        <tr>
            <th class="text-center" width="5%">序号</th>
            <th class="text-center">项目名称</th>
            <th class="text-center">申请编号</th>
            <th class="text-center">申请人</th>
            <th class="text-center">申请日期</th>
            <th class="text-center">家庭类型</th>
            <th class="text-center">学历信息</th>
            <th class="text-center">婚姻状况</th>
            <th class="text-center">数据状态</th>
            <th class="text-center">操作</th>
        </tr>
        </thead>
        <c:forEach items="${pageInfo.result}" var="family" varStatus="status">
            <tr>
                <td class="text-center">${status.count}</td>
                <td style="text-align: center;"><tags:dataDict dataDict="项目名称" value="${family.projectName}" /></td>
                <td class="text-center">${family.familyCode}</td>
                <td class="text-center">${family.name}</td>
                <td class="text-center"><fmt:formatDate value="${family.applyDate}" pattern="yyyy年MM月dd日"/></td>
                <td class="text-center"><tags:dataDict dataDict="家庭类型" value="${family.familyType}"/> </td>
                <td class="text-center">
                    <tags:dataDict dataDict="学历层次" value="${family.education}"/>
                </td>
                <td class="text-center"><tags:dataDict dataDict="婚姻状况" value="${family.marryStatus}"/> </td>
                <td class="text-center"><tags:dataDict dataDict="数据状态" value="${family.dataStatus}"/> </td>
                <td class="text-center">
                    <a href='historyList?familyId=${family.id}&<tags:searchParams/>' title="查看"><i
                            class="fa fa-eye"></i>&nbsp;查看</a>&nbsp;&nbsp;
                </td>
            </tr>
        </c:forEach>
    </table>
    <div class="footer resizeLayout"><tags:pageInfo/></div>
</div>
</body>
</html>