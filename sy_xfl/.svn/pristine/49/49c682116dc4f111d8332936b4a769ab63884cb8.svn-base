<%@ page import="com.app.cq.en.CheckState" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>补充协议签约管理列表</title>
    <%@include file="/static/common/common.jsp"%>
</head>
<body>
<div class="title">
    <h5>补充协议签约管理列表</h5>
</div>
<div class="content">
    <div class="search form-inline" >
        <div class="search">
            <div class="search_content">
                <form id="search" class="form-search">
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
                            <div class="input-group-addon">签约状态</div>
                            <tags:searchDataDict name="bcxyState" className="form-control" fieldType="integer" dataDict="签约状态"/>
                        </div>
                        <div class="input-group input-group-sm">
                            <div class="input-group-addon">安置类型</div>
                            <tags:searchDataDict name="type" className="form-control" fieldType="integer" dataDict="安置类型"/>
                        </div>
                        <div class="input-group input-group-sm">
                            <div class="input-group-addon">签约时间</div>
                            <tags:searchInput name="f.bcxyDate" fieldType="date" operator="ge" className="form-control"/>
                        </div>
                        <div class="input-group input-group-sm">
                            <div class="input-group-addon">至</div>
                        <tags:searchInput name="f.bcxyDate" fieldType="date" operator="lt" className="form-control"/>
                        </div>
                        <button type="submit" class="btn btn-primary btn-sm"><i class="fa fa-search"></i>&nbsp;查询</button>
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
                <th class="text-center">签约时间</th>
                <th width="8%" class="text-center">操作</th>
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
                <td class="text-center"><tags:dataDict dataDict="签约状态" value="${family.bcxyState}"/></td>
                <td class="text-center"><fmt:formatDate value="${family.bcxyDate}" pattern="yyyy-MM-dd"/> </td>
                <td class="text-center">
                    <c:if test="${family.qyState eq 2 && family.bcxyState ne 2}">
                        <a href="javascript:setBcxyStatus('${family.id}')" title="设置为已签约"><i
                                class="fa fa-edit"></i>&nbsp;设置为已签约
                        </a>
                    </c:if>
                    <c:if test="${family.bcxyState eq 2}">
                        <a href="javascript:cancelBcxyStatus('${family.id}')" title="撤销已签约"><i
                                class="fa fa-close"></i>&nbsp;撤销已签约
                        </a>
                    </c:if>
                </td>
            </tr>
            </c:forEach>
        </table>
        <tags:pageInfo/>
    </div>
</div>

<script>
    function setBcxyStatus(familyId) {
        if (confirm("确定要将该家庭补充协议设置为已签约状态吗？")) {
            $.get("setBcxyStatus", {familyId: familyId, _date: new Date().getTime()}, function (data) {
                if (data.code == "0000") {
                    window.location.reload();
                } else {
                    alert(data.message);
                }
            })
        }
    }
    function cancelBcxyStatus(familyId) {
        if (confirm("确定要撤销该家庭补充协议已签约状态吗？")) {
            $.get("cancelBcxyStatus", {familyId: familyId, _date: new Date().getTime()}, function (data) {
                if (data.code == "0000") {
                    window.location.reload();
                } else {
                    alert(data.message);
                }
            })
        }
    }
</script>
</body>
</html>