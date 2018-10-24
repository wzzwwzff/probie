<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <title>转租信息登记</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="title">
    <h4>转租信息登记</h4>
</div>
<div class="content">
    <div class="doc-content">
        <form class="form-horizontal" id="inputForm" method="post" action="turnzuSave?<tags:searchParams></tags:searchParams>">
            <input type="hidden" name="houseId" id="houseId" value="${house.id}"/>
            <fieldset>
                <table class="table table-bordered">
                    <tbody>
                    <tr>
                        <td class="fieldName">产权人姓名：</td>
                        <td class="fieldValue">${house.name}</td>
                        <td class="fieldName">身份号码：</td>
                        <td class="fieldValue">${house.idCard}</td>
                    </tr>
                    <tr>
                        <td class="fieldName">项目名称：</td>
                        <td class="fieldValue"><tags:dataDict dataDict="项目名称" value="${house.project.projectName}"/></td>
                        <td class="fieldName">楼号：</td>
                        <td class="fieldValue">${house.buildNum}</td>
                    </tr>
                    <tr>
                        <td class="fieldName">单元：</td>
                        <td class="fieldValue">${house.unitNum}</td>
                        <td class="fieldName">房号：</td>
                        <td class="fieldValue">${house.houseNum}</td>
                    </tr>
                    <tr>
                        <td class="fieldName">建筑面积（㎡）：</td>
                        <td class="fieldValue">${house.buildArea}</td>
                        <td class="fieldName">居室：</td>
                        <td class="fieldValue"><tags:dataDict dataDict="居室" value="${house.houseType}"/></td>
                    </tr>
                    <tr>
                        <td class="fieldName">转租人姓名：</td>
                        <td class="fieldValue">
                            <input type="text" name="rentName" class="form-control" style="width: 10em" size="10" value="${house.rentName}"/>
                        </td>
                        <td class="fieldName">转租人身份证号：</td>
                        <td class="fieldValue">
                            <input type="text" name="rentIdCard" class="form-control" style="width: 20em" size="10" value="${house.rentIdCard}"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldName">租赁日期：</td>
                        <td class="fieldValue" colspan="3">
                            <input type="text" name="rentDate" value="<fmt:formatDate value="${house.rentDate}" pattern="yyyy-MM-dd" />" class="form-control form-date-time dateISO" style="width: 130px;height: 33px;"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldName">备注：</td>
                        <td class="fieldValue" colspan="3">${house.memo}</td>
                    </tr>
                    </tbody>
                </table>
            </fieldset>
            <div class="text-center">
                <button class="btn btn-primary btn-sm" id="submitButton" type="submit"><i class="fa fa-save"></i>&nbsp;保存</button>
                &nbsp;&nbsp;
                <button type="button" class="btn btn-white" onclick="javascript:history.back();"><i
                        class="fa fa-backward"></i> 返回
                </button>
            </div>
        </form>
    </div>

</div>
</body>
<script>
    //日期控件
    $('.form-date-time').on('changeDate', function (ev) {
        $(this).datepicker('hide');
    });

    $('.form-date-time').datepicker({
        minViewMode: 'hours',
        format: 'yyyy-mm-dd',
        autoclose: true,
    });

</script>
</html>