<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
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
            <td class="fieldName">合法宅基地面积【㎡】：</td>
            <td class="fieldValue">${family.confirmArea}</td>
            <td class="fieldName">正式房屋建筑面积【㎡】：</td>
            <td class="fieldValue">${family.buildArea}</td>
        </tr>
        <tr>
            <td class="fieldName">安置人口：</td>
            <td class="fieldValue"
                colspan="3">${personStr}共${family.personNum}人,其中独生子女为：${empty personOne?"/":personOne}共${family.personOne}人，达到法定结婚年龄且从未结婚为：${empty personNo?"/":personNo}共${family.personNo}人，怀孕为：${empty personPregnancy?"/":personPregnancy}共${family.personPregnancy}人。
            </td>
        </tr>
        <tr>
            <td class="fieldName">安置类型：</td>
            <td class="fieldValue"><span id="type"><tags:dataDictRadio name="type" dataDict="安置类型"
                                                                       value="${family.type}"/></span></td>
            <td class="fieldName"><span class="confir">安置面积【㎡】：</span></td>
            <td class="fieldValue"><span class="confir"><input type="text" class="form-control_short number" readonly
                                                               name="houseControlArea" size="8"
                                                               value="${family.houseControlArea}"/></span></td>
        </tr>
        </tbody>
    </table>
</fieldset>
<fieldset>
    <legend>二、评估信息情况</legend>
    <table class="table table-bordered">
        <tbody>
        <tr>
            <td class="fieldName">评估公司</td>
            <td class="fieldValue" colspan="3"><tags:dataDict dataDict="评估公司" value="${family.pgCompany}"/>
        </tr>
        <tr>
            <td class="fieldName">宅基地面积控制标准内区位补偿款【元】：</td>
            <td class="fieldValue">${family.inqwFee}</td>
            <td class="fieldName">宅基地面积控制标准外区位补偿款【元】：</td>
            <td class="fieldValue">${family.outqwFee}</td>
        </tr>
        <tr>
            <td class="fieldName">房屋及附属物重置成新价补偿款【元】：</td>
            <td class="fieldValue">${family.fswFee}&nbsp;&nbsp;
                是否包含未经审批房屋重置成新价【元】：<tags:dataDict dataDict="是否" value="${family.isGiveup}"/></td>
            <td class="fieldName">装修补助费【元】：</td>
            <td class="fieldValue">${family.realZxbzFee}</td>
        </tr>
        <tr>
            <td class="fieldName">分户补偿款【元】：</td>
            <td class="fieldValue">${family.fhbcfFee}</td>
            <td class="fieldName">合法宅基地内空地奖【元】：</td>
            <td class="fieldValue">${family.ktjFee}</td>
        </tr>
        <tr>
            <td class="fieldName">评估价款合计【元】：</td>
            <td class="fieldValue" colspan="3">${family.pgAllCount}</td>
        </tr>
        </tbody>
    </table>
</fieldset>
<fieldset>
    <legend>三、拆迁补助费及奖励费</legend>
    <table class="table table-bordered">
        <tbody>
        <tr>
            <td class="fieldName">搬家补助费【元】：</td>
            <td class="fieldValue"><input type="text" class="form-control_short fee" readonly name="bjbzFee"
                                          value="${family.bjbzFee}"/></td>
            <td class="fieldName">安置房补助费【元】：</td>
            <td class="fieldValue"><input type="text" name="azfbzFee" class="form-control_short fee" readonly
                                          value="${family.azfbzFee}"/></td>
        </tr>
        <tr>
            <td class="fieldName">人员安置补助费【元】：</td>
            <td class="fieldValue"><input type="text" class="form-control_short fee" name="rybzFee" readonly
                                          value="${family.rybzFee}"/></td>
            <td class="fieldName">生活补助费【元】：</td>
            <td class="fieldValue"><input type="text" class="form-control_short fee" name="shbzFee" readonly
                                          value="${family.shbzFee}"/></td>
        </tr>
        <tr>
            <%--<td class="fieldName">停产停业补助费【元】：</td>
            <td class="fieldValue"><input type="text" class="form-control_short fee" readonly name="tctyfFee"
                                          value="${family.tctyfFee}"/></td>--%>
            <td class="fieldName">移机费【元】：</td>
            <td class="fieldValue"><input type="text" class="form-control_short fee" name="yjfSumFee" readonly
                                       value="${family.yjfSumFee}"/></td>
            <td class="fieldName">其他补助费【元】：</td>
            <td class="fieldValue">（名称：<input type="text" class="form-control_short" name="otherName"
                                              value="${family.otherName}"/>
                金额：<input type="text" class="form-control_short fee number" name="otherfFee"
                                          value="${family.otherfFee}"/>）</td>
        </tr>
        <%--<tr>--%>
            <%--<td class="fieldName">独生子女补助费【元】：</td>--%>
            <%--<td class="fieldValue"><input type="text" class="form-control_short fee" name="onlyFee" readonly--%>
            <%--value="${family.onlyFee}"/></td>--%>
            <%--<td class="fieldName">周转补助费【元】：</td>--%>
            <%--<td class="fieldValue"><input type="text" class="form-control_short fee" name="lsazfFee" readonly--%>
                                          <%--value="${family.lsazfFee}"/></td>--%>
        <%--</tr>--%>
        <tr>

            <td class="fieldName">提前搬家奖【元】：</td>
            <td class="fieldValue"><input type="text" class="form-control_short fee" name="tqbjfFee" readonly
                                          value="${family.tqbjfFee}"/></td>
            <td class="fieldName">合法利用奖【元】：</td>
            <td class="fieldValue"><input type="text" class="form-control_short fee" name="confirmFee" readonly
                                          value="${family.confirmFee}"/></td>
        </tr>
        <tr>

            <td class="fieldName">其他奖励费用【元】：</td>
            <td class="fieldValue" colspan="3"><input type="text" class="form-control_short fee number" name="otherRewardFee"
                                                      value="${family.otherRewardFee}"/></td>
        </tr>
        </tbody>
    </table>
</fieldset>
<fieldset>
    <legend>四、拆迁补偿款总计<font style="color:red">（评估价款+拆迁补助费及奖励费）</font></legend>
    <table class="table table-bordered">
        <tbody>
        <tr>
            <td class="fieldName">拆迁补偿款总计【元】：</td>
            <td colspan="3" class="fieldvalue"><input type="text" class="form-control_short number" readonly
                                                      name="bcSumTatal" value="${family.bcSumTatal}"/></td>
        </tr>
        </tbody>
    </table>
</fieldset>