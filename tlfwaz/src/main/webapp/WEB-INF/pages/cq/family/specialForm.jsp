<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>特殊家庭管理</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="title">
    <div style="float: left;">特殊家庭管理
    </div>
    <div style="float: right;">
        <button class="btn btn-white btn-sm" type="button" onclick="location.href='specialList'"><i class="fa fa-backward"></i>&nbsp;返回列表</button>
    </div>
</div>
<div class="content">
    <form action="specialSave" class="form-inline" method="post">
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
            <legend>二、特殊家庭信息</legend>
            <table class="table table-bordered">
                <tr>
                    <td class="fieldName">是否是特殊家庭</td>
                    <td class="fieldValue"><tags:dataDictRadio dataDict="是否是特殊家庭" value="${family.isSpecialFamily}" name="isSpecialFamily"/></td>
                </tr>
                <tr>
                    <td class="fieldName">特殊家庭原因</td>
                    <td class="fieldValue"><textarea rows="5" style="width: 45%" class="form-control" name="specialReason" value="${family.specialReason}">${family.specialReason}</textarea></td>
                </tr>
            </table>
        </fieldset>
        <div class="footer">
            <button type="submit" id="submitBtn" class="btn btn-primary"><i class="fa fa-save"></i> 保 存</button>
            &nbsp;&nbsp;
            <button onclick="history.back()" type="button" class="btn btn-white"><i class="fa fa-backward"></i> 返 回
            </button>
        </div>
    </form>
</div>
</body>
</html>
