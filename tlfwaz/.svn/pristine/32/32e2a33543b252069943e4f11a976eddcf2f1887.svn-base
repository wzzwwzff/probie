<%--
  Created by IntelliJ IDEA.
  User: jmdf
  Date: 2018/9/11
  Time: 13:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <title>家庭数据信息</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="title">
    <h4 style="color: #0d88cc">家庭信息</h4>
</div>
    <div class="content">
        <form class="form-horizontal" id="form" name="myForm" action="handedSave?familyId=${family.id}&<tags:searchParams></tags:searchParams>" method="post">
            <input type="hidden" value="${family.id}" name="familyId" />
            <div class=" doc-content" style="position: relative;">
                <fieldset>
                    <legend>一、基本信息</legend>
                    <table class="table table-bordered">
                        <tbody>
                        <tr>
                            <td class="fieldName">所属项目：</td>
                            <td class="fieldValue">
                                ${family.project.projectName}
                            </td>
                            <td class="fieldName">所属地块：</td>
                            <td class="fieldValue">
                                ${family.area.areaName}
                            </td>
                        </tr>
                        <tr>
                            <td class="fieldName">家庭编号：</td>
                            <td class="fieldValue">${family.familyCode}</td>
                            <td class="fieldName">姓名：</td>
                            <td class="fieldValue">${family.name}</td>
                        </tr>
                        <tr>
                            <td class="fieldName">联系电话：</td>
                            <td class="fieldValue">
                                ${family.phone}
                            </td>
                            <td class="fieldName">身份证号：</td>
                            <td class="fieldValue">
                                ${family.idCard}
                            </td>
                        </tr>
                        <tr>
                            <td class="fieldName">选房批次：</td>
                            <td class="fieldValue"><input size="10" type="text" name="xfBatch" class="form-control number" value="${family.xfBatch}" style="width: 5em"/></td>
                            <td class="fieldName">选房日期：</td>
                            <td class="fieldValue">
                                <input type="text" name="xyXfDate" value="<fmt:formatDate value="${family.xyXfDate}" pattern="yyyy-MM-dd" />" class="form-control form-date-time dateISO" style="width: 130px;height: 33px;"/>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </fieldset>
                <div class="footer">
                    <button type="submit" id="submitBtn" class="btn btn-primary"><i class="fa fa-save"></i> 保 存</button>
                    &nbsp;&nbsp;
                    <button onclick="history.back()" type="button" class="btn btn-white"><i class="fa fa-backward"></i> 返 回
                    </button>
                </div>
            </div>
        </form>
    </div>
</body>
</html>
