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
            <td class="fieldName">房屋坐落：</td>
            <td class="fieldValue" colspan="3">${family.houseAddress}</td>
        </tr>
        </tbody>
    </table>
</fieldset>
<fieldset>
    <legend>二、测绘信息情况</legend>
    <table class="table table-bordered">
        <tbody>
        <tr>

            <td class="fieldName">合法宅基地范围内正式房屋建筑面积【㎡】：</td>
            <td class="fieldValue">${family.buildArea}</td>

        </tr>
        <tr>
            <td class="fieldName">合法宅基地外的房屋建筑面积【㎡】：</td>
            <td class="fieldValue">${family.outBuildArea}</td>
        </tr>
        </tbody>
    </table>
</fieldset>

