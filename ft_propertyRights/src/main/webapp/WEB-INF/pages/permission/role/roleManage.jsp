<%@ page import="java.util.List" %>
<%@ page import="com.app.permission.model.Role" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    Integer roleId = (Integer) request.getAttribute("roleId");
    List<Role> roleList = (List) request.getAttribute("roleList");
%>
<!DOCTYPE html>
<HTML>
<HEAD>
    <TITLE>角色权限分配</TITLE>
    <%@include file="/static/common/common.jsp"%>
    <link rel="stylesheet" href="${ctx}/static/plugin/zTree_v3-master/css/zTreeStyle/zTreeStyle.css">
    <script src="${ctx}/static/plugin/zTree_v3-master/js/jquery.ztree.core.js"></script>
    <script src="${ctx}/static/plugin/zTree_v3-master/js/jquery.ztree.excheck.min.js"></script>
    <SCRIPT type="text/javascript">
        var setting = {
            check: {
                enable: true
            },
            async: {
                enable: true,
                url: "menuJson?roleId=<%=roleId%>"
            },
            callback: {
                beforeAsync: beforeAsync,
                onClick: onClick,
                onAsyncSuccess: onAsyncSuccess
            },
            view: {
                nameIsHTML: true
            }
        };
        function onClick() {
            $("#menuInfo").empty();
            $("#menuInfoLoad").show();
            var nodes = zTree.getSelectedNodes();
            if (nodes.length > 0) {
                var id = nodes[0].id;//id
                //菜单信息显示出来
                $.get('/permission/menu/menuInfo', {id: id, _time: new Date().getTime()},
                        function (data) {
                            $("#menuInfoLoad").hide();
                            $("#menuInfo").append(data);
                        }
                );
            }
        }
        function beforeAsync() {
            $("#load").show();
        }
        function onAsyncSuccess() {
            $("#load").hide();
        }

        var zTree, rMenu;
        $(document).ready(function () {
            $.fn.zTree.init($("#treeDemo"), setting);
            zTree = $.fn.zTree.getZTreeObj("treeDemo");
            rMenu = $("#rMenu");
            $("#menuInfoLoad").hide();
        });

        function selectRole() {
            location.href = "roleManage?roleId=" + $("#roleId").val();
        }

        function saveRoleMenu() {
            $("#saveWait").show();
            var roleId = "<%=roleId %>";
            if (roleId == 0 || roleId == "") {
                $("#saveWait").hide();
                bootstrapQ.msg({msg: "请选择角色", type: 'danger'});
                return;
            }
            var nodes = zTree.getCheckedNodes(true);
            var array = new Array();
            for (var i = 0; i < nodes.length; i++) {
                array.push(nodes[i].id);
            }
            /*
             if(array.length==0){
             $("#saveWait").hide();
             alert("请选择角色权限");
             return;
             }*/
            $.get("saveRoleMenu", {roleId: roleId, menuId: array.join(",")}, function (result) {
                $("#saveWait").hide();
                alert("保存成功");
                bootstrapQ.msg({msg: "保存成功", type: 'success'});
            });
        }
    </SCRIPT>
</HEAD>
<BODY>
<DIV class="title"><h5>角色权限分配</h5></DIV>
<DIV class="content">
    <div class="search">
        角色：
        <select name="roleId" id="roleId" onchange="selectRole();">
            <option value="">-请选择-</option>
            <%
                for (Role role : roleList) {
                    String selected = "";
                    if (role.getId().intValue() == roleId) {
                        selected = " selected";
                    }
                    out.println("<option value=\"" + role.getId() + "\" " + selected + ">" + role.getRoleName() + "</option>");
                }
            %>
        </select>&nbsp;&nbsp;
        <input type="button" name="button" class="btn btn-sm btn-primary" id="button" value="保 存" onclick="saveRoleMenu();">&nbsp;
        <span id="saveWait" style="display: none;"><img src="/static/image/loading.gif" align="absmiddle"/></span>
    </div>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th width="30%">功能菜单</th>
            <th>菜单详情</th>
        </tr>
        </thead>
        <tbody>
        <tr bgcolor="#ffffff">
            <td valign="top">
                <span id="load"><img src="/static/image/loading.gif" align="absmiddle"/>信息加载中...</span>
                <ul id="treeDemo" class="ztree"></ul>
            </td>
            <td valign="top">
                <span id="menuInfoLoad"><img src="/static/image/loading.gif" align="absmiddle"/>信息加载中...</span>
                <span id="menuInfo"></span>
            </td>
        </tr>
        </tbody>
    </table>
</div>
</BODY>
</HTML>
