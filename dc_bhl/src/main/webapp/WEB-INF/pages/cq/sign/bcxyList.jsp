<%--
  Created by IntelliJ IDEA.
  User: jmdf
  Date: 2018/9/13
  Time: 9:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.app.cq.en.CheckState" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>补偿安置意向书签订</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="title">
    <h5>补偿安置意向书签订</h5>
</div>
<div class="content">
    <div class="search form-inline">
        <div class="search">
            <div class="search_content">
                <form id="search" class="form-search">
                    <div class="form-group">
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
                            <div class="input-group-addon">房屋坐落</div>
                            <tags:searchInput name="f.houseAddress" fieldType="string" operator="like"
                                              className="form-control"/>
                        </div>
                        <div class="input-group input-group-sm">
                            <div class="input-group-addon">房屋产别</div>
                            <tags:searchDataDict name="f.houseType" className="form-control" fieldType="integer"
                                                 dataDict="房屋产别"/>
                        </div>
                        <div class="input-group input-group-sm">
                            <div class="input-group-addon">房屋类型</div>
                            <tags:searchDataDict name="f.houseStyle" className="form-control" fieldType="integer"
                                                 dataDict="房屋类型"/>
                        </div>
                        <div class="input-group input-group-sm">
                            <div class="input-group-addon">签约状态</div>
                            <tags:searchDataDict name="f.signStatus" fieldType="integer" dataDict="签约状态" className="form-control"/>
                        </div>
                        <div class="input-group input-group-sm">
                            <div class="input-group-addon">补偿方式</div>
                            <tags:searchDataDict name="f.bcType" fieldType="integer" dataDict="补偿方式" className="form-control"/>
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
                <th class="text-center">签约状态</th>
                <th class="text-center">补偿安置意向书顺序号</th>
                <th class="text-center">补偿方式</th>
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
                    <td class="text-center"><tags:dataDict dataDict="签约状态" value="${family.signStatus}"/></td>
                    <td class="text-center"><fmt:formatNumber value="${family.signNum}" pattern="000"/></td>
                    <td class="text-center"><tags:dataDict dataDict="补偿方式" value="${family.bcType}"/></td>
                    <td class="text-center">
                        <a href="/cq/sign/bcxyForm?familyId=${family.id}" title="补偿安置意向书签订"><i
                                class="fa fa-edit"></i>&nbsp;补偿安置意向书签订
                        </a>
                        <c:if test="${!empty family.bcType}">
                            <a href="/cq/sign/printBcxyFrame?familyId=${family.id}" title="打印补偿安置意向书"><i
                                    class="fa fa-print"></i>&nbsp;打印补偿安置意向书
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
</script>