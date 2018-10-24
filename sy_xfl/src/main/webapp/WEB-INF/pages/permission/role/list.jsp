<%@ page import="java.util.List" %>
<%@ page import="com.app.permission.model.Role" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<HEAD>
    <TITLE>角色管理</TITLE>
    <%@include file="/static/common/common.jsp"%>
</HEAD>
<BODY>
<DIV class="title"><h5>角色管理</h5></DIV>
<DIV class="content">
    <c:if test="${not empty message}">
        <div id="message" class="alert alert-success">
            <button data-dismiss="alert" class="close">×</button>
                ${message}
        </div>
    </c:if>
    <div class="search">
        <input type="button" class="btn btn-sm btn-primary" onclick="addOrEdit(0)" value="添加角色">
    </div>
    <table class="table table-bordered table-hover">
        <thead>
        <tr>
            <th class="text-center" width="4%">序号</th>
            <th class="text-center" width="15%">角色名称</th>
            <th class="text-center" width="20%">角色描述</th>
            <th class="text-center" width="10%">是否有效</th>
            <th class="text-center" width="5%">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="role" items="${roleList}" varStatus="i">
            <tr>
                <td class="text-center">${i.index+1}</td>
                <td class="text-center" style="cursor: pointer;" onclick="roleInfo(${role.id});">${role.roleName}</td>
                <td class="text-center">${role.roleDescription}</td>
                <td class="text-center">
                    <c:if test="${role.activeFlag==0}"><font color="red">无效</font></c:if>
                    <c:if test="${role.activeFlag==1}">有效</c:if>
                </td>
                <td class="text-center">
                    <a href="javascript:addOrEdit(${role.id})"><img src="/static/image/edit.gif"></a>
                    <a href="javascript:deleteData(${role.id})"><img src="/static/image/delete.gif"></a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel"></h4>
                </div>
                <div class="modal-body" id="myModalBoday">加载中...</div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" onclick="$('#inputForm').submit();">确定</button>
                </div>
            </div>
        </div>
    </div>
    <script>
        function addOrEdit(id) {
            //打开弹出层
            $("#myModal").modal({backdrop:false});
            $("#myModalLabel").html("");
            $("#myModalBoday").html("加载中...");
            var url = "form?id=" + id + "&${pageInfo.searchParams}";
//            location.href=url;
            $.get(url, {datetime: new Date().getTime()}, function (data) {
                $("#myModalBoday").html(data);
            });
        }
    </script>
</DIV>
</BODY>
</HTML>


