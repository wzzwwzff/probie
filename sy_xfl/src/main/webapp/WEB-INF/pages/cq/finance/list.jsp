<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>财务结算管理列表</title>
    <%@include file="/static/common/common.jsp"%>
</head>
<body>
<div>
    <div class="title">
        <h5> 财务结算管理列表</h5>
    </div>
</div>
<div class="content">
    <div class="search form-inline" style="margin-top: 8px;">
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
                            <div class="input-group-addon">结算状态</div>
                            <tags:searchDataDict name="jsState" className="form-control" fieldType="integer" dataDict="结算状态"/>
                        </div>
                        <button type="submit" class="btn btn-primary btn-sm"><i class="fa fa-search"></i>&nbsp;查询</button>
                    </div>
                </form>
            </div>
        </div>
        <table class="table table-bordered table-hover">
            <thead>
            <tr>
                <th class="text-center" width="5%">序号</th>
                <th class="text-center">编号</th>
                <th class="text-center">组别</th>
                <th class="text-center">姓名</th>
                <th class="text-center">房屋坐落</th>
                <th class="text-center">结算状态</th>
                <th class="text-center">结算操作日期</th>
                <th width="15%" class="text-center">操作</th>
            </tr>
            </thead>
            <c:forEach items="${pageInfo.result}" var="family" varStatus="status">
                    <tr>
                        <td style="vertical-align: middle" class="text-center">${status.count}</td>
                        <td style="vertical-align: middle" class="text-center">${family.familyCode}</td>
                        <td style="vertical-align: middle" class="text-center"><tags:dataDict dataDict="组别" value="${family.groupCode}"/></td>
                        <td style="vertical-align: middle" class="text-center">${family.name}</td>
                        <td style="vertical-align: middle" class="text-left">${family.houseAddress}</td>
                        <td class="text-center">
                            <tags:dataDict dataDict="结算状态" value="${family.jsState}"/>
                        </td>
                        <td class="text-center">
                            <fmt:formatDate value="${family.jsDate}" pattern="yyyy-MM-dd"/>
                        </td>
                        <td style="vertical-align: middle" class="text-center">
                            <c:if test="${family.jsState ne 2}">
                            <a href="javaScript:setJsState('${family.id}')"
                                    title="设置为已结算"><i class="fa fa-edit"></i>&nbsp;设置为已结算
                            </a>
                            </c:if>
                            <c:if test="${family.jsState eq 2}">
                                <a href="javaScript:cancelJsState('${family.id}')"
                                   title="撤销已结算"><i class="fa fa-close"></i>&nbsp;撤销已结算
                                </a>
                                <a href="financePrint?familyId=${family.id}"
                                   title="打印会签单"><i class="fa fa-print"></i>&nbsp;打印会签单
                                </a>
                            </c:if>
                        </td>
                    </tr>
            </c:forEach>
        </table>
    </div>
</div>
<div >
    <tags:pageInfo/>
</div>
<script>

    function setJsState(familyId){
        var url = "setJsState?familyId=" + familyId;
        if (confirm("确认设置为已结算吗？")) {
            $.get(url, function (data) {
                if (data.code == '0000') {
                    location.reload();
                } else {
                    alert(data.message);
                }
            });
        }
    }


    function cancelJsState(familyId){
        var url = "cancelJsState?familyId=" + familyId;
        if (confirm("确认撤销已结算状态吗？")) {
            $.get(url, function (data) {
                if (data.code == '0000') {
                    location.reload();
                } else {
                    alert(data.message);
                }
            });
        }
    }

</script>
</body>
</html>