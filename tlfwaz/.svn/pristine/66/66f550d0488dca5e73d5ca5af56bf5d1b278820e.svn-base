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
</head>
<body>
<div class="title"><h5>综合信息查看</h5></div>
<div class="content">
    <div class="resizeLayout">
        <%@include file="mainHead.jsp"%>
    </div>
    <div class="form-inline" id="form" style="margin-top: 120px;">
        <ul id="myTab" class="nav nav-tabs resizeLayout">
            <li class="active"><a href="javascript:void(0);" url="view">基础信息</a></li>
            <li><a href="javascript:void(0);" url="houseView">选房信息</a></li>
            <li><a href="javascript:void(0);" url="agreementView">协议信息</a></li>
            <li><a href="javascript:void(0);" url="financeView">财务信息</a></li>
        </ul>
        <!-- 显示输出内容能够 -->
        <div id="myTabContent">
        </div>
    </div>
</div>
<br/>
<div class="footer resizeLayout">
    <button type="button" class="btn btn-primary" onclick="history.back()"><i class="fa fa-backward"></i>&nbsp;返回
    </button>
</div>
<script>

    //调用显示方法内容
    function clickToShowContent(url) {
        $("#myTabContent").html("加载中，请稍后...");
        $.get(url, {familyId: "${family.id}", _time: new Date().getTime()}, function (html) {
            $("#myTabContent").html(html);
        });
    }
    //初始化显示内容，默认为li active第一个
    $(function () {
        var url = $("#myTab").children("li[class='active']").children("a").attr("url");
        clickToShowContent(url);
    });
    //绑定点击事件
    $("#myTab li a").click(function () {
        $("#myTab li").removeClass("active");
        $(this).parent().addClass("active");
        var url = $(this).attr("url");
        clickToShowContent(url);
    });
</script>
</body>
</html>
