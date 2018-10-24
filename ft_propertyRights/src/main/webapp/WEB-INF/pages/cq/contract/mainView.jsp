<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <title>综合信息查看</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="content">
<div class="form-inline" id="form">
    <ul class="nav nav-tabs resizeLayout" style="margin-bottom: 10px;">
        <li role="presentation" class="active"><a href="javascript:void(0);" aid="view1" style="font-size: 15px;">家庭信息查看</a></li>
        <li role="presentation"><a href="javascript:void(0);" aid="view2" style="font-size: 15px;">合同信息查看</a></li>
    </ul>
    <div class="view" id="view1">
        <%@include file="../family/view.jsp" %>
    </div>
    <div class="view" id="view2">
        <%@include file="view.jsp" %>
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
        $(".headTitle").attr("hidden","hidden");

    }
    init("view${empty viewIndex ? 1 : viewIndex}")
    $(".nav li a").click(function () {
        var aid = $(this).attr("aid");
        init(aid);
    });

//    $(function () {
//        $("#form").validate({});
//    });

</script>
</body>
</html>