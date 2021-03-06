<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
                <fieldset>
                    <legend>一、基本信息</legend>
                    <table class="table table-bordered">
                        <tbody>
                        <tr>
                            <td class="fieldName"><span class="require">*</span>所属项目：</td>
                            <td class="fieldValue">
                                <select name="p_projectId" id="p_projectId" class="required form-control" style="float: left;width: 8em">
                                    <option value="">-请选择-</option>
                                    <c:forEach varStatus="status" var="project" items="${projectList}">
                                        <option value="${project.id}"
                                                <c:if test="${project.id == family.project.id}">selected</c:if> >${project.projectName}</option>
                                    </c:forEach>
                                </select>
                            </td>
                            <td class="fieldName"><span class="require">*</span>所属地块：</td>
                            <td class="fieldValue">
                                <select name="areaId" id="areaId" class="required form-control"  style="float: left;width: 8em">
                                    <option value="">-请选择-</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="fieldName">
                                <%--<span class="require">*</span>--%>
                                档案编号：</td>
                            <td class="fieldValue">
                                <input type="text" value="${family.familyCode}" name="familyCode" class="form-control"
                                       style="width: 10em"/>
                            </td>
                            <td class="fieldName"><span class="require">*</span>姓名：</td>
                            <td class="fieldValue"><input type="text" name="name" value="${family.name}" size="10" placeholder="必填项"
                                                          class="form-control required"  style="width: 10em"/></td>
                        </tr>
                        <tr>
                            <td class="fieldName">性别：</td>
                            <td class="fieldValue">
                                <div style="float: left">
                                    <tags:dataDictInput name="sex" className="form-control" value="${family.sex}" dataDict="性别"/>
                                </div>
                            </td>
                            <td class="fieldName">身份证号：</td>
                            <td class="fieldValue">
                                <input type="text" name="idCard" value="${family.idCard}" class="form-control" style="width: 15em">
                            </td>
                        </tr>
                        <tr>
                            <td class="fieldName">年龄：</td>
                            <td class="fieldValue"><input type="text" name="age" value="${family.age}" class="form-control" style="width: 5em"/></td>
                            <td class="fieldName">联系电话：</td>
                            <td class="fieldValue"><input type="text" name="phone" value="${family.phone}" class="form-control" style="width: 15em"/></td>
                        </tr>
                        <tr>
                            <td class="fieldName">联系地址：</td>
                            <td class="fieldValue"><input type="text" name="address" value="${family.address}" class="form-control" style="width: 25em"/></td>
                            <td class="fieldName">房屋坐落：</td>
                            <td class="fieldValue"><input type="text" name="fwzl" value="${family.fwzl}" class="form-control" style="width: 35em"/></td>
                        </tr>
                        <tr>
                            <td class="fieldName">已选房面积：</td>
                            <td class="fieldValue"><input size="10" type="text" name="azArea" class="form-control number" value="${family.azArea}" style="width: 10em"/></td>
                            <td class="fieldName">已选房套数：</td>
                            <td class="fieldValue"><input size="10" type="text" name="houseNum" class="form-control number" value="${family.houseNum}" style="width: 5em"/></td>
                        </tr>
                        <tr>
                            <td class="fieldName">超15㎡内面积：</td>
                            <td class="fieldValue"><input size="10" type="text" name="inArea" class="form-control number" value="${family.inArea}" style="width: 10em"/></td>
                            <td class="fieldName">购房指标：</td>
                            <td class="fieldValue"><input size="10" type="text" name="gfArea" class="form-control number" value="${family.gfArea}" style="width: 10em"/></td>
                        </tr>
                        <tr>
                            <td class="fieldName">超标内房款(4000／㎡)：</td>
                            <td class="fieldValue"><input size="10" type="text" name="inHouseMoney" class="form-control fee number" value="${family.inHouseMoney}" style="width: 10em"/></td>
                            <td class="fieldName">超15㎡外面积：</td>
                            <td class="fieldValue"><input size="10" type="text" name="outArea" class="form-control number" value="${family.outArea}" style="width: 10em"/></td>
                        </tr>
                        <tr>
                            <td class="fieldName">总购房款：</td>
                            <td class="fieldValue"><input size="10" type="text" name="totalHouseMoney" class="form-control fee number" value="${family.totalHouseMoney}" style="width: 10em"/></td>
                            <td class="fieldName">超标外房款(6000／㎡)：</td>
                            <td class="fieldValue"><input size="10" type="text" name="outHouseMoney" class="form-control fee number" value="${family.outHouseMoney}" style="width: 10em"/></td>
                        </tr>
                        <tr>
                            <td class="fieldName">回迁日期：</td>
                            <td class="fieldValue">
                                <input type="text" name="moveBackDate" value="<fmt:formatDate value="${family.moveBackDate}" pattern="yyyy-MM-dd" />" class="form-control form-date-time dateISO" style="width: 130px;height: 33px;"/>
                            </td>
                            <td class="fieldName">签约日期：</td>
                            <td class="fieldValue">
                                <input type="text" name="signDate" value="<fmt:formatDate value="${family.signDate}" pattern="yyyy-MM-dd" />" class="form-control form-date-time dateISO" style="width: 130px;height: 33px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="fieldName">选房状态：</td>
                            <td class="fieldValue"><div style="width: 8em"><tags:dataDictInput name="xfStatus" dataDict="选房状态" value="${family.xfStatus}" className="form-control"/></div></td>
                            <td class="fieldName">选房批次：</td>
                            <td class="fieldValue"><input size="10" type="text" name="xfBatch" class="form-control number" value="${family.xfBatch}" style="width: 5em"/></td>
                        </tr>
                        <tr>
                            <td class="fieldName">选房顺序号：</td>
                            <td class="fieldValue"><input size="10" type="text" name="xfNum" class="form-control number" value="${family.xfNum}" style="width: 5em"/></td>
                            <td class="fieldName">选房日期：</td>
                            <td class="fieldValue">
                                <input type="text" name="xfDate" value="<fmt:formatDate value="${family.xfDate}" pattern="yyyy-MM-dd" />" class="form-control form-date-time dateISO" style="width: 130px;height: 33px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="fieldName">结算状态：</td>
                            <td class="fieldValue"><div style="width: 8em"><tags:dataDictInput name="jsStatus" dataDict="结算状态" value="${family.jsStatus}" className="form-control" /></div></td>
                            <td class="fieldName">认购协议打印日期：</td>
                            <td class="fieldValue">
                                <input type="text" name="xyPrintDate" value="<fmt:formatDate value="${family.xyPrintDate}" pattern="yyyy-MM-dd" />" class="form-control form-date-time dateISO" style="width: 130px;height: 33px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="fieldName">结算经办人：</td>
                            <td class="fieldValue"><input size="10" type="text" name="jsPerson" class="form-control" value="${family.jsPerson}" style="width: 10em"/></td>
                            <td class="fieldName">结算日期：</td>
                            <td class="fieldValue">
                                <input type="text" name="jsDate" value="<fmt:formatDate value="${family.jsDate}" pattern="yyyy-MM-dd" />" class="form-control form-date-time dateISO" style="width: 130px;height: 33px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="fieldName">备注：</td>
                            <td class="fieldValue" colspan="3">
                                <textarea class="form-control" name="memo" cols="60" rows="4" style="resize:none">${family.memo}</textarea>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </fieldset>
                <fieldset>
                    <legend>二、家庭成员信息</legend>
                    <table class="table table-bordered">
                        <tbody>
                        <tr>
                            <td class="fieldName">家庭人口数：</td>
                            <td class="fieldValue" colspan="3"><input type="text" name="personNum" id="count" value="${family.personNum}" readonly class="form-control"
                                                                      style="width: 5em"/></td>
                        </tr>
                        </tbody>
                    </table>
                    <table class="table table-bordered" id="personTable" style="margin-top: -5px;">
                        <thead>
                        <tr>
                            <th class="text-center" style="width: 5%">户籍性质</th>
                            <th class="text-center" style="width: 5%">姓名</th>
                            <th class="text-center" style="width: 4%">年龄</th>
                            <th class="text-center" style="width: 5%">性别</th>
                            <th class="text-center" style="width: 9%">证件号码</th>
                            <th class="text-center" style="width: 7%">联系电话</th>
                            <th class="text-center" style="width: 5%">是否是继承人</th>
                            <th class="text-center" style="width: 5%">关系</th>
                            <th class="text-center" style="width: 6%">生活状态</th>
                            <th class="text-center" style="width: 9%">户口所在地</th>
                            <th class="text-center" style="width: 8%">在册/非在册</th>
                            <th class="text-center" style="width: 10%">备注</th>
                            <th class="text-center" style="width: 3%">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:set value="${-1}" var="countFamilyP" />
                        <c:forEach begin="0" end="${fn:length(familyPersonList)}" var="i" varStatus="status">
                            <tr>
                                <c:set value="${countFamilyP + 1}" var="countFamilyP" />
                                <input type="hidden" class="form-control" name="pId" value="${familyPersonList[i].id}"/>
                                <td align="center">
                                    <tags:dataDictInput name="pAddressType" className="form-control" value="${familyPersonList[i].addressType}" dataDict="户籍性质"/>
                                </td>
                                <td align="center">
                                    <input type="text" name="pName" value="${familyPersonList[i].pName}" size="10" class="form-control personName"/>
                                </td>
                                <td align="center">
                                    <input type="text" name="pAge" value="${familyPersonList[i].age}" size="10" class="form-control"/>
                                </td>
                                <td align="center">
                                    <tags:dataDictInput name="pSex" className="form-control" value="${familyPersonList[i].pSex}" dataDict="性别"/>
                                </td>
                                <td align="center">
                                    <input type="text" name="pIdCard" value="${familyPersonList[i].pIdCard}" class="form-control">
                                </td>
                                <td align="center">
                                    <input type="text" name="pPhone" value="${familyPersonList[i].pPhone}" class="form-control">
                                </td>
                                <td style="text-align: center;">
                                    <tags:dataDictInput name="inheritType" dataDict="是否" className="form-control"
                                                        value="${familyPerson.inheritType}"/>
                                </td>
                                <td align="center">
                                    <input type="text" name="pRelation" value="${familyPersonList[i].pRelation}" class="form-control">
                                </td>
                                <td align="center">
                                    <input type="text" name="liveStatus" value="${familyPersonList[i].liveStatus}" class="form-control">
                                </td>
                                <td align="center">
                                    <input type="text" name="pAddress" value="${familyPersonList[i].pAddress}" class="form-control">
                                </td>
                                <td align="center">
                                    <tags:dataDictInput name="isRegistered" className="form-control" value="${familyPersonList[i].isRegistered}" dataDict="在册/非在册"/>
                                </td>
                                <td align="center">
                                    <textarea class="form-control" name="pMemo" cols="60" rows="1" style="resize:none">${familyPersonList[i].pMemo}</textarea>
                                </td>
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
                    <legend>三、协议房源信息</legend>
                    <table class="table table-bordered">
                        <tbody>
                            <tr>
                                <td class="fieldName">安置房源：</td>
                                <td class="fieldValue"><input type="text" name="azHouse" value="${family.azHouse}" class="form-control" style="width: 15em"/></td>
                                <td class="fieldName">补偿协议编号：</td>
                                <td class="fieldValue"><input type="text" name="agreementCode" value="${family.agreementCode}" class="form-control" style="width: 25em"/></td>
                            </tr>
                            <tr>
                                <td class="fieldName">选房情况(套)：</td>
                                <td class="fieldValue" colspan="3" style="height: 15em;">
                                    <table>
                                        <tr>
                                            <td>一居室</td><td><input type="text" name="oneRoomCount" value="${family.oneRoomCount}" id="oneRoomCount" class="form-control number xfCount" style="width: 5em"/></td><td>(55.00㎡/套)<span style="color: red"></span></td>
                                        </tr>
                                        <tr>
                                            <td>二居室</td><td><input type="text" name="firstTwoRoomCount" value="${family.firstTwoRoomCount}" id="firstTwoRoomCount" class="form-control number xfCount" style="width: 5em"/></td><td>(75.00㎡/套)<span style="color: red">,</span></td>
                                            <td>二居室</td><td><input type="text" name="secondTwoRoomCount" value="${family.secondTwoRoomCount}" id="secondTwoRoomCount" class="form-control number xfCount" style="width: 5em"/></td><td>(84.32㎡/套)<span style="color: red">,</span></td>
                                            <td>二居室</td><td><input type="text" name="thirdTwoRoomCount" value="${family.thirdTwoRoomCount}" id="thirdTwoRoomCount" class="form-control number xfCount" style="width: 5em"/></td><td>(84.33㎡/套)<span style="color: red">,</span></td>
                                            <td>二居室</td><td><input type="text" name="fourthTwoRoomCount" value="${family.fourthTwoRoomCount}" id="fourthTwoRoomCount" class="form-control number xfCount" style="width: 5em"/></td><td>(84.43㎡/套)<span style="color: red"></span></td>
                                        </tr>
                                        <tr>
                                            <td>三居室</td><td><input type="text" name="threeRoomCount" value="${family.threeRoomCount}" id="threeRoomCount" class="form-control number xfCount" style="width: 5em"/></td><td>(111.53㎡/套)<span style="color: red"></span></td>
                                        </tr>
                                        <tr>
                                            <td>实际选房套数</td><td><input type="text" name="xfTotalCount" value="${family.xfTotalCount}" id="xfTotalCount" class="form-control number" style="width: 5em"/></td><td>(套)</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="fieldName">应选面积：</td>
                                <td class="fieldValue"><input type="text" name="shouldArea" value="${family.shouldArea}" class="form-control number" style="width: 10em;float: left"/><div style="float: left;margin-top: 5px;font-size: 15px">㎡</div></td>
                                <td class="fieldName">实际选房面积：</td>
                                <td class="fieldValue"><input type="text" name="selectedArea" value="${family.selectedArea}"  class="form-control number" style="width: 10em;float: left"/><div style="float: left;margin-top: 5px;font-size: 15px">㎡</div></td>
                            </tr>
                            <tr>
                                <td class="fieldName">指标内面积(15㎡以内)：</td>
                                <td class="fieldValue"><input type="text" name="inXyArea" value="${family.inXyArea}" class="form-control number" style="width: 10em;float: left"/><div style="float: left;margin-top: 5px;font-size: 15px">㎡</div></td>
                                <td class="fieldName">超指标面积(15㎡以外)：</td>
                                <td class="fieldValue"><input type="text" name="outXyArea" value="${family.outXyArea}" class="form-control number" style="width: 10em;float: left"/><div style="float: left;margin-top: 5px;font-size: 15px">㎡</div></td>
                            </tr>
                            <tr>
                                <td class="fieldName">指标内购房款：</td>
                                <td class="fieldValue"><input type="text" name="inMoney"  value="${family.inMoney}" class="form-control number" style="width: 10em;float: left"/><div style="float: left;margin-top: 5px;">元</div></td>
                                <td class="fieldName">指标外购房款：</td>
                                <td class="fieldValue"><input type="text" name="outMoney"  value="${family.outMoney}" class="form-control number" style="width: 10em;float: left"/><div style="float: left;margin-top: 5px;">元</div></td>
                            </tr>
                            <tr>
                                <td class="fieldName">购房款：</td>
                                <td class="fieldValue" colspan="3"><input type="text" name="gfMoney" value="${family.gfMoney}" class="form-control number" style="width: 10em;float: left"/><div style="float: left;margin-top: 5px;">元</div></td>
                            </tr>
                        </tbody>
                    </table>
                </fieldset>
                <fieldset>
                    <legend>四、评估款、补偿补助及奖励费合计</legend>
                    <table class="table table-bordered">
                        <tbody>
                            <tr>
                                <td class="fieldName">腾退补偿款总价：</td>
                                <td class="fieldValue" colspan="3"><input type="text" name="totalMoney"  value="${family.totalMoney}" class="form-control number" style="width: 10em;float: left"/><div style="float: left;margin-top: 5px;">元</div></td>
                            </tr>
                            <tr>
                                <td class="fieldName">结算后款：</td>
                                <td class="fieldValue" colspan="3"><input type="text" name="settlementedMoney"  value="${family.settlementedMoney}" class="form-control number" style="width: 10em;float: left"/><div style="float: left;margin-top: 5px;">元</div></td>
                            </tr>
                        </tbody>
                    </table>
                </fieldset>
                <br />
