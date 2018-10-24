<%@ page contentType="text/html;charset=UTF-8" %>
<fieldset>
    <legend>一、被拆迁人信息</legend>
    <table class="table table-bordered">
        <tr>
            <td class="fieldName">编号</td>
            <td class="fieldValue">${family.familyCode}</td>
            <td class="fieldName">分指</td>
            <td class="fieldValue">
                <tags:dataDict dataDict="分指" value="${family.bdCode}" />
            </td>
        </tr>
        <tr>
            <td class="fieldName">组别</td>
            <td class="fieldValue">
                <tags:dataDict dataDict="组别" value="${family.groupCode}"/>
            </td>
            <td class="fieldName">被拆迁人</td>
            <td class="fieldValue">${family.name}</td>
        </tr>
        <tr>
            <td class="fieldName">援藏人数</td>
            <td class="fieldValue">${family.helpNum}</td>
            <td class="fieldName">教师资格数</td>
            <td class="fieldValue">${family.teacherNum}</td>
        </tr>
        <tr>
            <td class="fieldName">夫妻工龄之和</td>
            <td class="fieldValue">${family.glNum}</td>
            <td class="fieldName">联系电话</td>
            <td class="fieldValue">${family.tel}</td>
        </tr>
        <tr>
            <td class="fieldName">身份证号</td>
            <td class="fieldValue">${family.idCard}</td>
            <td class="fieldName">婚姻状况</td>
            <td class="fieldValue">
                <tags:dataDict dataDict="婚姻状况" value="${family.marryStatus}"/>
            </td>
        </tr>
    </table>
</fieldset>
<fieldset>
    <legend>二、房屋基本信息</legend>
    <table class="table table-bordered">
        <tr>
            <td class="fieldName">地址门牌</td>
            <td class="fieldValue" colspan="3">${family.address}</td>
        </tr>
        <tr>
            <td class="fieldName">房屋产别</td>
            <td class="fieldValue"><tags:dataDict dataDict="房屋产别" value="${family.houseType}"/></td>
            <td class="fieldName">产权单位</td>
            <td class="fieldValue">${family.houseCompany}</td>
        </tr>
        <tr>
            <td class="fieldName">房屋类型</td>
            <td class="fieldValue"><tags:dataDict dataDict="房屋类型" value="${family.houseStyle}"/></td>
            <td class="fieldName">间数</td>
            <td class="fieldValue">${family.houseNum}</td>
        </tr>
        <tr>
            <td class="fieldName">使用面积</td>
            <td class="fieldValue">${family.useArea}㎡</td>
            <td class="fieldName">建筑面积</td>
            <td class="fieldValue">${family.buildArea}㎡</td>
        </tr>
        <tr>
            <td class="fieldName">用途</td>
            <td class="fieldValue" colspan="3"><tags:dataDict dataDict="住宅房屋用途" value="${family.houseUse}"/></td>
        </tr>
        <tr>
            <td class="fieldName">营业面积</td>
            <td class="fieldValue">${family.businessArea}</td>
            <td class="fieldName">营业执照号</td>
            <td class="fieldValue">${family.businessCode}</td>
        </tr>
        <tr>
            <td class="fieldName">自建房间数</td>
            <td class="fieldValue">${family.zjHouseNum}</td>
            <td class="fieldName">自建房面积</td>
            <td class="fieldValue">${family.zjHouseArea}㎡</td>
        </tr>
        <tr>
            <td class="fieldName">是否有标准自建房</td>
            <td class="fieldValue" colspan="3" style="color: green;font-size: 20px;font-weight: bold;"><tags:dataDict dataDict="是否" value="${family.houseStatus}"/></td>
        </tr>
    </table>
    <c:if test="${family.houseStatus eq 1}">
        <table class="table table-bordered">
            <tr>
                <td class="fieldName" style="text-align: center;" colspan="8">标准自建房信息</td>
            </tr>
            <tr>
                <td class="fieldName" style="text-align: center;" colspan="5">标准自建房信息</td>
                <td class="fieldName" style="text-align: center;" colspan="3">标准自建房家庭成员信息</td>
            </tr>
            <tr>
                <td class="fieldName" style="text-align: center;width: 5%">序号</td>
                <td class="fieldName" style="text-align: center;width: 6%">间数</td>
                <td class="fieldName" style="text-align: center;width: 6%">面积</td>
                <td class="fieldName" style="text-align: center;width: 10%">房主姓名</td>
                <td class="fieldName" style="text-align: center;width: 15%">房主身份证号</td>
                <td class="fieldName" style="text-align: center;width: 10%">姓名</td>
                <td class="fieldName" style="text-align: center;width: 15%">身份证号</td>
                <td class="fieldName" style="text-align: center;width: 10%">与房主关系</td>
            </tr>
            <c:if test="${not empty familyHouseList}">
                <c:forEach items="${familyHouseList}" var="familyHouse" varStatus="status">
                    <c:set var="length" value="${fn:length(familyHousePersonMap[familyHouse.id])}"/>
                    <tr>
                        <td style="text-align: center;" rowspan="${length}">${status.count}</td>
                        <td style="text-align: center;" rowspan="${length}">${familyHouse.houseNum}</td>
                        <td style="text-align: center;" rowspan="${length}">${familyHouse.houseArea}㎡</td>
                        <td style="text-align: center;" rowspan="${length}">${familyHouse.name}</td>
                        <td style="text-align: center;" rowspan="${length}">${familyHouse.idCard}</td>
                        <c:set var="familyHousePerson" value="${familyHousePersonMap[familyHouse.id][0]}"/>
                        <td style="text-align: center;">${familyHousePerson.name}</td>
                        <td style="text-align: center;">${familyHousePerson.idCard}</td>
                        <td style="text-align: center;">${familyHousePerson.relation}</td>
                    </tr>
                    <c:if test="${fn:length(familyHousePersonMap[familyHouse.id]) gt 1}">
                        <c:forEach begin="1" end="${fn:length(familyHousePersonMap[familyHouse.id])-1}"  var="i">
                            <c:set var="familyHousePerson" value="${familyHousePersonMap[familyHouse.id][i]}"/>
                            <tr>
                                <td style="text-align: center;">${familyHousePerson.name}</td>
                                <td style="text-align: center;">${familyHousePerson.idCard}</td>
                                <td style="text-align: center;">${familyHousePerson.relation}</td>
                            </tr>
                        </c:forEach>
                    </c:if>
                </c:forEach>
            </c:if>
        </table>
    </c:if>
