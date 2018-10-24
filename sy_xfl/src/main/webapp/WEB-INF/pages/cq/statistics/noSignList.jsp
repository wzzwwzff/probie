<%@ page import="java.util.ArrayList" %>
<%@ page import="com.app.cq.model.FamilyPerson" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="com.app.cq.model.Family" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <title>未签约台账</title>
    <%@include file="/static/common/common.jsp" %>
    <style>
        table tr td{
            vertical-align:  middle;
        }
    </style>
</head>
<body style="width: 7200px;">
<div class="title">
    <h5>未签约台账</h5>
</div>
<div class="content">
    <div class="search_content resizeLayout">
        <form class="form-inline" role="form" id="search">
            <div class="form-group">
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">组别</div>
                    <tags:searchDataDict className="form-control" name="groupCode" fieldType="string" dataDict="组别"  />
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">编号</div>
                    <tags:searchInput name="f.familyCode" fieldType="string" operator="like" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">姓名</div>
                    <tags:searchInput name="f.name" fieldType="string" operator="like" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">房屋坐落</div>
                    <tags:searchInput name="f.houseAddress" fieldType="string" operator="like" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">安置类型</div>
                    <tags:searchDataDict name="type" className="form-control" fieldType="integer" dataDict="安置类型"/>
                </div>
            <button type="submit" class="btn btn-sm btn-primary"><i class="fa fa-search"></i> 查询</button>
            <button type="button" class="btn btn-sm btn-primary" onclick="location.href='noSignExcel?<tags:searchParams/>'"><i class="fa fa-forward"></i> 导出</button>
            </div>
        </form>
    </div>


