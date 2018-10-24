<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<HTML>
<HEAD>
    <TITLE>菜单管理</TITLE>
    <%@include file="/static/common/common.jsp"%>
    <link rel="stylesheet" href="${ctx}/static/plugin/zTree_v3-master/css/zTreeStyle/zTreeStyle.css">
    <script src="${ctx}/static/plugin/zTree_v3-master/js/jquery.ztree.core.js"></script>
    <SCRIPT type="text/javascript">
        var setting = {
            async: {
                enable: true,
                url: "menuJson"
            },
            callback: {
                beforeAsync: beforeAsync,
                onAsyncSuccess: onAsyncSuccess,
                onClick: onClick,
                onRightClick: OnRightClick
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
                var url="/permission/menu/manager?id="+id+"&_time="+new Date().getTime();
                $("#iframepage").attr("src",url);
            }
        }
        function beforeAsync() {
            $("#load").show();
        }
        function onAsyncSuccess() {
            $("#load").hide();
        }
        function OnRightClick(event, treeId, treeNode) {
            if (!treeNode && event.target.tagName.toLowerCase() != "button" && $(event.target).parents("a").length == 0) {
                zTree.cancelSelectedNode();
                showRMenu("root", event.clientX, event.clientY);
            } else if (treeNode && !treeNode.noR) {
                zTree.selectNode(treeNode);
                showRMenu("node", event.clientX, event.clientY);
            }
        }

        function showRMenu(type, x, y) {
            $("#rMenu ul").show();
            if (type == "root") {
                $("#m_del").hide();
                $("#m_check").hide();
                $("#m_unCheck").hide();
            } else {
                $("#m_del").show();
                $("#m_check").show();
                $("#m_unCheck").show();
            }
            rMenu.css({"top": y + "px", "left": x + "px", "visibility": "visible"});

            $("body").bind("mousedown", onBodyMouseDown);
        }

        function hideRMenu() {
            if (rMenu) rMenu.css({"visibility": "hidden"});
            $("body").unbind("mousedown", onBodyMouseDown);
        }
        function onBodyMouseDown(event) {
            if (!(event.target.id == "rMenu" || $(event.target).parents("#rMenu").length > 0)) {
                rMenu.css({"visibility": "hidden"});
            }
        }

        var zTree, rMenu;
        $(document).ready(function () {
            $.fn.zTree.init($("#treeDemo"), setting);
            zTree = $.fn.zTree.getZTreeObj("treeDemo");
            rMenu = $("#rMenu");
            $("#menuInfoLoad").hide();
        });

        //添加下级菜单
        function addMenu() {
            hideRMenu();
            var nodes = zTree.getSelectedNodes();
            if (nodes.length > 0) {
                var id = nodes[0].id;
                addOrEdit(id, "");
            }
        }
        function editMenu() {
            hideRMenu();
            var nodes = zTree.getSelectedNodes();
            if (nodes.length > 0) {
                var id = nodes[0].id;
                addOrEdit("", id);
            }
        }

        function deleteMenu() {
            hideRMenu();
            if (confirm("确认删除当前菜单吗？")) {
                var nodes = zTree.getSelectedNodes();
                if (nodes.length > 0) {
                    var id = nodes[0].id;
                    $.get("deleteMenu.do", {id: id}, function (result) {
                        if (result.success == "true") {
                            zTree.reAsyncChildNodes(null, "refresh", true);
                        }else{
                            alert(result.message);
                        }
                    });
                }
            }
        }

    </SCRIPT>
    <style type="text/css">
        div#rMenu {
            position: absolute;
            visibility: hidden;
            top: 0;
            background-color: #cccccc;
            text-align: left;
            padding: 2px;
        }

        div#rMenu ul li {
            margin: 0px 0px;
            padding: 4px 5px;
            cursor: pointer;
            list-style: none outside none;
            background-color: #ffffff;
        }

        ul, li {
            margin: 0;
            padding: 0;
        }
    </style>
</HEAD>
<BODY oncontextmenu="self.event.returnValue=false">
<DIV class="title"><h5>菜单管理</h5></DIV>
<DIV class="content">
    <c:if test="${not empty message}">
        <div id="message" class="alert alert-success">
            <button data-dismiss="alert" class="close">×</button>
                ${message}
        </div>
    </c:if>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th class="text-center" width="20%">菜单</th>
            <th class="text-center" width="80%">菜单详情</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td class="text-left" valign="top">
                <%--			<div style="text-align: left;width: 100%;border:1px solid #ccc;width:99%;" >--%>
                <span id="load"><img src="/static/image/loading.gif"/>信息加载中...</span>
                <ul id="treeDemo" class="ztree"></ul>
                <%--			</div>--%>
            </td>
            <td class="text-center" valign="top">
                <iframe src="" marginheight="0" marginwidth="0" frameborder="0" scrolling="yes" width="100%" height="100%"  id="iframepage" name="iframepage" ></iframe>
                <script>
                    $(function(){
                        $("#iframepage").load(function(){
                            $(this).height($(document.body).height()-200);
                        });
                    });
                    $(window).resize(function () {          //当浏览器大小变化时
                        $("#iframepage").height($(document.body).height()-200);
                    });
                </script>
            </td>
        </tr>
        </tbody>
    </table>
    <div id="rMenu">
        <ul>
            <li id="m_add" onclick="addMenu();">添加下级菜单</li>
            <li id="m_del" onclick="editMenu();">修改</li>
            <li id="m_check" onclick="deleteMenu();">删除</li>
        </ul>
    </div>
    <div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">菜单信息登记</h4>
                </div>
                <div class="modal-body" id="myModalBoday">加载中...</div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal" id="queryBtn">确定</button>
                </div>
            </div>
        </div>
    </div>
    <script>
        function addOrEdit(parentId, id) {
            //打开弹出层
            if(id==0){
                $("#myModalLabel").html("菜单信息登记");
            }else{
                $("#myModalLabel").html("菜单信息修改");
            }
            $("#myModal").modal({backdrop:false});
            $("#myModalBoday").html("加载中...");
            var url = "form";
//            location.href = url + "?parentId=" + parentId + "&id=" + id;
            $.get(url, {parentId: parentId, id: id, datetime: new Date().getTime()}, function (data) {
                $("#myModalBoday").html(data);
            });
            $("#queryBtn").click(function(data){
                $('#inputForm').submit();
            });
        }
    </script>
</DIV>
</BODY>
</HTML>
