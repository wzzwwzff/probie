<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@include file="/static/common/common.jsp" %>

<form class="form-horizontal" id="myForm" method="post" action="contractSave?<tags:searchParams/>">
    <input type="hidden" name="contractId" id="contractId" value="${contract.id}"/>
    <input type="hidden" name="houseId" id="houseId" value="${house.id}"/>
    <table class="table table-bordered">
        <c:if test="${house.status eq 1}">
            <tr>
                <td class="fieldName"><span class="require">*</span>申请编号：</td>
                <td class="fieldValue">
                    <input type="text" id="familyCode" name="familyCode" value="${contract.familyCode}" placeholder="必填项" class="form-control required"
                           style="width: 20em"/>
                </td>
                <td class="fieldName"><span class="require">*</span>合同编号：</td>
                <td class="fieldValue">
                    <input type="text" name="contractCode" value="${contract.contractCode}" placeholder="必填项" class="form-control required"
                           style="width: 20em"/>
                </td>
            </tr>
            <tr>
                <td class="fieldName">产权人姓名：</td>
                <td class="fieldValue"> <input type="text" name="name" value="${contract.name}" placeholder="必填项" class="form-control required"
                                               style="width: 20em"/></td>
                <td class="fieldName">身份号码：</td>
                <td class="fieldValue"> <input type="text" name="idCard" value="${contract.idCard}" placeholder="必填项" class="form-control required"
                                               style="width: 20em"/></td>
            </tr>
        </c:if>
        <c:if test="${house.status ne 1}">
            <tr>
                <td class="fieldName">申请编号：</td>
                <td class="fieldValue"> ${contract.familyCode} </td>
                <td class="fieldName">合同编号：</td>
                <td class="fieldValue"> ${contract.contractCode} </td>
            </tr>
            <tr>
                <td class="fieldName">产权人姓名：</td>
                <td class="fieldValue"> ${contract.name} </td>
                <td class="fieldName">身份号码：</td>
                <td class="fieldValue"> ${contract.idCard} </td>
            </tr>
        </c:if>

        <tr>
            <td class="fieldName">项目名称：</td>
            <td class="fieldValue"> ${project.projectName} </td>
            <td class="fieldName">楼号：</td>
            <td class="fieldValue"> ${house.buildNum} </td>
        </tr>
        <tr>
            <td class="fieldName">单元：</td>
            <td class="fieldValue"> ${house.unitNum} </td>
            <td class="fieldName">房号：</td>
            <td class="fieldValue"> ${house.houseNum} </td>
        </tr>
        <tr>
            <td class="fieldName">居室：</td>
            <td class="fieldValue"> <tags:dataDict dataDict="居室" value="${house.houseType}"/> </td>
            <td class="fieldName">建筑面积：</td>
            <td class="fieldValue"> ${house.buildArea} </td>
        </tr>

        <c:if test="${house.status eq 1}">
            <tr>
                <td class="fieldName">合同签订日期：</td>
                <td class="fieldValue">
                    <input type="text" name="signDate" id="signDate" value="<fmt:formatDate value="${contract.signDate}" pattern="yyyy-MM-dd"/>"
                           class="form-control form-date-time datetime dateISO" style="width: 130px;height: 33px;"/>
                </td>
                <td class="fieldName">经办人：</td>
                <td class="fieldValue"><input type="text" name="person" value="${contract.person}" class="form-control required"
                                              style="width: 20em"/></td>
            </tr>
            <tr>
                <td class="fieldName">销售价格：</td>
                <td class="fieldValue"><input type="text" name="price" value="${contract.price}" class="form-control" style="width: 20em"/></td>
                <td class="fieldName">产权比例：</td>
                <td class="fieldValue"><input type="text" name="propertyRight" value="${contract.propertyRight eq null? project.scale: contract.propertyRight}" class="form-control" style="width: 20em"/></td>
            </tr>
            <tr>
                <td class="fieldName">备注：</td>
                <td class="fieldValue" colspan="3">
                    <textarea class="form-control" cols="60" rows="4" name="memo" value="${contract.memo}"></textarea>
                </td>
            </tr>
        </c:if>
        <c:if test="${house.status ne 1}">
            <tr>
                <td class="fieldName">合同签订日期：</td>
                <td class="fieldValue"> <fmt:formatDate value="${contract.signDate}" pattern="yyyy-MM-dd"/> </td>
                <td class="fieldName">经办人：</td>
                <td class="fieldValue"> ${contract.person} </td>
            </tr>
            <tr>
                <td class="fieldName">销售价格：</td>
                <td class="fieldValue"> ${contract.price} </td>
                <td class="fieldName">产权比例：</td>
                <td class="fieldValue"> ${contract.propertyRight eq null? project.scale: contract.propertyRight} </td>
            </tr>
            <tr>
                <td class="fieldName">备注：</td>
                <td class="fieldValue" colspan="3"> ${contract.memo} </td>
            </tr>
        </c:if>
    </table>
    <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-close"></i>关闭</button>
        <c:if test="${house.status eq 1}">
            <button class="btn btn-primary btn-sm ssave" type="submit"><i class="fa fa-save"></i>&nbsp;保存</button>
        </c:if>
    </div>
 </form>
<%--<script src="/static/common/laydate.js"></script>--%>
<script>
    //申请编号验证
    $(function(){
        $("#familyCode").bind("change", function () {
            var familyCode=$("#familyCode").val();
            $.get("validateIsExists",{familyCode:familyCode},function(data){
                if(data.status=="1"){

                }else{
                    alert(data.message);
                }
            });
        });
    });

    //必填校验
    $().ready(function() {
        $("#myForm").validate( );
    });
    //日期控件
    $('.form-date-time').on('changeDate', function (ev) {
        $(this).datepicker('hide');
    });

    $('.form-date-time').datepicker({
        minViewMode: 'hours',
        format: 'yyyy-mm-dd',
        autoclose: true,
    });
</script>

