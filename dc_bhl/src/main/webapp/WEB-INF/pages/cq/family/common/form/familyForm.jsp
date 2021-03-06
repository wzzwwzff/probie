<%@ page contentType="text/html;charset=UTF-8" %>
<fieldset>
    <legend>一、被拆迁人信息</legend>
    <table class="table table-bordered">
        <tr>
            <td class="fieldName">编号</td>
            <td class="fieldValue"><input type="text" class="form-control required" name="familyCode" placeholder="必填项" value="${family.familyCode}"/><span class="require">*</span></td>
            <td class="fieldName">分指</td>
            <td class="fieldValue">
                <tags:dataDictInput dataDict="分指" name="bdCode" value="${family.bdCode}" className="form-control required" firstValue="-请选择-"/><span class="require">*</span>
            </td>
        </tr>
        <tr>
            <td class="fieldName">组别</td>
            <td class="fieldValue">
                <tags:dataDictInput dataDict="组别" name="groupCode" value="${family.groupCode}" className="form-control required" firstValue="-请选择-"/><span class="require">*</span>
            </td>
            <td class="fieldName">被拆迁人</td>
            <td class="fieldValue"><input type="text" class="form-control required" name="name" placeholder="必填项" value="${family.name}"/><span class="require">*</span></td>
        </tr>
        <tr>
            <td class="fieldName">援藏人数</td>
            <td class="fieldValue"><input type="text" class="form-control number" size="5" name="helpNum" value="${family.helpNum}"/></td>
            <td class="fieldName">教师资格数</td>
            <td class="fieldValue"><input type="text" class="form-control number" size="5" name="teacherNum" value="${family.teacherNum}"/></td>
        </tr>
        <tr>
            <td class="fieldName">夫妻工龄之和</td>
            <td class="fieldValue"><input type="text" class="form-control number" size="5" name="glNum" value="${family.glNum}"/></td>
            <td class="fieldName">联系电话</td>
            <td class="fieldValue"><input type="text" class="form-control" size="50" name="tel" value="${family.tel}"/></td>
        </tr>
        <tr>
            <td class="fieldName">身份证号</td>
            <td class="fieldValue"><input type="text" class="form-control" name="idCard" size="36" value="${family.idCard}"/></td>
            <td class="fieldName">婚姻状况</td>
            <td class="fieldValue">
                <tags:dataDictInput dataDict="婚姻状况" name="marryStatus" value="${family.marryStatus}" className="form-control" firstValue="-请选择-"/>
            </td>
        </tr>
    </table>
