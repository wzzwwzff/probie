<%--
  Created by IntelliJ IDEA.
  User: jmdf
  Date: 2018/8/27
  Time: 14:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>非宅数据管理列表</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="title">
    <h5>非宅数据管理列表</h5>
</div>
<div class="content">
    <div class="search_content resizeLayout">
        <form class="form-inline" role="form" id="search">
            <div class="form-group">
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">组别</div>
                    <tags:searchDataDict className="form-control" name="groupCode" fieldType="string" dataDict="非宅组别"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">编号</div>
                    <tags:searchInput name="familyCode" fieldType="string" operator="like" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">被拆迁人</div>
                    <tags:searchInput name="name" fieldType="string" operator="like" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">坐落</div>
                    <tags:searchInput name="address" fieldType="string" operator="like"
                                      className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">签约状态</div>
                    <tags:searchDataDict className="form-control" name="qyState" fieldType="integer" dataDict="签约状态"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">地块位置</div>
                    <tags:searchInput name="dkAddress" fieldType="string" operator="like"
                                      className="form-control"/>
                </div>
                <button type="submit" class="btn btn-sm btn-primary"><i class="fa fa-search"></i> 查询</button>
                <button type="button" class="btn btn-sm btn-primary" onclick="location.href='form';">
                    <i class="fa fa-edit"></i>非宅数据登记
                </button>
            </div>
        </form>
    </div>


    <table class="table table-bordered table-hover table-striped">
        <thead>
        <tr>
            <th class="text-center" width="5%">序号</th>
            <th class="text-center">编号</th>
            <th class="text-center">组别</th>
            <th class="text-center">被拆迁人</th>
            <th class="text-center">坐落</th>
            <th class="text-center">签约状态</th>
            <th class="text-center">签约时间</th>
            <th class="text-center">登记时间</th>
            <th class="text-center">地块位置</th>
            <th class="text-center">操作</th>
        </tr>
        </thead>
        <c:forEach items="${pageInfo.result}" var="notFamily" varStatus="status">
            <tr>
                <td class="text-center">${status.count}</td>
                <td class="text-center">${notFamily.familyCode}</td>
                <td class="text-center"><tags:dataDict dataDict="非宅组别" value="${notFamily.groupCode}"/></td>
                <td class="text-center">${notFamily.name}</td>
                <td class="text-left">${notFamily.address}</td>
                <td class="text-center"><tags:dataDict dataDict="签约状态" value="${notFamily.qyState}" /></td>
                <td class="text-center"><fmt:formatDate value="${notFamily.qyDate}" pattern="yyyy-MM-dd" /></td>
                <td class="text-center"><fmt:formatDate value="${notFamily.addDate}" pattern="yyyy-MM-dd" /></td>
                <td class="text-center">${notFamily.dkAddress}</td>
                <td class="text-center">
                    <a href='view?notFamilyId=${notFamily.id}'
                       title="查看"><i class="fa fa-eye"></i>&nbsp;查看
                    </a>&nbsp;&nbsp;
                    <a href='/cq/notFamily/form?notFamilyId=${notFamily.id}&<tags:searchParams></tags:searchParams>' title="修改"><i class="fa fa-edit"></i>&nbsp;修改</a>&nbsp;&nbsp;
                    <a href="#" onclick="deleteNotFamily(${notFamily.id})"><i class="fa fa-times-circle"></i>&nbsp;删除</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <tags:pageInfo/>
</div>
</body>
<script>
    // 数据上报
    function deleteNotFamily(notFamilyId) {
        if (confirm("确定删除数据吗？")) {
            $.get("delNotFamily", {
                notFamilyId: notFamilyId,
                _date: new Date().getTime()
            }, function (data) {
                if (data.code == "0000") {
                    window.location.href = "list?<tags:searchParams/>";
                } else {
                    alert(data.message);
                    window.location.reload();
                }
            })
        }
    }
</script>
</html>