<script>
    $(".xfCount").change(function(){
        var number1 = Number($("#oneRoomCount").val());
        var number2 = Number($("#firstTwoRoomCount").val());
        var number3 = Number($("#secondTwoRoomCount").val());
        var number4 = Number($("#thirdTwoRoomCount").val());
        var number5 = Number($("#fourthTwoRoomCount").val());
        var number6 = Number($("#threeRoomCount").val());
        var totalCount = number1+number2+number3+number4+number5+number6;
        $("#xfTotalCount").val(totalCount);
    });
    $(document).ready(function () {
        <%--$("#count").val(${countFamilyP});--%>
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

    $(function () {
        zsProjectIdChange();
        $("select[name='p_projectId']").change(function(){
            validateAzProjectId();
        })
    });

    $("#p_projectId").change(function () {
        zsProjectIdChange();
    });

    function zsProjectIdChange() {
        var zsProjectId1 = $('#p_projectId option:selected').val();

        if (zsProjectId1 == '') {

            $("#areaId").empty();
            $("#areaId").append("<option value=''>-请选择-</option>");

            return false;
        }
        /*动态获取地块信息*/
        $.ajax({
            url: "/cq/family/getAreaByProjectId",
            data: {projectId: zsProjectId1,myTime:new Date().getTime()},
            success: function (data) {
                if (data) {
                    $("#areaId").empty();

                    var list = eval("(" + data + ")");
                    if (list.length == 0){
                        $("#areaId").append("<option value=''>--</option>");
                    } else {
                        var familyZsAreaId = "${family.area.id}";
                        for (var i = 0; i < list.length; i++) {

                            var selectedText = "";
                            var id = list[i].id;

                            if (familyZsAreaId == id) {
                                selectedText = "selected";
                            }
                            var str = "<option value='" + id + "' " + selectedText + " >" + list[i].areaName + "</option>";

                            $("#areaId").append(str);
                        }
                    }
                }
            },
            error: function () {
                alert("系统错误，请联系系统支持人员！")
            }
        });
    }


    function validateAzProjectId() {
        var azProjectIds = "";
        $("select[name='p_projectId']").each(function () {
            azProjectIds = azProjectIds + "'" + $(this).val() + "',";
        })

        var flag = "true";

        $("select[name='p_projectId']").each(function () {
            var azProjectId = $(this).val();
            if (azProjectId != ""){
                azProjectId = "'"+azProjectId+"'";
                var len = azProjectIds.split(azProjectId).length;
                if (len > 2){
                    flag = "false";
                    $(this).parent().find("span").show();
                }else{
                    $(this).parent().find("span").hide();
                }
            }else{
                $(this).parent().find("span").hide();
            }
        })
        if (flag == "true"){
            $("#submitBtn").prop("disabled",false);
        }else{
            $("#submitBtn").prop("disabled",true);
        }
    }
</script>