</fieldset>
<fieldset>
    <legend>二、房屋基本信息</legend>
    <table class="table table-bordered">
        <tr>
            <td class="fieldName">地址门牌</td>
            <td class="fieldValue" colspan="3"><input type="text" size="50" class="form-control" name="address" value="${family.address}"/></td>
        </tr>
        <tr>
            <td class="fieldName">房屋产别</td>
            <td class="fieldValue">
                <tags:dataDictRadio dataDict="房屋产别" name="houseType" value="${family.houseType}"/>
            </td>
            <td class="fieldName">产权单位</td>
            <td class="fieldValue"><input type="text" class="form-control" name="houseCompany" size="50" value="${family.houseCompany}"/></td>
        </tr>
        <tr>
            <td class="fieldName">房屋类型</td>
            <td class="fieldValue">
                <tags:dataDictRadio dataDict="房屋类型" name="houseStyle" value="${family.houseStyle}"/>
            </td>
            <td class="fieldName">间数</td>
            <td class="fieldValue"><input type="text" class="form-control number" name="houseNum" size="5" value="${family.houseNum}"/></td>
        </tr>
        <tr>
            <td class="fieldName">使用面积</td>
            <td class="fieldValue"><input type="text" class="form-control number" size="10" name="useArea" value="${family.useArea}"/>㎡</td>
            <td class="fieldName">建筑面积</td>
            <td class="fieldValue"><input type="text" class="form-control number" size="10" name="buildArea" value="${family.buildArea}"/>㎡</td>
        </tr>
        <tr>
            <td class="fieldName">用途</td>
            <td class="fieldValue">
                <tags:dataDictRadio dataDict="住宅房屋用途" name="houseUse" value="${family.houseUse}"/>
            </td>
            <td class="fieldName">停产停业补助费</td>
            <td class="fieldValue"><input type="text" class="form-control number" size="10" name="tctyFee" value="${family.tctyFee}"/>元</td>
        </tr>
        <tr>
            <td class="fieldName">营业面积</td>
            <td class="fieldValue"><input type="text" class="form-control number" size="10" name="businessArea" value="${family.businessArea}"/>㎡</td>
            <td class="fieldName">营业执照号</td>
            <td class="fieldValue"><input type="text" class="form-control" name="businessCode" value="${family.businessCode}"/></td>
        </tr>
        <tr>
            <td class="fieldName">自建房间数</td>
            <td class="fieldValue"><input type="text" class="form-control number" size="5" name="zjHouseNum" value="${family.zjHouseNum}"/></td>
            <td class="fieldName">自建房面积</td>
            <td class="fieldValue"><input type="text" class="form-control number" size="10" name="zjHouseArea" value="${family.zjHouseArea}"/>㎡</td>
        </tr>
        <tr>
            <td class="fieldName">是否有标准自建房</td>
            <td class="fieldValue" colspan="3">
                <tags:dataDictRadio dataDict="是否" name="houseStatus" value="${family.houseStatus}"/>【<span class="require">注：①如存在标准自建房，请在列表中点击登记标准自建房进行登记，②若不进行选择或选择“否”，保存后系统将自动将该家庭已登记过的标准自建房信息删除！</span>】
            </td>
        </tr>
        <tr>
            <td class="fieldName">未登记房屋停产停业损失补偿</td>
            <td class="fieldValue" colspan="3">
                <input type="text" class="form-control number" size="10" name="zjfTctyFee" value="${family.zjfTctyFee}"/>元
            </td>
        </tr>
    </table>
</fieldset>
<fieldset>
    <legend>三、家庭成员</legend>
    <table class="table table-bordered">
        <tr>
            <td class="fieldName" style="width: 16.66%;">户籍数</td>
            <td class="fieldValue" style="width: 16.66%;"><input type="text" class="form-control digits" size="5" name="hjNum" value="${family.hjNum}"/></td>
            <td class="fieldName" style="width: 16.66%;">户籍人数</td>
            <td class="fieldValue" style="width: 16.66%;"><input type="text" class="form-control digits" size="5" name="hjPersonNum" value="${family.hjPersonNum}"/></td>
            <td class="fieldName" style="width: 16.66%;">现居住人数</td>
            <td class="fieldValue" style="width: 16.66%;"><input type="text" class="form-control digits" size="5" name="livePersonNum" value="${family.livePersonNum}"/></td>
        </tr>
    </table>
    <table class="table table-bordered" id="personTable1">
        <tr>
            <td class="fieldName" style="text-align: center;" colspan="10">户籍在本址</td>
        </tr>
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
        <c:forEach begin="0" end="${1+fn:length(familyPersonList1)}" var="i">
            <c:set var="familyPerson1" value="${familyPersonList1[i]}"/>
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
    <div align="center"><input type="button" class="btn btn-sm btn-primary" onclick="addRow1()" value="添加新行"/></div>
    <hr/>
    <table class="table table-bordered" id="personTable2">
        <tr>
            <td class="fieldName" style="text-align: center;" colspan="8">户籍不在本址</td>
        </tr>
        <tr>
            <td class="fieldName" style="text-align: center;width: 15%">姓名</td>
            <td class="fieldName" style="text-align: center;width: 5%">年龄</td>
            <td class="fieldName" style="text-align: center;width: 20%">身份证号</td>
            <td class="fieldName" style="text-align: center;width: 13%">与被拆迁人关系</td>
            <td class="fieldName" style="text-align: center;width: 13%">户口所在地</td>
            <td class="fieldName" style="text-align: center;width: 18%">工作单位</td>
        </tr>
        <c:forEach begin="0" end="${1+fn:length(familyPersonList2)}" var="i">
            <c:set var="familyPerson2" value="${familyPersonList2[i]}"/>
            <tr>
                <input type="hidden" name="fp_id" value="${familyPerson2.id}"/>
                    <%--不在本址--%>
                <input type="hidden" name="fp_type" value="2"/>
                <input type="hidden" name="fp_hkNum" value=""/>
                <input type="hidden" name="fp_hzRelation" value=""/>
                <input type="hidden" name="fp_status" value=""/>
                <input type="hidden" name="fp_aveStatus" value=""/>
                <input type="hidden" name="fp_flag" value=""/>
                <td style="text-align: center;"><input type="text" class="form-control" name="fp_name" value="${familyPerson2.name}"/></td>
                <td style="text-align: center;"><input type="text" class="form-control" name="fp_age" style="width: 5em;" value="${familyPerson2.age}"/></td>
                <td style="text-align: center;"><input type="text" size="40" class="form-control" name="fp_idCard" value="${familyPerson2.idCard}"/></td>
                <td style="text-align: center;"><input type="text" class="form-control" style="width: 10em;" name="fp_relation" value="${familyPerson2.relation}"/></td>
                <td style="text-align: center;"><input type="text" class="form-control" name="fp_hjAddress" value="${familyPerson2.hjAddress}"/></td>
                <td style="text-align: center;"><input type="text" size="30" class="form-control" name="fp_unit" value="${familyPerson2.unit}"/></td>
            </tr>
        </c:forEach>
    </table>
    <div align="center"><input type="button" class="btn btn-sm btn-primary" onclick="addRow2()" value="添加新行"/></div>
