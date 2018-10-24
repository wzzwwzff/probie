<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>桌面文件目录列表</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="title">
    <h5>桌面文件目录列表</h5>
</div>
<div class="content">
    <div class="search_content resizeLayout">
        <form class="form-inline" role="form" id="search">
            <div class="form-group">
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">是否有效</div>
                    <tags:searchDataDict className="form-control" name="able" fieldType="integer" dataDict="是否"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">目录名称</div>
                    <tags:searchInput name="name" fieldType="string" size="50" operator="like" className="form-control"/>
                </div>
                <button type="submit" class="btn btn-sm btn-primary"><i class="fa fa-search"></i>查询</button>
                <button type="button" class="btn btn-sm btn-primary" onclick="location.href='deskCatalogForm';">
                    <i class="fa fa-pencil"></i>添加新目录
                </button>
            </div>
        </form>
    </div>

</div>
<table class="table table-bordered table-hover table-striped">
    <thead>
    <tr>
        <th class="text-center" width="5%">序号</th>
        <th class="text-center">目录名称</th>
        <th class="text-center">目录创建日期</th>
        <th class="text-center">排序号</th>
        <th class="text-center">是否有效</th>
        <th class="text-center">操作</th>
    </tr>
    </thead>
    <c:forEach items="${pageInfo.result}" var="deskCatalog" varStatus="status">
        <tr>
            <td class="text-center">${status.count+(pageInfo.pageNo-1)*pageInfo.pageSize}</td>
            <td class="text-center">${deskCatalog.name}</td>
            <td class="text-center"><fmt:formatDate value="${deskCatalog.createDate}" pattern="yyyy年MM月dd日"/></td>
            <td class="text-center">${deskCatalog.number}</td>
            <td class="text-center"><tags:dataDict dataDict="是否" value="${deskCatalog.able}"/></td>
            <td class="text-center">
                <button onclick="location.href='deskFileForm?cataId=${deskCatalog.id}'" type="button" class="btn btn-xs btn-primary" title="添加文件"><i class="fa fa-plus"></i>&nbsp;添加文件</button>&nbsp;&nbsp;
                <button onclick="location.href='deskCatalogForm?cataId=${deskCatalog.id}&<tags:searchParams/>'" type="button" class="btn btn-xs btn-warning" title="修改"><i class="fa fa-edit"></i>&nbsp;修改</button>&nbsp;&nbsp;
                <button onclick="javascript:deleteDeskCataLog(${deskCatalog.id})" type="button" class="btn btn-xs btn-danger" title="删除"><i class="fa fa-remove"></i>&nbsp;删除</button>
            </td>
        </tr>
    </c:forEach>
</table>
<tags:pageInfo/>
</body>
<script>
    function deleteDeskCataLog(cataId){
        if (confirm("确定要将该桌面目录删除吗？\r\r注：删除后数据将不能找回！")){
            $.get("deleteDeskCataLog",{cataId:cataId,_date:new Date().getTime()},function(data){
                if (data.success == "true"){
                    window.location.reload();
                }else {
                    alert(data.message);
                }
            })
        }
    }
</script>
</html>
