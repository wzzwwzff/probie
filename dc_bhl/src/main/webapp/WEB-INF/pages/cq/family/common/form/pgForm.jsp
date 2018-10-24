<%@ page contentType="text/html;charset=UTF-8" %>
<fieldset>
    <legend>一、被拆迁人信息</legend>
    <table class="table table-bordered">
        <tr>
            <td class="fieldName">编号</td>
            <td class="fieldValue" colspan="3">${family.familyCode}</td>
        </tr>
        <tr>
            <td class="fieldName">分指</td>
            <td class="fieldValue"><tags:dataDict dataDict="分指" value="${family.bdCode}"/></td>
            <td class="fieldName">组别</td>
            <td class="fieldValue"><tags:dataDict dataDict="组别" value="${family.groupCode}"/></td>
        </tr>
        <tr>
            <td class="fieldName">被拆迁人</td>
            <td class="fieldValue">${family.name}</td>
            <td class="fieldName">联系电话</td>
            <td class="fieldValue">${family.tel}</td>
        </tr>
        <tr>
            <td class="fieldName">身份证号</td>
            <td class="fieldValue">${family.idCard}</td>
            <td class="fieldName">婚姻状况</td>
            <td class="fieldValue"><tags:dataDict dataDict="婚姻状况" value="${family.marryStatus}"/></td>
        </tr>
    </table>
</fieldset>
<fieldset>
    <legend>二、评估数据信息</legend>
    <table class="table table-bordered">
        <tr>
            <td class="fieldName">评估公司名称</td>
            <td class="fieldValue" colspan="3"></td>
        </tr>
        <tr>
            <td class="fieldName">房屋价值</td>
            <td class="fieldValue"><input type="text" class="form-control number" name="houseMoney" value="${family.houseMoney}"/></td>
            <td class="fieldName">房屋装修及附属物</td>
            <td class="fieldValue"><input type="text" class="form-control number" name="fitPgMoney" value="${family.fitPgMoney}"/></td>
        </tr>
        <tr>
            <td class="fieldName">房屋重置成新价</td>
            <td class="fieldValue" colspan="3"><input type="text" class="form-control number" name="houseNewMoney" value="${family.houseNewMoney}"/></td>
        </tr>
    </table>
</fieldset>