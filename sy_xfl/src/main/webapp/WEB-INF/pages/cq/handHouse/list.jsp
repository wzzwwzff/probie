<%@ page import="com.app.cq.en.CheckState" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>交房管理列表</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="title">
    <h5>交房管理列表</h5>
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
                            <div class="input-group-addon">交房状态</div>
                            <tags:searchDataDict name="jfState" className="form-control" fieldType="integer"
                                                 dataDict="交房状态"/>
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
                <th class="text-center">交房顺序号</th>
                <th class="text-center">交房状态</th>
                <th class="text-center">交房日期</th>
                <th width="15%" class="text-center">操作</th>
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
                    <td class="text-center"><fmt:formatNumber value="${family.jfNumber}" pattern="000"/></td>
                    <td class="text-center"><tags:dataDict dataDict="交房状态" value="${family.jfState}"/></td>
                    <td class="text-center">
                        <fmt:formatDate value="${family.jfDate}" pattern="yyyy-MM-dd"/>
                    </td>
                    <td class="text-center">
                        <a href='/cq/common/view/main?familyId=${family.id}'
                           title="查看"><i
                                class="fa fa-eye"></i>&nbsp;查看
                        </a>&nbsp;&nbsp;
                        <a href='form?familyId=${family.id}&<tags:searchParams></tags:searchParams>'
                           title="修改"><i class="fa fa-edit"></i>&nbsp;修改
                        </a>&nbsp;&nbsp;
                        <c:if test="${family.jfState eq 2}">
                            <a href='printJfjgFrame?familyId=${family.id}&<tags:searchParams></tags:searchParams>'
                               title="交房结果单"><i class="fa fa-print"></i>&nbsp;交房结果单
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
</html>