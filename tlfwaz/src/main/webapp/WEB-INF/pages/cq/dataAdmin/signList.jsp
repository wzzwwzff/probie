
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <title>签约状态更改</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="title">
    <h4 style="color: #0d88cc">签约状态更改</h4>
</div>
<div class="content">
    <div class="search_content resizeLayout">
        <form class="form-inline" role="form">
            <div class="form-group">
                <%@include file="/WEB-INF/pages/cq/common/search/searchFamily.jsp" %>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">签约状态：</div>
                    <tags:searchDataDict name="f.signStatus" className="form-control" fieldType="integer" dataDict="签约状态"/>
                </div>
                <button class="btn btn-primary btn-sm" type="submit"><i class="fa fa-search"></i> 查询</button>
                <button type="button" class="btn btn-sm btn-primary" onclick="location.reload();"><i
                        class="fa fa-refresh"></i>&nbsp;刷新
                </button>
            </div>
        </form>
    </div>

    <table class="table table-bordered table-hover table-striped">
        <thead>
        <tr>
            <th class="text-center" width="5%">序号</th>
            <th class="text-center">项目名称</th>
            <th class="text-center">地块</th>
            <th class="text-center">家庭编号</th>
            <th class="text-center">姓名</th>
            <th class="text-center">身份证号</th>
            <th class="text-center">房屋坐落</th>
            <th class="text-center">签约状态</th>
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
                <td class="text-center">${family.idCard}</td>
                <td class="text-center">${family.fwzl}</td>
                <td class="text-center">
                    <tags:dataDict dataDict="签约状态" value="${family.signStatus}" />
                </td>
                <td style="text-align: center;width: 20%">
                        <a onclick="szStatus(${family.id})" style="cursor:pointer"><i class="fa fa-edit"></i>设置未签约</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="footer resizeLayout"><tags:pageInfo/></div>
</div>
</body>
<script>
    function szStatus(familyId){
        if(confirm("确认设置为未签约吗")){
            $.get('configSignStatus', {familyId: familyId}, function (data) {
                if(data.code == "1111"){
                    alert("操作成功");
                    location.reload();
                }else{
                    alert("异常操作，请重试");
                }
            });
        }
    }
</script>
</html>
