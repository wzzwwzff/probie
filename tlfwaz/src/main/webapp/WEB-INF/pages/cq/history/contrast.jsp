<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fieldset>
    <legend>一、基本信息</legend>
    <table class="table table-bordered">
        <tbody>
        <tr>
            <td class="fieldName">所属项目：</td>
            <td class="fieldValue">
                ${family.project.projectName}
                <c:if test="${compareUtils.show(family.project.projectName,family1.project.projectName)}"><font
                        style="color: red">（${family1.project.projectName}）</font></c:if>
            </td>
            <td class="fieldName">所属地块：</td>
            <td class="fieldValue">
                ${family.area.areaName}
                <c:if test="${compareUtils.show(family.area.areaName,family1.area.areaName)}"><font style="color:red;">
                    （${family1.area.areaName}）</font></c:if>
            </td>
        </tr>
        <tr>
            <td class="fieldName">档案编号：</td>
            <td class="fieldValue">
                ${family.familyCode}
                <c:if test="${compareUtils.show(family.familyCode,family1.familyCode)}"><font style="color:red;">
                    （${family1.familyCode}）</font></c:if>
            </td>
            <td class="fieldName">姓名：</td>
            <td class="fieldValue">
                ${family.name}
                <c:if test="${compareUtils.show(family.name,family1.name)}"><font style="color:red;">
                    （${family1.name}）</font></c:if>
            </td>
        </tr>
        <tr>
            <td class="fieldName">性别：</td>
            <td class="fieldValue">
                <tags:dataDict value="${family.sex}" dataDict="性别"/>
                <c:if test="${compareUtils.show(family.sex,family1.sex)}"><font style="color:red;"> （ <tags:dataDict
                        value="${family1.sex}" dataDict="性别"/>）</font></c:if>
            </td>
            <td class="fieldName">身份证号：</td>
            <td class="fieldValue">
                ${family.idCard}
                <c:if test="${compareUtils.show(family.idCard,family1.idCard)}"><font style="color:red;">
                    （${family1.idCard}）</font></c:if>
            </td>
        </tr>
        <tr>
            <td class="fieldName">年龄：</td>
            <td class="fieldValue">${family.age}
                <c:if test="${compareUtils.show(family.age,family1.age)}"><font style="color:red;">
                    （${family1.age}）</font></c:if>
            </td>
            <td class="fieldName">联系电话：</td>
            <td class="fieldValue">${family.phone}
                <c:if test="${compareUtils.show(family.phone,family1.phone)}"><font style="color:red;">
                    （${family1.phone}）</font></c:if>
            </td>
        </tr>
        <tr>
            <td class="fieldName">联系地址：</td>
            <td class="fieldValue">${family.address}
                <c:if test="${compareUtils.show(family.address,family1.address)}"><font style="color:red;">
                    （${family1.address}）</font></c:if>
            </td>
            <td class="fieldName">房屋坐落：</td>
            <td class="fieldValue">${family.fwzl}
                <c:if test="${compareUtils.show(family.fwzl,family1.fwzl)}"><font style="color:red;">
                    （${family1.fwzl}）</font></c:if>
            </td>
        </tr>
        <tr>
            <td class="fieldName">补偿款总计：</td>
            <td class="fieldValue">${family.totalMoney}
                <c:if test="${compareUtils.show(family.totalMoney,family1.totalMoney)}"><font style="color:red;">
                    （${family1.totalMoney}）</font></c:if>
            </td>
            <td class="fieldName">已选房套数：</td>
            <td class="fieldValue">${family.houseNum}
                <c:if test="${compareUtils.show(family.houseNum,family1.houseNum)}"><font style="color:red;">
                    （${family1.houseNum}）</font></c:if>
            </td>
        </tr>
        <tr>
            <td class="fieldName">已选房面积：</td>
            <td class="fieldValue">${family.azArea}
                <c:if test="${compareUtils.show(family.azArea,family1.azArea)}"><font style="color:red;">
                    （${family1.azArea}）</font></c:if>
            </td>
            <td class="fieldName">购房指标：</td>
            <td class="fieldValue">${family.gfArea}
                <c:if test="${compareUtils.show(family.gfArea,family1.gfArea)}"><font style="color:red;">
                    （${family1.gfArea}）</font></c:if>
            </td>
        <tr>
            <td class="fieldName">超15㎡内面积：</td>
            <td class="fieldValue">${family.inArea}
                <c:if test="${compareUtils.show(family.inArea,family1.inArea)}"><font style="color:red;">
                    （${family1.inArea}）</font></c:if>
            </td>
            <td class="fieldName">超15㎡外面积：</td>
            <td class="fieldValue">${family.outArea}
                <c:if test="${compareUtils.show(family.outArea,family1.outArea)}"><font style="color:red;">
                    （${family1.outArea}）</font></c:if>
            </td>
        </tr>
        <tr>
            <td class="fieldName">超标内房款(4000／㎡)：</td>
            <td class="fieldValue">${family.inHouseMoney}
                <c:if test="${compareUtils.show(family.inHouseMoney,family1.inHouseMoney)}"><font style="color:red;">
                    （${family1.inHouseMoney}）</font></c:if>
            </td>
            <td class="fieldName">超标外房款(6000／㎡)：</td>
            <td class="fieldValue">${family.outHouseMoney}
                <c:if test="${compareUtils.show(family.outHouseMoney,family1.outHouseMoney)}"><font style="color:red;">
                    （${family1.outHouseMoney}）</font></c:if>
            </td>
        </tr>
        <tr>
            <td class="fieldName">总购房款：</td>
            <td class="fieldValue">${family.totalHouseMoney}
                <c:if test="${compareUtils.show(family.totalHouseMoney,family1.totalHouseMoney)}"><font
                        style="color:red;"> （${family1.totalHouseMoney}）</font></c:if>
            </td>
            <td class="fieldName">签约日期：</td>
            <td class="fieldValue">
                <fmt:formatDate value="${family.signDate}" pattern="yyyy-MM-dd"/>
                <c:if test="${compareUtils.show(family.signDate,family1.signDate)}"><font style="color:red;">
                    （<fmt:formatDate value="${family1.signDate}" pattern="yyyy-MM-dd"/>）</font></c:if>
            </td>
        </tr>
        <tr>
            <td class="fieldName">回迁日期：</td>
            <td class="fieldValue">
                <fmt:formatDate value="${family.moveBackDate}" pattern="yyyy-MM-dd"/>
                <c:if test="${compareUtils.show(family.moveBackDate,family1.moveBackDate)}"><font style="color:red;">
                    （<fmt:formatDate value="${family1.moveBackDate}" pattern="yyyy-MM-dd"/>）</font></c:if>
            </td>
            <td class="fieldName">选房批次：</td>
            <td class="fieldValue">${family.xfBatch}
                <c:if test="${compareUtils.show(family.xfBatch,family1.xfBatch)}"><font
                        style="color:red;"> （${family1.xfBatch}）</font></c:if>
            </td>
        </tr>
        <tr>
            <td class="fieldName">选房状态：</td>
            <td class="fieldValue"><tags:dataDict dataDict="选房状态" value="${family.xfStatus}"/>
                <c:if test="${compareUtils.show(family.xfStatus,family1.xfStatus)}"><font
                        style="color:red;"> （<tags:dataDict dataDict="选房状态" value="${family1.xfStatus}"/>）</font></c:if>
            </td>
            <td class="fieldName">选房日期：</td>
            <td class="fieldValue">
                <fmt:formatDate value="${family.xfDate}" pattern="yyyy-MM-dd"/>
                <c:if test="${compareUtils.show(family.xfDate,family1.xfDate)}"><font style="color:red;">
                    （<fmt:formatDate value="${family1.xfDate}" pattern="yyyy-MM-dd"/>）</font></c:if>
            </td>
        </tr>
        <tr>
            <td class="fieldName">选房顺序号：</td>
            <td class="fieldValue">${family.xfNum}
                <c:if test="${compareUtils.show(family.xfNum,family1.xfNum)}"><font
                        style="color:red;"> （${family1.xfNum}）</font></c:if>
            </td>
            <td class="fieldName">认购协议打印日期：</td>
            <td class="fieldValue">
                <fmt:formatDate value="${family.xyPrintDate}" pattern="yyyy-MM-dd"/>
                <c:if test="${compareUtils.show(family.xyPrintDate,family1.xyPrintDate)}"><font style="color:red;">
                    （<fmt:formatDate value="${family1.xyPrintDate}" pattern="yyyy-MM-dd"/>）</font></c:if>
            </td>
        </tr>
        <tr>
            <td class="fieldName">结算状态：</td>
            <td class="fieldValue"><tags:dataDict dataDict="结算状态" value="${family.jsStatus}"/>
                <c:if test="${compareUtils.show(family.jsStatus,family1.jsStatus)}"><font
                        style="color:red;"> （<tags:dataDict dataDict="结算状态" value="${family1.jsStatus}"/>）</font></c:if>
            </td>
            <td class="fieldName">结算日期：</td>
            <td class="fieldValue">
                <fmt:formatDate value="${family.jsDate}" pattern="yyyy-MM-dd"/>
                <c:if test="${compareUtils.show(family.jsDate,family1.jsDate)}"><font style="color:red;">
                （<fmt:formatDate value="${family1.jsDate}" pattern="yyyy-MM-dd"/>）</font></c:if>
            </td>
        </tr>
        <tr>
            <td class="fieldName">结算经办人：</td>
            <td class="fieldValue">${family.jsPerson}
                <c:if test="${compareUtils.show(family.jsPerson,family1.jsPerson)}"><font style="color:red;">
                    （${family1.jsPerson}）</font></c:if>
            </td>
            <td class="fieldName">备注：</td>
            <td class="fieldValue">
                ${family.memo}
                <c:if test="${compareUtils.show(family.memo,family1.memo)}"><font style="color:red;">
                    （${family1.memo}）</font></c:if>
            </td>
        </tr>
        </tbody>
    </table>
