<%--
  Created by IntelliJ IDEA.
  User: jmdf
  Date: 2018/8/3
  Time: 15:04
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
        <tr>
            <td class="fieldName">交房顺序号：</td>
            <td class="fieldValue" colspan="3">
                ${family.jfNumber}
            </td>
        </tr>
        </tbody>
    </table>
</fieldset>
<fieldset style="margin-bottom: 30px">
    <legend>二、选房顺序号</legend>
    <table class="table table-bordered">
        <tr>
            <td class="fieldName">第一选房顺序号</td>
            <td class="fieldValue">
                <input name="firstXFNum" style="width: 150px;" type="text" size="3" class="form-control_short number xf1" value="${family.firstXFNum}"/>
            </td>
            <td class="fieldName">第二选房顺序号</td>
            <td class="fieldValue">
                <input name="secondXFNum" style="width: 150px" type="text" size="3" class="form-control_short number xf2" value="${family.secondXFNum}"/>
            </td>
        </tr>
        <tr>
            <td class="fieldName">第三选房顺序号</td>
            <td class="fieldValue">
                <input name="thirdXFNum" style="width: 150px;margin-top: 10px;" type="text" size="3" class="form-control_short number xf3" value="${family.thirdXFNum}"/>
            </td>
            <td class="fieldName"></td>
            <td class="fieldValue">
            </td>
        </tr>
    </table>
</fieldset>
