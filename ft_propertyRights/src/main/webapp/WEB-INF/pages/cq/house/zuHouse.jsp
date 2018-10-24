<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>转租信息登记</title>
    <%@include file="/static/common/common.jsp" %>
    <link rel="stylesheet" href="${ctx}/static/plugin/zTree_v3-master/css/zTreeStyle/zTreeStyle.css">
    <script src="${ctx}/static/plugin/zTree_v3-master/js/jquery.ztree.core.js"></script>
    <style>
        html, body {
            background: #f3f3f4;
            margin: 0;
            padding: 0;
        }
    </style>
</head>
<body>
<div class="content" style=" background: #f3f3f4;">
    <ul class="nav nav-tabs">
        <li class="active">
            <a href="zuHouse">转租信息登记</a>
        </li>
        <li>
            <a href="turnzuList">转租信息列表</a>
        </li>
    </ul>
    <table style="width: 100%;">
        <tr>
            <td style="vertical-align: top;width: 210px;">
                <div class="clients-list">
                    <span id="loadFamily"><img src="/static/image/loading.gif"/>信息加载中...</span>
                    <ul id="treeFamily" class="ztree"></ul>
                </div>
            </td>
            <td style="vertical-align: top;padding-left: 10px;">
                <div id="message" class="alert alert-warning fade in">
                    请选择左侧房源
                </div>
                <div class="clients-list" id="content_cata">
                </div>
            </td>
        </tr>
    </table>
</div>
<script type="text/javascript">
    var zTree;
    $(document).ready(function () {
        initTree();
    });

    var setting = {
        async: {
            enable: true
        },
        callback: {
            beforeAsync: beforeAsync,
            onAsyncSuccess: onAsyncSuccess,
            onClick: onClick
        },
        view: {
            nameIsHTML: true
        }
    };

    function initTree(){
        setting.async.url="dataJson";
        $.fn.zTree.init($("#treeFamily"), setting);
        zTree = $.fn.zTree.getZTreeObj("treeFamily");
    }

    var buildNum;
    var id;
    function onClick() {
        var nodes = zTree.getSelectedNodes();
        if (nodes.length > 0) {
            id = nodes[0].id;//id
            if (id == null || id == "")
                return;
            buildNum = nodes[0].name.substring(0,nodes[0].name.length-2);
            loadBuildNumInfo();
        }
    }

    function addOrEdit(id, num,opMemo,houseId) {//打开弹出层
        var nodes = zTree.getSelectedNodes();
        var projectId = nodes[0].id;//项目id
        $.get("houseMsg",{houseId:houseId,projectId:projectId},function(data){
            $("#myModalBodayy").html(data);
            $("#myModall").modal({backdrop: false});
        });
    }

    function loadBuildNumInfo() {//加载楼盘图
        var url = "loadBuildPic";
        $.get(url,{id:id,buildNum:buildNum},function(data){
            $("#content_cata").html(data);
        });
    }

    function beforeAsync() {
        $("#loadFamily").show();
    }
    function onAsyncSuccess() {
        $("#loadFamily").hide();
    }
</script>
</body>
</html>