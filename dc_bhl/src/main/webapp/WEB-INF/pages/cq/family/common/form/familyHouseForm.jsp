<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <legend>二、标准自建房信息</legend>
    <table class="table table-bordered">
        <tr>
            <td class="fieldName">间数</td>
            <td class="fieldValue"><input type="text" class="form-control number" size="5" name="houseNum" value="${familyHouse.houseNum}"/></td>
            <td class="fieldName">面积</td>
            <td class="fieldValue"><input type="text" class="form-control number" size="8" name="houseArea" value="${familyHouse.houseArea}"/>㎡</td>
        </tr>
        <tr>
            <td class="fieldName">房主姓名</td>
            <td class="fieldValue"><input type="text" class="form-control" name="name" value="${familyHouse.name}"/></td>
            <td class="fieldName">房主身份证号</td>
            <td class="fieldValue"><input type="text" class="form-control" name="idCard" size="50" value="${familyHouse.idCard}"/></td>
        </tr>
    </table>
</fieldset>
<fieldset>
    <legend>三、标准自建房内家庭成员</legend>
    <table class="table table-bordered" id="housePersonTable">
        <tr>
            <td class="fieldName" style="text-align: center;width: 15%">姓名</td>
            <td class="fieldName" style="text-align: center;width: 20%">身份证号</td>
            <td class="fieldName" style="text-align: center;width: 13%">与房主关系</td>
        </tr>
        <c:forEach begin="0" end="${fn:length(familyHousePersonList) + 2}" var="i">
            <c:set var="person" value="${familyHousePersonList[i]}"/>
            <tr>
                <input type="hidden" name="p_id" value="${person.id}"/>
                <td style="text-align: center;"><input type="text" name="p_name" class="form-control" value="${person.name}"/></td>
                <td style="text-align: center;"><input type="text" name="p_idCard" size="40" class="form-control" value="${person.idCard}"/></td>
                <td style="text-align: center;"><input type="text" name="p_relation" class="form-control" value="${person.relation}"/></td>
            </tr>
        </c:forEach>
    </table>
    <div align="center"><input type="button" class="btn btn-sm btn-primary" onclick="addRow();" value="添加新行"/></div>
</fieldset>
