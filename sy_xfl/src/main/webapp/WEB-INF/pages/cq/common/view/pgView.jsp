<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fieldset>
    <legend>一、被拆迁人情况</legend>
    <table class="table table-bordered">
        <tbody>
        <tr>
            <td class="fieldName">组 别：</td>
            <td class="fieldValue"><tags:dataDict dataDict="组别" value="${family.groupCode}"/></td>
            <td class="fieldName">编号：</td>
            <td class="fieldValue">${family.familyCode}</td>
        </tr>
        <tr>
            <td class="fieldName">姓名：</td>
            <td class="fieldValue">${family.name}</td>
            <td class="fieldName">身份证号：</td>
            <td class="fieldValue">${family.idCard}</td>
        </tr>
        <tr>
            <td class="fieldName">房屋坐落：</td>
            <td class="fieldValue" >${family.houseAddress}</td>
            <td class="fieldName">合法宅基地面积【㎡】：</td>
            <td class="fieldValue" >${family.confirmArea}</td>
        </tr>
        <tr>
            <td class="fieldName">控制标准面积【㎡】：</td>
            <td class="fieldValue">${family.controlArea}</td>
            <td class="fieldName">超控制标准面积【㎡】：</td>
            <td class="fieldValue">${family.outControlArea}</td>
        </tr>
        <tr>
            <td class="fieldName">合法宅基地范围内正式房屋建筑面积【㎡】：</td>
            <td class="fieldValue">${family.buildArea}</td>
            <td class="fieldName">合法宅基地外的房屋建筑面积【㎡】：</td>
            <td class="fieldValue">${family.outBuildArea}</td>
        </tr>
        </tbody>
    </table>
</fieldset>
<fieldset>
    <legend>二、评估信息情况</legend>
    <table class="table table-bordered">
        <tbody>
        <tr>
            <td class="fieldName">评估公司：</td>
            <td class="fieldValue" colspan="3"><tags:dataDict dataDict="评估公司" value="${family.pgCompany}"/>
        </tr>
        <tr>
            <td class="fieldName">宅基地面积控制标准内区位补偿款【元】：</td>
            <td class="fieldValue"><%--${family.inqwFee}--%><fmt:formatNumber value="${family.inqwFee+0.000001}" pattern="##0"/></td>
            <td class="fieldName">宅基地面积控制标准外区位补偿款【元】：</td>
            <td class="fieldValue"><%--${family.outqwFee}--%><fmt:formatNumber value="${family.outqwFee+0.000001}" pattern="##0"/></td>
        </tr>
        <tr>
            <td class="fieldName">宅基地区位补偿款【元】：</td>
            <td class="fieldValue" colspan="3"><%--${family.qwMoney}--%><fmt:formatNumber value="${family.qwMoney+0.000001}" pattern="##0"/></td>
        </tr>
        <tr>
            <td class="fieldName">房屋及附属物重置成新价补偿款【元】：</td>
            <td class="fieldValue"><fmt:formatNumber value="${family.fswFee+0.000001}" pattern="##0"/>&nbsp;&nbsp;
                是否包含未经审批房屋重置成新价：<tags:dataDict dataDict="是否" value="${family.isGiveup}"/></td>
            <td class="fieldName">装修补助费【元】：</td>
            <td class="fieldValue"><fmt:formatNumber value="${family.realZxbzFee+0.000001}" pattern="##0"/></td>
        </tr>
        <tr>
            <td class="fieldName">分户补偿款【元】：</td>
            <td class="fieldValue"><fmt:formatNumber value="${family.fhbcfFee+0.000001}" pattern="##0"/></td>
            <td class="fieldName">合法宅基地内空地奖【元】：</td>
            <td class="fieldValue"><fmt:formatNumber value="${family.ktjFee+0.000001}" pattern="##0"/></td>
        </tr>
        <tr>
            <td class="fieldName">评估价款合计【元】：</td>
            <td class="fieldValue" colspan="3"><fmt:formatNumber value="${family.pgAllCount+0.000001}" pattern="##0"/></td>
        </tr>
        </tbody>
    </table>
</fieldset>

