<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/static/common/common.jsp" %>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" style="width: 1500px;">
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
                            <h2>一、家庭信息
                                <label class="checkbox-inline">
                                    <input type="checkbox"
                                           style="width: 20px;height: 20px;font-size: 22px"
                                           class="all"/>全选/反选
                                </label>
                            </h2>
                            <label class="checkbox checkbox-inline" style="padding-left: 17px">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_familyCode"
                                       class="rh"/>档案编号
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_sortCode"
                                       class="rh"/>档案编号（新）
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_name"
                                       class="rh"/>姓名
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_idCard"
                                       class="rh"/>身份证号
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_sex"
                                       class="rh"/>性别
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_age"
                                       class="rh"/>年龄
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_phone"
                                       class="rh"/>联系电话
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_address"
                                       class="rh"/>联系地址
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_familyPerson"
                                       class="rh"/>家庭成员
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_fwzl"
                                       class="rh"/>房屋坐落
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_totalMoney"
                                       class="rh"/>补偿款总计
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_houseNum"
                                       class="rh"/>已选套数
                            </label>

                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_azArea"
                                       class="rh"/>已选房面积
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_gfArea"
                                       class="rh"/>购房指标
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_inArea"
                                       class="rh"/>超15㎡内面积
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_outArea"
                                       class="rh"/>超15㎡外面积
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_inHouseMoney"
                                       class="rh"/>超标内房款
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_outHouseMoney"
                                       class="rh"/>超标外房款
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_totalHouseMoney"
                                       class="rh"/>总购房款
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_jsMoney"
                                       class="rh"/>结算款
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_signDate"
                                       class="rh"/>原协议签约日期
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_moveBackDate"
                                       class="rh"/>回迁日期
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_xfBatch"
                                       class="rh"/>选房批次
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_xfStatus"
                                       class="rh"/>选房状态
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_xfDate"
                                       class="rh"/>选房日期
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_xfNum"
                                       class="rh"/>选房顺序号
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_signStatus"
                                       class="rh"/>认购协议签约状态
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_xyPrintDate"
                                       class="rh"/>认购协议打印日期
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_jsStatus"
                                       class="rh"/>结算状态
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_jsDate"
                                       class="rh"/>结算日期
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_jsPerson"
                                       class="rh"/>结算经办人
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_memo"
                                       class="rh"/>备注
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_personNum"
                                       class="rh"/>人口
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_azHouse"
                                       class="rh"/>安置房源
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_xfTotalCount"
                                       class="rh"/>实际选房套数
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_oneRoomCount"
                                       class="rh"/>一居室套数
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_firstTwoRoomCount"
                                       class="rh"/>第一种二居室套数
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_secondTwoRoomCount"
                                       class="rh"/>第二种二居室套数
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_thirdTwoRoomCount"
                                       class="rh"/>第三种二居室套数
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_fourthTwoRoomCount"
                                       class="rh"/>第四种二居室套数
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_threeRoomCount"
                                       class="rh"/>三居室套数
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_shouldArea"
                                       class="rh"/>应选面积
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_selectedArea"
                                       class="rh"/>实际选房面积
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_inXyArea"
                                       class="rh"/>指标内面积(15㎡以内)
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_outXyArea"
                                       class="rh"/>超指标面积(15平米以外)
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_inMoney"
                                       class="rh"/>指标内购房款
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_outMoney"
                                       class="rh"/>指标外购房款
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_gfMoney"
                                       class="rh"/>购房款
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_settlementedMoney"
                                       class="rh"/>结算后款
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_isSpecial" value="1"
                                       class="rh"/>是否平移家庭
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_moveSubsidyFee" value="1"
                                       class="rh"/>平移补助费
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_signNumDate" value="1"
                                       class="rh"/>签约取号日期
                            </label>
                            <label class="checkbox checkbox-inline">
                                <input style="width: 20px;height: 20px;" type="checkbox"
                                       name="f_houseInfo"
                                       class="rh"/>房源信息
                            </label>


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

