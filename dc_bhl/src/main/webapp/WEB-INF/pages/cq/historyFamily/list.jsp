<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>历史签约管理</title>
    <%@include file="/static/common/common.jsp"%>
</head>
<body>
<div class="title">
    <h5>历史签约管理</h5>
</div>
<div class="content">
    <div class="search_content resizeLayout">
        <form class="form-inline" role="form" id="search">
            <div class="form-group">
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">编号</div>
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
                <button type="submit" class="btn btn-primary btn-sm"><i class="fa fa-search"></i>&nbsp;查询</button>
                <button type="button" class="btn btn-primary btn-sm" onclick="location.href='form'"><i class="glyphicon glyphicon-plus"></i>&nbsp;登记</button>
                <button type="button" class="btn btn-primary btn-sm" onclick="location.href='export'"><i class="glyphicon glyphicon-export"></i>&nbsp;导出</button>
            </div>
        </form>
    </div>
    <table class="table table-bordered table-hover">
        <thead>
        <tr>
            <th class="text-center" width="5%">序号</th>
            <th class="text-center">家庭编号</th>
            <th class="text-center">被拆迁人</th>
            <th class="text-center">地址门牌</th>
            <th class="text-center">房屋产别</th>
            <th class="text-center">房屋类型</th>
            <th class="text-center">建筑面积/㎡</th>
            <th width="20%" class="text-center">操作</th>
        </tr>
        </thead>
        <c:forEach items="${pageInfo.result}" var="historyFamily" varStatus="status">
            <tr>
                <td class="text-center">${status.count+(pageInfo.pageNo-1)*pageInfo.pageSize}</td>
                <td class="text-center">${historyFamily.familyCode}</td>
                <td class="text-center">${historyFamily.name}</td>
                <td class="text-center">${historyFamily.address}</td>
                <td class="text-center"><tags:dataDict dataDict="房屋产别" value="${historyFamily.houseType}"/></td>
                <td class="text-center"><tags:dataDict dataDict="房屋类型" value="${historyFamily.houseStyle}"/></td>
                <td class="text-center">${historyFamily.buildArea}</td>
                <td class="text-center">
                    <a href="view?historyFamilyId=${historyFamily.id}"><i class="fa fa-big fa-eye"></i>&nbsp;查看</a>&nbsp;&nbsp;
                    <a href="form?historyFamilyId=${historyFamily.id}&${pageInfo.searchParams}"><i class="fa fa-big fa-edit"></i>&nbsp;修改</a>&nbsp;&nbsp;
                    <a href="javascript:historyFamilyModal('${historyFamily.id}','${historyFamily.familyCode}','${historyFamily.name}','${historyFamily.address}','${historyFamily.buildArea}')"><i class="fa fa-big fa-trash"></i>&nbsp;删除</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<div class="footer resizeLayout"><tags:pageInfo/></div>
<div class="modal fade" id="historyFamilyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 800px;height: 800px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">确认信息后点击【删除】即可</h4>
            </div>
            <div class="modal-body" id="modalBody">
                <input type="hidden" name="historyFamilyId"/>
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
                    <button class="btn btn-primary" type="button" onclick="javascript:deleteHistoryFamily()">删除</button>
                    &nbsp;&nbsp;&nbsp;
                    <button class="btn btn-danger" data-dismiss="modal">取消</button>
                </center>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    function historyFamilyModal(historyFamilyId,familyCode,name,address,buildArea) {
        $("input:hidden[name='historyFamilyId']").val(historyFamilyId);
        $("#familyCode").html(familyCode);
        $("#name").html(name);
        $("#address").html(address);
        $("#buildArea").html(buildArea);
        $("#warnError").html("确定信息无误后，点击删除即可！");
        $("#historyFamilyModal").modal();
    }

    function deleteHistoryFamily() {
        var historyFamilyId = $("input:hidden[name='historyFamilyId']").val();
        $.ajax({
            url: "deleteHistoryFamily",
            type: "post",
            data: {historyFamilyId:historyFamilyId},
            success: function (data) {
                if (data.success == "true") {
                    window.location.reload();
                }else {
                    $("#warnError").html(data.message);
                }
            }
        })
    }
</script>
</html>