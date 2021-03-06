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
                <td class="text-center">${house.azProject.projectName}</td>
                <td class="text-center">
                        ${house.buildNum}
                        <%--如果是特殊的平移户的家庭--%>
                    <c:if test="${house.isSpecial eq 1}">
                        （原房号：${house.houseNumAll}）
                    </c:if>
                </td>
                <td class="text-center">${house.unitNum}</td>
                <td class="text-center">${house.houseNum}</td>
                <td class="text-center"><tags:dataDict dataDict="户型" value="${house.houseType}"/></td>
                <td class="text-center">${house.buildArea}㎡</td>
                <td class="text-center">
                    <c:if test="${family.area.areaName eq '东河沿'}">
                        <c:if test="${family.xfStatus ne 2}">
                            <a href="javascript:delHouseInfo('${house.id}')" title="点击删除该房源">
                                <img src="/static/image/delete.gif">
                            </a>
                        </c:if>
                    </c:if>
                    <c:if test="${family.area.areaName ne '东河沿'}">
                        <c:if test="${family.xfStatus ne 2 && house.isSpecial eq 1}">
                            <a href="javascript:delHouseInfo('${house.id}')" title="点击删除该房源">
                                <img src="/static/image/delete.gif">
                            </a>
                        </c:if>
                    </c:if>
                        <%--&nbsp;&nbsp;&nbsp;&nbsp;--%>
                        <%--<c:if test="${house.isSpecial == 1}">--%>
                        <%--<a href="javascript:cancelXfStatus('${house.id}')" title="改选房源"><i class="fa fa-edit"></i>改选房源</a>&nbsp;&nbsp;--%>
                        <%--</c:if>--%>
                </td>
            </tr>
        </c:forEach>
    </c:if>
    <tr>
        <td class="text-center" colspan="6">面积合计</td>
        <td class="text-center">${areaTotal}㎡</td>
        <td></td>
    </tr>
    <tr style="color: green;font-size: 20px;">
        <td class="text-center" colspan="8">
            <%--<button type="button" class="btn btn-primary"--%>
            <%--onclick="javascript:showModal(${family.id})"><i class="fa fa-edit"></i>补录信息--%>
            <%--</button>--%>
            <%--&nbsp;&nbsp;&nbsp;--%>
            <button type="button" class="btn btn-primary"
                    onclick="location.href='printAgreement?familyId=${family.id}'"><i class="fa fa-edit"></i>签约业务办理
            </button>
            <%--&nbsp;&nbsp;&nbsp;--%>
            <%--<input type="button" class="btn btn-primary" value="设置为已签约"  <c:if--%>
            <%--test="${family.signStatus eq 1}"> onclick="javascript:setSignStatus(${family.id})"</c:if>/>--%>
        </td>
        <%--<td class="text-center" colspan="4">--%>
        <%--&lt;%&ndash;购房款：元；&ndash;%&gt;--%>
        <%--&lt;%&ndash;<button type="button" class="btn btn-primary" onclick="location.href='choosedHouseList?<tags:searchParams/>'"><i class="fa fa-backward"></i>&nbsp;&nbsp;返回&ndash;%&gt;--%>
        <%--<button type="button" class="btn btn-primary" onclick="history.back()"><i class="fa fa-backward"></i>&nbsp;&nbsp;返回--%>
        <%--</button>--%>
        <%--</td>--%>
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

    function showModal(familyId) {
        $.post("addForm", {familyId: familyId, myTime: new Date().getTime()}, function (data) {
            $("#myModalBoday").html(data);
        });
        $("#myModal").modal();
    }
</script>
