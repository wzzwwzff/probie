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
                <th class="text-center">编号</th>
                <th class="text-center">组别</th>
                <th class="text-center">姓名</th>
                <th class="text-center">房屋坐落</th>
                <th class="text-center">合法宅基地面积(㎡)</th>
                <th class="text-center">合法宅基地范围内正式房屋建筑面积 (㎡)</th>
                <th class="text-center">安置人口</th>
                <th class="text-center">签约状态</th>
                <th class="text-center">操作</th>
            </tr>
            </thead>
            <c:forEach items="${pageInfo.result}" var="family" varStatus="status">
                <tr>
                    <td class="text-center">${status.count}</td>
                    <td class="text-center">${family.familyCode}</td>
                    <td class="text-center"><tags:dataDict dataDict="组别" value="${family.groupCode}"/></td>
                    <td class="text-center">${family.name}</td>
                    <td class="text-left">${family.houseAddress}</td>
                    <td class="text-center">${family.confirmArea}</td>
                    <td class="text-center">${family.buildArea}</td>
                    <td class="text-center">${family.personNum}</td>
                    <td class="text-center">
                        <tags:dataDict dataDict="签约状态" value="${family.qyState}"/>
                        <c:if test="${family.qyState == 2}">
                            <br/><fmt:formatDate value="${family.qyDate}" pattern="yyyy-MM-dd"/>
                        </c:if>
                    </td>
                    <td class="text-center">
                        <%--<a href='previewFrame?familyId=${family.id}&${pageInfo.searchParams}'--%>
                           <%--title="预览协议"><i class="fa fa-eye"></i>&nbsp;预览协议--%>
                        <%--</a>--%>
                        <%--&nbsp;&nbsp;--%>
                        <c:set var="secondCheck" value="<%=CheckState.SECONDCHECK.getIndex()%>"/>
                        <%--<c:if test="${family.checkState eq secondCheck }">--%>
                            <a href='printFrame?familyId=${family.id}&${pageInfo.searchParams}'
                               title="打印协议"><i class="fa fa-print"></i>&nbsp;打印协议
                            </a>
                        <%--</c:if>--%>
                        &nbsp;&nbsp;
                        <c:if test="${family.checkState eq secondCheck }">
                            <a href='printJfFrame?familyId=${family.id}&${pageInfo.searchParams}'
                               title="打印交房验收单"><i class="fa fa-print"></i>&nbsp;打印交房验收单
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
    function setSignStatus(familyId) {
        if (confirm("确定要将该家庭设置为已签约状态吗？\r\r注：设置为已签约后将不能撤销！")) {
            $.get("setSignStatus", {familyId: familyId, _date: new Date().getTime()}, function (data) {
                if (data.success == "true") {
                    window.location.reload();
                } else {
                    alert(data.message);
                }
            })
        }
    }

</script>
<%--<script>--%>
<%--function setSignStatus(familyId) {--%>
<%--if (confirm("确定要将该家庭设置为已签约状态吗？")) {--%>
<%--$.get("setSignStatus", {familyId: familyId, _date: new Date().getTime()}, function (data) {--%>
<%--if (data.response == "true") {--%>
<%--window.location.reload();--%>
<%--} else {--%>
<%--alert(data.message);--%>
<%--}--%>
<%--})--%>
<%--}--%>
<%--}--%>
<%--</script>--%>

</html>