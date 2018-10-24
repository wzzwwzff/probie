<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="now" class="java.util.Date" scope="page"/>
<fieldset>
    <legend>一、被拆迁人情况</legend>
    <table class="table table-bordered">
        <tbody>
        <tr>
            <td class="fieldName">组别：</td>
            <td class="fieldValue">
                <c:if test="${departmentCode eq '01'}">
                <tags:dataDictInput dataDict="组别" className="required form-control_short" name="groupCode"
                                    value="${family.groupCode}" firstValue="-请选择-"/><span class="require">*</span>
                </c:if>
                <c:if test="${departmentCode ne '01'}">
                    <input class="hidden" name="groupCode" value="${departmentCode}">
                    <tags:dataDict dataDict="组别" value="${departmentCode}" /><span class="require">*</span>
                </c:if>
            </td>
            <td class="fieldName">编号：</td>
            <td class="fieldValue">
                <input type="text" name="familyCode" id="familyCode" class="required form-control_short"
                       value="${family.familyCode}"/>
                <span class="require">*</span><span class="require" id="textShow"></span>
            </td>
        </tr>
        <tr>
            <td class="fieldName">姓名：</td>
            <td class="fieldValue">
                <input type="text" name="name" class="required form-control_short" value="${family.name}"/><span
                    class="require">*</span>
            </td>
            <td class="fieldName">身份证号：</td>
            <td class="fieldValue"><input size="30" type="text" name="idCard" class="form-control_short idCard"
                                          value="${family.idCard}"/><span style="color: red"></span></td>
        </tr>
        <tr>
            <td class="fieldName">性别：</td>
            <td class="fieldValue"><tags:dataDictInput name="sex" dataDict="性别" className="form-control_short"
                                                       value="${family.sex}"/></td>
            <td class="fieldName">出生日期：</td>
            <td class="fieldValue"><input id="birthdayDate" type="text" class="form-date-time form-control datepicker dateISO"
                                          name="birthdayDate"
                                          value="<fmt:formatDate value='${family.birthdayDate}' pattern='yyyy-MM-dd'/>"/>
            </td>
        </tr>
        <tr>
            <td class="fieldName">工作单位：</td>
            <td class="fieldValue"><input size="50" type="text" class="form-control_short" name="unit"
                                          value="${family.unit}"/></td>
            <td class="fieldName">联系电话：</td>
            <td class="fieldValue"><input size="30" type="text" class="form-control_short" name="phone"
                                          value="${family.phone}"/></td>
        </tr>
        <tr>
            <td class="fieldName">户籍所在地：</td>
            <td class="fieldValue"><input type="text" class="form-control_short" name="address" size="50"
                                          value="${family.address}"/></td>
            <td class="fieldName">邮编：</td>
            <td class="fieldValue"><input size="30" class="form-control_short" type="text" name="zipCode"
                                          value="${family.zipCode}"/></td>
        </tr>
        <tr>
            <td class="fieldName">通讯地址：</td>
            <td class="fieldValue"><input type="text" name="contextAddress" class="form-control_short" size="50"
                                          value="${family.contextAddress}"/></td>
            <td class="fieldName ">户口迁入时间</td>
            <td class="fieldValue"><input id="moveDate" type="text" class="form-control form-date-time datepicker dateISO"
                                          name="moveDate"
                                          value="<fmt:formatDate value='${family.moveDate}' pattern='yyyy-MM-dd'/>"/>
            </td>
        </tr>
        </tbody>
    </table>
