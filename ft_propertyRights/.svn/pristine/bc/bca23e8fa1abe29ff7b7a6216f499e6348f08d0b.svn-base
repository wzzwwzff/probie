<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv=X-UA-Compatible content="IE=edge,chrome=1">
    <meta content=always name=referrer>
    <meta name="renderer" content="webkit">
    <title>家庭信息查看</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="title">
    <h4 style="color: #0d88cc">合同信息查看</h4>
</div>
<div class="content">
    <fieldset>
            <table class="table table-bordered" style="margin-top: 10px;">
                <tbody>
                <tr>
                    <td class="fieldName">申请编号：</td>
                    <td class="fieldValue">${contract.familyCode}</td>
                    <td class="fieldName">合同编号：</td>
                    <td class="fieldValue">${contract.contractCode}</td>
                </tr>
                <tr>
                    <td class="fieldName">产权人姓名：</td>
                    <td class="fieldValue">${contract.name}</td>
                    <td class="fieldName">身份号码：</td>
                    <td class="fieldValue">${contract.idCard}</td>
                </tr>
                <tr>
                    <td class="fieldName">项目名称：</td>
                    <td class="fieldValue"><tags:dataDict dataDict="项目名称" value="${contract.family.projectName}"/></td>
                    <td class="fieldName">楼号：</td>
                    <td class="fieldValue">${contract.house.buildNum}</td>
                </tr>
                <tr>
                    <td class="fieldName">单元：</td>
                    <td class="fieldValue">${contract.house.unitNum}</td>
                    <td class="fieldName">房号：</td>
                    <td class="fieldValue">${contract.house.houseNum}</td>
                </tr>
                <tr>
                    <td class="fieldName">建筑面积（㎡）：</td>
                    <td class="fieldValue">${contract.house.buildArea}</td>
                    <td class="fieldName">居室：</td>
                    <td class="fieldValue"><tags:dataDict dataDict="居室" value="${contract.house.houseType}"/></td>
                </tr>
                <tr>
                    <td class="fieldName">合同签订日期：</td>
                    <td class="fieldValue"><fmt:formatDate value="${contract.signDate}" pattern="yyyy-MM-dd" /></td>
                    <td class="fieldName">经办人：</td>
                    <td class="fieldValue">${contract.person}</td>
                </tr>
                <tr>
                    <td class="fieldName">销售价格：</td>
                    <td class="fieldValue">${contract.price}</td>
                    <td class="fieldName">产权比例：</td>
                    <td class="fieldValue">${contract.propertyRight}</td>
                </tr>
                <tr>
                    <td class="fieldName">备注：</td>
                    <td class="fieldValue" colspan="3">${contract.memo}</td>
                </tr>
                </tbody>
            </table>
            <div class="text-center">
                <button type="button" class="btn btn-white" onclick="javascript:history.back();"><i
                        class="fa fa-backward"></i> 返回
                </button>
            </div>
    </fieldset>
</div>
</body>
</html>
