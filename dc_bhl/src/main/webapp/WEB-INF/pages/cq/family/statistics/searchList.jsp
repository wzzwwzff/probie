<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div>
    <table class="table table-bordered table-hover">
        <thead>
        <tr>
            <th width="5%" class="text-center">序号</th>
            <th class="text-center">分指</th>
            <th class="text-center">组别</th>
            <th class="text-center">家庭编号</th>
            <th class="text-center">被拆迁人</th>
            <th class="text-center">地址门牌</th>
            <th class="text-center">房屋产别</th>
            <th class="text-center">使用面积</th>
            <th class="text-center">建筑面积</th>
            <th width="15%" class="text-center">查看</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="family" items="${pageInfo.result}" varStatus="status">
            <tr>
                <td class="text-center">${status.count+(pageInfo.pageNo-1)*pageInfo.pageSize}</td>
                <td class="text-center"><tags:dataDict dataDict="分指" value="${family.bdCode}"/></td>
                <td class="text-center"><tags:dataDict dataDict="组别" value="${family.groupCode}"/></td>
                <td class="text-center">${family.familyCode}</td>
                <td class="text-center">${family.name}</td>
                <td class="text-left">${family.address}</td>
                <td class="text-center"><tags:dataDict dataDict="房屋产别" value="${family.houseType}"/> </td>
                <td class="text-center">${family.useArea}</td>
                <td class="text-center">${family.buildArea}</td>
                <td class="text-center">
                    <a title="查看" href="/cq/family/common/view/main?familyId=${family.id}"><i class="fa fa-big fa-eye"></i>&nbsp;查看</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div class="footer resizeLayout"><tags:pageInfo/></div>