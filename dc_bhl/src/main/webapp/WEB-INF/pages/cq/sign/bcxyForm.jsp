<%@ page import="com.sqds.web.Servlets" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Servlets.setNoCacheHeader(response); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>补偿安置意向书签订管理</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<style>
</style>
<body>
<div class="title"><h4>补偿安置意向书签订管理</h4></div>
<div class="content">
    <form id="myForm">
            <input type="hidden" name="familyId" value="${family.id}">
        <fieldset>
            <legend>一、被拆迁人的基本信息</legend>
            <table class="table table-bordered">
                <tr>
                    <td class="fieldName">分指</td>
                    <td class="fieldValue"><tags:dataDict dataDict="分指" value="${family.bdCode}"/>
                    </td>
                    <td class="fieldName">组别</td>
                    <td class="fieldValue"><tags:dataDict dataDict="组别" value="${family.groupCode}"/></td>
                </tr>
                <tr>
                    <td class="fieldName">家庭编号</td>
                    <td class="fieldValue">${family.familyCode}</td>
                    <td class="fieldName">被征收人</td>
                    <td class="fieldValue">${family.name}</td>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">身份证号</td>
                    <td class="fieldValue">${family.idCard}
                    </td>
                    <td class="fieldName">房屋产别</td>
                    <td class="fieldValue"><tags:dataDict dataDict="房屋产别"
                                                          value="${family.houseType}"/>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">房屋类型</td>
                    <td class="fieldValue"><tags:dataDict dataDict="房屋类型"
                                                          value="${family.houseStyle}"/>
                    </td>
                    <td class="fieldName">住宅房屋用途</td>
                    <td class="fieldValue"><tags:dataDict dataDict="住宅房屋用途"
                                                          value="${family.houseUse}"/>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">地址门牌</td>
                    <td class="fieldValue">${family.address}</td>
                    <td class="fieldName">建筑面积</td>
                    <td class="fieldValue">${family.buildArea}㎡</td>
                </tr>
                <tr>
                    <td class="fieldName">被拆迁人联系电话</td>
                    <td class="fieldValue" colspan="3"><input type="text" class="form-control"
                                                  placeholder=""
                                                  name="tel"
                                                  style="width: 280px;"
                                                  value="${family.tel}"/>
                    </td>
                </tr>
            </table>
        </fieldset>
        <c:if test="${family.signStatus eq 1}">
        <fieldset>
            <legend>二、补偿方式</legend>
            <div class="row">
                <c:forEach var="bc" items="${bcMap}" varStatus="status">
                    <div class="col-md-3 text-center">
                        <div class="well" style="font-size: 28px;">
                            <div class="radio">
                                <label class="radio-inline">
                                    <input type="radio" name="bcType" value="${bc.key}"
                                        ${family.bcType eq bc.key ? 'checked' : ''}
                                           style="height: 32px;width: 32px;"/><br/>
                                    <font color="green">${bc.value}<c:if test="${bc.key eq '1'}">(就地安置)</c:if>
                                    </font>
                                </label>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </fieldset>
        </c:if>
        <div class="footer" style="text-align: center;padding: 10px;">
            <button class="btn btn-primary" type="button" id="submitBtn"
                    onclick="javascript:saveForm(${family.id})"><i class="fa fa-save"></i>&nbsp;保存并打印协议
            </button>
            &nbsp;
            <button class="btn btn-white" type="button" onclick="location.href='bcxyList'"><i
                    class="fa fa-backward"></i>&nbsp;返回
            </button>
        </div>
    </form>
</div>
<script>
    function validateBeforeSubmit() {
        var obj = $('input:radio[name="bcType"]:checked').val();//得到当前选中的radio的值
        if (obj == null) {
            alert("请选择补偿方式!");
            return false;
        }
    }
    //保存房源
    function saveForm(id) {
        $.ajax({
            url: "saveForm",
            type: "post",
            data: $("#myForm").serialize(),
            beforeSend: function () {
                <c:if test="${family.signStatus eq 1}">
                return validateBeforeSubmit();
                </c:if>
            },
            success: function (result) {
                if (result.code == "0000") {
                    location.href = "printBcxyFrame?familyId=${family.id}";
                } else {
                    alert(result.message);
                    location.reload();
                }
            },
            error: function () {
                alert("保存错误，请刷新重试！！！");
            }
        });
    }
</script>
</body>
</html>