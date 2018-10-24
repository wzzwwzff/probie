<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<table class="table table-bordered table-hover">
    <thead>
    <tr>
        <th class="text-center" width="4%">序号</th>
        <th class="text-center">项目名称</th>
        <th class="text-center">楼号</th>
        <th class="text-center">单元</th>
        <th class="text-center">房号</th>
        <th class="text-center">居室</th>
        <th class="text-center">购房人</th>
        <th class="text-center">购房身份证号</th>
        <th class="text-center">面积</th>
        <th class="text-center">操作</th>
    </tr>
    </thead>
    <tbody>
    <c:if test="${not empty houseList}">
        <c:forEach items="${houseList}" var="house" varStatus="status">
            <c:set var="areaTotal" value="${areaTotal + house.buildArea}"/>
            <tr>
                <td class="text-center">${status.count}</td>
                <td class="text-center">${house.project.projectName}</td>
                <td class="text-center">${house.buildNum}</td>
                <td class="text-center">${house.unitNum}</td>
                <td class="text-center">${house.houseNum}</td>
                <td class="text-center"><tags:dataDict dataDict="房屋户型" value="${house.houseHold}"/></td>
                <td class="text-center">${house.hPerson}</td>
                <td class="text-center">${house.hIdCard}</td>
                <td class="text-center">${house.buildArea}㎡</td>
                <td class="text-center">
                    <c:if test="${family.xfStatus eq 1}">
                        <a href="javascript:delHouseInfo('${house.id}')" title="点击删除该房源"><img
                                src="/static/image/delete.gif"></a>
                    </c:if>&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="editHPerson?houseId=${house.id}&familyId=${family.id}" title="修改购房人"><i class="fa fa-edit"></i>修改购房人</a>&nbsp;&nbsp;
                    <%--<a href="javascript:changeHouseInfo('${house.id}')" title="平移房源"><i class="fa fa-building"></i>平移房源</a>&nbsp;&nbsp;--%>
                    <%--<a href="javascript:cancelXfStatus()" title="改选房源"><i class="fa fa-edit"></i>改选房源</a>&nbsp;&nbsp;--%>
                </td>
            </tr>
        </c:forEach>
    </c:if>
    <tr>
        <td class="text-center" colspan="8">面积合计</td>
        <td class="text-center">${areaTotal}㎡</td>
        <td></td>
    </tr>
    <tr style="color: green;font-size: 20px;">
        <td class="text-center" colspan="6">
            <button type="button" class="btn btn-primary"
                    onclick="location.href='printXfResultFrame?familyId=${family.id}'"><i class="fa fa-print"></i>点击打印选房确认单
            </button>
            &nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;
        </td>
        <td class="text-center" colspan="4">
            <%--购房款：元；--%>
            <button type="button" class="btn btn-primary" onclick="history.back();"><i class="fa fa-backward"></i>&nbsp;&nbsp;返回
            </button>
        </td>
    </tr>
    </tbody>
</table>
<script>
    //    设置认购协议状态
    function setSignStatus(familyId) {
        if (confirm("确认设置为已签约吗？")) {
            var url = "setSignStatus?familyId=" + familyId;
            $.get(url, {_time: new Date().getTime()}, function (data) {
                if (data.code == '0000') {
                    location.reload();
                } else {
                    alert(data.message);
                }
            });
        }
    }
</script>
