<%--
  Created by IntelliJ IDEA.
  User: jmdf
  Date: 2018/8/3
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>选房顺序管理列表</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="title">
    <h5>选房顺序管理列表</h5>
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
                            <div class="input-group-addon">交房顺序号</div>
                            <tags:searchInput name="f.jfNumber" fieldType="integer" operator="eq"
                                              className="form-control"/>
                        </div>
                        <div class="input-group input-group-sm">
                            <div class="input-group-addon">上报状态</div>
                            <tags:searchDataDict className="form-control" name="f.cqState" fieldType="integer"
                                                 dataDict="上报状态"/>
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
                <th class="text-center">交房顺序号</th>
                <th class="text-center">安置人口</th>
                <th class="text-center">第一轮<br/>选房顺序</th>
                <th class="text-center">第二轮<br/>选房顺序</th>
                <th class="text-center">第三轮<br/>选房顺序</th>
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
                    <td class="text-center">${family.jfNumber}</td>
                    <td class="text-center">${family.personNum}</td>
                    <td class="text-center">${family.firstXFNum}</td>
                    <td class="text-center">${family.secondXFNum}</td>
                    <td class="text-center">${family.thirdXFNum}</td>
                    <td class="text-center">
                        <a
                                href='/cq/common/view/main?familyId=${family.id}'
                                title="查看"><i
                                class="fa fa-eye"></i>&nbsp;查看
                        </a>&nbsp;&nbsp;
                        <a href='xfForm?familyId=${family.id}&<tags:searchParams/>'
                           title="修改"><i class="fa fa-edit"></i>&nbsp;修改
                        </a>&nbsp;&nbsp;
                    </td>
                </tr>
            </c:forEach>
        </table>
        <tags:pageInfo/>
    </div>
</div>
</body>
</html>