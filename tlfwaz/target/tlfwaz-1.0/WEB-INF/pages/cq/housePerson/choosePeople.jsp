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
            <legend>二、登记变更购房人信息</legend>
            <table class="table table-bordered table-hover">
                <thead>
                <tr>
                    <td class="fieldName" colspan="2">变更房源</td>
                    <td class="fieldValue" colspan="4">
                        <input type="hidden" name="id" value="${house.id}"/>
                        <span style="font-size: 30px;">${house.azProject.projectName}项目${house.buildNum}号楼${house.unitNum}单元${house.houseNum}室&nbsp;<tags:dataDict
                                dataDict="户型" value="${house.houseType}"/>${house.buildArea}㎡</span>
                    </td>
                </tr>
                <tr>
                <tr><td class="fieldName" colspan="6" style="text-align: center;">家庭成员情况</td></tr>
                <tr>
                    <th class="text-center">姓名</th>
                    <th class="text-center">性别</th>
                    <th class="text-center">身份证号</th>
                    <th class="text-center">与户主关系</th>
                    <th class="text-center">是否在册</th>
                    <th class="text-center">变更</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${familyPersonList}" var="familyPerson">
                    <tr>
                        <td class="text-center">${familyPerson.pName}</td>
                        <td class="text-center"><tags:dataDict dataDict="性别" value="${familyPerson.pSex}"/></td>
                        <td class="text-center">${familyPerson.pIdCard}</td>
                        <td class="text-center">${familyPerson.pRelation}</td>
                        <td class="text-center"><tags:dataDict dataDict="是否" value="${familyPerson.isRegistered}"/></td>
                        <td class="text-center"><a title="点击变更购房人信息" onClick="change(${familyPerson.id},${house.id},${family.id})" style="cursor: pointer;"><font color='green'>变更</font></a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </fieldset>
        <div class="footer">
            <button type="button" class="btn btn-primary" onclick="location.href='addPeople?familyId=${family.id}&houseId=${house.id}'"><i class="glyphicon glyphicon-plus"></i>&nbsp;添加家庭人口</button>
            <button class="btn btn-white" type="button" onclick="history.back();"><i class="fa fa-backward"></i>&nbsp;返回</button>
        </div>
    </form>
</div>
<script>
    function change(familyPersonId,houseId,familyId){
        if(confirm("确定变更该购房人吗？")){
            location.href="change?familyId="+familyId+"&houseId="+houseId+"&familyPersonId="+familyPersonId;
        }
    }
</script>
</body>
</html>
