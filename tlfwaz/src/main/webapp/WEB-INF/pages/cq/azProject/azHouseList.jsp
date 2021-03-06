<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <title>安置房源管理</title>
    <%@include file="/static/common/common.jsp" %>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>
<body style="overflow: hidden;">
<div class="title">
    <h4>安置房源列表<span style="color: red">【项目:${project.projectName}】</span></h4>
</div>
<div class="content">
    <div class=" doc-contentInfo">
        <div class="search">
            <form class="form-inline" action="azHouseList">
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">楼号</div>
                    <tags:searchInput name="buildNum" fieldType="string" operator="like" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">单元</div>
                    <tags:searchInput name="unitNum" fieldType="string" operator="like" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">房号</div>
                    <tags:searchInput name="houseNum" fieldType="string" operator="like" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">户型</div>
                    <tags:searchDataDict name="houseType" dataDict="户型" fieldType="integer" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">房屋状态</div>
                    <tags:searchDataDict name="houseStatus" dataDict="房屋状态" fieldType="integer" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">入住状态</div>
                    <tags:searchDataDict name="rzStatus" dataDict="入住状态" fieldType="integer" className="form-control"/>
                </div>
                <input type="hidden" name="projectId" value="${project.id}">
                <button class="btn btn-primary btn-sm" type="submit"><i class="fa fa-search"></i> 查询</button>&nbsp;
                <a href="azhouseForm?projectId=${projectId}&${pageInfo.searchParams}" class="btn btn-primary btn-sm">
                    <i class="glyphicon glyphicon-plus"></i>登记房屋
                </a>&nbsp;
                <a href="plHouse?projectId=${projectId}" class="btn btn-primary btn-sm"><i class="fa fa-file-excel-o"></i>
                    批量导入数据
                </a>&nbsp;
                <a href="updateHouse?projectId=${projectId}" class="btn btn-primary btn-sm"><i class="fa fa-file-excel-o"></i>
                    批量更新实测面积
                </a>&nbsp;
                <button class="btn btn-primary btn-sm" type="button" onclick="location.href='azProjectList'"><i class="fa fa-backward"></i>
                    返回
                </button>
            </form>
        </div>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th style="text-align: center;" width="5%">序号</th>
                <th style="text-align: center;">项目名称</th>
                <th style="text-align: center;">楼号</th>
                <th style="text-align: center;">单元</th>
                <th style="text-align: center;">房号</th>
                <th style="text-align: center;">户型</th>
                <th style="text-align: center;">建筑面积（㎡）</th>
                <th style="text-align: center;">实测建筑面积（㎡）</th>
                <th style="text-align: center;">备注</th>
                <th style="text-align: center;">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${pageInfo.result}" var="house" varStatus="status">
                <tr>
                    <td class="text-center">${status.count+(pageInfo.pageNo-1)*pageInfo.pageSize}</td>
                    <td class="text-center">${house.azProject.projectName}</td>
                    <td class="text-center">${house.buildNum}</td>
                    <td class="text-center">${house.unitNum}</td>
                    <td class="text-center">${house.houseNum}</td>
                    <td class="text-center"><tags:dataDict dataDict="户型" value="${house.houseType}"/> </td>
                    <td class="text-center">${house.buildArea}</td>
                    <td class="text-center">${house.sjBuildArea}</td>
                    <td class="text-center">${house.memo}</td>
                    <td class="text-center">
                        <a href="azhouseView?projectId=${house.azProject.id}&houseId=${house.id}"><i class="fa fa-eye"></i>查看</a>&nbsp;&nbsp;
                        <a href="azhouseForm?projectId=${house.azProject.id}&houseId=${house.id}">
                            <i class="fa fa-edit"></i>修改
                        </a>&nbsp;&nbsp;
                        <a href="javascript:delMsg(${house.id})"><i class="a fa-big fa-remove"></i>删除</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<div class="footer resizeLayout">
    <tags:pageInfo/>
</div>
<script>
    //删除房源
    function delMsg(houseId){
        if(confirm("确认删除此房屋信息吗?")){
            alert("删除成功");
            location.href="delazHouse?houseId="+houseId;
        }
    }
</script>
</body>
</html>