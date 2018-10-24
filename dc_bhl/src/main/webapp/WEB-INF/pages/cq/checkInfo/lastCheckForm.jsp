<%--
  Created by IntelliJ IDEA.
  User: jmdf
  Date: 2018/9/19
  Time: 9:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.app.cq.en.CheckState" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <title>数据终审</title>
    <%@include file="/static/common/common.jsp" %>
    <script src="/static/bigDecimal/BigDecimal-all-last.min.js" type="text/javascript"></script>
</head>
<body>
<div class="title"><h4>数据终审页面【${family.name}，当前状态：(<span style="color: red">终审</span>)<tags:dataDict dataDict="初审状态" value="${family.lastCheckStatus}" />】</h4></div>
<div class="content">
    <div class="form-inline" id="form" style="margin-top: 5px;">
        <ul class="nav nav-tabs resizeLayout" style="margin-bottom: 10px;">
            <li role="presentation" class="active"><a href="javascript:void(0);" aid="view1">入户信息</a></li>
            <li role="presentation" class="active"><a href="javascript:void(0);" aid="view2">评估信息</a></li>
            <li role="presentation" class="active"><a href="javascript:void(0);" aid="view3">测绘信息</a></li>
            <li role="presentation" class="active"><a href="javascript:void(0);" aid="view4">安置选择参考单</a></li>
            <li role="presentation" class="active"><a href="javascript:void(0);" aid="view5">补偿协议</a></li>
            <li role="presentation" class="active"><a href="javascript:void(0);" aid="view6">补充协议</a></li>
        </ul>
        <div class="view" id="view1">
            <%@include file="/WEB-INF/pages/cq/family/common/view/rhView.jsp"%>
        </div>
        <div class="view" id="view2">
            <%@include file="/WEB-INF/pages/cq/family/common/view/pgView.jsp"%>
        </div>
        <div class="view" id="view3">
            <%--<%@include file="#"%>--%>
        </div>
        <div class="view" id="view4">
            <%@include file="/WEB-INF/pages/cq/family/common/view/accountView.jsp"%>
        </div>
        <div class="view" id="view5">
            <%@include file="/WEB-INF/pages/cq/family/common/view/bcxyView.jsp"%>
        </div>
        <div class="view" id="view6">
            <%@include file="/WEB-INF/pages/cq/family/common/view/buChongView.jsp"%>
        </div>
    </div>
    <div class="footer">
        <button type="button" class="btn btn-lg btn-primary"
                onclick="handUp('${family.id}')" ${ family.lastCheckStatus eq 1  ? '':'disabled'}>
            <i class="fa fa-check"></i>&nbsp;终审通过
        </button>
        &nbsp;&nbsp;
        <%--<button type="button" class="btn btn-lg btn-danger" ${ family.lastCheckStatus eq 2 ? 'disabled':''}--%>
                <%--onclick="backData('${family.id}')"><i class="fa fa-close"></i>&nbsp;初审退回--%>
        <%--</button>--%>
        <%--&nbsp;&nbsp;--%>
        <button class="btn btn-white btn-lg" type="button" onclick="history.back()"><i class="fa fa-backward"></i>&nbsp;返回
        </button>
    </div>
</div>
<%--审计初审退回原因--%>
<%--<div class="modal fade" id="myModalCs" tabindex="-1" role="dialog" aria-labelledby="myModalLabe1"--%>
     <%--aria-hidden="true">--%>
    <%--<div class="modal-dialog">--%>
        <%--<div class="modal-content">--%>
            <%--<form class="form-horizontal" id="myFormCs" method="post">--%>
                <%--<div class="modal-header">--%>
                    <%--<button type="button" class="close" data-dismiss="modal"><span--%>
                            <%--aria-hidden="true">&times;</span><span--%>
                            <%--class="sr-only">Close</span></button>--%>
                    <%--<h4 class="modal-title" id="myModalLabel2">请填写初审退回原因</h4>--%>
                <%--</div>--%>
                <%--<div class="modal-body" id="modalBodyCs">--%>
                    <%--<input type="hidden" name="familyId" value="${family.id}">--%>
                    <%--<table class="table table-bordered">--%>
                        <%--<tr>--%>
                            <%--<td class="active text-right" style="width: 20%;">退回原因：</td>--%>
                            <%--<td>--%>
                                <%--<textarea id="reasonCs" class="form-control" style="width: 100%;height: 200px;"--%>
                                          <%--name="problem"></textarea>--%>
                            <%--</td>--%>
                        <%--</tr>--%>
                    <%--</table>--%>
                <%--</div>--%>
                <%--<div class="modal-footer">--%>
                    <%--<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>--%>
                    <%--<button id="subButtonCs" type="button" class="btn btn-primary" onclick="submitData()">保存</button>--%>
                <%--</div>--%>
            <%--</form>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>
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

    // 数据初审通过
    function handUp(familyId, searchParams) {
        if (confirm("确定数据终审通过吗？")) {
            var type = "last";
            $.get("handUp", {
                familyId: familyId,
                type: type,
                _date: new Date().getTime()
            }, function (data) {
                window.location.href = "lastCheckList?<tags:searchParams/>";
            })
        }
    }

    <%--function backData(familyId) {--%>
<%--//        $.get(url, {familyId: familyId, _date: new Date().getTime()}, function (data) {--%>
<%--//            $("#modalBodyCs").html(data);--%>
<%--//        });--%>
        <%--$("#myModalCs").modal();--%>
        <%--$("input[name='familyId']").val(familyId);--%>
    <%--}--%>
    <%--function submitData(familyId) {--%>
        <%--var reasonCs = $("#reasonCs").val();--%>
        <%--if (reasonCs != "") {--%>
            <%--if (confirm("确定数据终审退回吗？")) {--%>
                <%--$.ajax({--%>
                    <%--url: "backData",--%>
<%--//                data: {--%>
<%--//                    familyId: familyId,--%>
<%--//                    problem: reasonCs--%>
<%--//                },--%>
                    <%--method: "post",--%>
                    <%--data: $("#myFormCs").serialize(),--%>
                    <%--success: function (data) {--%>
                        <%--window.location.href = "list?<tags:searchParams/>";--%>
                    <%--}--%>
                <%--});--%>
            <%--}--%>
        <%--} else {--%>
            <%--alert("必须填写退回原因！");--%>
        <%--}--%>
    <%--}--%>
</script>
</body>
</html>

