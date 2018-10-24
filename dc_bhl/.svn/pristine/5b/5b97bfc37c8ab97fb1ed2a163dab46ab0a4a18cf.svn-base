<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>已选房源列表</title>
    <%@include file="/static/common/common.jsp" %>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>
<body>
<div class="content">
    <ul class="nav nav-tabs">
        <li>
            <a href="list">电子选房管理</a>
        </li>
        <li class="active">
            <a href="choosedHouseList">已选房源列表</a>
        </li>
    </ul>
    <div class="search_content resizeLayout" style="margin-top: 5px;">
        <form class="form-inline" role="form" id="search">
            <div class="input-group input-group-sm">
                <div class="input-group-addon">分指</div>
                <select class='form-control selectBdClass' name="search_eq_string_f.bdCode" id="search_eq_string_f.bdCode">
                    <option value="">-全部-</option>
                </select>
            </div>
            <div class="input-group input-group-sm">
                <div class="input-group-addon">组别</div>
                <select class='form-control selectGroupClass' name="search_eq_string_f.groupCode" id="search_eq_string_f.groupCode">
                    <option value="">-全部-</option>
                </select>
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
                <div class="input-group-addon">身份证号</div>
                <tags:searchInput name="f.idCard" fieldType="string" operator="like"
                                  className="form-control"/>
            </div>
            <div class="input-group input-group-sm">
                <div class="input-group-addon">房屋坐落</div>
                <tags:searchInput name="f.houseAddress" fieldType="string" operator="like"
                                  className="form-control"/>
            </div>
            <button class="btn btn-primary btn-sm" type="submit"><i class="fa fa-search"></i>&nbsp;查询</button>&nbsp;&nbsp;
        </form>
    </div>
    <table class="table table-bordered table-hover table-striped">
        <thead>
        <tr>
            <th rowspan="2">序号</th>
            <th colspan="6">基本信息</th>
            <th colspan="7">选房信息</th>
            <th rowspan="2">选房管理</th>
            <th rowspan="2">打印选房确认单</th>
        </tr>
        <tr>
            <th>家庭编号</th>
            <th>分指</th>
            <th>组别</th>
            <th>被拆迁人</th>
            <th>身份证号</th>
            <th>地址门牌</th>
            <th>项目名称</th>
            <th>楼号</th>
            <th>单元</th>
            <th>房号</th>
            <th>居室</th>
            <th>居室面积/㎡</th>
            <th>选房时间</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach varStatus="status1" var="family" items="${pageInfo.result}">
            <c:forEach varStatus="status2" var="house" items="${houseListMap[family.id]}">
                <c:set var="lenth" value="${houseListMap[family.id].size()}"/>
                <c:if test="${status2.index eq 0}">
                    <td rowspan="${lenth}">${status1.index+1}</td>
                    <td rowspan="${lenth}">${family.familyCode}</td>
                    <td rowspan="${lenth}"><tags:dataDict dataDict="分指" value="${family.bdCode}" /></td>
                    <td rowspan="${lenth}"><tags:dataDict dataDict="组别" value="${family.groupCode}" /></td>
                    <td rowspan="${lenth}">${family.name}</td>
                    <td rowspan="${lenth}">${family.idCard}</td>
                    <td rowspan="${lenth}">${family.address}</td>
                </c:if>
                <td>${house.project.projectName}</td>
                <td>${house.buildNum}</td>
                <td>${house.unitNum}</td>
                <td>${house.houseNum}</td>
                <td><tags:dataDict dataDict="房屋居室" value="${fn:trim(house.houseType)}"/></td>
                <td><fmt:formatNumber value="${house.buildArea}" pattern="##.00"/></td>
                <td><fmt:formatDate value="${house.chooseDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <c:if test="${status2.index eq 0}">
                    <td rowspan="${lenth}">
                        <a href="chooseHouse?familyId=${family.id}"><img src="/static/image/manager.gif"/></a>
                    </td>
                    <td rowspan="${lenth}">
                        <a href="printXfResultFrame?familyId=${family.id}"><i class="fa fa-print"></i>打印选房确认单</a>
                    </td>
                    <%--<td rowspan="${lenth}">--%>
                        <%--<a href="printChange?familyId=${family.id}"><i class="fa fa-print"></i>产权人确认申请</a>--%>
                    <%--</td>--%>
                    <%--<td rowspan="${lenth}">--%>
                        <%--<a href="printBuChongFrame?familyId=${family.id}"><i class="fa fa-print"></i>安置协议</a>--%>
                    <%--</td>--%>
                </c:if>
                </tr>
            </c:forEach>
        </c:forEach>
        </tbody>
    </table>
</div>
<div class="footer resizeLayout">
    <tags:pageInfo></tags:pageInfo>
</div>
</body>
</html>
<script>
    $(document).ready(function () {
        $(".selectBdClass").empty();
        var option = "<option value=''>-全部-</option>";
        $(".selectBdClass").append(option);
        $.ajax({
            url: "/cq/family/rh/getBdList",
            type: "post",
            success: function (data) {
                for (var i = 0;i<data.length;i++){
                    var bdCode = data[i];
                    var options = "<option value='"+ bdCode + "' >" + bdCode + "分指</option>";
                    $(".selectBdClass").append(options);
                }
            }
        })
    });
    $(".selectBdClass").change(function () {
        $(".selectGroupClass").empty();
        var option = "<option value=''>-全部-</option>";
        $(".selectGroupClass").append(option);
        var bdCode = $(this).val();
        $.ajax({
            url: "/cq/family/rh/getGroupByArea",
            type: "post",
            data: {bdCode:bdCode},
            success: function (data) {
                for (var i = 0;i<data.length;i++){
                    var groupCode = data[i];
                    var options = "<option value='"+ groupCode + "' >" + groupCode + "组</option>";
                    $(".selectGroupClass").append(options);
                }
            }
        })
    });
</script>
