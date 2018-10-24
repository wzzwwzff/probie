<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>基础数据查看</title>
    <%@include file="/static/common/common.jsp" %>
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
<div class="title resizeLayout">
    <h5>历史信息查看　(姓名：${name})</h5>
</div>
<div class="content resizeLayout">
    <ul class="nav nav-tabs resizeLayout" style="margin-bottom: 10px;">
        <li role="presentation" class="active"><a href="javascript:void(0);" aid="view1">入户信息</a></li>
        <li role="presentation"><a href="javascript:void(0);" aid="view2">测绘信息</a></li>
        <li role="presentation"><a href="javascript:void(0);" aid="view3">评估信息</a></li>
        <li role="presentation"><a href="javascript:void(0);" aid="view4">方案信息</a></li>
        <li role="presentation"><a href="javascript:void(0);" aid="view5">交房信息</a></li>
        <li role="presentation"><a href="javascript:void(0);" aid="view6">拆除信息</a></li>
    </ul>
    <div class="view" id="view1">
        <%@include file="/WEB-INF/pages/cq/common/view/rhHistroyView.jsp"%>
    </div>
    <div class="view" id="view2">
        <%@include file="/WEB-INF/pages/cq/common/view/chView.jsp"%>
    </div>
    <div class="view" id="view3">
        <%@include file="/WEB-INF/pages/cq/common/view/pgView.jsp"%>
    </div>
    <div class="view" id="view4">
        <%@include file="/WEB-INF/pages/cq/common/view/scheme.jsp"%>
    </div>
    <div class="view" id="view5">
        <%@include file="/WEB-INF/pages/cq/common/view/jfView.jsp"%>
    </div>
    <div class="view" id="view6" style="margin-bottom: 10px;">
        <%@include file="/WEB-INF/pages/cq/common/view/chView.jsp"%>
    </div>
</div>
<div class="footer2 resizeLayout">
    <button class="btn btn-primary btn-sm" type="button" onclick="history.back()"><i class="fa fa-backward"></i>&nbsp;返回
    </button>
</div>
<script>
    init("view${empty viewIndex ? 1 : viewIndex}")
    $(".nav li a").click(function () {
        var aid = $(this).attr("aid");
        init(aid);
    });

    function init(aid) {
        //注意方法的()
        $(".view").hide();
        var a = $("a[aid='" + aid + "']");
        $("li[role='presentation']").removeClass("active");
        a.parent().addClass("active");
        $("#" + aid).show();
    }
</script>
</body>
</html>