</fieldset>
<fieldset>
    <legend>二、被拆迁房屋土地情况</legend>
    <table class="table table-bordered">
        <tbody>
        <tr>
            <td class="fieldName">房屋坐落：</td>
            <td class="fieldValue" colspan="3">
                <input size="50" type="text" class="form-control_short required" name="houseAddress"
                       value="${family.houseAddress}"/><span
                    class="require">*</span>
            </td>
        </tr>
        <tr>
            <td class="fieldName">权属证书编号：</td>
            <td class="fieldValue"><input size="30" type="text" class="form-control_short" name="ownershipCode"
                                          value="${family.ownershipCode}"/></td>
            <td class="fieldName">合法宅基地面积【㎡】：</td>
            <td class="fieldValue"><input size="10" type="text" name="confirmArea" class="form-control_short number"
                                          value="${family.confirmArea}"/>
            </td>
        </tr>
        <tr>
            <td class="fieldName">控制标准面积【㎡】：</td>
            <td class="fieldValue"><input size="10" type="text" class="form-control_short number" name="controlArea"
                                          value="${family.controlArea}"/>
            </td>
            <td class="fieldName">超控制标准面积【㎡】：</td>
            <td class="fieldValue"><input size="10" type="text" class="form-control_short number" name="outControlArea"
                                          value="${family.outControlArea}"/>
            </td>
        </tr>
        <tr>
            <td class="fieldName">房屋是否经营：</td>
            <td class="fieldValue"><tags:dataDictRadio name="isBussess" dataDict="是否" value="${family.isBussess}"/></td>
            <td class="fieldName"><span class="confir">经营认定面积【㎡】：</span></td>
            <td class="fieldValue"><span class="confir"><input type="text" class="form-control_short number" name="bussessArea"
                                                               id="bussessArea" size="8" value="${family.bussessArea}"/></span>
            </td>
        </tr>
        <tr class="confir">
            <td class="fieldName">是否免税：</td>
            <td class="fieldValue"><tags:dataDictRadio name="isDutyFree" dataDict="是否"
                                                       value="${family.isDutyFree}"/></td>
            <td class="fieldName"><span class="confirFree">停产停业补助费【元】：</span></td>
            <td class="fieldValue"><span class="confirFree">
                <input type="text" class="form-control_short number" name="tctyfFee" size="8" value="${family.tctyfFee}"/>
                 <span style="display: none;color: red" id="managerText">停产停业补助费超出600元/㎡标准</span>
            </span>
            </td>
        </tr>
        <tr class="confir">
            <td class="fieldName">营业执照名称：</td>
            <td class="fieldValue"><input type="text" name="yyzz" size="40" class="form-control_short"
                                          value="${family.yyzz}"/></td>
            <td class="fieldName">营业执照注册号：</td>
            <td class="fieldValue"><input type="text" name="zcgCode" size="40" class="form-control_short"
                                          value="${family.zcgCode}"/></td>
        </tr>
        <tr>
            <td class="fieldName">是否有缴费种养殖地：</td>
            <td class="fieldValue" colspan="3"><tags:dataDictRadio name="isLandFee" dataDict="是否" value="${family.isLandFee}"/>
            </td>
        </tr>
        </tbody>
    </table>
</fieldset>
<fieldset>
    <legend>三、家庭人口情况</legend>
    <table class="table table-bordered" id="personTable">
        <tr>
            <th class="active" style="text-align: center;">删除</th>
            <th class="active" style="text-align: center;width: 7%">姓名</th>
            <th class="active" style="text-align: center;width: 6%;">性别</th>
            <th class="active" style="text-align: center;width: 12%">身份证号</th>
            <th class="active" style="text-align: center;width: 5%">年龄</th>
            <th class="active" style="text-align: center;width: 7%">与户主关系</th>
            <th class="active" style="text-align: center;width: 6%">婚姻状况</th>
            <th class="active" style="text-align: center;">工作单位</th>
            <th class="active" style="text-align: center;">是否是独生子女</th>
            <th class="active" style="text-align: center;">是否怀孕</th>
            <th class="active" style="text-align: center;">户口迁入时间</th>
            <th class="active" style="text-align: center;">是否为安置人口</th>
            <th class="active" style="text-align: center;">联系方式</th>
            <th class="active" style="text-align: center;">现住址</th>
            <th class="active" style="text-align: center;">备注</th>
        </tr>
        <c:forEach begin="0" end="${2+fn:length(familyPersonList)}" var="i" varStatus="status">
            <tr id="${status.count}_tr">
                <input type="hidden" class="form-control" name="f_id" value="${familyPersonList[i].id}"/>
                <td class="active" style="text-align: center;">
                    <button type="button" class="btn btn-sm btn-danger" onclick="deleteTr1($(this))"><i
                            class="fa fa-delicious"></i>&nbsp;删除
                    </button>
                </td>
                <td class="active" style="text-align: center;"><input type="text" class="form-control execute"
                                                                      name="f_personName"
                                                                      value="${familyPersonList[i].personName}"/></td>
                <td class="active" style="text-align: center;"><tags:dataDictInput dataDict="性别" name="f_sex"
                                                                                            className="form-control"
                                                                                            type="select"
                                                                                            value="${familyPersonList[i].sex}"/></td>
                <td class="active" style="text-align: center;"><input type="text" class="form-control idCard"
                                                                      name="f_idCard"
                                                                      value="${familyPersonList[i].idCard}"/><span
                        style="color: red"></span></td>
                <td class="active" style="text-align: center;"><input type="text" class="form-control digits" name="f_age"
                                                                      value="${familyPersonList[i].age}"/></td>
                <td class="active" style="text-align: center;"><input type="text" class="form-control" name="f_relation"
                                                                      value="${familyPersonList[i].relation}"/></td>
                <td class="active" style="text-align: center;"><tags:dataDictInput dataDict="婚姻状况"
                                                                                            name="f_marrType"
                                                                                            className="form-control"
                                                                                            type="select"
                                                                                            value="${familyPersonList[i].marrType}"/></td>
                <td class="active" style="text-align: center;">
                    <input type="text" class="form-control" name="f_unit" value="${familyPersonList[i].unit}"/></td>
                <td class="active" style="text-align: center;width: 6%">
                    <tags:dataDictInput dataDict="是否" name="f_oneType" className="form-control" type="select"
                                        value="${familyPersonList[i].oneType}"/></td>
                <td class="active" style="text-align: center;width: 6%"><tags:dataDictInput dataDict="是否"
                                                                                            name="f_pregnancyType"
                                                                                            className="form-control"
                                                                                            type="select"
                                                                                            value="${familyPersonList[i].pregnancyType}"/></td>
                <td class="active" style="text-align: center;width: 6%">
                    <input class="form-control form-date-time datepicker dateISO" name="f_qrDate" style="height: 35px;"
                           value="<fmt:formatDate value="${familyPersonList[i].qrDate}" pattern="yyyy-MM-dd" />">
                </td>
                <td class="active" style="text-align: center;width: 6%"><tags:dataDictInput dataDict="是否"
                                                                                            name="f_status"
                                                                                            className="form-control"
                                                                                            type="select"
                                                                                            value="${empty familyPersonList[i].status ? 2 : familyPersonList[i].status}"/></td>
                <td class="active" style="text-align: center;"><input type="text" class="form-control" name="f_tel"
                                                                      value="${familyPersonList[i].tel}"/></td>
                <td class="active" style="text-align: center;"><input type="text" class="form-control tt" name="f_address"
                                                                      value="${familyPersonList[i].address}" title="${familyPersonList[i].address}"/></td>
                <td class="active" style="text-align: center;"><input type="text" class="form-control tt" name="f_memo"
                                                                      value="${familyPersonList[i].memo}" title="${familyPersonList[i].memo}"/></td>
            </tr>
        </c:forEach>
    </table>
    <div align="center"><input type="button" class="btn btn-sm btn-primary" onclick="addRow1();" value="添加新行"/></div>