</fieldset>
<fieldset>
    <legend>二、家庭成员信息</legend>
    <table class="table table-bordered" id="personTable" style="margin-top: -5px;">
        <thead>
        <tr>
            <th class="text-center">姓名</th>
            <th class="text-center">性别</th>
            <th class="text-center">证件号码</th>
            <th class="text-center">联系电话</th>
            <th class="text-center">关系</th>
            <th class="text-center">户口所在地</th>
            <th class="text-center">在册/非在册</th>
            <th class="text-center">备注</th>
        </tr>
        </thead>
        <tbody>
        <c:set value="${-1}" var="countFamilyP"/>
        <c:forEach begin="0" end="${fn:length(familyPersonList)}" var="i" varStatus="status">
            <tr>
                <c:set value="${countFamilyP + 1}" var="countFamilyP"/>
                <input type="hidden" class="form-control" name="pId" value="${familyPersonList[i].id}"/>
                <td align="center">
                        ${familyPersonList[i].pName}
                </td>
                <td align="center">
                    <tags:dataDict value="${familyPersonList[i].pSex}" dataDict="性别"/>
                </td>
                <td align="center">
                        ${familyPersonList[i].pIdCard}
                </td>
                <td align="center">
                        ${familyPersonList[i].pPhone}
                </td>
                <td align="center">
                        ${familyPersonList[i].pRelation}
                </td>
                <td align="center">
                        ${familyPersonList[i].pAddress}
                </td>
                <td align="center">
                    <tags:dataDict value="${familyPersonList[i].isRegistered}" dataDict="在册/非在册"/>
                </td>
                <td align="center">
                        ${familyPersonList[i].pMemo}
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</fieldset>
<fieldset>
    <legend>三、协议房源信息</legend>
    <table class="table table-bordered">
        <tbody>
        <tr>
            <td class="fieldName">安置房源：</td>
            <td class="fieldValue">${family.azHouse}
                <c:if test="${compareUtils.show(family.azHouse,family1.azHouse)}"><font style="color:red;">
                    （${family1.azHouse}）</font></c:if>
            </td>
            <td class="fieldName">补偿协议编号：</td>
            <td class="fieldValue">${family.agreementCode}
                <c:if test="${compareUtils.show(family.agreementCode,family1.agreementCode)}"><font style="color:red;">
                    （${family1.agreementCode}）</font></c:if>
            </td>
        </tr>
        <tr>
            <td class="fieldName">选房情况(套)：</td>
            <td class="fieldValue" colspan="3" style="height: 15em;">
                <table>
                    <tr>
                        <td>一居室</td>
                        <td>${family.oneRoomCount}
                            <c:if test="${compareUtils.show(family.oneRoomCount,family1.oneRoomCount)}"><font style="color:red;">
                                （${family1.oneRoomCount}）</font></c:if>
                        </td>
                        <td>(㎡/套)</td>
                    </tr>
                    <tr>
                        <td>二居室</td>
                        <td>${family.firstTwoRoomCount}
                            <c:if test="${compareUtils.show(family.firstTwoRoomCount,family1.firstTwoRoomCount)}"><font style="color:red;">
                                （${family1.firstTwoRoomCount}）</font></c:if>
                        </td>
                        <td>(㎡/套)</td>
                        <td>二居室</td>
                        <td>${family.secondTwoRoomCount}
                            <c:if test="${compareUtils.show(family.secondTwoRoomCount,family1.secondTwoRoomCount)}"><font style="color:red;">
                                （${family1.secondTwoRoomCount}）</font></c:if>
                        </td>
                        <td>(㎡/套)</td>
                        <td>二居室</td>
                        <td>${family.thirdTwoRoomCount}
                            <c:if test="${compareUtils.show(family.thirdTwoRoomCount,family1.thirdTwoRoomCount)}"><font style="color:red;">
                                （${family1.thirdTwoRoomCount}）</font></c:if>
                        </td>
                        <td>(㎡/套)</td>
                        <td>二居室</td>
                        <td>${family.fourthTwoRoomCount}
                            <c:if test="${compareUtils.show(family.fourthTwoRoomCount,family1.fourthTwoRoomCount)}"><font style="color:red;">
                                （${family1.fourthTwoRoomCount}）</font></c:if>
                        </td>
                        <td>(㎡/套)</td>
                    </tr>
                    <tr>
                        <td>三居室</td>
                        <td>${family.threeRoomCount}
                            <c:if test="${compareUtils.show(family.threeRoomCount,family1.threeRoomCount)}"><font style="color:red;">
                                （${family1.threeRoomCount}）</font></c:if>
                        </td>
                        <td>(㎡/套)</td>
                    </tr>
                    <tr>
                        <td>实际选房套数</td>
                        <td>${family.xfTotalCount}
                            <c:if test="${compareUtils.show(family.xfTotalCount,family1.xfTotalCount)}"><font style="color:red;">
                                （${family1.xfTotalCount}）</font></c:if>
                        </td>
                        <td>(套)</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="fieldName">应选面积：</td>
            <td class="fieldValue">${family.shouldArea}
                <c:if test="${compareUtils.show(family.shouldArea,family1.shouldArea)}"><font style="color:red;">
                    （${family1.shouldArea}）</font></c:if>
               ㎡
            </td>
            <td class="fieldName">实际选房面积：</td>
            <td class="fieldValue">${family.selectedArea}
                <c:if test="${compareUtils.show(family.selectedArea,family1.selectedArea)}"><font style="color:red;">
                    （${family1.selectedArea}）</font></c:if>
                ㎡
            </td>
        </tr>
        <tr>
            <td class="fieldName">指标内面积(15㎡以内)：</td>
            <td class="fieldValue">${family.inXyArea}
                <c:if test="${compareUtils.show(family.inXyArea,family1.inXyArea)}"><font style="color:red;">
                    （${family1.inXyArea}）</font></c:if>
                ㎡
            </td>
            <td class="fieldName">超指标面积(15㎡以外)：</td>
            <td class="fieldValue">${family.outXyArea}
                <c:if test="${compareUtils.show(family.outXyArea,family1.outXyArea)}"><font style="color:red;">
                    （${family1.outXyArea}）</font></c:if>
                ㎡
            </td>
        </tr>
        <tr>
            <td class="fieldName">指标内购房款：</td>
            <td class="fieldValue">${family.inMoney}
                <c:if test="${compareUtils.show(family.inMoney,family1.inMoney)}"><font style="color:red;">
                    （${family1.inMoney}）</font></c:if>
                元
            </td>
            <td class="fieldName">指标外购房款：</td>
            <td class="fieldValue">${family.outMoney}
                <c:if test="${compareUtils.show(family.outMoney,family1.outMoney)}"><font style="color:red;">
                    （${family1.outMoney}）</font></c:if>
               元
            </td>
        </tr>
        <tr>
            <td class="fieldName">购房款：</td>
            <td class="fieldValue" colspan="3">${family.gfMoney}
                <c:if test="${compareUtils.show(family.gfMoney,family1.gfMoney)}"><font style="color:red;">
                    （${family1.gfMoney}）</font></c:if>
               元
            </td>
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
            <td class="fieldValue" colspan="3">${family.totalMoney}
                <c:if test="${compareUtils.show(family.totalMoney,family1.totalMoney)}"><font style="color:red;">
                    （${family1.totalMoney}）</font></c:if>
                元
            </td>
        </tr>
        <tr>
            <td class="fieldName">结算后款：</td>
            <td class="fieldValue" colspan="3">${family.settlementedMoney}
                <c:if test="${compareUtils.show(family.settlementedMoney,family1.settlementedMoney)}"><font style="color:red;">
                    （${family1.settlementedMoney}）</font></c:if>
                元
            </td>
        </tr>
        </tbody>
    </table>
</fieldset>