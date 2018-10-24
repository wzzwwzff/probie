<%--
  Created by IntelliJ IDEA.
  User: jmdf
  Date: 2018/9/13
  Time: 10:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.app.cq.en.CheckState" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>协议管理列表</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="title">
    <h5>协议管理列表</h5>
</div>
<div class="content">
    <div class="search form-inline">
        <div class="search">
            <div class="search_content">
                <form id="search" class="form-search">
                    <div class="form-group">
                        <div class="input-group input-group-sm">
                            <div class="input-group-addon">组别</div>
                            <tags:searchDataDict className="form-control" name="groupCode" fieldType="string"
                                                 dataDict="组别"/>
                        </div>
                        <div class="input-group input-group-sm">
                            <div class="input-group-addon">编号</div>
                            <tags:searchInput name="f.familyCode" fieldType="string" operator="like"
                                              className="form-control"/>
                        </div>
                        <div class="input-group input-group-sm">
                            <div class="input-group-addon">姓名</div>
                            <tags:searchInput name="f.name" fieldType="string" operator="like"
                                              className="form-control"/>
                        </div>
                        <div class="input-group input-group-sm">
                            <div class="input-group-addon">房屋坐落</div>
                            <tags:searchInput name="f.houseAddress" fieldType="string" operator="like"
                                              className="form-control"/>
                        </div>
                        <div class="input-group input-group-sm">
                            <div class="input-group-addon">签约状态</div>
                            <tags:searchDataDict name="qyState" className="form-control" fieldType="integer"
                                                 dataDict="签约状态"/>
                        </div>
                        <button type="submit" class="btn btn-primary btn-sm"><i class="fa fa-search"></i>&nbsp;查询
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <table class="table table-bordered table-hover table-striped">
            <thead>
            <tr>
                <th class="text-center" width="5%">序号</th>
                <th class="text-center">分指</th>
                <th class="text-center">组别</th>
                <th class="text-center">家庭编号</th>
                <th class="text-center">被拆迁人</th>
                <th class="text-center">地址门牌</th>
                <th class="text-center">房屋产别</th>
                <th class="text-center">房屋类型</th>
                <th class="text-center">建筑面积/㎡</th>
                <th class="text-center">审计初审状态</th>
                <th class="text-center">签约状态</th>
                <th class="text-center">签约顺序号</th>
                <th width="20%" class="text-center">操作</th>
            </tr>
            </thead>
            <c:forEach items="${pageInfo.result}" var="family" varStatus="status">
                <tr>
                    <td class="text-center">${status.count+(pageInfo.pageNo-1)*pageInfo.pageSize}</td>
                    <td class="text-center"><tags:dataDict dataDict="分指" value="${family.bdCode}"/></td>
                    <td class="text-center"><tags:dataDict dataDict="组别" value="${family.groupCode}"/></td>
                    <td class="text-center">${family.familyCode}</td>
                    <td class="text-center">${family.name}</td>
                    <td class="text-center">${family.address}</td>
                    <td class="text-center"><tags:dataDict dataDict="房屋产别" value="${family.houseType}"/></td>
                    <td class="text-center"><tags:dataDict dataDict="房屋类型" value="${family.houseStyle}"/></td>
                    <td class="text-center">${family.buildArea}</td>
                    <td class="text-center"><tags:dataDict dataDict="初审状态" value="${family.firstCheckStatus}"/></td>
                    <td class="text-center"><tags:dataDict dataDict="签约状态" value="${family.signStatus}"/></td>
                    <td class="text-center">${family.signNum}</td>
                    <td class="text-center">
                        <c:set var="firstChecked" value="<%=CheckState.FIRSTCHECK.getIndex()%>"></c:set>
                        <c:if test="${family.firstCheckStatus eq firstChecked && family.signStatus eq 1}">
                            <a href="javascript:setSignNum('${family.id}')" title="设置为已签约"><i
                                    class="fa fa-edit"></i>&nbsp;设置为已签约
                            </a>
                        </c:if>
                        <c:if test="${family.signStatus eq 2 && family.jfStatus ne 2}">
                            <a href="javascript:cancelSignNum('${family.id}')" title="撤销已签约"><i
                                    class="fa fa-close"></i>&nbsp;撤销已签约
                            </a>
                        </c:if>
                        <c:if test="${family.signStatus eq 2 && family.jfStatus ne 2}">
                            <a href='printSignFrame?familyId=${family.id}&${pageInfo.searchParams}'
                                   title="打印意向签约结果单"><i class="fa fa-print"></i>&nbsp;打印意向签约结果单
                            </a>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <tags:pageInfo/>
    </div>
</div>
</body>
<script>
    function setSignNum(familyId) {
        if (confirm("确定要将该家庭设置为已签约状态吗？")) {
            $.get("setSign", {familyId: familyId, _date: new Date().getTime()}, function (data) {
                if (data.success == "true") {
                    window.location.reload();
                } else {
                    alert(data.message);
                }
            })
        }
    }
    function cancelSignNum(familyId) {
        if (confirm("确定要撤销该家庭已签约状态吗？")) {
            $.get("cancelSign", {familyId: familyId, _date: new Date().getTime()}, function (data) {
                if (data.success == "true") {
                    window.location.reload();
                } else {
                    alert(data.message);
                }
            })
        }
    }
</script>

</html>
