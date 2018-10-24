<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>历史记录查看</title>
    <%@include file="/static/common/common.jsp" %>
    <script>

        function clickToShowContent(url) {
            $("#myTabContent").html("加载中，请稍后...");
            $.get(url, {_time: new Date().getTime()}, function (html) {
                $("#myTabContent").html(html);
            });
        }


        function bindTab() {
            $("#myTab li a").click(function () {
                $("#myTab li").removeClass("active");
                $(this).parent().addClass("active");
                var url = $(this).attr("url");

                clickToShowContent(url);
            });
        }

        $(function () {
            var url = $("#myTab").children("li[class='active']").children("a").attr("url");
            clickToShowContent(url);
        });

        $(function () {
            bindTab();
        });
    </script>

</head>
<body style="overflow: hidden;">
<div class="title resizeLayout">
    <h5>历史信息查看　(姓名：${family.name})</h5>
</div>
<div class="content resizeLayout">
    <input type="hidden" name="historyInfoId" value="${historyInfoId}"/>
    <ul class="nav nav-tabs" id="myTab">
        <c:if test="${datePhase eq 1}">
            <li class="active"><a href="javascript:void(0);" url="contrast?historyInfoId=${historyInfoId}">家庭信息</a>
            </li>
        </c:if>
        <c:if test="${datePhase eq 2}">
            <li class="active"><a href="javascript:void(0);" url="contractView?historyInfoId=${historyInfoId}">合同信息</a></li>
        </c:if>
    </ul>
</div>
<div class="content" style="border: 0;">
    <div id="myTabContent" class="data_table_height_auto"></div>
</div>
<div class="footer resizeLayout">
    <button class="btn btn-white" type="button" onclick="history.back()"><i class="fa fa-backward"></i>&nbsp;返回
    </button>
</div>
</body>
</html>
