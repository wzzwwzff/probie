<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>历史签约数据查看</title>
    <%@include file="/static/common/common.jsp"%>
</head>
<body>
<div class="title">
    <h5>历史签约数据查看</h5>
</div>
    <div class="content">
        <fieldset>
            <legend>一、被拆迁人信息</legend>
            <table class="table table-bordered">
                <tr>
                    <td class="fieldName">编号</td>
                    <td class="fieldValue">${historyFamily.familyCode}</td>
                    <td class="fieldName">联系电话</td>
                    <td class="fieldValue">${historyFamily.tel}</td>
                </tr>
                <tr>
                    <td class="fieldName">被拆迁人</td>
                    <td class="fieldValue">${historyFamily.name}</td>
                    <td class="fieldName">身份证号</td>
                    <td class="fieldValue">${historyFamily.idCard}</td>
                </tr>
                <tr>
                    <td class="fieldName">通信地址</td>
                    <td class="fieldValue">${historyFamily.mailAddress}</td>
                    <td class="fieldName">邮政编码</td>
                    <td class="fieldValue">${historyFamily.mailCode}</td>
                </tr>
                <tr>
                    <td class="fieldName">正式户口</td>
                    <td class="fieldValue">${historyFamily.hjNum}</td>
                    <td class="fieldName">安置人口</td>
                    <td class="fieldValue">${historyFamily.azPersonNum}</td>
                </tr>
                <tr>
                    <td class="fieldName">被拆迁人与产权人/承租人关系</td>
                    <td class="fieldValue">${historyFamily.relation}</td>
                    <td class="fieldName">是否有补充协议</td>
                    <td class="fieldValue"><tags:dataDict dataDict="是否" value="${historyFamily.bcStatus}"/></td>
                </tr>
            </table>
        </fieldset>
        <fieldset>
            <legend>二、房屋基本信息</legend>
            <table class="table table-bordered">
                <tr>
                    <td class="fieldName">地址门牌</td>
                    <td class="fieldValue" colspan="3">${historyFamily.address}</td>
                </tr>
                <tr>
                    <td class="fieldName">房屋产别</td>
                    <td class="fieldValue"><tags:dataDict dataDict="房屋产别" value="${historyFamily.houseType}"/></td>
                    <td class="fieldName">产权单位</td>
                    <td class="fieldValue">${historyFamily.houseCompany}</td>
                </tr>
                <tr>
                    <td class="fieldName">房屋类型</td>
                    <td class="fieldValue"><tags:dataDict dataDict="房屋类型" value="${historyFamily.houseStyle}"/></td>
                    <td class="fieldName">间数</td>
                    <td class="fieldValue">${historyFamily.houseNum}</td>
                </tr>
                <tr>
                    <td class="fieldName">使用面积</td>
                    <td class="fieldValue">${historyFamily.useArea}㎡</td>
                    <td class="fieldName">建筑面积</td>
                    <td class="fieldValue">${historyFamily.buildArea}㎡</td>
                </tr>
                <tr>
                    <td class="fieldName">用途</td>
                    <td class="fieldValue"><tags:dataDict dataDict="住宅房屋用途" value="${historyFamily.houseUse}"/></td>
                    <td class="fieldName">营业执照号</td>
                    <td class="fieldValue">${historyFamily.businessCode}</td>
                </tr>
            </table>
        </fieldset>
        <fieldset>
            <legend>三、安置人口</legend>
            <table class="table table-bordered" id="personTable">
                <tr>
                    <td class="fieldName" style="text-align: center;width: 5%">序号</td>
                    <td class="fieldName" style="text-align: center;width: 20%">类别</td>
                    <td class="fieldName" style="text-align: center;width: 20%">姓名</td>
                    <td class="fieldName" style="text-align: center;width: 40%">身份证号</td>
                </tr>
                <c:forEach items="${historyFamilyPersonList}" var="historyFamilyPerson" varStatus="status">
                    <tr>
                        <td style="text-align: center;">${status.count}</td>
                        <td style="text-align: center;"><tags:dataDict dataDict="安置人口类别" value="${historyFamilyPerson.type}"/></td>
                        <td style="text-align: center;">${historyFamilyPerson.name}</td>
                        <td style="text-align: center;">${historyFamilyPerson.idCard}</td>
                    </tr>
                </c:forEach>
            </table>
        </fieldset>
        <fieldset>
            <legend>四、安置房源</legend>
            <table class="table table-bordered" id="houseTable">
                <tr>
                    <td class="fieldName" style="text-align: center;width: 5%">序号</td>
                    <td class="fieldName" style="text-align: center;width: 20%">项目名称</td>
                    <td class="fieldName" style="text-align: center;width: 10%">楼号</td>
                    <td class="fieldName" style="text-align: center;width: 10%">单元</td>
                    <td class="fieldName" style="text-align: center;width: 10%">房号</td>
                    <td class="fieldName" style="text-align: center;width: 10%">居室</td>
                    <td class="fieldName" style="text-align: center;width: 10%">户型</td>
                    <td class="fieldName" style="text-align: center;width: 10%">建筑面积/㎡</td>
                </tr>
                <c:forEach items="${historyFamilyHouseList}" var="historyFamilyHouse" varStatus="status">
                    <tr>
                        <td>${status.count}</td>
                        <td>${historyFamilyHouse.projectName}</td>
                        <td>${historyFamilyHouse.buildNum}</td>
                        <td>${historyFamilyHouse.unitNum}</td>
                        <td>${historyFamilyHouse.houseNum}</td>
                        <td><tags:dataDict dataDict="房屋居室" value="${historyFamilyHouse.houseType}"/></td>
                        <td>${historyFamilyHouse.houseHold}</td>
                        <td>${historyFamilyHouse.buildArea}</td>
                    </tr>
                </c:forEach>
            </table>
        </fieldset>
        <fieldset>
            <legend>五、协议款项</legend>
            <table class="table table-bordered">
                <tr>
                    <td class="fieldName">购房款合计/元</td>
                    <td class="fieldValue">${historyFamily.buyHouseMoney}</td>
                    <td class="fieldName">公共维修基金/元</td>
                    <td class="fieldValue">${historyFamily.gwMoney}</td>
                </tr>
                <tr>
                    <td class="fieldName">贷款人民币/元</td>
                    <td class="fieldValue" colspan="3">${historyFamily.dkMoney}</td>
                </tr>
            </table>
        </fieldset>
        <fieldset>
            <legend>六、其他信息</legend>
            <table class="table table-bordered">
                <tr>
                    <td class="fieldName" style="width: 15%;">签约日期</td>
                    <td class="fieldValue" style="width: 85%;"><fmt:formatDate value="${historyFamily.signDate}" pattern="yyyy-MM-dd"/></td>
                </tr>
                <tr>
                    <td class="fieldName">备注</td>
                    <td class="fieldValue">${historyFamily.memo}</td>
                </tr>
            </table>
        </fieldset>
    </div><br/><br/><br/>
    <div class="footer resizeLayout">
        <button class="btn btn-primary btn-sm" type="button" onclick="history.back()"><i class="fa fa-backward"></i>&nbsp;返回</button>
    </div>
</body>
</html>
