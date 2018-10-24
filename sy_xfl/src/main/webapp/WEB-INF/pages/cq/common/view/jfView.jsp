<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fieldset>
    <legend>一、被拆迁人情况</legend>
    <table class="table table-bordered">
        <tbody>
        <tr>
            <td class="fieldName">编号：</td>
            <td class="fieldValue">${family.familyCode}</td>
            <td class="fieldName">组 别：</td>
            <td class="fieldValue"><tags:dataDict dataDict="组别" value="${family.groupCode}"/></td>
        </tr>
        <tr>
            <td class="fieldName">姓名：</td>
            <td class="fieldValue">${family.name}</td>
            <td class="fieldName">身份证号：</td>
            <td class="fieldValue">${family.idCard}</td>
        </tr>
        <tr>
            <td class="fieldName">性别：</td>
            <td class="fieldValue"><tags:dataDict dataDict="性别" value="${family.sex}"/></td>
            <td class="fieldName">出生日期：</td>
            <td class="fieldValue"><fmt:formatDate value="${family.birthdayDate}" pattern="yyyy年MM月dd日" /></td>
        </tr>
        <tr>
            <td class="fieldName">工作单位：</td>
            <td class="fieldValue">${family.unit}</td>
            <td class="fieldName">联系电话：</td>
            <td class="fieldValue">${family.phone}</td>
        </tr>
        </tbody>
    </table>
</fieldset>
<fieldset>
    <legend>二、交房信息情况</legend>
    <table class="table table-bordered">
        <tbody>

        <tr>
            <td class="active text-right" width="15%">交房状态</td>
            <td class="text-left"><tags:dataDict  dataDict="交房状态" value="${family.jfState}"/></td>
        </tr>
        <tr>
            <td class="active text-right">交房日期</td>
            <td class="text-left"><fmt:formatDate  value="${family.jfDate}" pattern="yyyy-MM-dd" /></td>
        </tr>
        <tr>
            <td class="active text-right">交房经办人</td>
            <td class="text-left">${family.jfPerson}</td>
        </tr>
        <tr>
            <td class="active text-right">备注</td>
            <td colspan="3">${family.jfMemo}</td>
        </tr>
        </tbody>
    </table>
</fieldset>