<table class="table table-bordered table-hover table-striped">
    <thead>
    <tr>
        <td class="text-center" colspan="27">家庭信息</td>
        <%--<td class="text-center" colspan="13">家庭成员</td>--%>
        <td class="text-center" colspan="4">人口信息</td>
        <td class="text-center" colspan="25">补偿情况</td>
        <th class="text-center" rowspan="2" style="vertical-align: middle">操作</th>
    </tr>
    <tr>
        <th class="text-center" style="width: 50px;">序号</th>
        <th class="text-center" style="width: 100px;">编号</th>
        <th class="text-center" style="width: 70px;">组别</th>
        <th class="text-center" style="width: 100px;">姓名</th>
        <th class="text-center" style="width: 180px;">身份证号</th>
        <th class="text-center" style="width: 180px;">房屋坐落</th>
        <th class="text-center" style="width: 150px;">合法宅基地面积(㎡)</th>
        <th class="text-center" style="width: 150px;">控制标准面积(㎡)</th>
        <th class="text-center" style="width: 150px;">超控制标准面积(㎡)</th>
        <th class="text-center" style="width: 270px;">合法宅基地范围内正式房屋建筑面积(㎡)</th>
        <th class="text-center" style="width: 230px;">合法宅基地外的房屋建筑面积(㎡)</th>
        <th class="text-center" style="width: 80px;">是否营业</th>
        <th class="text-center" style="width: 80px;">是否免税</th>
        <th class="text-center" style="width: 120px;">营业面积(㎡)</th>
        <th class="text-center" style="width: 150px;">是否有缴费种养殖地</th>
        <th class="text-center" style="width: 50px;">电话</th>
        <th class="text-center" style="width: 50px;">空调</th>
        <th class="text-center" style="width: 80px;">网络宽带</th>
        <th class="text-center" style="width: 80px;">有线电视</th>
        <th class="text-center" style="width: 70px;">热水器</th>
        <th class="text-center" style="width: 50px;">低保</th>
        <th class="text-center" style="width: 50px;">残疾</th>
        <th class="text-center" style="width: 50px;">大病</th>
        <th class="text-center" style="width: 120px;">营业执照名称</th>
        <th class="text-center" style="width: 150px;">营业执照注册号</th>
        <th class="text-center" style="width: 130px;">登记日期</th>
        <th class="text-center" style="width: 120px;">其他情况说明</th>
        <%--<th class="text-center" style="width: 100px;">姓名</th>--%>
        <%--<th class="text-center" style="width: 50px;">性别</th>--%>
        <%--<th class="text-center" style="width: 180px;">身份证号</th>--%>
        <%--<th class="text-center" style="width: 50px;">年龄</th>--%>
        <%--<th class="text-center" style="width: 100px;">与户主关系</th>--%>
        <%--<th class="text-center" style="width: 80px;">婚姻状况</th>--%>
        <%--<th class="text-center" style="width: 200px;">工作单位</th>--%>
        <%--<th class="text-center" style="width: 120px;">是否是独生子女</th>--%>
        <%--<th class="text-center" style="width: 80px;">是否怀孕</th>--%>
        <%--<th class="text-center" style="width: 80px;">户口迁入时间</th>--%>
        <%--<th class="text-center" style="width: 80px;">是否为安置人口</th>--%>
        <%--<th class="text-center" style="width: 110px;">联系方式</th>--%>
        <%--<th class="text-center" style="width: 200px;">备注</th>--%>
        <th class="text-center" style="width: 80px;">安置人口</th>
        <th class="text-center" style="width: 120px;">大龄未婚人数</th>
        <th class="text-center" style="width: 120px;">独生子女人数</th>
        <th class="text-center" style="width: 80px;">怀孕人数</th>
        <th class="text-center" style="width: 160px;">安置类型</th>
        <th class="text-center" style="width: 120px;">安置面积(㎡)</th>
        <th class="text-center" style="width: 200px;">评估公司</th>
        <th class="text-center" style="width: 230px;">宅基地面积控制标准内区位补偿款</th>
        <th class="text-center" style="width: 230px;">宅基地面积控制标准外区位补偿款</th>
        <th class="text-center" style="width: 140px;">宅基地区位补偿款</th>
        <th class="text-center" style="width: 210px;">房屋及附属物重置成新价补偿款</th>
        <th class="text-center" style="width: 230px;">是否包含未经审批房屋重置成新价</th>
        <th class="text-center" style="width: 100px;">装修补助费</th>
        <th class="text-center" style="width: 100px;">分户补偿款</th>
        <th class="text-center" style="width: 160px;">合法宅基地内空地奖</th>
        <th class="text-center" style="width: 120px;">评估价款合计</th>
        <th class="text-center" style="width: 100px;">搬家补助费</th>
        <th class="text-center" style="width: 120px;">安置房补助费</th>
        <th class="text-center" style="width: 140px;">人员安置补助费</th>
        <th class="text-center" style="width: 100px;">生活补助费</th>
        <th class="text-center" style="width: 140px;">停产停业补助费</th>
        <th class="text-center" style="width: 140px;">独生子女补助费</th>
        <th class="text-center" style="width: 140px;">住房困难补助费</th>
        <th class="text-center" style="width: 100px;">周转补助费</th>
        <th class="text-center" style="width: 60px;">移机费</th>
        <th class="text-center" style="width: 100px;">提前搬家奖</th>
        <th class="text-center" style="width: 100px;">合法利用奖</th>
        <th class="text-center" style="width: 80px;">其他</th>
        <th class="text-center" style="width: 140px;">拆迁补偿款总计</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${pageInfo.result}" var="family" varStatus="status">
        <c:set var="familyPersonList" value="${map[family.id]}"/>
        <c:set var="size" value="${fn:length(familyPersonList)}"/>
        <c:if test="${empty familyPersonList}">
            <c:set var="familyPersonList" value="<%=Arrays.asList(new FamilyPerson())%>"/>
        </c:if>
        <c:forEach var="familyPerson" varStatus="statusItem" items="${familyPersonList}">
        <tr>
            <c:if test="${statusItem.count eq 1}">
                <td class="text-center" rowspan="${size}">${status.count}</td>
                <td class="text-center" rowspan="${size}">${family.familyCode}</td>
                <td class="text-center" rowspan="${size}"><tags:dataDict dataDict="组别" value="${family.groupCode}"/></td>
                <td class="text-center" rowspan="${size}">${family.name}</td>
                <td class="text-center" rowspan="${size}">${family.idCard}</td>
                <td class="text-left" rowspan="${size}">${family.houseAddress}</td>
                <td class="text-center" rowspan="${size}">${family.confirmArea}</td>
                <td class="text-center" rowspan="${size}">${family.controlArea}</td>
                <td class="text-center" rowspan="${size}">${family.outControlArea}</td>
                <td class="text-center" rowspan="${size}">${family.buildArea}</td>
                <td class="text-center" rowspan="${size}">${family.outBuildArea}</td>
                <td class="text-center" rowspan="${size}"><tags:dataDict dataDict="是否" value="${family.isBussess}"/></td>
                <td class="text-center" rowspan="${size}"><tags:dataDict dataDict="是否" value="${family.isDutyFree}"/></td>
                <td class="text-center" rowspan="${size}">${family.bussessArea}</td>
                <td class="text-center" rowspan="${size}"><tags:dataDict dataDict="是否" value="${family.isLandFee}"/></td>
                <td class="text-center" rowspan="${size}">${family.telephoneNum}</td>
                <td class="text-center" rowspan="${size}">${family.airConditionerNum}</td>
                <td class="text-center" rowspan="${size}">${family.broadbandNum}</td>
                <td class="text-center" rowspan="${size}">${family.tvNum}</td>
                <td class="text-center" rowspan="${size}">${family.waterHeaterNum}</td>
                <td class="text-center" rowspan="${size}">${family.dbNum}</td>
                <td class="text-center" rowspan="${size}">${family.cjNum}</td>
                <td class="text-center" rowspan="${size}">${family.dabNum}</td>
                <td class="text-center" rowspan="${size}">${family.yyzz}</td>
                <td class="text-center" rowspan="${size}">${family.zcgCode}</td>
                <td class="text-center" rowspan="${size}"><fmt:formatDate value="${family.addDate}" pattern="yyyy年MM月dd日"/></td>
                <td class="text-center" rowspan="${size}">${family.summary}</td>
            </c:if>
            <%--<td class="text-center">${familyPerson.personName}</td>--%>
            <%--<td class="text-center"><tags:dataDict dataDict="性别" value="${familyPerson.sex}"/></td>--%>
            <%--<td class="text-center">${familyPerson.idCard}</td>--%>
            <%--<td class="text-center">${familyPerson.age}</td>--%>
            <%--<td class="text-center">${familyPerson.relation}</td>--%>
            <%--<td class="text-center"><tags:dataDict dataDict="婚姻状况" value="${familyPerson.marrType}"/></td>--%>
            <%--<td class="text-center">${familyPerson.unit}</td>--%>
            <%--<td class="text-center"><tags:dataDict dataDict="是否" value="${familyPerson.oneType}"/></td>--%>
            <%--<td class="text-center"><tags:dataDict dataDict="是否" value="${familyPerson.pregnancyType}"/></td>--%>
            <%--<td class="text-center"><fmt:formatDate value="${familyPerson.qrDate}" pattern="yyyy年MM月dd日"/></td>--%>
            <%--<td class="text-center"><tags:dataDict dataDict="是否" value="${familyPerson.status}"/></td>--%>
            <%--<td class="text-center">${familyPerson.tel}</td>--%>
            <%--<td class="text-center">${familyPerson.memo}</td>--%>
            <c:if test="${statusItem.count eq 1}">
                <td class="text-center" rowspan="${size}">${family.personNum}</td>
                <td class="text-center" rowspan="${size}">${family.personNo}</td>
                <td class="text-center" rowspan="${size}">${family.personOne}</td>
                <td class="text-center" rowspan="${size}">${family.personPregnancy}</td>
                <td class="text-center" rowspan="${size}"><tags:dataDict  dataDict="安置类型" value="${family.type}"/></td>
                <td class="text-center" rowspan="${size}">${family.houseControlArea}</td>
                <td class="text-center" rowspan="${size}"><tags:dataDict dataDict="评估公司" value="${family.pgCompany}"/></td>
                <td class="text-center" rowspan="${size}">${family.inqwFee}</td>
                <td class="text-center" rowspan="${size}">${family.outqwFee}</td>
                <td class="text-center" rowspan="${size}">${family.qwMoney}</td>
                <td class="text-center" rowspan="${size}">${family.fswFee}</td>
                <td class="text-center" rowspan="${size}"><tags:dataDict dataDict="是否" value="${family.isGiveup}"/></td>
                <td class="text-center" rowspan="${size}">${family.realZxbzFee}</td>
                <td class="text-center" rowspan="${size}">${family.fhbcfFee}</td>
                <td class="text-center" rowspan="${size}">${family.ktjFee}</td>
                <td class="text-center" rowspan="${size}">${family.pgAllCount}</td>
                <td class="text-center" rowspan="${size}">${family.bjbzFee}</td>
                <td class="text-center" rowspan="${size}">${family.azfbzFee}</td>
                <td class="text-center" rowspan="${size}">${family.rybzFee}</td>
                <td class="text-center" rowspan="${size}">${family.shbzFee}</td>
                <td class="text-center" rowspan="${size}">${family.tctyfFee}</td>
                <td class="text-center" rowspan="${size}">${family.onlyFee}</td>
                <td class="text-center" rowspan="${size}">${family.zfknFee}</td>
                <td class="text-center" rowspan="${size}">${family.lsazfFee}</td>
                <td class="text-center" rowspan="${size}">${family.yjfSumFee}</td>
                <td class="text-center" rowspan="${size}">${family.tqbjfFee}</td>
                <td class="text-center" rowspan="${size}">${family.confirmFee}</td>
                <td class="text-center" rowspan="${size}">${family.otherfFee}</td>
                <td class="text-center" rowspan="${size}">${family.bcSumTatal}</td>
                <td class="text-center" rowspan="${size}">
                    <a href='/cq/common/view/main?familyId=${family.id}'
                       title="查看"><i class="fa fa-eye"></i>&nbsp;查看
                    </a>&nbsp;&nbsp;

                </td>
            </c:if>
        </tr>
        </c:forEach>
    </c:forEach>
    </tbody>
</table>
<tags:pageInfo/>
</div>
</body>
</html>