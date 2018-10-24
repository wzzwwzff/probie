<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>历史记录列表</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="title">
    <h5> 历史记录列表</h5>
</div>
<div class="search_content resizeLayout">
    <form class="form-inline" role="form" id="search">
        <div class="form-group">
            <div class="input-group input-group-sm">
                <div class="input-group-addon">操作类型</div>
                <tags:searchDataDict name="h.dataPhase" fieldType="integer" dataDict="操作类型" className="form-control"/>
            </div>
            <input type="hidden" name="familyId" id="familyId" value="${familyId}"/>
            <button type="submit" class="btn btn-primary btn-sm"><i class="fa fa-search"></i>&nbsp;查询</button>
        </div>
    </form>
</div>
<div class="content">
    <div class="search form-inline">
        <table class="table table-bordered table-hover table-striped">
            <thead>
            <tr>
                <th class="text-center" width="5%">序号</th>
                <th class="text-center">操作电脑IP</th>
                <th class="text-center">操作用户名</th>
                <th class="text-center">操作时间</th>
                <th class="text-center">操作类型</th>
                <th width="15%" class="text-center">查看</th>
            </tr>
            </thead>
            <c:forEach items="${pageInfo.result}" var="historyInfo" varStatus="status">
                <tr>
                    <td class="text-center">${status.count}</td>
                    <td class="text-center">${historyInfo.computerId}</td>
                    <td class="text-center">${historyInfo.operatePerson}</td>
                    <td class="text-center">${historyInfo.operateDate}</td>
                    <td class="text-center"><tags:dataDict dataDict="操作类型" value="${historyInfo.dataPhase}"/></td>
                    <td class="text-center">
                        <a href="view?historyInfoId=${historyInfo.id}&familyId=${historyInfo.familyId}&datePhase=${historyInfo.dataPhase}&${pageInfo.searchParams}"><i
                                class="fa fa-big fa-eye"></i> 查看</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="footer resizeLayout">
        <button class="btn btn-primary btn-sm" type="button" onclick="history.back()"><i class="fa fa-backward"></i>&nbsp;返回
        </button>
    </div>
</div>
</body>
</html>