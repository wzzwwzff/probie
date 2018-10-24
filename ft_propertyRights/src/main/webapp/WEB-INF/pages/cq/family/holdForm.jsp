<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv=X-UA-Compatible content="IE=edge,chrome=1">
    <meta content=always name=referrer>
    <meta name="renderer" content="webkit">
    <title>持有效证家庭信息</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="title">
    <h4 style="color: #0d88cc">持有效证家庭信息</h4>
</div>
<div class="content">
    <form class="form-horizontal" id="form" name="myForm" action="holdSave?familyId=${family.id}&<tags:searchParams></tags:searchParams>" method="post">
        <input type="hidden" value="${family.id}" />
        <input type="hidden" value="2" name="familyType" />
        <div class=" doc-content"
             style="position: relative;">
            <fieldset>
                <legend>一、申请人信息</legend>
                <table class="table table-bordered">
                    <tbody>
                    <tr>
                        <td class="fieldName"><span class="require">*</span>项目名称：</td>
                        <td class="fieldValue">
                            <div style="float: left">
                                <tags:dataDictInput name="projectName" value="${family.projectName}" className="form-control" firstValue="--请选择--" dataDict="项目名称"/>
                            </div>
                        </td>
                        <td class="fieldName"><span class="require">*</span>申请编号：</td>
                        <td class="fieldValue">
                            <input type="text" value="${family.familyCode}" name="familyCode" placeholder="必填项" class="form-control required"
                                   style="width: 12em"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldName"><span class="require">*</span>姓名：</td>
                        <td class="fieldValue"><input type="text" name="name" value="${family.name}" size="10" placeholder="必填项"
                                                      class="form-control required" style="width: 10em"/></td>
                        <td class="fieldName"><span class="require">*</span>证件号码：</td>
                        <td class="fieldValue">
                            <div style="float: left;">
                                <tags:dataDictInput name="cardType" value="${family.cardType}" className="form-control" firstValue="--请选择--" dataDict="证件类型"/>
                            </div>
                            <div style="float: right;margin-right:200px;"><input type="text" name="idCard" value="${family.idCard}" placeholder="必填项"
                                                                                 class="form-control required"
                                                                                 style="width: 15em"></div>
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldName">婚姻状况：</td>
                        <td class="fieldValue">
                            <div style="float: left">
                                <tags:dataDictInput name="marryStatus" value="${family.marryStatus}" className="form-control" firstValue="--请选择--" dataDict="婚姻状况"/>
                            </div>
                        </td>
                        <td class="fieldName">年龄：</td>
                        <td class="fieldValue">
                            <input type="text" name="age" value="${family.age}" class="form-control" style="width: 10em"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldName">户籍所在地：</td>
                        <td class="fieldValue"><input type="text" name="address" value="${family.address}" class="form-control" style="width: 10em"/></td>
                        <td class="fieldName">工作地（社保缴纳地）：</td>
                        <td class="fieldValue">
                            <div style="float: left">
                                <tags:dataDictInput name="workUnit" value="${family.workUnit}" className="form-control" firstValue="--请选择--" dataDict="工作地（社保缴纳地）"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldName">工作居住证类型：</td>
                        <td class="fieldValue">
                            <div style="float: left">
                                <tags:dataDictInput name="residencePermit"  firstValue="--请选择--" className="form-control" value="${family.residencePermit}" dataDict="工作居住证类型"/>
                            </div>
                        </td>
                        <td class="fieldName">办理使用证件：</td>
                        <td class="fieldValue" colspan="3">
                            <div style="float: left;">
                            <tags:dataDictInput name="handleType" value="${family.handleType}" className="form-control" firstValue="--请选择--" dataDict="证件类型"/>
                            </div>
                            <div style="float: right;margin-right:200px;">
                            <input type="text" name="handleCard" value="${family.handleCard}" class="form-control" style="width: 15em"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldName">工作居住证编号：</td>
                        <td class="fieldValue">
                            <input type="text" name="residencePermitCode" value="${family.residencePermitCode}" class="form-control" style="width: 18em"/>
                        </td>
                        <td class="fieldName">有效期限：</td>
                        <td class="fieldValue">
                            <div style="float: left;">
                                <input type="text" name="startDate" value="<fmt:formatDate value="${family.startDate}" pattern="yyyy-MM-dd" />" class="form-control form-date-time dateISO" style="width: 130px;height: 33px;"/>
                            </div>
                            <div style="float: left;margin-left: 23px;margin-right: 5px;margin-top: 2px;">
                                至
                            </div>
                            <div style="float: right;margin-right:250px;">
                                <input type="text" name="endDate" value="<fmt:formatDate value="${family.endDate}" pattern="yyyy-MM-dd" />" class="form-control form-date-time dateISO" style="width: 130px;height: 33px;"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldName">是否是本区：</td>
                        <td class="fieldValue">
                            <div style="float: left">
                                <tags:dataDictInput name="thisArea" className="form-control" value="${family.thisArea}" dataDict="是否"/>
                            </div>
                        </td>
                        <td class="fieldName">申请日期：</td>
                        <td class="fieldValue">
                            <input type="text" name="applyDate" value="<fmt:formatDate value="${family.applyDate}" pattern="yyyy-MM-dd" />" class="form-control form-date-time dateISO" style="width: 130px;height: 33px;"/>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </fieldset>
            <fieldset>
                <legend>二、前配偶信息</legend>
                <table class="table table-bordered">
                    <tbody>
                    <tr>
                        <td class="fieldName">前配偶姓名：</td>
                        <td class="fieldValue"><input type="text" name="exSpouseName" value="${family.exSpouseName}" size="10" class="form-control"
                                                      style="width: 10em"/></td>
                        <td class="fieldName">前配偶证件号码：</td>
                        <td class="fieldValue">
                            <div style="float: left;">
                                <tags:dataDictInput name="exCardType" value="${family.exCardType}" className="form-control" firstValue="--请选择--" dataDict="证件类型"/>
                            </div>
                            <div style="float: right;margin-right:200px;"><input type="text" name="exIdCard" value="${family.exIdCard}"class="form-control"style="width: 15em"></div>
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldName">离婚日期：</td>
                        <td class="fieldValue" colspan="3">
                            <fmt:formatDate value="${family.divorceDate}" var="divorceDate" pattern="yyyy-MM-dd" />
                            <input type="text" style="width: 130px;height: 33px;" name="divorceDate"
                                   value="${divorceDate}"
                                   class="form-control form-date-time dateISO"/></td>
                    </tr>
                    </tbody>
                </table>
            </fieldset>
            <fieldset>
                <legend>三、家庭成员信息</legend>
                <table class="table table-bordered">
                    <tbody>
                    <tr>
                        <td class="fieldName">家庭人口数：</td>
                        <td class="fieldValue" colspan="3"><input type="text" id="count" value="${family.count}" readonly class="form-control"
                                                                  style="width: 5em"/></td>
                    </tr>
                    </tbody>
                </table>
                <table class="table table-bordered" id="personTable" style="margin-top: -5px;">
                    <thead>
                    <tr>
                        <th class="text-center">成员姓名</th>
                        <th class="text-center">证件类型</th>
                        <th class="text-center">证件号码</th>
                        <th class="text-center">关系</th>
                        <th class="text-center">户籍</th>
                        <th class="text-center">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:set value="${-1}" var="countFamilyP" />
                    <c:forEach begin="0" end="${fn:length(familyPersonList)}" var="i" varStatus="status">
                        <tr>
                            <c:set value="${countFamilyP + 1}" var="countFamilyP" />
                            <input type="hidden" class="form-control" name="fp_id" value="${familyPersonList[i].id}"/>
                            <td align="center"><input type="text" name="fp_name" value="${familyPersonList[i].name}" size="10" class="form-control personName"/>
                            </td>
                            <td align="center">
                                    <tags:dataDictInput name="fp_cardType" value="${familyPersonList[i].cardType}" className="form-control" firstValue="--请选择--" dataDict="证件类型"/>
                            </td>
                            <td align="center">
                                <input type="text" name="fp_idCard" value="${familyPersonList[i].idCard}" class="form-control">
                            </td>
                            <td align="center">
                                    <tags:dataDictInput name="fp_relationShip" value="${familyPersonList[i].relationShip}" className="form-control" firstValue="--请选择--" dataDict="家庭成员关系"/>
                            </td>
                            <td align="center"><input type="text" name="fp_address" value="${familyPersonList[i].address}" class="form-control"/></td>
                            <td align="center">
                                <button type="button" class="btn btn-sm btn-danger" onclick="deleteTr1($(this),${familyPersonList[i].id})"><i
                                        class="fa fa-delicious"></i>&nbsp;删除
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div align="center"><input type="button" class="btn btn-sm btn-primary" onclick="addRow1();" value="添加新行"/></div>
            </fieldset>

            <fieldset>
                <legend>四、联系人信息</legend>
                <table class="table table-bordered">
                    <tbody>
                    <tr>
                        <td class="fieldName">姓名：</td>
                        <td class="fieldValue"><input type="text" name="contactName" value="${family.contactName}" size="10" class="form-control"
                                                      style="width: 10em"/></td>
                        <td class="fieldName">手机号码：</td>
                        <td class="fieldValue"><input type="text" name="phone" value="${family.phone}" size="10" class="form-control"
                                                      style="width: 10em"/></td>
                    </tr>
                    <tr>
                        <td class="fieldName">通讯地址：</td>
                        <td class="fieldValue"><input type="text" name="currentAddres" value="${family.currentAddres}" size="10" class="form-control"
                                                      style="width: 10em"/></td>
                        <td class="fieldName">邮编：</td>
                        <td class="fieldValue"><input type="text" name="postCode" value="${family.postCode}" class="form-control" style="width: 10em"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldName">备注：</td>
                        <td class="fieldValue" colspan="3">
                            <textarea class="form-control" name="memo" cols="60" rows="4">${family.memo}</textarea>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </fieldset>
            <fieldset>
                <legend>五、其他信息</legend>
                <table class="table table-bordered">
                    <tbody>
                    <tr>
                        <td class="fieldName">摇号批次：</td>
                        <td class="fieldValue"><input type="text" name="shakingBatch" value="${family.shakingBatch}" size="10" class="form-control"
                                                      style="width: 10em"/></td>
                        <td class="fieldName">摇号编号：</td>
                        <td class="fieldValue"><input type="text" name="shakingCode" value="${family.shakingCode}" class="form-control" style="width: 10em"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldName">摇号组别：</td>
                        <td class="fieldValue"><input type="text" name="shakingGroup" value="${family.shakingGroup}" size="10" class="form-control"
                                                      style="width: 10em"/></td>
                        <td class="fieldName">摇号结果：</td>
                        <td class="fieldValue"><input type="text" name="shakingResult" value="${family.shakingResult}" class="form-control" style="width: 10em"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldName">是否是优先组：</td>
                        <td class="fieldValue"><div style="float: left"><tags:dataDictInput name="firstOrNot" value="${family.firstOrNot}" className="form-control" dataDict="是否"/></div></td>
                        <td class="fieldName">社保是否符合连续缴纳12个月要求：</td>
                        <td class="fieldValue"><div style="float: left"><tags:dataDictInput dataDict="是否" name="continuity" className="form-control" value="${family.continuity}" /></div>
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldName">学历：</td>
                        <td class="fieldValue"><div style="float: left"><tags:dataDictInput dataDict="学历层次" name="education" value="${family.education}" className="form-control" /></div></td>
                        <td class="fieldName">学历证书在线验证码：</td>
                        <td class="fieldValue"><input type="text" name="educationCode" value="${family.educationCode}" class="form-control" style="width: 10em"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldName">学习形式：</td>
                        <td class="fieldValue"><div style="float: left"><tags:dataDictInput dataDict="学习形式" name="learning" value="${family.learning}" className="form-control" /></div></td>
                        <td class="fieldName">是否园区：</td>
                        <td class="fieldValue"><div style="float: left"><tags:dataDictInput name="thisPark" value="${family.thisPark}" className="form-control" dataDict="是否"/></div>
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldName">职务：</td>
                        <td class="fieldValue"><input type="text" name="job" value="${family.job}" size="10" class="form-control"
                                                      style="width: 10em"/></td>
                        <td class="fieldName">工作单位：</td>
                        <td class="fieldValue"><input type="text" name="unit" value="${family.unit}" class="form-control" style="width: 10em"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldName">单位联系人：</td>
                        <td class="fieldValue"><input type="text" name="unitPerson" value="${family.unitPerson}" size="10" class="form-control"
                                                      style="width: 10em"/></td>
                        <td class="fieldName">单位联系电话：</td>
                        <td class="fieldValue"><input type="text" name="unitPhone" value="${family.unitPhone}" class="form-control" style="width: 10em"/>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </fieldset><br/>
            <div class="text-center footer">
                <button type="submit" class="btn btn-primary"><i
                        class="fa fa-save"></i> 保存
                </button>
                <button type="button" class="btn btn-white" onclick="javascript:history.back();"><i
                        class="fa fa-backward"></i> 返回
                </button>
            </div>
        </div>
    </form>
</div>
</body>
<script>
    $(document).ready(function () {
        $("#count").val(${countFamilyP});
        $("#form").validate({
            rules: {
                familyCode:{
                    remote: "checkRepeat?familyId=${family.id}&_mydate=" + new Date().getTime()
                }
            },
            messages: {
                familyCode: {
                    remote: "编号已经存在"
                }
            }
        });
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

    $('.form-date-time-m').datepicker({
        minViewMode: 'hours',
        format: 'yyyy-mm',
        autoclose: true,
    });
    function addRow1() {
        var rowIndex = $("#personTable tr").length - 1;
        $("#personTable tr:last").clone().insertAfter($("#personTable tr:eq(" + rowIndex + ")"))
        $("#personTable tr:last input").each(function () {
            $(this).val("");
        });

    }

    function deleteTr1(obj,familyPersonId) {//删除人口行
        obj.parent().parent().remove();
        $.ajax({
            url: "/cq/family/deleteFamilyPerson",
            data: {familyPersonId: familyPersonId,myTime:new Date().getTime()},
            success: function (data) {
            }
        });
    }
</script>
</html>