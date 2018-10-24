<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                <%@include file="/WEB-INF/pages/cq/common/mainHead/mainHead.jsp"%>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">是否有标准自建</div>
                    <tags:searchDataDict name="f.houseStatus" fieldType="integer" dataDict="是否" className="form-control"/>
                </div>
                <button type="submit" class="btn btn-primary btn-sm"><i class="fa fa-search"></i>&nbsp;查询</button>
                <button type="button" class="btn btn-primary btn-sm" onclick="location.href='form'"><i class="glyphicon glyphicon-plus"></i>&nbsp;登记</button>
                <%--<a href="/cq/family/rh/innerExcelIndex" class="btn btn-primary btn-sm"><i class="fa fa-file-excel-o"></i>批量导入数据</a>--%>
                <%--<a href="/cq/family/rh/innerExcelIndex1" class="btn btn-primary btn-sm"><i class="fa fa-file-excel-o"></i>批量导入家庭成员数据</a>--%>
            </div>
        </form>
    </div>
    <table class="table table-bordered table-hover">
        <thead>
        <tr>
            <th class="text-center" width="3%">序号</th>
            <th class="text-center">分指</th>
            <th class="text-center">组别</th>
            <th class="text-center">家庭编号</th>
            <th class="text-center">被拆迁人</th>
            <th class="text-center">地址门牌</th>
            <th class="text-center">房屋产别</th>
            <th class="text-center">房屋类型</th>
            <th class="text-center">建筑面积/㎡</th>
            <th class="text-center">是否有标准自建</th>
            <th class="text-center">数据锁定状态</th>
            <th class="text-center">审计初审状态</th>
            <th class="text-center">标准自建房登记</th>
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
                <td class="text-center"><tags:dataDict dataDict="是否" value="${family.houseStatus}"/></td>
                <td class="text-left"><tags:dataDict dataDict="锁定状态" value="${family.sureStatus}"/></td>
                <td class="text-center"><tags:dataDict dataDict="初审状态" value="${family.firstCheckStatus}"/></td>
                <td class="text-center">
                        <%--初审退回或者初审未审核并且数据未锁定，才能够修改数据--%>
                    <c:if test="${(family.firstCheckStatus eq 1 and family.sureStatus eq 1) or family.firstCheckStatus eq 0 }">
                        <c:if test="${family.houseStatus eq 1}">
                            <a href="familyHouseForm?familyId=${family.id}&${pageInfo.searchParams}"><i class="fa fa-big fa-edit"></i>&nbsp;标准自建房登记</a>&nbsp;&nbsp;
                        </c:if>
                    </c:if>
                </td>
                <td class="text-center">
                    <a href="/cq/family/common/view/main?familyId=${family.id}"><i class="fa fa-big fa-eye"></i>&nbsp;查看</a>&nbsp;&nbsp;
                    <%--初审退回或者初审未审核并且数据未锁定，才能够修改数据--%>
                    <c:if test="${(family.firstCheckStatus eq 1 and family.sureStatus eq 1) or family.firstCheckStatus eq 0 }">
                        <a href="form?familyId=${family.id}&${pageInfo.searchParams}"><i class="fa fa-big fa-edit"></i>&nbsp;修改</a>&nbsp;&nbsp;
                        <c:if test="${family.sureStatus eq 1 or family.firstCheckStatus eq 1}">
                            <a href="/cq/family/rh/dataSureList?familyId=${family.id}"><i class="fa fa-big fa-eye"></i>&nbsp;数据锁定</a>&nbsp;&nbsp;
                        </c:if>
                    </c:if>
                    <c:if test="${family.sureStatus eq 2 and (family.firstCheckStatus eq 1 or family.firstCheckStatus eq 0)}">
                        <a href="javaScript:cancleData('${family.id}')"><i class="fa fa-close"></i>&nbsp;数据锁定撤回</a>&nbsp;&nbsp;
                    </c:if>
                    <c:if test="${(family.firstCheckStatus eq 1 and family.sureStatus eq 1) or family.firstCheckStatus eq 0 }">
                        <a href="javascript:familyModal('${family.id}','${family.familyCode}','${family.name}','${family.address}','${family.buildArea}')"><i class="fa fa-big fa-trash"></i>&nbsp;删除</a>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<div class="footer resizeLayout"><tags:pageInfo/></div>
<div class="modal fade" id="familyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 800px;height: 800px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">锁定信息后点击【删除】即可</h4>
            </div>
            <div class="modal-body" id="modalBody">
                <input type="hidden" name="familyId"/>
                <table class="table table-bordered">
                    <tr>
                        <td class="fieldName">编号:</td>
                        <td class="fieldValue"><span id="familyCode"></span></td>
                    </tr>
                    <tr>
                        <td class="fieldName">被拆迁人:</td>
                        <td class="fieldValue"><span id="name"></span></td>
                    </tr>
                    <tr>
                        <td class="fieldName">地址门牌:</td>
                        <td class="fieldValue"><span id="address"></span></td>
                    </tr>
                    <tr>
                        <td class="fieldName">建筑面积(㎡):</td>
                        <td class="fieldValue"><span id="buildArea"></span></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: left;font-size: 20px;color: red;"><span id="warnError"></span></td>
                    </tr>
                </table>
                <center>
                    <button class="btn btn-primary" type="button" onclick="javascript:deleteFamily()">删除</button>
                    &nbsp;&nbsp;&nbsp;
                    <button class="btn btn-danger" data-dismiss="modal">取消</button>
                </center>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    function familyModal(familyId,familyCode,name,address,buildArea) {
        $("input:hidden[name='familyId']").val(familyId);
        $("#familyCode").html(familyCode);
        $("#name").html(name);
        $("#address").html(address);
        $("#buildArea").html(buildArea);
        $("#warnError").html("确定信息无误后，点击删除即可！");
        $("#familyModal").modal();
    }

    function deleteFamily() {
        var familyId = $("input:hidden[name='familyId']").val();
        $.ajax({
            url: "deleteFamily",
            type: "post",
            data: {familyId:familyId},
            success: function (data) {
                if (data.success == "true") {
                    window.location.reload();
                }else {
                    $("#warnError").html(data.message);
                }
            }
        })
    }
    function cancleData(familyId) {
        if (confirm("确认拆迁数据撤销锁定吗？\n撤销锁定后拆迁数据将可以修改！")) {
            $.get("cancleData", {familyId: familyId,type:"cc"}, function (data) {
                window.location.href = "list?<tags:searchParams/>";
            })
        }
    }
</script>
</html>