<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <title>项目信息查看</title>
    <%@include file="/static/common/common.jsp" %>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>
<body style="overflow:hidden;">
<div class="title">
    <h4>项目查看</h4>
</div>
<div class="content">
    <div class=" doc-contentInfo">
        <form id="inputForm" action="projectSave" method="post" class="form-inline">
            <input type="hidden" name="projectId" id="projectId" value="${project.id}"/>
            <table class="table table-bordered">
                <tbody>
                <tr>
                    <td class="fieldName">项目名称：</td>
                    <td class="fieldValue">${project.projectName}
                    </td>
                    <td class="fieldName">进展情况：</td>
                    <td class="fieldValue">${project.progress}
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">企业名称：</td>
                    <td class="fieldValue">${project.enterprise}
                    </td>
                    <td class="fieldName">项目位置：</td>
                    <td class="fieldValue">${project.address}
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">项目东至：</td>
                    <td class="fieldValue">${project.east}
                    </td>
                    <td class="fieldName">项目西至：</td>
                    <td class="fieldValue">${project.west}
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">项目南至：</td>
                    <td class="fieldValue">${project.south}
                    </td>
                    <td class="fieldName">项目北至：</td>
                    <td class="fieldValue">${project.north}
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">套数：</td>
                    <td class="fieldValue">${project.number}
                    </td>
                    <td class="fieldName">产权比例：</td>
                    <td class="fieldValue">${project.scale}
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">销售均价：</td>
                    <td class="fieldValue">${project.price}
                    </td>
                    <td class="fieldName">户型面积：</td>
                    <td class="fieldValue">${project.houseTypeArea}
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">建设单位：</td>
                    <td class="fieldValue">${project.unit}
                    </td>
                    <td class="fieldName">建设单位联系人：</td>
                    <td class="fieldValue">${project.unitPerson}
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">建设单位联系电话：</td>
                    <td class="fieldValue">${project.unitPhone}
                    </td>
                    <td class="fieldName">项目坐落社区街道：</td>
                    <td class="fieldValue">${project.community}
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">社区街道联系人：</td>
                    <td class="fieldValue">${project.cPerson}
                    </td>
                    <td class="fieldName">社区街道联系电话：</td>
                    <td class="fieldValue">${project.cPhone}
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">物业公司名称：</td>
                    <td class="fieldValue">${project.propertyCompany}
                    </td>
                    <td class="fieldName">物业公司联系人：</td>
                    <td class="fieldValue">${project.pPerson}
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">物业公司联系电话：</td>
                    <td class="fieldValue">${project.pPhone}
                    </td>
                    <td class="fieldName">出租单价：</td>
                    <td class="fieldValue">${project.rentPrice}
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">备注：</td>
                    <td class="fieldValue" colspan="3">${project.memo}
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="text-center">
                <button type="button" class="btn btn-white" onclick="history.back();"><i class="fa fa-backward"></i>
                    返回
                </button>
            </div>
        </form>
    </div>
</div>
<script>
    $(function () {
        $("#inputForm").valid();
    });
</script>
</body>
</html>