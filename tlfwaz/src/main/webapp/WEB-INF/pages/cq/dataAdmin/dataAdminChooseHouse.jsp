<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.sqds.web.Servlets" %>
<%
    Servlets.setNoCacheHeader(response);
%>
<!DOCTYPE html>
<html>
<head>
    <title>电子选房</title>
</head>
<%@include file="/static/common/common.jsp" %>
<body style="overflow: auto;">
<div>
    <div class="title">【${family.name}】电子选房</div>
    <div style="position: absolute;top: 10px;right: 10px;">
        <button class="btn btn-primary btn-sm" type="button"
                onclick="location.href='dataAdminXf?<tags:searchParams/>'"></i>&nbsp;返回列表
        </button>
    </div>
</div>
<div class="content">
    <fieldset>
        <legend>一、基本信息</legend>
        <table class="table table-bordered">
            <tbody>
            <tr>
                <td class="fieldName">所属项目：</td>
                <td class="fieldValue">${family.project.projectName}</td>
                <td class="fieldName">所属地块：</td>
                <td class="fieldValue">${family.area.areaName}</td>
            </tr>
            <tr>
                <td class="fieldName">姓名</td>
                <td class="fieldValue" title="特殊家庭原因：${family.specialReason}">${family.name}</td>
                <td class="fieldName">档案编号</td>
                <td class="fieldValue"
                    <c:if test="${family.isSpecialFamily ne 3}">style="color: red"</c:if>>${family.familyCode}</td>
            </tr>
            <tr>
                <td class="fieldName">身份证号</td>
                <td class="fieldValue">${family.idCard}</td>
                <td class="fieldName">性别</td>
                <td class="fieldValue"><tags:dataDict dataDict="性别" value="${family.sex}"/></td>
            </tr>
            <tr>
                <td class="fieldName">应选面积</td>
                <td class="fieldValue">${family.shouldArea}㎡</td>
                <td class="fieldName">房屋坐落</td>
                <td class="fieldValue">${family.fwzl}</td>
            </tr>
            <c:if test="${family.area.areaName eq '东河沿'}">
            <tr>
                <td class="fieldName">选房批次</td>
                <td class="fieldValue">${family.xfBatch}</td>
                <td class="fieldName">选房顺序号</td>
                <td class="fieldValue">${family.xfNum}</td>
            </tr>
            </c:if>
            <tr>
                <td class="fieldName">购房指标</td>
                <td class="fieldValue" colspan="3">${family.gfArea}㎡</td>
            </tr>
        </table>
    </fieldset>
    <fieldset>
        <legend>二、已选房源信息</legend>
        <div id="selectHouseInfo"></div>
    </fieldset>
    <fieldset>
        <legend>三、选择房源</legend>
        <table class="table table-bordered table-striped">
            <tbody>
            <c:forEach items="${azProjectList}" var="azProject">
                <tr>
                    <td class="text-right" style="width: 240px;;font-size:24px; ">${azProject.projectName}</td>
                    <td style="line-height: 35px;text-align: left;">
                        <c:forEach items="${projectBuildNumMap[azProject.id]}" var="buildNum" varStatus="status">
                            <c:if test="${status.index ne 0 && status.index % 6 eq 0}"><br/></c:if>
                            <button type="button" projectUuid="${azProject.id}" buildNum="${buildNum}"
                                    projectName="${azProject.projectName}" class="btn btn-primary buildNumBtn"
                                    style="width: 150px;">
                                <i class="fa fa-building"></i> ${buildNum}
                            </button>
                        </c:forEach>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div style="width: 100%;text-align: center;font-weight: bold;font-size: 20px;color: black;margin-top: 20px;"
             id="buildInfoTitle"></div>
        <div style="text-align: center;height:1500px;" id="buildContent"></div>
    </fieldset>
</div>
<div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document" style="width: 1100px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">补录信息</h4>
            </div>
            <div class="modal-body" id="myModalBoday">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick="numSave()"><i class="fa fa-save"></i>&nbsp;保存
                </button>
                <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-close"></i>&nbsp;关闭
                </button>
            </div>
        </div>
    </div>
