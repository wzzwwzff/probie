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
            <legend>一、被征收人状况</legend>
            <table class="table table-bordered">
                <tr>
                    <td class="fieldName">家庭编号</td>
                    <td class="fieldValue">${family.familyCode}</td>
                    <td class="fieldName">被征收人</td>
                    <td class="fieldValue">${family.name}</td>
                </tr>
                <tr>
                    <td class="fieldName">性别</td>
                    <td class="fieldValue"><tags:dataDict dataDict="性别" value="${family.sex}"/></td>
                    <td class="fieldName">身份证号</td>
                    <td class="fieldValue">${family.idCard}</td>
                </tr>
                <tr>
                    <td class="fieldName">建筑面积</td>
                    <td class="fieldValue">${family.azArea}㎡</td>
                    <td class="fieldName">房屋坐落</td>
                    <td class="fieldValue">${family.fwzl}</td>
                </tr>
            </table>
        </fieldset>
        <fieldset>
            <legend>二、家庭成员信息</legend>
            <table class="table table-bordered table-hover" id="personTable">
                <tr>
                    <td class="fieldName" style="text-align: center;width: 10%">姓名</td>
                    <td class="fieldName" style="text-align: center;width: 5%">性别</td>
                    <td class="fieldName" style="text-align: center;width: 12%">身份证号</td>
                    <td class="fieldName" style="text-align: center;width: 5%">年龄</td>
                    <td class="fieldName" style="text-align: center;width: 8%">联系电话</td>
                    <td class="fieldName" style="text-align: center;width: 8%">与<span
                            id="backupRelationText1">产权人</span>关系
                    </td>
                    <td class="fieldName" style="text-align: center;width: 5%">是否在册</td>
                    <td class="fieldName" style="text-align: center;width: 5%">户籍类型</td>
                    <td class="fieldName" style="text-align: center;width: 8%">户口所在地</td>
                    <td class="fieldName" style="text-align: center;width: 8%">生活水平</td>
                    <td class="fieldName" style="text-align: center;width: 8%">备注</td>
                </tr>
                <c:forEach begin="0" end="${1+fn:length(familyPersonList)}" var="i" varStatus="status">
                    <c:set var="familyPerson" value="${familyPersonList[i]}"/>
                    <tr id="tr_${status.index+1}">
                        <input type="hidden" name="pId" value="${familyPerson.id}"/></td>
                        <td style="text-align: center;">
                            <c:if test="${familyPerson.pName eq null}"><input type="text" id="f_pName${status.index+1}"
                                                                              name="pName" class="form-control"
                                                                              size="10"
                                                                              value="${familyPerson.pName}"/></c:if>
                            <c:if test="${familyPerson.pName ne null}">
                                <input type="text" id="f_pName${status.index+1}" name="pName" class="form-control"
                                       readonly size="10" value="${familyPerson.pName}"/>
                            </c:if>
                        </td>
                        <td style="text-align: center;">
                            <tags:dataDictInput name="pSex" dataDict="性别" className="form-control"
                                                value="${familyPerson.pSex}"/>
                        </td>
                        <td style="text-align: center;">
                            <input type="text" name="pIdCard" class="form-control" size="20"
                                   value="${familyPerson.pIdCard}"/>
                        </td>
                        <td style="text-align: center;">
                            <input type="text" name="pAge" class="form-control" size="5"
                                   value="${familyPerson.age}"/>
                        </td>
                        <td style="text-align: center;">
                            <input type="text" name="pPhone" class="form-control"
                                   value="${familyPerson.pPhone}"/>
                        </td>
                        <td style="text-align: center;">
                            <input type="text" name="pRelation" class="form-control"
                                   value="${familyPerson.pRelation}"/>
                        </td>
                        <td style="text-align: center;">
                            <tags:dataDictInput name="isRegistered" dataDict="在册/非在册" className="form-control"
                                                value="${familyPerson.isRegistered}"/>
                        </td>
                        <td style="text-align: center;">
                            <tags:dataDictInput name="pAddressType" dataDict="户籍性质" className="form-control"
                                                value="${familyPerson.addressType}"/>
                        </td>
                        <td style="text-align: center;">
                            <input type="text" name="pAddress" class="form-control" value="${familyPerson.pAddress}"/>
                        </td>
                        <td align="center">
                            <input type="text" name="liveStatus" value="${familyPerson.liveStatus}" size="10" class="form-control">
                        </td>
                        <td style="text-align: center;">
                            <input type="text" name="pMemo" class="form-control" value="${familyPerson.pMemo}"/>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <div align="center"><input type="button" class="btn btn-sm btn-primary" onclick="addRow();" value="添加新行"/>
            </div>
        </fieldset>
        <div class="footer resizeLayout">
            <button class="btn btn-primary btn-sm" type="submit"><i class="fa fa-save"></i>&nbsp;保存</button>
            &nbsp;&nbsp;
            <button class="btn btn-white btn-sm" type="button" onclick="history.back()"><i class="fa fa-backward"></i>&nbsp;取消
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