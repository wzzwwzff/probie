<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>非宅数据管理</title>
    <%@include file="/static/common/common.jsp"%>
</head>
<body>
<div class="title">
    <h5>非宅数据管理</h5>
</div>
<div class="content">
    <div class="search_content resizeLayout">
        <form class="form-inline" role="form" id="search">
            <div class="form-group">
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">分指</div>
                    <tags:searchDataDict name="f.bdCode" fieldType="string" dataDict="分指" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">组别</div>
                    <tags:searchDataDict name="f.groupCode" fieldType="string" dataDict="组别" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">编号</div>
                    <tags:searchInput name="f.familyCode" fieldType="string" operator="like" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">房屋地址门牌</div>
                    <tags:searchInput name="f.address" fieldType="string" size="30" operator="like" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">产权单位名称</div>
                    <tags:searchInput name="f.unitName" fieldType="string" size="30" operator="like" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">单位联系人</div>
                    <tags:searchInput name="f.unitNum" fieldType="string" operator="like" className="form-control"/>
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
                <th class="text-center">分指</th>
                <th class="text-center">组别</th>
                <th class="text-center">编号</th>
                <th class="text-center">房屋地址门牌</th>
                <th class="text-center">产权单位名称</th>
                <th class="text-center">单位联系人</th>
                <th class="text-center">房屋总建筑面积/㎡</th>
                <th width="15%" class="text-center">操作</th>
            </tr>
            </thead>
            <c:forEach items="${pageInfo.result}" var="nonFamily" varStatus="status">
            <tr>
                <td class="text-center">${status.count+(pageInfo.pageNo-1)*pageInfo.pageSize}</td>
                <td class="text-center"><tags:dataDict dataDict="分指" value="${nonFamily.bdCode}"/></td>
                <td class="text-center"><tags:dataDict dataDict="组别" value="${nonFamily.groupCode}"/></td>
                <td class="text-center">${nonFamily.familyCode}</td>
                <td class="text-center">${nonFamily.address}</td>
                <td class="text-center">${nonFamily.unitName}</td>
                <td class="text-left">${nonFamily.unitMan}</td>
                <td class="text-center">${nonFamily.houseTotalArea}</td>
                <td class="text-center">
                    <a href="view?nonFamilyId=${nonFamily.id}"><i class="fa fa-big fa-eye"></i> 查看</a>&nbsp;&nbsp;
                    <a href="form?nonFamilyId=${nonFamily.id}&${pageInfo.searchParams}"><i class="fa fa-big fa-edit"></i> 修改</a>&nbsp;&nbsp;
                    <a href="javascript:nonFamilyModal('${nonFamily.id}','${nonFamily.familyCode}','${nonFamily.unitName}','${nonFamily.address}','${nonFamily.houseTotalArea}')"><i class="fa fa-big fa-trash"></i> 删除</a>
                </td>
            </tr>
            </c:forEach>
        </table>
</div>
<div class="footer resizeLayout"><tags:pageInfo/></div>
<div class="modal fade" id="nonFamilyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 800px;height: 800px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">确认信息后点击【删除】即可</h4>
            </div>
            <div class="modal-body" id="modalBody">
                <input type="hidden" name="nonFamilyId"/>
                <table class="table table-bordered">
                    <tr>
                        <td class="fieldName">编号:</td>
                        <td class="fieldValue"><span id="familyCode"></span></td>
                    </tr>
                    <tr>
                        <td class="fieldName">房屋产权单位名称（全称）:</td>
                        <td class="fieldValue"><span id="unitName"></span></td>
                    </tr>
                    <tr>
                        <td class="fieldName">房屋地址门牌:</td>
                        <td class="fieldValue"><span id="address"></span></td>
                    </tr>
                    <tr>
                        <td class="fieldName">房屋总建筑面积(㎡):</td>
                        <td class="fieldValue"><span id="houseTotalArea"></span></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: left;font-size: 20px;color: red;"><span id="warnError"></span></td>
                    </tr>
                </table>
                <center>
                    <button class="btn btn-primary" type="button" onclick="javascript:deleteNonFamily()">删除</button>
                    &nbsp;&nbsp;&nbsp;
                    <button class="btn btn-danger" data-dismiss="modal">取消</button>
                </center>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    function nonFamilyModal(nonFamilyId,familyCode,unitName,address,houseTotalArea) {
        $("input:hidden[name='nonFamilyId']").val(nonFamilyId);
        $("#familyCode").html(familyCode);
        $("#unitName").html(unitName);
        $("#address").html(address);
        $("#houseTotalArea").html(houseTotalArea);
        $("#warnError").html("确定信息无误后，点击删除即可！");
        $("#nonFamilyModal").modal();
    }

    function deleteNonFamily() {
        var nonFamilyId = $("input:hidden[name='nonFamilyId']").val();
        $.ajax({
            url: "deleteNonFamily",
            type: "post",
            data: {nonFamilyId:nonFamilyId},
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