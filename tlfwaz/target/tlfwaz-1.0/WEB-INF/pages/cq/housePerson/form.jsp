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
    <div style="float: left;">变更购房人管理
    </div>
    <div style="float: right;">
        <button class="btn btn-white btn-sm" type="button" onclick="location.href='list'"><i class="fa fa-backward"></i>&nbsp;返回列表</button>
    </div>
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
            <legend>二、安置房屋信息</legend>
            <table class="table table-bordered table-hover">
                <thead>
                <tr>
                    <th width="10%" class="text-center">安置地块</th>
                    <th width="6%" class="text-center">楼号</th>
                    <th width="6%" class="text-center">单元</th>
                    <th width="6%" class="text-center">房号</th>
                    <th width="6%" class="text-center">居室</th>
                    <th width="6%" class="text-center">面积</th>
                    <th width="6%" class="text-center">产权人</th>
                    <th width="10%" class="text-center">变更产确认名字</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${houseList}" var="house">
                    <tr>
                        <td class="text-center">${house.azProject.projectName}</td>
                        <td class="text-center">${house.buildNum}</td>
                        <td class="text-center">${house.unitNum}</td>
                        <td class="text-center">${house.houseNum}</td>
                        <td class="text-center"><tags:dataDict dataDict="户型" value="${house.houseType}"/></td>
                        <td class="text-center">${house.buildArea}</td>
                        <td class="text-center">${house.hPerson}</td>
                        <td class="text-center">
                            <a href="choosePeople?familyId=${family.id}&houseId=${house.id}&${pageInfo.searchParams}"><img src="/static/image/edit.gif"></a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </fieldset>
        <div class="footer">
            <%--<button class="btn btn-primary" type="button" onclick="print('${family.id}');">打印</button>--%>
            <button class="btn btn-white" type="button" onclick="history.back();"><i class="fa fa-backward"></i>&nbsp;返回</button>
        </div>
    </form>
</div>
<script>
    function print(familyId){
        location.href="print?familyId="+familyId;
    }
</script>
</body>
</html>