</fieldset>
<fieldset>
    <legend>四、移机项目</legend>
    <table class="table table-bordered">
        <tr>
            <td width="20%" class="fieldName" style="text-align: center">空调【台】</td>
            <td width="20%" class="fieldName" style="text-align: center">电话【部】</td>
            <td width="20%" class="fieldName" style="text-align: center">网络宽带【宗】</td>
            <td width="20%" class="fieldName" style="text-align: center">有线电视【宗】</td>
            <td width="20%" class="fieldName" style="text-align: center">热水器【台】</td>
        </tr>
        <tr>
            <td style="text-align: center"><input type="text" name="airConditionerNum" size="8"
                                                  class="form-control_short digits"
                                                  value="${family.airConditionerNum}"/></td>
            <td style="text-align: center"><input type="text" name="telephoneNum" size="8"
                                                  class="form-control_short digits"
                                                  value="${family.telephoneNum}"/></td>
            <td style="text-align: center"><input type="text" name="broadbandNum" size="8"
                                                  class="form-control_short digits"
                                                  value="${family.broadbandNum}"/></td>
            <td style="text-align: center"><input type="text" name="tvNum" size="8" class="form-control_short digits"
                                                  value="${family.tvNum}"/></td>
            <td style="text-align: center"><input type="text" name="waterHeaterNum" size="8"
                                                  class="form-control_short digits"
                                                  value="${family.waterHeaterNum}"/></td>
        </tr>
    </table>
</fieldset>
<fieldset>
    <legend>五、其他信息</legend>
    <table class="table table-bordered">
        <tbody>
        <tr>
            <td class="fieldName">低保【证】：</td>
            <td class="fieldValue"><input class="form-control_short digits" type="text" name="dbNum" size="8"
                                          value="${family.dbNum}"/>
            </td>
            <td class="fieldName">残疾【证】：</td>
            <td class="fieldValue"><input class="form-control_short digits" type="text" name="cjNum" size="8"
                                          value="${family.cjNum}"/>
            </td>
        </tr>
        <tr>
            <td class="fieldName">大病【人】：</td>
            <td class="fieldValue" colspan="3"><input class="form-control_short digits" type="text" name="dabNum"
                                                      size="8" value="${family.dabNum}"/>
            </td>
        </tr>

        <tr>
            <td class="fieldName">登记日期：</td>
            <td class="fieldValue" colspan="3">
                <%--<fmt:formatDate value='${family.addDate}' pattern='yyyy年MM月dd日'/>--%>
                <input type="text" name="addDate"   class="form-control form-date-time datepicker dateISO"
                       value="<fmt:formatDate value='${family.addDate}' pattern='yyyy-MM-dd'/>"/>
            </td>
        </tr>
        <tr>
            <td class="fieldName">其他情况说明：</td>
            <td class="fieldValue" colspan="3"><textarea name="summary" class="form-control_short" style="width:1000px;height:100px"
                                                       >${family.summary}</textarea>
            </td>
        </tr>
        </tbody>
    </table>
</fieldset>
