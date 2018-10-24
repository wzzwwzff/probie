<%@ page import="com.app.cq.en.CheckState" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <title>拆迁数据登记</title>
    <%@include file="/static/common/common.jsp" %>
    <script src="/static/bigDecimal/BigDecimal-all-last.min.js" type="text/javascript"></script>
</head>
<body>


<div class="title"><h4>数据初审页面【${family.name}，<font color="red">当前状态：</font><font color="green"><tags:dataDict
        dataDict="审核状态" value="${family.checkState}"/></font>】</h4></div>
<div class="content">
    <div class="form-inline" id="hideCls" style="padding-bottom: 20px;">
        <ul class="nav nav-tabs">
            <li role="presentation" class="active"><a href="javascript:void(0);" aid="view1">方案数据</a></li>
            <li role="presentation" class="active"><a href="javascript:void(0);" aid="view2">匡算单</a></li>
            <li role="presentation" class="active"><a href="javascript:void(0);" aid="view3">补偿协议</a></li>
        </ul>
    </div>
    <div id="view1" class="view">
        <%@include file="/WEB-INF/pages/cq/common/view/rhView.jsp" %>
    </div>
    <div id="view2" class="view">
        <iframe id="printf2" name="printf" src="" style="width: 100%;border: 0px;height: 700px;"></iframe>
    </div>
    <div id="view3" class="view">
        <iframe id="printf3" name="printf" src="" style="width: 100%;border: 0px;height: 700px;"></iframe>
    </div>
    <div class="footer">
        <c:set var="noCheck" value="<%=CheckState.NOCHECK.getIndex()%>"/>
        <c:set var="secondCheck" value="<%=CheckState.SECONDCHECK.getIndex()%>"/>
        <c:set var="firstBack" value="<%=CheckState.FIRSTBACK.getIndex()%>"/>
        <button type="button" class="btn btn-lg btn-primary"
                onclick="handUp('${family.id}')" ${ family.pgState gt 1 && family.cqState gt 1 && family.chState gt 1 && family.checkState le noCheck  ? '':'disabled'}>
            <i class="fa fa-check"></i>&nbsp;初审通过
        </button>
        &nbsp;&nbsp;
        <button type="button" class="btn btn-lg btn-danger" ${ family.checkState ne secondCheck ? '':'disabled'}
                onclick="backData('${family.id}','formFirst')"><i class="fa fa-close"></i>&nbsp;初审退回
        </button>
        &nbsp;&nbsp;
        <button class="btn btn-white btn-lg" type="button" onclick="history.back()"><i class="fa fa-backward"></i>&nbsp;返回
        </button>
    </div>

</div>
<%--审计初审退回原因--%>
<div class="modal fade" id="myModalCs" tabindex="-1" role="dialog" aria-labelledby="myModalLabe1"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form class="form-horizontal" id="myFormCs" method="post">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span
                            aria-hidden="true">&times;</span><span
                            class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="myModalLabel2">请填写初审退回原因</h4>
                </div>
                <div class="modal-body" id="modalBodyCs">
                    <input type="hidden" name="familyId" value="${family.id}">
                    <table class="table table-bordered">
                        <tr>
                            <td class="active text-right" style="width: 20%;">退回数据类型：</td>
                            <td>
                                <input type="checkbox" id="checkAll">全部
                                <input type="checkbox" name="company" value="拆迁数据">拆迁数据
                                <input type="checkbox" name="company" value="评估数据">评估数据
                                <input type="checkbox" name="company" value="测绘数据">测绘数据
                            </td>
                        </tr>
                        <tr>
                            <td class="active text-right" style="width: 20%;">退回原因：</td>
                            <td>
                                <textarea id="reasonCs" class="form-control" style="width: 100%;height: 200px;"
                                          name="problem"></textarea>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button id="subButtonCs" type="button" class="btn btn-primary" onclick="submitData()">保存</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    $(function () {
        init("view1");
        $("#checkAll").click(function () {
            if ($(this).prop("checked")) {
                $("input[name='company']").prop("checked", true);
            } else {
                $("input[name='company']").prop("checked", false);
            }
        })
    })
    // 数据初审通过
    function handUp(familyId, searchParams) {
        if (confirm("确定数据初审通过吗？")) {
            var type = "first";
            $.get("handUp", {
                familyId: familyId,
                type: type,
                _date: new Date().getTime()
            }, function (data) {
                if (data.code == "0000") {
                    window.location.href = "list?<tags:searchParams/>";
                } else {
                    alert(data.message);
                    window.location.reload();
                }
            })
        }
    }

    function backData(familyId, url) {
//        $.get(url, {familyId: familyId, _date: new Date().getTime()}, function (data) {
//            $("#modalBodyCs").html(data);
//        });
        $("#myModalCs").modal();
        $("input[name='familyId']").val(familyId);
    }
    function submitData() {
        var company = $("input[name='company']:checked").val();
        var reasonCs = $("#reasonCs").val();
        if (reasonCs != "" && company != undefined && company != "") {
            $.ajax({
                url: "backData",
                method: "post",
                data: $("#myFormCs").serialize(),
                success: function (data) {
                    if (data.code == "0000") {
                        window.location.href = "list?<tags:searchParams/>";
                    } else {
                        alert(data.message);
                    }
                }

            });
        } else {
            alert("必须选择退回数据类型和填写退回原因！");
        }
    }

    function init(view) {
        //注意方法的()
        $(".view").hide();
        var a = $("a[aid='" + view + "']");
        $("li").removeClass("active");
        a.parent().addClass("active");

        if (view == "view2") {
            $("#printf2").attr("src", "/cq/family/print?familyId=${family.id}#toolbar=0");
        } else if (view == "view3") {
            $("#printf3").attr("src", "/cq/sign/print?familyId=${family.id}#toolbar=0");
        }

        $("#" + view).show();

    }
    $(".nav li a").click(function () {
        var view = $(this).attr("aid");
        init(view);
    });
</script>
</body>
</html>
