<%--
  Created by IntelliJ IDEA.
  User: jmdf
  Date: 2018/9/5
  Time: 13:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <title>已有批次家庭列表</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="content">
    <div class="form-inline" id="hideCls" style="padding-bottom: 5px;">
    <ul class="nav nav-tabs">
        <li><a href="phoneHandList">批次电话通知管理</a></li>
        <li class="active"><a href="handed">已有批次家庭</a></li>
    </ul>
</div>
    <div class="search_content resizeLayout">
        <div class="search_content resizeLayout" style="text-align: left;">
            <form class="form-inline" role="form">
                <div class="form-group">
                    <%--<tags:searchProject areaFlag="true" allFlag="true" className="form-control"/>--%>
                    <div class="input-group input-group-sm">
                        <div class="input-group-addon">家庭编号</div>
                        <tags:searchInput name="f.familyCode" fieldType="string" size="25" operator="like"
                                          className="form-control"/>
                    </div>
                    <div class="input-group input-group-sm">
                        <div class="input-group-addon">姓名</div>
                        <tags:searchInput name="f.name" fieldType="string" size="20" operator="like" className="form-control"/>
                    </div>
                    <div class="input-group input-group-sm">
                        <div class="input-group-addon">联系电话</div>
                        <tags:searchInput name="f.phone" fieldType="string" size="20" operator="like" className="form-control"/>
                    </div>
                    <div class="input-group input-group-sm">
                        <div class="input-group-addon">选房批次</div>
                        <tags:searchInput name="f.xfBatch" fieldType="integer" operator="eq" className="form-control"/>
                    </div>
                    <div class="input-group input-group-sm">
                        <div class="input-group-addon">选房批次区间</div>
                        <tags:searchInput name="f.xfBatch" fieldType="integer" operator="ge" className="form-control"/><br/>
                    </div>
                    <div class="input-group input-group-sm">
                        <tags:searchInput name="f.xfBatch" fieldType="integer" operator="le" className="form-control"/><br/>
                    </div>
                    <div class="input-group input-group-sm">
                        <div class="input-group-addon">选房时间：</div>
                        <tags:searchInput name="f.xyXfDate" fieldType="date" operator="ge"/>
                        至
                        <tags:searchInput name="f.xyXfDate" fieldType="date" operator="le"/>
                    </div>
                    <button class="btn btn-primary btn-sm" type="submit"><i class="fa fa-search"></i> 查询</button>
                    <a href="excelPhoneHanded?<tags:searchParams />" class="btn btn-primary btn-sm"><i class="fa fa-file-excel-o"></i> 导出已有选房批次家庭</a>&nbsp;&nbsp;
                    <button type="button" class="btn btn-sm btn-primary" onclick="location.reload();"><i
                            class="fa fa-refresh"></i>&nbsp;刷新
                    </button>
                </div>
            </form>
        </div>
    </div>
    <table class="table table-bordered table-hover table-striped">
        <thead>
        <tr>
            <th class="text-center" width="5%">序号</th>
            <th class="text-center">项目名称</th>
            <th class="text-center">地块</th>
            <th class="text-center">家庭编号</th>
            <th class="text-center">姓名</th>
            <th class="text-center">联系电话</th>
            <th class="text-center">选房批次</th>
            <th class="text-center">选房时间</th>
            <th class="text-center">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pageInfo.result}" var="family" varStatus="status">
            <tr>
                <td class="text-center">${status.count}</td>
                <td class="text-center">${family.project.projectName}</td>
                <td class="text-center">${family.area.areaName}</td>
                <td class="text-center">${family.familyCode}</td>
                <td class="text-center">${family.name}</td>
                <td class="text-center">${family.phone}</td>
                <td class="text-center">${family.xfBatch}</td>
                <td class="text-center"><fmt:formatDate value="${family.xyXfDate}" pattern="yyyy-MM-dd"/></td>
                <td style="text-align: center;width: 20%">
                    <a href="/cq/common/view/main?familyId=${family.id}&<tags:searchParams></tags:searchParams>"><i class="fa fa-eye"></i>查看</a>&nbsp;
                    <a href="handedForm?familyId=${family.id}&<tags:searchParams></tags:searchParams>"><i class="fa fa-edit"></i>修改</a>&nbsp;
                    <a href='printXfFrame?familyId=${family.id}&${pageInfo.searchParams}' title="打印选房通知单"><i class="fa fa-print"></i>打印选房通知单&nbsp;
                    </a>
                    <a href='printHqFrame?familyId=${family.id}&${pageInfo.searchParams}' title="打印换签通知书"><i class="fa fa-print"></i>打印换签通知书
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="footer resizeLayout"><tags:pageInfo/></div>
</div>
</body>
</html>
