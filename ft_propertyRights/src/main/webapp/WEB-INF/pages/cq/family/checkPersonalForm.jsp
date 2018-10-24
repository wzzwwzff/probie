<%--
  Created by IntelliJ IDEA.
  User: jmdf
  Date: 2018/8/10
  Time: 18:15
  To change this template use File | Settings | File Templates.
--%>
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
    <title>家庭信息上报</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="title">
    <h4 style="color: #0d88cc">家庭信息上报</h4>
</div>
<div class="content">
    <div class=" doc-content"
         style="position: relative;">
        <fieldset>
            <legend>一、申请人信息</legend>
            <table class="table table-bordered">
                <tbody>
                <tr>
                    <td class="fieldName">项目名称：</td>
                    <td class="fieldValue">
                        ${family.projectName}
                    </td>
                    <td class="fieldName">申请编号：</td>
                    <td class="fieldValue">
                        ${family.familyCode}
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">姓名：</td>
                    <td class="fieldValue">${family.name}</td>
                    <td class="fieldName">证件号码：</td>
                    <td class="fieldValue">
                        <div style="float: left;">
                            <tags:dataDict value="${family.cardType}" dataDict="证件类型"/>
                        </div>
                        <div style="float: right;margin-right:300px;">
                            ${family.idCard}
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">婚姻状况：</td>
                    <td class="fieldValue">
                        <tags:dataDict dataDict="婚姻状况" value="${family.marryStatus}" />
                    </td>
                    <td class="fieldName">年龄：</td>
                    <td class="fieldValue">${family.age}</td>
                </tr>
                <tr>
                    <td class="fieldName">户籍所在地：</td>
                    <td class="fieldValue">${family.address}</td>
                    <td class="fieldName">工作地（社保缴纳地）：</td>
                    <td class="fieldValue">
                        <tags:dataDict dataDict="工作地（社保缴纳地）" value="${family.workUnit}" />
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">是否是本区：</td>
                    <td class="fieldValue"><tags:dataDict dataDict="是否" value="${family.thisArea}" /></td>
                    <td class="fieldName">申请日期：</td>
                    <td class="fieldValue">
                        <fmt:formatDate value="${family.applyDate}" pattern="yyyy-MM-dd" />
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">工作居住证类型：</td>
                    <td class="fieldValue">
                        <tags:dataDict value="${family.residencePermit}" dataDict="工作居住证类型"/>
                    </td>
                    <td class="fieldName">办理使用证件：</td>
                    <td class="fieldValue" colspan="3">
                        <div style="float: left;">
                            <tags:dataDict value="${family.handleType}" dataDict="证件类型"/>
                        </div>
                        <div style="float: right;margin-right:200px;">
                            ${family.handleCard}
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">工作居住证编号：</td>
                    <td class="fieldValue">
                        ${family.residencePermitCode}
                    </td>
                    <td class="fieldName">工作居住证有效期限：</td>
                    <td class="fieldValue">
                        <div style="float: left;">
                            <fmt:formatDate value="${family.startDate}" pattern="yyyy-MM-dd"/>
                        </div>
                        <div style="float: left;margin-left: 23px;margin-right: 23px">
                            至
                        </div>
                        <div style="float: left">
                            <fmt:formatDate value="${family.endDate}" pattern="yyyy-MM-dd"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">军官（警官）证件：</td>
                    <td class="fieldValue">
                        <tags:dataDict value="${family.armyType}" dataDict="军官（警官）证件"/>
                    </td>
                    <td class="fieldName">证件号码：</td>
                    <td class="fieldValue">
                        ${family.armyIdCard}
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">暂住证/居住证/登记卡编号：</td>
                    <td class="fieldValue">${family.registerCode}
                    </td>
                    <td class="fieldName">暂住证/居住证/登记卡有效期限：</td>
                    <td class="fieldValue">
                        <div style="float: left;">
                            <fmt:formatDate value="${family.startDate}" pattern="yyyy-MM-dd"/>
                        </div>
                        <div style="float: left;margin-left: 23px;margin-right: 23px">
                            至
                        </div>
                        <div style="float: left">
                            <fmt:formatDate value="${family.endDate}" pattern="yyyy-MM-dd"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">是否是本区：</td>
                    <td class="fieldValue" colspan="3">
                        <div style="float: left">
                            <tags:dataDict value="${family.thisArea}" dataDict="是否"/>
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
                    <td class="fieldValue">${family.exSpouseName}</td>
                    <td class="fieldName">前配偶证件号码：</td>
                    <td class="fieldValue"><tags:dataDict dataDict="证件类型" value="${family.exCardType}"/>  ${family.exIdCard}</td>
                </tr>
                <tr>
                    <td class="fieldName">离婚日期：</td>
                    <td class="fieldValue" colspan="3"><fmt:formatDate value="${family.divorceDate}" var="divorceDate" pattern="yyyy-MM-dd" /><c:out value="${divorceDate}" /></td>
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
                    <td class="fieldValue" colspan="3">${family.count}</td>
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
                            <%--<input type="hidden" class="form-control" name="fp_uuid" value="${familyPersonList[i].uuid}"/>--%>
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
                    <td class="fieldValue">${family.contactName}</td>
                    <td class="fieldName">手机号码：</td>
                    <td class="fieldValue">${family.phone}</td>
                </tr>
                <tr>
                    <td class="fieldName">通讯地址：</td>
                    <td class="fieldValue">${family.currentAddres}</td>
                    <td class="fieldName">邮编：</td>
                    <td class="fieldValue">${family.postCode}</td>
                </tr>
                <tr>
                    <td class="fieldName">备注：</td>
                    <td class="fieldValue" colspan="3">${family.memo}</td>
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
                    <td class="fieldValue">${family.shakingBatch}</td>
                    <td class="fieldName">摇号编号：</td>
                    <td class="fieldValue">${family.shakingCode}</td>
                </tr>
                <tr>
                    <td class="fieldName">摇号组别：</td>
                    <td class="fieldValue">${family.shakingGroup}</td>
                    <td class="fieldName">摇号结果：</td>
                    <td class="fieldValue">${family.shakingResult}</td>
                </tr>
                <tr>
                    <td class="fieldName">是否是优先组：</td>
                    <td class="fieldValue"><tags:dataDict value="${family.firstOrNot}" dataDict="是否"/></td>
                    <td class="fieldName">社保是否符合连续缴纳12个月要求：</td>
                    <td class="fieldValue"><tags:dataDict dataDict="是否" value="${family.continuity}" />
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">学历：</td>
                    <td class="fieldValue"><tags:dataDict value="${family.education}" dataDict="学历层次"/></td>
                    <td class="fieldName">学历证书在线验证码：</td>
                    <td class="fieldValue">${family.educationCode}
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">学习形式：</td>
                    <td class="fieldValue"><tags:dataDict value="${family.learning}" dataDict="学习形式"/></td>
                    <td class="fieldName">是否园区：</td>
                    <td class="fieldValue"><tags:dataDict value="${family.thisPark}" dataDict="是否"/>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">职务：</td>
                    <td class="fieldValue">${family.job}</td>
                    <td class="fieldName">工作单位：</td>
                    <td class="fieldValue">${family.unit}
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">单位联系人：</td>
                    <td class="fieldValue">${family.unitPerson}</td>
                    <td class="fieldName">单位联系电话：</td>
                    <td class="fieldValue">${family.unitPhone}
                    </td>
                </tr>
                </tbody>
            </table>
        </fieldset><br/>
        <div class="text-center footer">
            <button type="button" class="btn btn-primary" <c:if test="${family.dataStatus eq 2}"> disabled </c:if>
                    onclick="javascript:handUp('${family.id}')"><i
                    class="fa fa-check"></i> 上报
            </button>
            <button type="button" class="btn btn-white" onclick="javascript:history.back();"><i
                    class="fa fa-backward"></i> 返回
            </button>
        </div>
    </div>
</div>
</body>
<script>
    function handUp(familyId) {
        if (confirm("确定上报数据吗？")) {
            $.get("personalHandUp", {
                familyId: familyId,
                _date: new Date().getTime()
            }, function (data) {
                if (data.code == "0000") {
                    window.location.href = "personalList?<tags:searchParams/>";
                } else {
                    alert(data.message);
                    window.location.reload();
                }
            })
        }
    }
    //日期控件
    $('.form-date-time').on('changeDate', function (ev) {
        $(this).datepicker('hide');
    });

    $('.form-date-time').datepicker({
        minViewMode: 'hours',
        format: 'yyyy-mm-dd',
        autoclose: true,
    });

    $('.form-date-time-m').datepicker({
        minViewMode: 'hours',
        format: 'yyyy-mm',
        autoclose: true,
    });
</script>
</html>
