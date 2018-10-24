<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>房源登记界面</title>
    <%@include file="/static/common/common.jsp"%>
    <script>
        $(document).ready(function () {
            $("#houseForm").validate({});
        });
    </script>
</head>
<body>
<div class="title">
    <h5>房源登记界面</h5>
</div>
<form id="houseForm" class="form-inline" method="post" action="houseSave">
    <input type="hidden" name="projectId" value="${project.id}"/>
    <input type="hidden" name="houseId" value="${house.id}"/>
    <div class="content">
        <fieldset>
            <table class="table table-bordered">
                <tbody>
                <tr>
                    <td class="fieldName" style="width: 15%;">项目名称</td>
                    <td class="fieldValue" style="width: 35%;">${project.projectName}</td>
                    <td class="fieldName" style="width: 15%;">楼号</td>
                    <td class="fieldValue" style="width: 35%;"><input class="form-control required" type="text" name="buildNum" value="${house.buildNum}"><span class="require">*</span></td>
                </tr>
                <tr>
                    <td class="fieldName">单元</td>
                    <td class="fieldValue"><input class="form-control required" type="text" name="unitNum" value="${house.unitNum}"><span class="require">*</span></td>
                    <td class="fieldName">房号</td>
                    <td class="fieldValue"><input  class="form-control required" type="text" name="houseNum" maxlength="4" minlength="4" value="${house.houseNum}"><span class="require">*</span>(请输入四位房号)</td>
                </tr>
                <tr>
                    <td class="fieldName">建筑面积</td>
                    <td class="fieldValue"><input type="text" name="buildArea" class="number form-control" value="${house.buildArea}"/>㎡</td>
                    <td class="fieldName">户型</td>
                    <td class="fieldValue"><tags:dataDictInput name="houseHold" dataDict="房屋户型" className="form-control" value="${house.houseHold}" /></td>
                </tr>
                <tr>
                    <td class="fieldName">居室</td>
                    <td class="fieldValue"><tags:dataDictRadio name="houseType" value="${house.houseType}" dataDict="房屋居室"/></td>
                    <td class="fieldName">房屋状态</td>
                    <td class="fieldValue">
                        <c:if test="${empty house.family}">
                            <tags:dataDictRadio name="houseStatus" dataDict="房屋状态" value="${house.houseStatus}"/>
                        </c:if>
                        <c:if test="${not empty house.family}">
                            <tags:dataDict dataDict="房屋状态" value="${house.houseStatus}"/>(<font color="green">被拆迁人已经选择，此状态无法变更。</font>)
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">备注</td>
                    <td class="fieldValue" colspan="3">
                        <textarea name="memo" rows="3" class="form-control" style="width: 85%;height: 150px;">${house.memo}</textarea>
                    </td>
                </tr>
                </tbody>
            </table>
        </fieldset>
    </div>
    <div class="footer resizeLayout">
        <button class="btn btn-primary btn-sm" type="submit"><i class="fa fa-save"></i>&nbsp;保存</button>
        &nbsp;&nbsp;
        <button class="btn btn-white btn-sm" type="button" onclick="history.back()"><i class="fa fa-backward"></i>&nbsp;返回</button>
    </div>
</form>
</body>
</html>