</fieldset>
<fieldset>
    <legend>四、生活困难情况</legend>
    <table class="table table-bordered">
        <tbody>
        <tr>
            <td class="fieldName" style="width: 10%;">低保(证)</td>
            <td class="fieldValue" style="width: 10%;"><input class="form-control digits" type="text" name="dbNum" size="5" value="${family.dbNum}"/></td>
            <td class="fieldName" style="width: 10%;">残疾(证)</td>
            <td class="fieldValue" style="width: 10%;"><input class="form-control digits" type="text" name="cjNum" size="5" value="${family.cjNum}"/></td>
        </tr>
        </tbody>
    </table>
</fieldset>
<fieldset>
    <legend>五、移机信息</legend>
    <table class="table table-bordered">
        <tbody>
        <tr>
            <td class="fieldName" style="width: 10%;">电话(部)</td>
            <td class="fieldValue" style="width: 10%;"><input class="form-control digits" type="text" name="dhNum" size="5" value="${family.dhNum}"/>
            </td>
            <td class="fieldName" style="width: 10%;">空调(台)</td>
            <td class="fieldValue" style="width: 10%;"><input class="form-control digits" type="text" name="ktNum" size="5" value="${family.ktNum}"/>
            </td>
            <td class="fieldName" style="width: 10%;">有线电视(端)</td>
            <td class="fieldValue" style="width: 10%;"><input class="form-control digits" type="text" name="yxNum" size="5" value="${family.yxNum}"/>
            </td>
            <td class="fieldName" style="width: 10%;">宽带(端)</td>
            <td class="fieldValue" style="width: 10%;"><input class="form-control digits" type="text" name="kdNum" size="5" value="${family.kdNum}"/>
            </td>
            <td class="fieldName" style="width: 10%;">热水器(台)</td>
            <td class="fieldValue" style="width: 10%;"><input class="form-control digits" type="text" name="rsqNum" size="5" value="${family.rsqNum}"/>
            </td>
        </tr>
        </tbody>
    </table>
</fieldset>
<fieldset>
    <legend>六、房改数据</legend>
    <table class="table table-bordered">
        <tr>
            <td class="fieldName" style="width: 15%;">房改售房代扣款</td>
            <td class="fieldValue" style="width: 85%;"><input type="text" class="form-control number" name="fgFee" value="${family.fgFee}"/></td>
        </tr>
    </table>
</fieldset>
<fieldset>
    <legend>七、其他信息</legend>
    <table class="table table-bordered">
        <tr>
            <td class="fieldName" style="width: 15%;">备注</td>
            <td class="fieldValue" style="width: 85%;"><textarea class="form-control" type="text" name="summary" cols="120" rows="6">${family.summary}</textarea></td>
        </tr>
    </table>
</fieldset>