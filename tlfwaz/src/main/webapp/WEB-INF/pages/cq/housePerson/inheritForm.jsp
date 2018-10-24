<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>变更购房人管理</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="title">
    <h5>变更购房人管理</h5>
</div>
<div class="content">
    <form action="save" class="form-inline" method="post">
        <input type="hidden" name="familyId" value="${family.id}"/>
        <fieldset>
            <legend>一、被征收人状况</legend>
            <table class="table table-bordered">
                <tr>
                    <td class="fieldName">家庭编号</td>
                    <td class="fieldValue">${family.familyCode}</td>
                    <td class="fieldName">被征收人</td>
                    <td class="fieldValue">${family.name}</td>
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
            </table>
        </fieldset>
        <fieldset>
            <legend>二、变更继承人信息</legend>
            <table class="table table-bordered table-hover">
                <thead>
                <tr>
                    <td class="fieldName" colspan="2">变更房源</td>
                    <td class="fieldValue" colspan="5">
                        <input type="hidden" name="id" value="${house.id}"/>
                        <span style="font-size: 30px;">${house.azProject.projectName}项目${house.buildNum}号楼${house.unitNum}单元${house.houseNum}室&nbsp;<tags:dataDict
                                dataDict="户型" value="${house.houseType}"/>${house.buildArea}㎡</span>
                    </td>
                </tr>
                <tr>
                <tr><td class="fieldName" colspan="8" style="text-align: center;">变更继承人情况</td></tr>
                <tr>
                    <th class="text-center">姓名</th>
                    <th class="text-center">性别</th>
                    <th class="text-center">身份证号</th>
                    <th class="text-center">与户主关系</th>
                    <th class="text-center">是否在册</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${personList}" var="familyPerson">
                    <tr>
                        <td class="text-center">${familyPerson.pName}</td>
                        <td class="text-center"><tags:dataDict dataDict="性别" value="${familyPerson.pSex}"/></td>
                        <td class="text-center">${familyPerson.pIdCard}</td>
                        <td class="text-center">${familyPerson.pRelation}</td>
                        <td class="text-center"><tags:dataDict dataDict="在册/非在册" value="${familyPerson.isRegistered}"/></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </fieldset>
        <div class="footer">
            <button type="button" class="btn btn-lg btn-primary"
                    onclick="backData('${family.id}','${house.id}')" ${ house.inheritStatus ne 1  ? '':'disabled'}>
                <i class="fa fa-check"></i>&nbsp;审核通过
            </button>
            <button class="btn btn-white btn-lg" type="button" onclick="location.href='list?<tags:searchParams></tags:searchParams>'"><i class="fa fa-backward"></i>&nbsp;返回列表</button>
        </div>
    </form>
</div>
<div class="modal fade" id="myModalCs" tabindex="-1" role="dialog" aria-labelledby="myModalLabe1"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form class="form-horizontal" id="myFormCs" method="post">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span
                            aria-hidden="true">&times;</span><span
                            class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="myModalLabel2">请输入审核密码</h4>
                </div>
                <div class="modal-body" id="modalBodyCs">
                    <input type="hidden" name="familyId" value="${family.id}">
                    <input type="hidden" name="houseId" value="${house.id}">
                    <table class="table table-bordered">
                        <tr>
                            <td class="active text-right" style="width: 20%;">审核密码：</td>
                            <td>
                                <input type="checkbox" onclick="showHidePassword()"/>显示密码
                                <input id="password" type="password" class="form-control" onblur="passwordBlur()" name="password" value=""/>
                                <input type="text" id="text" class="form-control" style="display:none" name="passwordText" onblur="textBlur()" value=""/>
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
    function showHidePassword() {
        $("#text").toggle();
        $("#password").toggle();
    }

    function textBlur() {
        $("#password").val($("#text").val());
    }

    function passwordBlur() {
        $("#text").val($("#password").val());
    }

    function backData(familyId,houseId) {
        $("#myModalCs").modal();
        $("input[name='familyId']").val(familyId);
        $("input[name='houseId']").val(houseId);
    }
    function submitData() {
        var reasonCs = $("#text").val();
        if (reasonCs != "") {
                $.ajax({
                    url: "checkPassword",
                    method: "post",
                    data: $("#myFormCs").serialize(),
                    success: function (data) {
                        alert(data.message);
                        if (data.success == true){
                            window.location.href = "inheritList?<tags:searchParams/>";
                        }
                        window.location.reload();
                    }
                });
        } else {
            alert("必须填写密码！");
        }
    }
</script>
</body>
</html>