</fieldset>
<fieldset>
    <legend>三、家庭成员</legend>
    <table class="table table-bordered">
        <tr>
            <td class="fieldName" style="width: 16.66%;">户籍数</td>
            <td class="fieldValue" style="width: 16.66%;">${family.hjNum}</td>
            <td class="fieldName" style="width: 16.66%;">户籍人数</td>
            <td class="fieldValue" style="width: 16.66%;">${family.hjPersonNum}</td>
            <td class="fieldName" style="width: 16.66%;">现居住人数</td>
            <td class="fieldValue" style="width: 16.66%;">${family.livePersonNum}</td>
        </tr>
    </table>
    <table class="table table-bordered" id="personTable1">
        <tr>
            <td class="fieldName" style="text-align: center;" colspan="10">户籍在本址</td>
        </tr>
        <tr>
            <td class="fieldName" style="text-align: center;width: 6%">序号</td>
            <td class="fieldName" style="text-align: center;width: 6%">户口本数</td>
            <td class="fieldName" style="text-align: center;width: 10%">姓名</td>
            <td class="fieldName" style="text-align: center;width: 18%">身份证号</td>
            <td class="fieldName" style="text-align: center;width: 10%">与户主关系</td>
            <td class="fieldName" style="text-align: center;width: 10%">户主与被拆迁人关系</td>
            <td class="fieldName" style="text-align: center;width: 8%">是否享受过保障性住房政策</td>
            <td class="fieldName" style="text-align: center;width: 8%">是否享受人均5㎡</td>
            <td class="fieldName" style="text-align: center;width: 8%">是否长期住在未登记房屋内</td>
            <td class="fieldName" style="text-align: center;width: 14%">工作单位</td>
        </tr>
        <c:forEach items="${familyPersonList1}"  var="familyPerson1" varStatus="status">
            <tr>
                <td style="text-align: center;">${status.count}</td>
                <td style="text-align: center;">${familyPerson1.hkNum}</td>
                <td style="text-align: center;">${familyPerson1.name}</td>
                <td style="text-align: center;">${familyPerson1.idCard}</td>
                <td style="text-align: center;">${familyPerson1.relation}</td>
                <td style="text-align: center;">${familyPerson1.hzRelation}</td>
                <td style="text-align: center;"><tags:dataDict dataDict="是否" value="${familyPerson1.status}"/></td>
                <td style="text-align: center;"><tags:dataDict dataDict="是否" value="${familyPerson1.aveStatus}"/></td>
                <td style="text-align: center;"><tags:dataDict dataDict="是否" value="${familyPerson1.flag}"/></td>
                <td style="text-align: center;">${familyPerson1.unit}</td>
            </tr>
        </c:forEach>
    </table>
    <table class="table table-bordered">
        <tr>
            <td class="fieldName" style="text-align: center;" colspan="7">户籍不在本址</td>
        </tr>
        <tr>
            <td class="fieldName" style="text-align: center;width: 5%">序号</td>
            <td class="fieldName" style="text-align: center;width: 15%">姓名</td>
            <td class="fieldName" style="text-align: center;width: 20%">身份证号</td>
            <td class="fieldName" style="text-align: center;width: 13%">与被拆迁人关系</td>
            <td class="fieldName" style="text-align: center;width: 13%">户口所在地</td>
            <td class="fieldName" style="text-align: center;width: 18%">工作单位</td>
        </tr>
        <c:forEach items="${familyPersonList2}" var="familyPerson2" varStatus="status">
            <tr>
                <td style="text-align: center;">${status.count}</td>
                <td style="text-align: center;">${familyPerson2.name}</td>
                <td style="text-align: center;">${familyPerson2.idCard}</td>
                <td style="text-align: center;">${familyPerson2.relation}</td>
                <td style="text-align: center;">${familyPerson2.hjAddress}</td>
                <td style="text-align: center;">${familyPerson2.unit}</td>
            </tr>
        </c:forEach>
    </table>
