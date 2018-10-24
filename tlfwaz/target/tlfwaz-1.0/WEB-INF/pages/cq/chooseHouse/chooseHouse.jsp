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
<div class="title">【${family.name}】电子选房</div>
<div class="content">
    <fieldset>
        <legend>一、基本信息</legend>
        <table class="table table-bordered">
            <tbody>
            <tr>
                <td class="fieldName">姓名</td>
                <td class="fieldValue">${family.name}</td>
                <td class="fieldName">档案编号</td>
                <td class="fieldValue">${family.familyCode}</td>
            </tr>
            <tr>
                <td class="fieldName">性别</td>
                <td class="fieldValue"><tags:dataDict dataDict="性别" value="${family.sex}"/></td>
                <td class="fieldName">身份证号</td>
                <td class="fieldValue">${family.idCard}</td>
            </tr>
            <tr>
                <td class="fieldName">建筑面积</td>
                <td class="fieldValue">${family.azArea}㎡</td>
                <td class="fieldName">房屋坐落</td>
                <td class="fieldValue">${family.fwzl}</td>
            </tr>
            <%--<tr>
                <td class="fieldName">房屋性质</td>
                <td class="fieldValue" colspan="3">
                    <tags:dataDict dataDict="房屋性质" value="${family.houseComplete}"/>
                </td>
            </tr>
            <tr>
                <td class="fieldName">提示：</td>
                <td class="fieldValue" colspan="3" style="font-size: 30px;color: black;">${message}</td>
            </tr>--%>
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
                            <button type="button" projectUuid="${azProject.id}" buildNum="${buildNum}" projectName="${azProject.projectName}" class="btn btn-primary buildNumBtn" style="width: 150px;">
                                <i class="fa fa-building"></i> ${buildNum}
                            </button>
                        </c:forEach>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div style="width: 100%;text-align: center;font-weight: bold;font-size: 20px;color: black;margin-top: 20px;" id="buildInfoTitle"></div>
        <div style="text-align: center;height:1500px;" id="buildContent"></div>
    </fieldset>
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
        loadBuildInfo(projectUuid,projectName, buildNum);
    });

    function loadBuildInfo(projectUuid,projectName, buildNum) {
        param_projectUuid = projectUuid;
        param_projectName = projectName;
        param_buildNum = buildNum;
        $("#buildInfoTitle").html(projectName + " " + buildNum + "号楼");

        loadBuild();
    }

    function loadBuild(){
        $("#buildContent").html("加载中，请稍后...");
        $.get("housePicChoose", {familyUuid:"${family.id}",projectUuid: param_projectUuid,buildNum: param_buildNum, _time: new Date().getTime()}, function (data) {
            $("#buildContent").html(data);
        });
    }

    function saveBuildInfo() {
        var houseUuid = $("input:hidden[name='houseUuid']").val();
        $.ajax({
            url:"saveBuildInfo",
            type:"post",
            data:{
                familyUuid:"${family.id}",
                houseUuid:houseUuid
            },
            success:function (data) {
                if (data.code == "0000"){
                    $("#myModal").modal("toggle");
                    $(".modal-backdrop").remove();
                    loadSelectHouseInfo();
                    loadBuild();
                }else {
                    alert(data.message);
                }
            }
        })
    }

    function delHouseInfo(houseUuid) {
        if (confirm("确定删除吗？")) {
            $.get("delHouseInfo", {houseUuid: houseUuid,familyUuid:"${family.id}", _time: new Date().getTime()}, function (data) {
                if (data.code == "0000"){
                    loadSelectHouseInfo();
                    loadBuild();
                }else {
                    alert(data.message);
                }
            });
        }
    }

</script>
</body>
</html>
