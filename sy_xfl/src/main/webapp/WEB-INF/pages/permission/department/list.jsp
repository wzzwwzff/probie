<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<HTML>
<HEAD>
    <TITLE>部门管理</TITLE>
    <%@include file="/static/common/common.jsp"%>
    <link rel="stylesheet" href="${ctx}/static/plugin/zTree_v3-master/css/zTreeStyle/zTreeStyle.css">
    <script src="${ctx}/static/plugin/zTree_v3-master/js/jquery.ztree.core.js"></script>
    <SCRIPT type="text/javascript">
        var setting = {
            async: {
                enable: true,
                url: "departmentJson"
            },
            callback: {
                beforeAsync: beforeAsync,
                onAsyncSuccess: onAsyncSuccess,
//                onClick: onClick,
                onRightClick: OnRightClick
            },
            view: {
                nameIsHTML: true
            }
        };
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
            $.fn.zTree.init($("#treeDepartment"), setting);
            zTree = $.fn.zTree.getZTreeObj("treeDepartment");
            rMenu = $("#rMenu");
            $("#menuInfoLoad").hide();
        });

        //添加下级部门
        function addDepartment() {
            hideRMenu();
            var nodes = zTree.getSelectedNodes();
            if (nodes.length > 0) {
                var id = nodes[0].id;
                addOrEdit(id, 0);
            }
        }
        //修改部门信息
        function editDepartment() {
            hideRMenu();
            var nodes = zTree.getSelectedNodes();
            if (nodes.length > 0) {
                var id = nodes[0].id;
                addOrEdit(0, id);
            }
        }

        function deleteDepartment() {
            hideRMenu();
            var nodes = zTree.getSelectedNodes();
            if (nodes.length > 0) {
                var id = nodes[0].id;
                deleteData(id);
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
<BODY  oncontextmenu="self.event.returnValue=false">
<DIV class="title"><h5>部门管理</h5></DIV>
<div class="content">
    <ul id="treeDepartment" class="ztree"><img src="/static/image/loading.gif"/>信息加载中...</ul>
    <div id="rMenu">
        <ul>
            <li id="m_add" onclick="addDepartment();">添加下级部门</li>
            <li id="m_del" onclick="editDepartment();">修改</li>
            <li id="m_check" onclick="deleteDepartment();">删除</li>
            <li id="m_check" onclick="changeDepartment();">调整部门至</li>
        </ul>
    </div>
    <div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">部门信息登记</h4>
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
        function addOrEdit(parentId, id) {
            //打开弹出层
            $("#myModal").modal({backdrop:false});
            $("#myModalBoday").html("加载中...");
            var url = "form";
//            location.href = url + "?parentId=" + parentId + "&id=" + id;
            $.get(url, {parentId: parentId, id: id, datetime: new Date().getTime()}, function (data) {
                $("#myModalBoday").html(data);
            });
        }
    </script>
</div>
</BODY>
</HTML>
