<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <title>合同信息备案</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body style="overflow: hidden;">
<div class="title">
    <h4>合同信息备案</h4>
</div>
<div class="content">
    <div class=" doc-content">
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
                <a class="btn btn-primary btn-sm refresh" href="checkList">
                    <i class="fa fa-refresh">&nbsp;刷新</i>
                </a>
            </form>
        </div>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th style="text-align: center;" width="5%">序号</th>
                <th style="text-align: center;">合同编号</th>
                <th style="text-align: center;">产权人姓名</th>
                <th style="text-align: center;">身份证号</th>
                <th style="text-align: center;">项目名称</th>
                <th style="text-align: center;">楼号</th>
                <th style="text-align: center;">单元</th>
                <th style="text-align: center;">房号</th>
                <th style="text-align: center;">合同签订日期</th>
                <th style="text-align: center;">产权比例</th>
                <th style="text-align: center;">数据状态</th>
                <th style="text-align: center;">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${pageInfo.result}" var="contract" varStatus="status">
                <c:if test="${contract.status ne 1}">
                    <tr>
                        <td class="text-center">${status.count}</td>
                        <td class="text-center">${contract.contractCode}</td>
                        <td class="text-center">${contract.name}</td>
                        <td class="text-center">${contract.idCard}</td>
                        <td class="text-center"><tags:dataDict dataDict="项目名称" value="${contract.family.projectName}"/></td>
                        <td class="text-center">${contract.house.buildNum}</td>
                        <td class="text-center">${contract.house.unitNum}</td>
                        <td class="text-center">${contract.house.houseNum}</td>
                        <td class="text-center"><fmt:formatDate value="${contract.signDate}" pattern="yyyy-MM-dd"/></td>
                        <td class="text-center">${contract.propertyRight}</td>
                        <td class="text-center"><tags:dataDict dataDict="合同数据状态" value="${contract.status}"/></td>
                        <td class="text-center">
                            <a href="mainView?contractId=${contract.id}"><i class="fa fa-eye"></i>查看</a>&nbsp;&nbsp;
                            <c:if test="${contract.status ne 3}">
                                <a href="checkForm?contractId=${contract.id}"><i class="fa fa-edit"></i>信息备案管理</a>&nbsp;&nbsp;
                            </c:if>
                        </td>
                    </tr>
                </c:if>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<div class="footer resizeLayout"><tags:pageInfo/></div>
</body>
</html>