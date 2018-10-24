<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <title>共有产权楼号列表</title>
    <%@include file="/static/common/common.jsp" %>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>
<body style="overflow: hidden;">
<div class="title">
    <h3>楼栋列表<span style="color: red">【项目:${project.projectName}】</span></h3>
</div>
<div class="content">
    <div class=" doc-contentInfo" style="position: relative;padding-left: 20px;padding-right: 20px;">
        <div class="search-form form-inline form-group-sm resizeLayout">
            <div style="float: left">
                <form class="form-inline" role="form" id="search">
                    <div class="form-group">
                        <button href="#" class="btn btn-primary btn-sm"><i class="fa fa-file-excel-o"></i>批量导入数据</button>&nbsp;
                        <button class="btn btn-primary btn-sm" type="button" onclick="location.href='projectList'"><i
                                class="fa fa-backward"></i> 返回
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <table class="table table-bordered table-hover table-striped">
            <thead>
            <tr>
                <th style="text-align: center;" width="5%">序号</th>
                <th style="text-align: center;">项目名称</th>
                <th style="text-align: center;">楼号</th>
                <th style="text-align: center;">房源总套数</th>
                <th style="text-align: center;">已分配套数</th>
                <th style="text-align: center;">剩余套数</th>
                <th style="text-align: center;">房源管理</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="house" varStatus="status">
                <tr>
                    <td class="text-center">${status.count}</td>
                    <td class="text-center">${project.projectName}</td>
                    <td class="text-center">${house.buildNum}</td>
                    <!-----------------套数明细--------------------->
                    <td class="text-center">${allCount}</td>
                    <td class="text-center">${signed}</td>
                    <td class="text-center">${allCount-signed}</td>
                    <td style="text-align: center;"><a href="houseList?projectId=${project.id}&houseId=${house.id}"><i class="fa fa-edit"></i>房源管理</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>