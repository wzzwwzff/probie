<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>添加家庭成员信息</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="title">
    <h5>添加家庭成员信息</h5>
</div>
<div class="content">
    <form action="save?<tags:searchParams></tags:searchParams>" class="form-inline" method="post">
        <input type="hidden" name="familyId" value="${family.id}"/>
        <input type="hidden" name="houseId" value="${houseId}"/>
        <fieldset>
            <legend>一、被拆迁人状况</legend>
            <table class="table table-bordered">
                <tbody>
                <tr>
                    <td class="fieldName">姓名</td>
                    <td class="fieldValue">${family.name}</td>
                    <td class="fieldName">档案编号</td>
                    <td class="fieldValue">${family.familyCode}</td>
                </tr>
                <tr>
                    <td class="fieldName">房屋产别</td>
                    <td class="fieldValue"><tags:dataDict dataDict="房屋产别" value="${family.houseType}"/></td>
                    <td class="fieldName">身份证号</td>
                    <td class="fieldValue">${family.idCard}</td>
                </tr>
                <tr>
                    <td class="fieldName">建筑面积</td>
                    <td class="fieldValue">${family.buildArea}㎡</td>
                    <td class="fieldName">地址门牌</td>
                    <td class="fieldValue">${family.address}</td>
                </tr>
            </table>
        </fieldset>
        <fieldset>
            <legend>二、家庭成员信息</legend>
            <table class="table table-bordered table-hover" id="personTable">
                <tr>
                    <td class="fieldName" style="text-align: center;width: 6%">户口本数</td>
                    <td class="fieldName" style="text-align: center;width: 10%">姓名</td>
                    <td class="fieldName" style="text-align: center">年龄</td>
                    <td class="fieldName" style="text-align: center;width: 18%">身份证号</td>
                    <td class="fieldName" style="text-align: center;width: 10%">与户主关系</td>
                    <td class="fieldName" style="text-align: center">户主与被拆迁人关系</td>
                    <td class="fieldName" style="text-align: center;width: 8%">是否享受过保障性住房政策</td>
                    <td class="fieldName" style="text-align: center;width: 8%">是否享受人均5㎡</td>
                    <td class="fieldName" style="text-align: center;width: 8%">是否长期住在未登记房屋内</td>
                    <td class="fieldName" style="text-align: center;width: 14%">工作单位</td>
                </tr>
                <c:forEach begin="0" end="${1+fn:length(familyPersonList)}" var="i">
                    <c:set var="familyPerson1" value="${familyPersonList[i]}"/>
                    <tr>
                        <input type="hidden" name="fp_id" value="${familyPerson1.id}"/>
                            <%--在本址--%>
                        <input type="hidden" name="fp_type" value="1"/>
                        <input type="hidden" name="fp_hjAddress" value=""/>
                        <td style="text-align: center;"><input type="text" class="form-control digits" name="fp_hkNum" size="5" value="${familyPerson1.hkNum}"/></td>
                        <td style="text-align: center;"><input type="text" class="form-control" name="fp_name" value="${familyPerson1.name}"/></td>
                        <td style="text-align: center;"><input type="text" class="form-control" name="fp_age" style="width: 4em;" value="${familyPerson1.age}"/></td>
                        <td style="text-align: center;"><input type="text" size="30" class="form-control" name="fp_idCard" value="${familyPerson1.idCard}"/></td>
                        <td style="text-align: center;"><input type="text" class="form-control" name="fp_relation" value="${familyPerson1.relation}"/></td>
                        <td style="text-align: center;"><input type="text" class="form-control" name="fp_hzRelation" style="width: 10em;" value="${familyPerson1.hzRelation}"/></td>
                        <td style="text-align: center;">
                            <tags:dataDictInput dataDict="是否" name="fp_status" value="${empty familyPerson1.status ? 2 : familyPerson1.status}" className="form-control" firstValue="-请选择-"/>
                        </td>
                        <td style="text-align: center;">
                            <tags:dataDictInput dataDict="是否" name="fp_aveStatus" value="${empty familyPerson1.aveStatus ? 1 : familyPerson1.aveStatus}" className="form-control" firstValue="-请选择-"/>
                        </td>
                        <td style="text-align: center;">
                            <tags:dataDictInput dataDict="是否长期住在未登记房屋内" name="fp_flag" value="${empty familyPerson1.flag ? 1 : familyPerson1.flag}" className="form-control" firstValue="-请选择-"/>
                        </td>
                        <td style="text-align: center;"><input type="text" size="30" class="form-control" name="fp_unit" value="${familyPerson1.unit}"/></td>
                    </tr>
                </c:forEach>
            </table>
            <div align="center"><input type="button" class="btn btn-sm btn-primary" onclick="addRow();" value="添加新行"/>
            </div>
        </fieldset>
        <div class="footer resizeLayout">
            <button class="btn btn-primary" type="submit"><i class="fa fa-save"></i>&nbsp;保存</button>
            &nbsp;&nbsp;
            <button class="btn btn-white" type="button" onclick="history.back()"><i class="fa fa-backward"></i>&nbsp;取消
            </button>
        </div>
    </form>

</div>
<script>
    function change(familyPersonId, houseId, familyId) {
        if (confirm("确定变更该购房人吗？")) {
            location.href = "change?familyId=" + familyId + "&houseId=" + houseId + "&familyPersonId=" + familyPersonId;
        }
    }

    //家庭成员增加新行
    function addRow() {
        var rowIndex = $("#personTable tr").length - 1;
        $("#personTable tr:last").clone().insertAfter($("#personTable tr:eq(" + rowIndex + ")"))
        $("#personTable tr:last input").each(function () {
            $(this).val("");
        });
    }
</script>
</body>
</html>