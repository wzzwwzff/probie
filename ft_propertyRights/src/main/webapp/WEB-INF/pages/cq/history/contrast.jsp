<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>家庭信息查看</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="content">
    <fieldset>
        <legend>一、申请人信息</legend>
        <table class="table table-bordered">
            <tbody>
            <tr>
                <td class="fieldName">项目名称：</td>
                <td class="fieldValue">
                    ${family.projectName}
                    <c:if test="${compareUtils.show(family.projectName,family1.projectName)}"><font
                            style="color: red">（${family1.projectName}）</font></c:if>
                </td>
                <td class="fieldName">申请编号：</td>
                <td class="fieldValue">
                    ${family.familyCode}
                    <c:if test="${compareUtils.show(family.familyCode,family1.familyCode)}"><font
                            style="color: red">（${family1.familyCode}）</font></c:if>
                </td>
            </tr>
            <tr>
                <td class="fieldName">姓名：</td>
                <td class="fieldValue">${family.name}
                    <c:if test="${compareUtils.show(family.name,family1.name)}"><font
                            style="color: red">（${family1.name}）</font></c:if>
                </td>
                <td class="fieldName">证件号码：</td>
                <td class="fieldValue">
                    <div style="float: left;">
                        <tags:dataDict value="${family.cardType}" dataDict="证件类型"/>
                        <c:if test="${compareUtils.show(family.cardType,family1.cardType)}"><font
                                style="color: red">（ <tags:dataDict value="${family1.cardType}" dataDict="证件类型"/>）</font></c:if>
                    </div>
                    <div style="float: right;margin-right:300px;">
                        ${family.idCard}
                        <c:if test="${compareUtils.show(family.idCard,family1.idCard)}"><font
                                style="color: red">（${family1.idCard}）</font></c:if>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="fieldName">婚姻状况：</td>
                <td class="fieldValue">
                    <tags:dataDict dataDict="婚姻状况" value="${family.marryStatus}"/>
                    <c:if test="${compareUtils.show(family.marryStatus,family1.marryStatus)}"><font
                            style="color: red">（ <tags:dataDict dataDict="婚姻状况" value="${family1.marryStatus}"/>）</font></c:if>
                </td>
                <td class="fieldName">年龄：</td>
                <td class="fieldValue">${family.age}
                    <c:if test="${compareUtils.show(family.age,family1.age)}"><font
                            style="color: red">（${family1.age}）</font></c:if>
                </td>
            </tr>
            <tr>
                <td class="fieldName">户籍所在地：</td>
                <td class="fieldValue">${family.address}
                    <c:if test="${compareUtils.show(family.address,family1.address)}"><font
                            style="color: red">（${family1.address}）</font></c:if>
                </td>
                <td class="fieldName">工作地（社保缴纳地）：</td>
                <td class="fieldValue">
                    <tags:dataDict dataDict="工作地（社保缴纳地）" value="${family.workUnit}"/>
                    <c:if test="${compareUtils.show(family.workUnit,family1.workUnit)}"><font
                            style="color: red">（ <tags:dataDict dataDict="工作地（社保缴纳地）"
                                                                value="${family1.workUnit}"/>）</font></c:if>
                </td>
            </tr>
            <tr>
                <td class="fieldName">是否本区：</td>
                <td class="fieldValue"><tags:dataDict dataDict="是否" value="${family.thisArea}"/>
                    <c:if test="${compareUtils.show(family.thisArea,family1.thisArea)}"><font
                            style="color: red">（ <tags:dataDict dataDict="是否"
                                                                value="${family1.thisArea}"/>）</font></c:if>
                </td>
                <td class="fieldName">申请日期：</td>
                <td class="fieldValue">
                    <fmt:formatDate value="${family.applyDate}" pattern="yyyy-MM-dd"/>
                    <c:if test="${compareUtils.show(family.applyDate,family1.applyDate)}"><font
                            style="color: red">（ <fmt:formatDate value="${family1.applyDate}"
                                                                 pattern="yyyy-MM-dd"/>）</font></c:if>
                </td>
            </tr>
            <tr>
                <td class="fieldName">工作居住证类型：</td>
                <td class="fieldValue">
                    <tags:dataDict value="${family.residencePermit}" dataDict="工作居住证类型"/>
                    <c:if test="${compareUtils.show(family.residencePermit,family1.residencePermit)}"><font
                            style="color: red">（ <tags:dataDict dataDict="是否"
                                                                value="${family1.residencePermit}"/>）</font></c:if>
                </td>
                <td class="fieldName">办理使用证件：</td>
                <td class="fieldValue" colspan="3">
                    <div style="float: left;">
                        <tags:dataDict value="${family.handleType}" dataDict="证件类型"/>
                        <c:if test="${compareUtils.show(family.handleType,family1.handleType)}"><font
                                style="color: red">（ <tags:dataDict dataDict="证件类型"
                                                                    value="${family1.handleType}"/>）</font></c:if>
                    </div>
                    <div style="float: right;margin-right:200px;">
                        ${family.handleCard}
                        <c:if test="${compareUtils.show(family.handleCard,family1.handleCard)}"><font
                                style="color: red">（${family1.handleCard}）</font></c:if>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="fieldName">工作居住证编号：</td>
                <td class="fieldValue">
                    ${family.residencePermitCode}
                    <c:if test="${compareUtils.show(family.residencePermitCode,family1.residencePermitCode)}"><font
                            style="color: red">（${family1.residencePermitCode}）</font></c:if>
                </td>
                <td class="fieldName">有效期限：</td>
                <td class="fieldValue">
                    <div style="float: left;">
                        <fmt:formatDate value="${family.startDate}" var="startDate" pattern="yyyy-MM-dd"/>
                        <c:if test="${compareUtils.show(family.startDate,family1.startDate)}"><font
                                style="color: red">（ <fmt:formatDate value="${family1.startDate}" pattern="yyyy-MM-dd"/>）</font></c:if>
                    </div>
                    <div style="float: left;margin-left: 23px;margin-right: 5px;margin-top: 2px;">
                        至
                    </div>
                    <div style="float: right;margin-right:250px;">
                        <fmt:formatDate value="${family.endDate}" var="endDate" pattern="yyyy-MM-dd"/>
                        <c:if test="${compareUtils.show(family.endDate,family1.endDate)}"><font
                                style="color: red">（ <fmt:formatDate value="${family1.endDate}"
                                                                     pattern="yyyy-MM-dd"/>）</font></c:if>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="fieldName">军官（警官）证件：</td>
                <td class="fieldValue">
                    <tags:dataDict value="${family.armyType}" dataDict="军官（警官）证件"/>
                    <c:if test="${compareUtils.show(family.armyType,family1.armyType)}"><font
                            style="color: red">（ <tags:dataDict dataDict="军官（警官）证件"
                                                                value="${family1.armyType}"/>）</font></c:if>
                </td>
                <td class="fieldName">证件号码：</td>
                <td class="fieldValue">
                    ${family.armyIdCard}
                    <c:if test="${compareUtils.show(family.armyIdCard,family1.armyIdCard)}"><font
                            style="color: red">（${family1.armyIdCard}）</font></c:if>
                </td>
            </tr>
            <tr>
                <td class="fieldName">暂住证/居住证/登记卡编号：</td>
                <td class="fieldValue">${family.registerCode}
                    <c:if test="${compareUtils.show(family.registerCode,family1.registerCode)}"><font
                            style="color: red">（${family1.registerCode}）</font></c:if>
                </td>
                <td class="fieldName">有效期限：</td>
                <td class="fieldValue">
                    <div style="float: left;">
                        <fmt:formatDate value="${family.startDate}" var="startDate" pattern="yyyy-MM-dd"/>
                        <c:if test="${compareUtils.show(family.startDate,family1.startDate)}"><font
                                style="color: red">（ <fmt:formatDate value="${family1.startDate}" pattern="yyyy-MM-dd"/>）</font></c:if>
                    </div>
                    <div style="float: left;margin-left: 23px;margin-right: 5px;margin-top: 2px;">
                        至
                    </div>
                    <div style="float: right;margin-right:250px;">
                        <fmt:formatDate value="${family.endDate}" var="endDate" pattern="yyyy-MM-dd"/>
                        <c:if test="${compareUtils.show(family.endDate,family1.endDate)}"><font
                                style="color: red">（ <fmt:formatDate value="${family1.endDate}"
                                                                     pattern="yyyy-MM-dd"/>）</font></c:if>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
    </fieldset>
    <fieldset>
        <legend>二、前配偶信息</legend>
        <table class="table table-bordered">
            <tbody>
            <tr>
                <td class="fieldName">前配偶姓名：</td>
                <td class="fieldValue">${family.exSpouseName}
                    <c:if test="${compareUtils.show(family.exSpouseName,family1.exSpouseName)}"><font
                            style="color: red">（${family1.exSpouseName}）</font></c:if>
                </td>
                <td class="fieldName">前配偶证件号码：</td>
                <td class="fieldValue">
                    <tags:dataDict dataDict="证件类型" value="${family.exCardType}"/>
                    <c:if test="${compareUtils.show(family.exCardType,family1.exCardType)}"><font
                            style="color: red">（<tags:dataDict dataDict="证件类型"
                                                               value="${family1.exCardType}"/>）</font></c:if>
                    ${family.exIdCard}
                    <c:if test="${compareUtils.show(family.exIdCard,family1.exIdCard)}"><font
                            style="color: red">（${family1.exIdCard}）</font></c:if>
                </td>
            </tr>
            <tr>
                <td class="fieldName">离婚日期：</td>
                <td class="fieldValue" colspan="3"><fmt:formatDate value="${family.divorceDate}" var="divorceDate"
                                                                   pattern="yyyy-MM-dd"/><c:out
                        value="${divorceDate}"/>
                    <c:if test="${compareUtils.show(family.divorceDate,family1.divorceDate)}"><font
                            style="color: red">（ <fmt:formatDate value="${family1.divorceDate}"
                                                                 pattern="yyyy-MM-dd"/>）</font></c:if>
                </td>
            </tr>
            </tbody>
        </table>
    </fieldset>
    <fieldset>
        <legend>三、家庭成员信息</legend>
        <table class="table table-bordered">
            <tbody>
            <tr>
                <td class="fieldName">家庭人口数：</td>
                <td class="fieldValue" colspan="3">${family.count}
                    <c:if test="${compareUtils.show(family.count,family1.count)}"><font
                            style="color: red">（${family1.count}）</font></c:if>
                </td>
            </tr>
            </tbody>
        </table>
        <table class="table table-bordered" style="margin-top: -5px;">
            <thead>
            <tr>
                <th class="text-center">成员姓名</th>
                <th class="text-center">证件类型</th>
                <th class="text-center">证件号码</th>
                <th class="text-center">关系</th>
                <th class="text-center">户籍</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${familyPersonList}" var="familyPerson" varStatus="status">
                <tr>
                    <td align="center">${familyPerson.name}</td>
                    <td align="center"><tags:dataDict dataDict="证件类型" value="${family.cardType}"/></td>
                    <td align="center">${familyPerson.idCard}</td>
                    <td align="center">${familyPerson.relationShip}</td>
                    <td align="center">${familyPerson.address}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </fieldset>

    <fieldset>
        <legend>四、联系人信息</legend>
        <table class="table table-bordered">
            <tbody>
            <tr>
                <td class="fieldName">姓名：</td>
                <td class="fieldValue">${family.contactName}
                    <c:if test="${compareUtils.show(family.contactName,family1.contactName)}"><font
                            style="color: red">（${family1.contactName}）</font></c:if>
                </td>
                <td class="fieldName">手机号码：</td>
                <td class="fieldValue">${family.phone}
                    <c:if test="${compareUtils.show(family.phone,family1.phone)}"><font
                            style="color: red">（${family1.phone}）</font></c:if>
                </td>
            </tr>
            <tr>
                <td class="fieldName">通讯地址：</td>
                <td class="fieldValue">${family.currentAddres}
                    <c:if test="${compareUtils.show(family.currentAddres,family1.currentAddres)}"><font
                            style="color: red">（${family1.currentAddres}）</font></c:if>
                </td>
                <td class="fieldName">邮编：</td>
                <td class="fieldValue">${family.postCode}
                    <c:if test="${compareUtils.show(family.postCode,family1.postCode)}"><font
                            style="color: red">（${family1.postCode}）</font></c:if>
                </td>
            </tr>
            <tr>
                <td class="fieldName">备注：</td>
                <td class="fieldValue" colspan="3">${family.memo}
                    <c:if test="${compareUtils.show(family.memo,family1.memo)}"><font
                            style="color: red">（${family1.memo}）</font></c:if>
                </td>
            </tr>
            </tbody>
        </table>
    </fieldset>
    <fieldset>
        <legend>五、其他信息</legend>
        <table class="table table-bordered">
            <tbody>
            <tr>
                <td class="fieldName">摇号批次：</td>
                <td class="fieldValue">${family.shakingBatch}
                    <c:if test="${compareUtils.show(family.shakingBatch,family1.shakingBatch)}"><font
                            style="color: red">（${family1.shakingBatch}）</font></c:if>
                </td>
                <td class="fieldName">摇号编号：</td>
                <td class="fieldValue">${family.shakingCode}
                    <c:if test="${compareUtils.show(family.shakingCode,family1.shakingCode)}"><font
                            style="color: red">（${family1.shakingCode}）</font></c:if>
                </td>
            </tr>
            <tr>
                <td class="fieldName">摇号组别：</td>
                <td class="fieldValue">${family.shakingGroup}
                    <c:if test="${compareUtils.show(family.shakingGroup,family1.shakingGroup)}"><font
                            style="color: red">（${family1.shakingGroup}）</font></c:if>
                </td>
                <td class="fieldName">摇号结果：</td>
                <td class="fieldValue">${family.shakingResult}
                    <c:if test="${compareUtils.show(family.shakingResult,family1.shakingResult)}"><font
                            style="color: red">（${family1.shakingResult}）</font></c:if>
                </td>
            </tr>
            <tr>
                <td class="fieldName">是否是优先组：</td>
                <td class="fieldValue"><tags:dataDict value="${family.firstOrNot}" dataDict="是否"/>
                    <c:if test="${compareUtils.show(family.firstOrNot,family1.firstOrNot)}"><font
                            style="color: red">（<tags:dataDict value="${family1.firstOrNot}"
                                                               dataDict="是否"/>）</font></c:if>
                </td>
                <td class="fieldName">社保是否符合连续缴纳12个月要求：</td>
                <td class="fieldValue"><tags:dataDict dataDict="是否" value="${family.continuity}"/>
                    <c:if test="${compareUtils.show(family.continuity,family1.continuity)}"><font
                            style="color: red">（<tags:dataDict dataDict="是否"
                                                               value="${family1.continuity}"/>）</font></c:if>
                </td>
            </tr>
            <tr>
                <td class="fieldName">学历：</td>
                <td class="fieldValue"><tags:dataDict dataDict="学历层次" value="${family.education}"/>
                    <c:if test="${compareUtils.show(family.education,family1.education)}"><font
                            style="color: red">（<tags:dataDict dataDict="学历层次" value="${family1.education}"/>）</font></c:if>
                </td>
                <td class="fieldName">学历证书在线验证码：</td>
                <td class="fieldValue">${family.educationCode}
                    <c:if test="${compareUtils.show(family.educationCode,family1.educationCode)}"><font
                            style="color: red">（${family1.educationCode}）</font></c:if>
                </td>
            </tr>
            <tr>
                <td class="fieldName">学习形式：</td>
                <td class="fieldValue">
                    <tags:dataDict dataDict="学习形式" value="${family.learning}"/>
                    <c:if test="${compareUtils.show(family.learning,family1.learning)}"><font
                            style="color: red">（<tags:dataDict dataDict="学习形式"
                                                               value="${family1.learning}"/>）</font></c:if>
                </td>
                <td class="fieldName">是否园区：</td>
                <td class="fieldValue">
                    <tags:dataDict value="${family.thisPark}" dataDict="是否"/>
                    <c:if test="${compareUtils.show(family.thisPark,family1.thisPark)}"><font
                            style="color: red">（<tags:dataDict dataDict="是否"
                                                               value="${family1.thisPark}"/>）</font></c:if>
                </td>
            </tr>
            <tr>
                <td class="fieldName">职务：</td>
                <td class="fieldValue">${family.job}
                    <c:if test="${compareUtils.show(family.job,family1.job)}"><font
                            style="color: red">（${family1.job}）</font></c:if>
                </td>
                <td class="fieldName">工作单位：</td>
                <td class="fieldValue">${family.unit}
                    <c:if test="${compareUtils.show(family.unit,family1.unit)}"><font
                            style="color: red">（${family1.unit}）</font></c:if>
                </td>
            </tr>
            <tr>
                <td class="fieldName">单位联系人：</td>
                <td class="fieldValue">${family.unitPerson}
                    <c:if test="${compareUtils.show(family.unitPerson,family1.unitPerson)}"><font
                            style="color: red">（${family1.unitPerson}）</font></c:if>
                </td>
                <td class="fieldName">单位联系电话：</td>
                <td class="fieldValue">${family.unitPhone}
                    <c:if test="${compareUtils.show(family.unitPhone,family1.unitPhone)}"><font
                            style="color: red">（${family1.unitPhone}）</font></c:if>
                </td>
            </tr>
            </tbody>
        </table>
    </fieldset>
</div>
</body>
</html>