</div>
<script>
    loadSelectHouseInfo();

    //已选房源信息
    function loadSelectHouseInfo() {
        $.get("selectHouseInfo", {familyId: ${family.id}, _time: new Date().getTime()}, function (data) {
            $("#selectHouseInfo").html(data);
        });
    }


    var param_projectUuid = null;
    var param_projectName = null;
    var param_buildNum = null;
    $(".buildNumBtn").click(function () {
        var projectUuid = $(this).attr("projectUuid");
        var projectName = $(this).attr("projectName");
        var buildNum = $(this).attr("buildNum");
        loadBuildInfo(projectUuid, projectName, buildNum);
    });

    function loadBuildInfo(projectUuid, projectName, buildNum) {
        param_projectUuid = projectUuid;
        param_projectName = projectName;
        param_buildNum = buildNum;
        $("#buildInfoTitle").html(projectName + " " + buildNum + "号楼");

        loadBuild();
    }

    function loadBuild() {
        $("#buildContent").html("加载中，请稍后...");
        $.get("/cq/chooseHouse/housePicChoose", {
            familyUuid: "${family.id}",
            projectUuid: param_projectUuid,
            buildNum: param_buildNum,
            _time: new Date().getTime()
        }, function (data) {
            $("#buildContent").html(data);
        });
    }

    function saveBuildInfo() {
        var houseUuid = $("input:hidden[name='houseUuid']").val();
        $.ajax({
            url: "/cq/chooseHouse/saveBuildInfo",
            type: "post",
            data: {
                familyUuid: "${family.id}",
                houseUuid: houseUuid
            },
            success: function (data) {
                if (data.code == "0000") {
                    $("#myModal").modal("toggle");
                    $(".modal-backdrop").remove();
                    loadSelectHouseInfo();
                    loadBuild();
                } else {
                    alert(data.message);
                }
            }
        })
    }

    function delHouseInfo(houseId) {
        if (confirm("确定删除吗？")) {
            $.get("/cq/chooseHouse/delHouseInfo", {
                houseId: houseId,
                familyId: "${family.id}",
                _time: new Date().getTime()
            }, function (data) {
                if (data.code == "0000") {
                    loadSelectHouseInfo();
                } else {
                    alert(data.message);
                }
            });
        }
    }

    function numSave() {
        var familyId = $("input[name='familyId']").val();
        var address = $("input[name='address']").val();
        var phone = $("input[name='phone']").val();
        var agreementCode = $("input[name='agreementCode']").val();
        var currentAddress = $("input[name='currentAddress']").val();
        $.ajax({
            type: "post",
            url: "/cq/chooseHouse/addSave",
            data: {
                familyId: familyId,
                address: address,
                phone: phone,
                agreementCode: agreementCode,
                currentAddress: currentAddress,
                myTime: new Date().getTime()
            },
            success: function (data) {
                if (data.code == "0000") {
                    location.reload();
                } else {
                    bootstrapQ.msg({msg: data.message, type: 'danger'});
                }
            },
            error: function () {
                bootstrapQ.msg({msg: "请联系技术支持！", type: 'danger'});
            }
        })
    }

    //平移房源信息
    /*function changeHouseInfo(houseId) {
     if (confirm("确定平移房源信息吗？")) {
     $.get("changeHouseInfo", {houseId: houseId,familyId:"", _time: new Date().getTime()}, function (data) {
     if (data.code == "0000"){
     loadSelectHouseInfo();
     }else {
     alert(data.message);
     }
     });
     }
     }*/

    <%--//改选房源，撤销选房状态--%>
    <%--function cancelXfStatus(houseId) {--%>
    <%--$.get("cancelXfStatus", {houseId: houseId,familyId:"${family.id}", _time: new Date().getTime()}, function (data) {--%>
    <%--if (data.code == "0000") {--%>
    <%--loadSelectHouseInfo();--%>
    <%--} else {--%>
    <%--alert(data.message);--%>
    <%--}--%>
    <%--});--%>
    <%--}--%>

</script>
</body>
</html>
