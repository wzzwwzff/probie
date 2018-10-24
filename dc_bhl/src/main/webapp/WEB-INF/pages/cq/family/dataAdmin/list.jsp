<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>住宅数据管理</title>
    <%@include file="/static/common/common.jsp"%>
</head>
<body>
<div class="title">
    <h5>住宅数据管理</h5>
</div>
<div class="content">
    <div class="search_content resizeLayout">
        <form class="form-inline" role="form" id="search">
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
                    <div class="input-group-addon">是否有效</div>
                    <tags:searchDataDict name="f.isValid" fieldType="integer" dataDict="是否" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">家庭编号</div>
                    <tags:searchInput name="f.familyCode" fieldType="string" operator="like" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">被拆迁人</div>
                    <tags:searchInput name="f.name" fieldType="string" operator="like" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">地址门牌</div>
                    <tags:searchInput name="f.address" fieldType="string" operator="like" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">房屋产别</div>
                    <tags:searchDataDict name="f.houseType" fieldType="integer" dataDict="房屋产别" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">房屋类型</div>
                    <tags:searchDataDict name="f.houseStyle" fieldType="integer" dataDict="房屋类型" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">数据确认状态</div>
                    <tags:searchDataDict name="f.sureStatus" fieldType="integer" dataDict="确认状态" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">审计初审状态</div>
                    <tags:searchDataDict name="f.firstCheckStatus" fieldType="integer" dataDict="初审状态" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">是否有标准自建</div>
                    <tags:searchDataDict name="f.houseStatus" fieldType="integer" dataDict="是否" className="form-control"/>
                </div>
                <button type="submit" class="btn btn-primary btn-sm"><i class="fa fa-search"></i>&nbsp;查询</button>
            </div>
        </form>
    </div>
    <table class="table table-bordered table-hover">
        <thead>
        <tr>
            <th class="text-center" width="5%">序号</th>
            <th class="text-center">是否有效</th>
            <th class="text-center">分指</th>
            <th class="text-center">组别</th>
            <th class="text-center">家庭编号</th>
            <th class="text-center">被拆迁人</th>
            <th class="text-center">地址门牌</th>
            <th class="text-center">房屋产别</th>
            <th class="text-center">房屋类型</th>
            <th class="text-center">建筑面积/㎡</th>
            <th class="text-center">是否有标准自建</th>
            <th class="text-center">数据确认状态</th>
            <th class="text-center">审计初审状态</th>
            <th class="text-center">标准自建房登记</th>
            <th width="13%" class="text-center">操作</th>
        </tr>
        </thead>
        <c:forEach items="${pageInfo.result}" var="family" varStatus="status">
            <tr>
                <td class="text-center">${status.count+(pageInfo.pageNo-1)*pageInfo.pageSize}</td>
                <td class="text-center"><tags:dataDict dataDict="是否" value="${family.isValid}"/></td>
                <td class="text-center"><tags:dataDict dataDict="分指" value="${family.bdCode}"/></td>
                <td class="text-center"><tags:dataDict dataDict="组别" value="${family.groupCode}"/></td>
                <td class="text-center">${family.familyCode}</td>
                <td class="text-center">${family.name}</td>
                <td class="text-center">${family.address}</td>
                <td class="text-center"><tags:dataDict dataDict="房屋产别" value="${family.houseType}"/></td>
                <td class="text-center"><tags:dataDict dataDict="房屋类型" value="${family.houseStyle}"/></td>
                <td class="text-center">${family.buildArea}</td>
                <td class="text-center"><tags:dataDict dataDict="是否" value="${family.houseStatus}"/></td>
                <td class="text-left"><tags:dataDict dataDict="确认状态" value="${family.sureStatus}"/></td>
                <td class="text-center"><tags:dataDict dataDict="初审状态" value="${family.firstCheckStatus}"/></td>
                <td class="text-center">
                    <c:if test="${family.isValid eq 1 and family.houseStatus eq 1}">
                        <a href="familyHouseForm?familyId=${family.id}&${pageInfo.searchParams}"><i class="fa fa-big fa-edit"></i>&nbsp;标准自建房登记</a>
                    </c:if>
                </td>
                <td class="text-center">
                    <a href="/cq/family/common/view/main?familyId=${family.id}"><i class="fa fa-big fa-eye"></i>&nbsp;查看</a>&nbsp;&nbsp;
                    <a href="form?familyId=${family.id}&${pageInfo.searchParams}"><i class="fa fa-big fa-edit"></i>&nbsp;修改</a>&nbsp;&nbsp;
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<div class="footer resizeLayout"><tags:pageInfo/></div>
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