<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>综合信息查看</title>
    <%@include file="/static/common/common.jsp" %>
    <link href="/static/plugin/uploadify/uploadify.css" rel="stylesheet" type="text/css"/>
    <script src="/static/plugin/uploadify/jquery.uploadify.min.js"></script>
    <link rel="stylesheet" href="/static/plugin/powerful-album-view/dist/viewer.css">
    <style>
        .footer2 {
            text-align: center;
            position: fixed;
            width: 100%;
            bottom: 0px;
            left: 0px;
            right: 0px;
            color: inherit;
            border: 1px solid #e7eaec;
            background: #f5f5f6;
            padding: 8px 0 5px 0;
        }
    </style>
</head>
<body>
<div class="title"><h5>综合信息查看</h5></div>
<div class="content">
    <div class="resizeLayout">
        <%@include file="mainHead.jsp" %>
    </div>
    <div class="form-inline" id="form" style="margin-top: 120px;">
        <ul class="nav nav-tabs resizeLayout" style="margin-bottom: 10px;">
            <li role="presentation" class="active"><a href="javascript:void(0);" aid="view1">基本信息</a></li>
            <li role="presentation"><a href="javascript:void(0);" aid="view2">交房信息</a></li>
            <li role="presentation"><a href="javascript:void(0);" aid="view3">拆除信息</a></li>
        </ul>
        <div class="view" id="view1">
            <%@include file="rhView.jsp" %>
        </div>
        <div class="view" id="view2">
            <%@include file="jfView.jsp" %>
        </div>
        <div class="view" id="view3">
            <%@include file="ccView.jsp" %>
        </div>
        <div class="footer2 resizeLayout">
            <button class="btn btn-primary btn-sm" type="button" onclick="history.back()"><i class="fa fa-backward"></i>&nbsp;返回
            </button>
        </div>
    </div>
</div>
<script>
    function init(aid) {
        //注意方法的()
        $(".view").hide();
        var a = $("a[aid='" + aid + "']");
        $("li[role='presentation']").removeClass("active");
        a.parent().addClass("active");
        $("#" + aid).show();

    }
    init("view${empty viewIndex ? 1 : viewIndex}")
    $(".nav li a").click(function () {
        var aid = $(this).attr("aid");
        init(aid);
    });

    $(function () {
        $("#form").validate({});
    });

</script>
</body>
</html>
