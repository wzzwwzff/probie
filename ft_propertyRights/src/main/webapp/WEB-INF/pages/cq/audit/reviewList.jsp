<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <meta charset="UTF-8">
    <title>申请家庭信息复核列表</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body style="overflow: hidden;">
<div class="title">
    <h5>申请家庭信息复核列表</h5>
</div>
<div class="content">
    <div class=" doc-content" style="position: relative;">
        <div class="search_content">
            <div style="float: left">
                <form class="form-inline" role="form">
                    <%@include file="/WEB-INF/pages/cq/common/file/educationSel.jsp"%>
                    <button class="btn btn-primary btn-sm" type="submit"><i class="fa fa-search"></i> 查询</button>
                    <a href="javascript:updateEducation('${family.id}')" class="btn btn-primary btn-sm">批量更新学历复核状态</a>&nbsp;&nbsp;
                    <a href="javascript:updateUnEducation('${family.id}')" class="btn btn-primary btn-sm">批量更新学历复核不通过状态</a>&nbsp;&nbsp;
                    <button class="btn btn-primary btn-sm" type="button" onclick="location.href='otherStatus'"><i class="fa fa-upload"></i> 批量更新其他复核状态</button>
                    <a href="excelEducationTrouble" class="btn btn-primary btn-sm"><i class="fa fa-file-excel-o"></i> 导出学历复核不通过名单信息</a>&nbsp;&nbsp;
                </form>
            </div>
        </div>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th style="text-align: center;" width="5%">序号</th>
                <th style="text-align: center;">项目名称</th>
                <th style="text-align: center;">申请编号</th>
                <th style="text-align: center;">申请人</th>
                <th style="text-align: center;">申请日期</th>
                <th style="text-align: center;">户籍类型</th>
                <th style="text-align: center;">学历信息</th>
                <th style="text-align: center;">婚姻状态</th>
                <th style="text-align: center;">学历复核状态</th>
                <th style="text-align: center;">其他复核状态</th>
                <th style="text-align: center;">操作</th>
            </tr>
            </thead>
            <tbody>
        <c:forEach items="${pageInfo.result}" var="family" varStatus="status">
            <tr>
                <td style="text-align: center;">${status.count}</td>
                <td style="text-align: center;"><tags:dataDict dataDict="项目名称" value="${family.projectName}" /></td>
                <td style="text-align: center;">${family.familyCode}</td>
                <td style="text-align: center;">${family.name}</td>
                <td style="text-align: center;"><fmt:formatDate value="${family.applyDate}" pattern="yyyy-MM-dd" /></td>
                <td style="text-align: center;"><tags:dataDict dataDict="家庭类型" value="${family.familyType}" /></td>
                <td style="text-align: center;"><tags:dataDict dataDict="学历层次" value="${family.education}" /></td>
                <td style="text-align: center;"><tags:dataDict dataDict="婚姻状况" value="${family.marryStatus}" /></td>
                <td style="text-align: center;color: red;">
                        <c:if test="${family.educationStatus eq 1}"><a href="educationQuery?familyId=${family.id}&<tags:searchParams/>"><i class="fa fa-edit"></i>&nbsp;<span style="color: blue;">未复核</span></a></c:if>
                        <c:if test="${family.educationStatus eq 2}"><a href="educationQuery?familyId=${family.id}&<tags:searchParams/>"><i class="fa fa-edit"></i>&nbsp;<span style="color: green;">复核通过</span></a></c:if>
                        <c:if test="${family.educationStatus eq 3}"><a href="educationQuery?familyId=${family.id}&<tags:searchParams/>" title="${family.educationTrouble}"><i class="fa fa-edit"></i>&nbsp;<span style="color: red;">复核不通过</span></a></c:if>
                </td>
                <td style="text-align: center;color: red;">
                    <c:if test="${family.otherStatus == 1}">
                        <a href="javaScript:cancelCheck1(${family.id})"><i class="fa fa-edit"></i>&nbsp;<span
                                style="color: blue;"><tags:dataDict dataDict="审核状态" value="${family.otherStatus}" /></span></a>
                    </c:if>
                    <c:if test="${family.otherStatus == 2}">
                        <a href="javaScript:cancelCheck2(${family.id})"><i class="fa fa-edit"></i>&nbsp;<span
                                style="color: blue;"><tags:dataDict dataDict="审核状态" value="${family.otherStatus}" /></span></a>
                    </c:if>
                    <c:if test="${family.otherStatus == 3}">
                        <a href="javaScript:cancelCheck3(${family.id})"><i class="fa fa-edit"></i>&nbsp;<span
                                style="color: blue;"><tags:dataDict dataDict="审核状态" value="${family.otherStatus}" /></span></a>
                    </c:if>
                </td>
                <td style="text-align: center;">
                    <a href="/cq/family/view?familyId=${family.id}"><i class="fa fa-eye"></i>&nbsp;查看</a>&nbsp;&nbsp;
                </td>
            </tr>
        </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="footer resizeLayout"><tags:pageInfo/></div>
</div>
<!------------------------------------弹框------------------------------------>
<div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document" style="width: 900px;">
        <div class="modal-content">
            <div class="modal-body" id="myModalBoday" style="text-align: center;">
                <span id="loading" style="font-size: 18px;color: blue;"><img src="/static/image/loading.gif" id="loadingIMG"/>学历复核中请稍后...<br/>&nbsp;请勿进行其它操作!</span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="closeModal" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    $("#closeModal").click(function () {
        window.location.reload();
    });
    function updateUnEducation(familyId) {
        var projectName = $("select[name='search_eq_string_projectName']").val();
        $("#myModal").modal({backdrop: false});
        $.ajax({
            url:"/cq/education/handleHTML",
            type:"post",
            data:{
                familyId:familyId,
                projectName:projectName,
                type:"unEducation",
            },
            success:function (result) {
                $("#loadingIMG").hide();
                $("#loading").empty();
                $("#loading").html(result.message);
                $("#loading").css("color","green");
            }
        })
    }
    function updateEducation(familyId) {
        var projectName = $("select[name='search_eq_string_projectName']").val();
        $("#myModal").modal({backdrop: false});
        $.ajax({
            url:"/cq/education/handleHTML",
            type:"post",
            data:{
                familyId:familyId,
                projectName:projectName
            },
            success:function (result) {
                $("#loadingIMG").hide();
                $("#loading").empty();
                $("#loading").html(result.message);
                $("#loading").css("color","green");
            }
        })
    }

    function cancelCheck2(familyId) {
            if (confirm("确认该家庭撤销复核吗？")) {
                $.get("cancelStatus", {familyId: familyId}, function (data) {
                    if (data.code == "0000") {
                        location.reload();
                    } else {
                        alert(data.message);
                    }
                })
            }
    }

    function cancelCheck3(familyId) {
            if (confirm("确认该家庭通过复核吗？")) {
                $.get("handleStatus", {familyId: familyId}, function (data) {
                    if (data.code == "0000") {
                        location.reload();
                    } else {
                        alert(data.message);
                    }
                })
            }
    }
    function cancelCheck1(familyId) {
            if (confirm("确认该家庭通过复核吗？")) {
                $.get("cancelStatus", {familyId: familyId}, function (data) {
                    if (data.code == "0000") {
                        location.reload();
                    } else {
                        alert(data.message);
                    }
                })
            }
    }

</script>
</html>