</fieldset>
<fieldset>
    <legend>四、生活困难情况</legend>
    <table class="table table-bordered">
        <tbody>
        <tr>
            <td class="fieldName" style="width: 10%;">低保(证)</td>
            <td class="fieldValue" style="width: 10%;">${family.dbNum}</td>
            <td class="fieldName" style="width: 10%;">残疾(证)</td>
            <td class="fieldValue" style="width: 10%;">${family.cjNum}</td>
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
            <td class="fieldValue" style="width: 10%;">${family.dhNum}</td>
            <td class="fieldName" style="width: 10%;">空调(台)</td>
            <td class="fieldValue" style="width: 10%;">${family.ktNum}</td>
            <td class="fieldName" style="width: 10%;">有线电视(端)</td>
            <td class="fieldValue" style="width: 10%;">${family.yxNum}</td>
            <td class="fieldName" style="width: 10%;">宽带(端)</td>
            <td class="fieldValue" style="width: 10%;">${family.kdNum}</td>
            <td class="fieldName" style="width: 10%;">热水器(台)</td>
            <td class="fieldValue" style="width: 10%;">${family.rsqNum}</td>
        </tr>
        </tbody>
    </table>
</fieldset>
<fieldset>
    <legend>六、房改数据</legend>
    <table class="table table-bordered">
        <tr>
            <td class="fieldName" style="width: 15%;">房改售房代扣款</td>
            <td class="fieldValue" style="width: 85%;">${family.fgFee}</td>
        </tr>
    </table>
</fieldset>
<fieldset>
    <legend>七、其他信息</legend>
    <table class="table table-bordered">
        <tr>
            <td class="fieldName" style="width: 15%;">备注</td>
            <td class="fieldValue" style="width: 85%;">${family.summary}</td>
        </tr>
    </table>
</fieldset>