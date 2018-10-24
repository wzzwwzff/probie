<%--
  Created by IntelliJ IDEA.
  User: jmdf
  Date: 2018/7/30
  Time: 16:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <td class="fieldValue">${personStr}共${family.personNum}人,其中独生子女为：${empty personOne?"/":personOne}共${family.personOne}人。
            </td>
            <td class="fieldName">联系电话：</td>
            <td class="fieldValue">${family.phone}</td>
        </tr>
        <tr>
            <td class="fieldName">安置类型：</td>
            <td class="fieldValue">
                <c:if test="${family.type == 1}">
                    按人均50安置补偿
                </c:if>
                <c:if test="${family.type == 2}">
                    按宅面70%安置补偿
                </c:if>
            </td>
            <td class="fieldName"><span class="confir">安置面积【㎡】：</span></td>
            <td class="fieldValue"><span class="confir">${family.houseControlArea}</span></td>
        </tr>
        </tbody>
    </table>
</fieldset>
<fieldset style="margin-bottom: 30px">
    <legend>二、选房情况</legend>
    <table class="table table-bordered">
        <tr>
            <td class="fieldName">50m²</td>
            <td class="fieldValue">
                <input name="oneAZHouse" style="width: 100px;" type="text" size="3" class="form-control_short number azArea" value="${family.oneAZHouse}"/>套;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td class="fieldName">80m²</td>
            <td class="fieldValue">
                <input name="twoAZHouse" style="width: 100px" type="text" size="3" class="form-control_short number azArea" value="${family.twoAZHouse}"/>套;
            </td>
        </tr>
        <tr>
            <td class="fieldName">90m²</td>
            <td class="fieldValue">
                <input name="threeAZHouse" style="width: 100px;margin-top: 10px;" type="text" size="3" class="form-control_short number azArea" value="${family.threeAZHouse}"/>套;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td class="fieldName">100m²</td>
            <td class="fieldValue">
                <input name="fourAZHouse" style="width: 100px;margin-top: 10px;" type="text" size="3" class="form-control_short number azArea" value="${family.fourAZHouse}"/>套;
            </td>
        </tr>
        <tr>
            <td class="fieldName">125m²</td>
            <td class="fieldValue">
                <input name="fiveAZHouse" style="width: 100px;margin-top: 10px;" type="text" size="3" class="form-control_short number azArea" value="${family.fiveAZHouse}"/>套;
            </td>
            <td class="fieldName"></td>
            <td class="fieldValue"></td>
        </tr>
        <tr>
            <td class="fieldName">套数总计</td>
            <td class="fieldValue">
                <input name="azHouseTotal" readonly style="width: 100px;margin-top: 10px;" type="text" size="3" class="form-control number azArea" value="${family.azHouseTotal}"/>套;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td class="fieldName">面积总计</td>
            <td class="fieldValue">
                <input name="azHouseAreaTotal" readonly style="width: 100px;margin-top: 10px;" type="text" size="3" class="form-control number azArea" value="${family.azHouseAreaTotal}"/>m²;
            </td>
        </tr>
    </table>
</fieldset>