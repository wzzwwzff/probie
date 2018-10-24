<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>合同信息列表</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="content">
    <ul class="nav nav-tabs">
        <li>
            <a href="start">合同登记入口</a>
        </li>
        <li class="active">
            <a href="list">合同信息列表</a>
        </li>
    </ul>
    <div class="search_content resizeLayout" style="margin-top: 5px;">
        <form class="form-inline" role="form" id="search">
            <div class="form-group">
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">项目名称</div>
                    <tags:searchDataDict name="f.projectName" className="form-control" fieldType="string" dataDict="项目名称"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">合同编号</div>
                    <tags:searchInput name="c.contractCode" className="form-control" fieldType="string" operator="like"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">产权人姓名</div>
                    <tags:searchInput name="c.name" className="form-control" fieldType="string" operator="like"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">身份证号</div>
                    <tags:searchInput name="c.idCard" className="form-control" fieldType="string" operator="like"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">合同签订日期</div>
                    <tags:searchInput name="c.signDate" fieldType="date" operator="ge" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">至</div>
                    <tags:searchInput name="c.signDate" fieldType="date" operator="lt" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">数据状态</div>
                    <tags:searchDataDict name="c.status" className="form-control" fieldType="integer" dataDict="合同数据状态"/>
                </div>
            </div>
            <button type="submit" class="btn btn-primary btn-sm"><i class="fa fa-search"></i>&nbsp;查询</button>&nbsp;&nbsp;
            <a href="plContract" class="btn btn-primary btn-sm"><i class="fa fa-file-excel-o"></i> 批量导入数据</a>
        </form>
    </div>
    <table class="table table-bordered table-hover table-striped">
        <thead>
        <tr>
            <th class="text-center" width="5%">序号</th>
            <th class="text-center">合同编号</th>
            <th class="text-center">产权人</th>
            <th class="text-center">身份证号</th>
            <th class="text-center">项目名称</th>
            <th class="text-center">楼号</th>
            <th class="text-center">单元</th>
            <th class="text-center">房号</th>
            <th class="text-center">建筑面积(㎡)</th>
            <th class="text-center">合同签订日期</th>
            <th class="text-center">产权比例</th>
            <th class="text-center">数据状态</th>
            <th class="text-center">操作</th>
        </tr>
        </thead>
        <c:forEach items="${pageInfo.result}" var="contract" varStatus="status">
            <tr>
                <td class="text-center">${status.count}</td>
                <td class="text-center">${contract.contractCode}</td>
                <td class="text-center">${contract.name}</td>
                <td class="text-center">${contract.idCard}</td>
                <td class="text-center"><tags:dataDict dataDict="项目名称" value="${contract.family.projectName}"/></td>
                <td class="text-center">${contract.house.buildNum}</td>
                <td class="text-center">${contract.house.unitNum}</td>
                <td class="text-center">${contract.house.houseNum}</td>
                <td class="text-center">${contract.house.buildArea}</td>
                <td class="text-center"><fmt:formatDate value="${contract.signDate}" pattern="yyyy-MM-dd"/></td>
                <td class="text-center">${contract.propertyRight}</td>
                <td class="text-center"><tags:dataDict dataDict="合同数据状态" value="${contract.status}"/></td>
                <td class="text-center">
                    <c:if test="${contract.status eq 1}">
                        <a href="view?contractId=${contract.id}"><i class="fa fa-eye"></i>查看</a>&nbsp;&nbsp;
                        <a href="form?contractId=${contract.id}&familyId=${contract.family.id}"><i class="fa fa-edit"></i>修改</a>&nbsp;&nbsp;
                        <a href="javaScript:deleteRow('delete?contractId=${contract.id}&houseId=${contract.house.id}')" style="color: #cc5965"
                           title="删除"><i class="fa fa-delicious"></i>&nbsp;删除</a>&nbsp;&nbsp;
                        <a href='contractReport?contractId=${contract.id}' style="color: #00B83F"><i class="fa fa-edit"></i>&nbsp;上报</a>
                    </c:if>
                    <c:if test="${contract.status eq 2}">
                        <a href="view?contractId=${contract.id}"><i class="fa fa-eye"></i>查看</a>
                        <a href="javaScript:cancelCheck('${contract.id}')" title="撤销上报"><i class="fa fa-close"></i>&nbsp;撤销上报</a>
                    </c:if>
                    <c:if test="${contract.status eq 3}">
                        <a href="view?contractId=${contract.id}"><i class="fa fa-eye"></i>查看</a>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<div class="footer resizeLayout"><tags:pageInfo/></div>
</body>
<script>
    //撤销上报
    function cancelCheck(contractId) {
        if (confirm("确认撤销复核上报吗？\n撤销后数据将可以修改！")) {
            $.get("cancelCheck", {contractId: contractId}, function (data) {
                if (data.code == "1111") {
                    location.reload();
                } else {
                    alert(data.message);
                }
            })
        }
    }
</script>
</html>