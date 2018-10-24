<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/static/common/common.jsp" %>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" style="width: 1500px;height: 1500px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span
                        aria-hidden="true">&times;</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">筛选导出信息</h4>
            </div>
            <style>
                .checkbox label input {
                    width: 20px;
                    height: 20px;
                }

                .checkbox{
                    font-size: 18px;
                    padding-left: 6px;
                    padding-top: 2px;
                }
            </style>
            <div class="modal-body" id="modalBody">
                <table>
                    <tr>
                        <td width="50%" class="tit" id="rh">
                            <h2>一、申请家庭信息
                                <label class="checkbox-inline">
                                    <input type="checkbox"
                                           style="width: 20px;height: 20px;font-size: 22px"
                                           class="all"/>全选/反选
                                </label>
                            </h2>
                            <label class="checkbox checkbox-inline" style="padding-left: 17px">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_projectName" value="项目名称"
                                       class="rh"/>项目名称
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_familyCode"
                                       class="rh"/>申请编号
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_name"
                                       class="rh"/>申请人
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_age"
                                       class="rh"/>年龄
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_applyDate"
                                       class="rh"/>申请日期
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_familyPerson"
                                       class="rh"/>家庭成员
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_cardType"
                                       class="rh"/>证件类型
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_idCard"
                                       class="rh"/>身份证号
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_currentAddres"
                                       class="rh"/>通讯地址
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_phone"
                                       class="rh"/>联系电话
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_address"
                                       class="rh"/>户籍所在地
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_workUnit"
                                       class="rh"/>工作地
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_marryStatus"
                                       class="rh"/>婚姻状况
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_exSpouseName"
                                       class="rh"/>前配偶姓名
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_exCardType"
                                       class="rh"/>前配偶证件类型
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_exIdCard"
                                       class="rh"/>前配偶证件号码
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_divorceDate"
                                       class="rh"/>离婚日期
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_contactName"
                                       class="rh"/>联系人姓名
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_postCode"
                                       class="rh"/>邮编
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_memo"
                                       class="rh"/>备注
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_familyType"
                                       class="rh"/>家庭类型
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_residencePermit"
                                       class="rh"/>工作居住证类型
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_handleType"
                                       class="rh"/>办理使用证件类型
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_handleCard"
                                       class="rh"/>办理使用证件号码
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_residencePermitCode"
                                       class="rh"/>工作居住证编号
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_startDate"
                                       class="rh"/>有效期限开始日期
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_endDate"
                                       class="rh"/>有效期限截止日期
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_armyType"
                                       class="rh"/>军官（警官）证件
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_armyIdCard"
                                       class="rh"/>军警证件号码
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_registerCode"
                                       class="rh"/>暂住证/居住证、登记卡编号
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_houseSituation"
                                       class="rh"/>住房情况
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_incomeSituation"
                                       class="rh"/>收入情况
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_houseStatus"
                                       class="rh"/>住房审核状态
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_socialStatus"
                                       class="rh"/>社保审核状态
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_marriageStatus"
                                       class="rh"/>婚姻审核状态
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_ageStatus"
                                       class="rh"/>年龄审核状态
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_educationStatus"
                                       class="rh"/>学历审核状态
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_otherStatus"
                                       class="rh"/>其他审核状态
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_seniorityStatus"
                                       class="rh"/>资格复核状态
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_signStatus"
                                       class="rh"/>签约状态
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_dataStatus"
                                       class="rh"/>数据状态
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_shakingBatch"
                                       class="rh"/>摇号批次
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_shakingCode"
                                       class="rh"/>摇号编号
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_shakingGroup"
                                       class="rh"/>摇号组别
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_shakingResult"
                                       class="rh"/>摇号结果
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_education"
                                       class="rh"/>学历层次
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_educationCode"
                                       class="rh"/>学历证书在线验证码
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_learning"
                                       class="rh"/>学习形式
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_job"
                                       class="rh"/>职务
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_continuity"
                                       class="rh"/>社保是否符合连续缴纳12个月要求
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_unit"
                                       class="rh"/>工作单位
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_unitPerson"
                                       class="rh"/>单位联系人
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_unitPhone"
                                       class="rh"/>单位联系电话
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_count"
                                       class="rh"/>家庭人口数
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_thisArea"
                                       class="rh"/>是否本区
                            </label>
                            <%--<label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_nothisArea"
                                       class="rh"/>京籍非本区
                            </label>--%>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_firstOrNot"
                                       class="rh"/>是否优先组
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_thisPark"
                                       class="rh"/>是否园区
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_educationTrouble"
                                       class="rh"/>学历复核不通过原因
                            </label>
                           <%-- <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_nofirstOrNot"
                                       class="rh"/>非优先组
                            </label>--%>
                        </td>
                        <td width="50%" class="tit" id="rd" valign="top">
                            <h2 style="">二、合同信息
                                <label class="checkbox-inline">
                                    <input type="checkbox"
                                           style="width: 20px;height: 20px;font-size: 22px"
                                           class="all"/>全选/反选
                                </label>
                            </h2>
                            <div class="checkbox">&nbsp;
                                <label class="checkbox checkbox-inline">
                                    <input style="width: 20px;height: 20px;" type="checkbox"
                                           name="contractCode"
                                           class="rd"/>合同编号
                                </label>
                            </div>
                            <div class="checkbox">&nbsp;
                                <label class="checkbox checkbox-inline">
                                    <input style="width: 20px;height: 20px;" type="checkbox"
                                           name="person"
                                           class="rd"/>经办人
                                </label>
                            </div>
                            <div class="checkbox">&nbsp;
                                <label class="checkbox checkbox-inline">
                                    <input style="width: 20px;height: 20px;" type="checkbox"
                                           name="signDate"
                                           class="rd"/>合同签订时间
                                </label>
                            </div>
                            <div class="checkbox">&nbsp;
                                <label class="checkbox checkbox-inline">
                                    <input style="width: 20px;height: 20px;" type="checkbox"
                                           name="status"
                                           class="rd"/>合同状态
                                </label>
                            </div>
                            <div class="checkbox">&nbsp;
                                <label class="checkbox checkbox-inline">
                                    <input style="width: 20px;height: 20px;" type="checkbox"
                                           name="price"
                                           class="rd"/>销售价格
                                </label>
                            </div>
                            <div class="checkbox">&nbsp;
                                <label class="checkbox checkbox-inline">
                                    <input style="width: 20px;height: 20px;" type="checkbox"
                                           name="propertyRight"
                                           class="rd"/>产权比例
                                </label>
                            </div>
                            <div class="checkbox">&nbsp;
                                <label class="checkbox checkbox-inline">
                                    <input style="width: 20px;height: 20px;" type="checkbox"
                                           name="name"
                                           class="rd"/>产权人姓名
                                </label>
                            </div>
                            <div class="checkbox">&nbsp;
                                <label class="checkbox checkbox-inline">
                                    <input style="width: 20px;height: 20px;" type="checkbox"
                                           name="idCard"
                                           class="rd"/>产权人身份证号
                                </label>
                            </div>
                            <div class="checkbox">&nbsp;
                                <label class="checkbox checkbox-inline">
                                    <input style="width: 20px;height: 20px;" type="checkbox"
                                           name="status"
                                           class="rd"/>数据状态
                                </label>
                            </div>
                            <div class="checkbox">&nbsp;
                                <label class="checkbox checkbox-inline">
                                    <input style="width: 20px;height: 20px;" type="checkbox"
                                           name="operatePerson"
                                           class="rd"/>锁定人员
                                </label>
                            </div>
                            <div class="checkbox">&nbsp;
                                <label class="checkbox checkbox-inline">
                                    <input style="width: 20px;height: 20px;" type="checkbox"
                                           name="operateDate"
                                           class="rd"/>锁定日期
                                </label>
                            </div>
                            <div class="checkbox">&nbsp;
                                <label class="checkbox checkbox-inline">
                                    <input style="width: 20px;height: 20px;" type="checkbox"
                                           name="memo"
                                           class="rd"/>备注
                                </label>
                            </div>
                            <div class="checkbox">&nbsp;
                                <label class="checkbox checkbox-inline">
                                    <input style="width: 20px;height: 20px;" type="checkbox"
                                           name="operateMemo"
                                           class="rd"/>操作备注
                                </label>
                            </div>
                            <div class="checkbox">&nbsp;
                                <label class="checkbox checkbox-inline">
                                    <input style="width: 20px;height: 20px;" type="checkbox"
                                           name="reason"
                                           class="rd"/>退回原因
                                </label>
                            </div>
                            <div class="checkbox">&nbsp;
                                <label class="checkbox checkbox-inline">
                                    <input style="width: 20px;height: 20px;" type="checkbox"
                                           name="h_house"
                                           class="rd"/>房源信息
                                </label>
                            </div>
                            <div class="checkbox">&nbsp;
                                <label class="checkbox checkbox-inline">
                                    <input style="width: 20px;height: 20px;" type="checkbox"
                                           name="h_status"
                                           class="rd"/>分配状态
                                </label>
                            </div>
                            <div class="checkbox">&nbsp;
                                <label class="checkbox checkbox-inline">
                                    <input style="width: 20px;height: 20px;" type="checkbox"
                                           name="h_rentName"
                                           class="rd"/>分配后租房人/转售人姓名
                                </label>
                            </div>
                            <div class="checkbox">&nbsp;
                                <label class="checkbox checkbox-inline">
                                    <input style="width: 20px;height: 20px;" type="checkbox"
                                           name="h_rentIdCard"
                                           class="rd"/>分配后租房人/转售人身份证号
                                </label>
                            </div>
                            <div class="checkbox">&nbsp;
                                <label class="checkbox checkbox-inline">
                                    <input style="width: 20px;height: 20px;" type="checkbox"
                                           name="h_rentDate"
                                           class="rd"/>分配后出租日期/转售日期/回购日期
                                </label>
                            </div>
                        </td>
                    </tr>
                </table>
                <div class="modal-footer" style="text-align: right;">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button class="btn btn-primary btn-sm" type="button" onclick="resultExcel()"><i class="fa fa-save"></i>&nbsp;导出</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function chooseData() {
        $("#myModal").modal();
    }

    function resultExcel() {
        location.href = "resultExcel?" + $("#myForm").serialize();
    }

    $(function () {
        $("input:checkbox[index]").click(function () {
            var index = $(this).attr("index");
            var bl = $(this).is(":checked");
            $(".checkItem" + index).each(function (key, val) {
                $(val).prop("checked", bl);
            });
        });
    });
</script>

