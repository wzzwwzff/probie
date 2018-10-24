<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
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
            <td class="fieldValue"><input size="15" type="text" class="form-control_short fee number" name="inqwFee" readonly value="<%--${family.controlArea*1755}--%><fmt:formatNumber value="${family.controlArea*1755+0.000001}" pattern="##0"/>"/><%--${family.inqwFee}--%></td>
            <td class="fieldName">宅基地面积控制标准外区位补偿款【元】：</td>
            <td class="fieldValue"><input size="15" type="text" class="form-control_short fee number" name="outqwFee" readonly value="<%--${family.outControlArea*1755*0.5}--%><fmt:formatNumber value="${family.outControlArea*1755*0.5+0.000001}" pattern="##0"/>"/></td>
        </tr>
        <tr>
            <td class="fieldName">宅基地区位补偿款【元】：</td>
            <td class="fieldValue" colspan="3"><input size="15" type="text" name="qwMoney" class="form-control_short" readonly value="<%--${family.qwMoney}--%><fmt:formatNumber value="${family.qwMoney+0.000001}" pattern="##0"/>"/></td>

        </tr>
        <tr>
            <td class="fieldName">房屋及附属物重置成新价补偿款【元】：</td>
            <td class="fieldValue">
                <input size="15" type="text" class="form-control_short fee number" name="fswFee" value="<fmt:formatNumber  value="${family.fswFee+0.000001}"  pattern="##0"/>"/>&nbsp;&nbsp;
                是否包含未经审批房屋重置成新价：<tags:dataDictRadio dataDict="是否" value="${family.isGiveup}" name="isGiveup"/>
            </td>
            <td class="fieldName">装修补助费【元】：</td>
            <td class="fieldValue">
                <input size="15" type="text" class="form-control_short fee number" name="realZxbzFee" value="<fmt:formatNumber  value="${family.realZxbzFee+0.000001}"  pattern="##0"/>"/>
            </td>
        </tr>
        <tr>
                <td class="fieldName">分户补偿款【元】：</td>
                <td class="fieldValue">
                    <input size="15" type="text" class="form-control_short fee number" name="fhbcfFee" value="<fmt:formatNumber  value="${family.fhbcfFee+0.000001}"  pattern="##0"/>"/>
                </td>
            <td class="fieldName">合法宅基地内空地奖【元】：</td>
            <td class="fieldValue"><input size="15" type="text" class="form-control_short fee number" name="ktjFee" value="<fmt:formatNumber  value="${family.ktjFee+0.000001}"  pattern="##0"/>"/></td>
        </tr>
        <tr>
            <td class="fieldName">评估价款合计【元】：</td>
            <td class="fieldValue" colspan="3"><input size="15" type="text"  class="form-control_short" readonly  name="pgAllCount" value="<fmt:formatNumber  value="${family.pgAllCount+0.000001}"  pattern="##0"/>"/></td>
        </tr>
        </tbody>
    </table>
</fieldset>