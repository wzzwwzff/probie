<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div>
    <table class="table table-bordered table-hover">
        <thead>
        <tr>
            <th width="5%" class="text-center">序号</th>
            <th class="text-center">组别</th>
            <th class="text-center">编号</th>
            <th class="text-center">被拆迁人</th>
            <th class="text-center">房屋坐落</th>
            <th class="text-center">证载面积</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="family" items="${pageInfo.result}" varStatus="status">
            <tr>
                <td class="text-center">${status.count+(pageInfo.pageNo-1)*pageInfo.pageSize}</td>
                <td class="text-center"><tags:dataDict dataDict="组别" value="${family.groupCode}"/></td>
                <td class="text-center">${family.familyCode}</td>
                <td class="text-center">${family.name}</td>
                <td class="text-left">${family.houseAddress}</td>
                <td class="text-center">${family.buildArea}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div class="footer resizeLayout"><tags:pageInfo/></div>