<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>上传图片查看列表</title>
    <%@include file="/static/common/common.jsp" %>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>
<body>
<div class="title resizeLayout"><h4>已上传照片家庭列表【<label class="require">点击图片可查看大图</label>】</h4></div>
<div class="content">
    <div class="search_content resizeLayout">
        <form class="form-inline" role="form" id="search">
            <div class="form-group">
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
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">签约状态</div>
                    <tags:searchDataDict name="f.signStatus" fieldType="integer" dataDict="签约状态" className="form-control"/>
                </div>
            </div>
            <div class="form-group">
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">被征收人</div>
                    <tags:searchInput name="f.name" fieldType="string" operator="like" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">地址门牌</div>
                    <tags:searchInput name="f.houseLocation" fieldType="string" operator="like" className="form-control"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">签约顺序号</div>
                    <tags:searchInput name="f.signNum" fieldType="integer" operator="eq" className="form-control"/>
                </div>
                <button type="submit" class="btn btn-primary btn-sm"><i class="fa fa-search"></i>&nbsp;查询</button>
            </div>
        </form>
    </div>
        <table class="table table-bordered table-hover table-striped">
            <thead>
            <tr>
                <th width="5%">序号</th>
                <th style="cursor: pointer" <tags:sort name="bdCode"/>>分指</th>
                <th style="cursor: pointer" <tags:sort name="groupCode"/>>组别</th>
                <th style="cursor: pointer" <tags:sort name="address"/>>地址门牌号</th>
                <th style="cursor: pointer" <tags:sort name="name"/>>被征收人</th>
                <th style="cursor: pointer" <tags:sort name="buildArea"/>>建筑面积（㎡）</th>
                <th>签约顺序号</th>
                <th style="cursor: pointer" <tags:sort name="signStatus"/>>签约状态</th>
                <th class="text-center">补偿方式</th>
                <th class="text-center">图片查看</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="family" items="${pageInfo.result}" varStatus="status">
                <tr>
                    <td>${status.count}</td>
                    <td><tags:dataDict dataDict="分指" value="${family.bdCode}"/></td>
                    <td><tags:dataDict dataDict="组别" value="${family.groupCode}" /></td>
                    <td style="text-align: left;">${family.address}</td>
                    <td>${family.name}</td>
                    <td>${family.buildArea}</td>
                    <td style="font-weight: bold;color: green;">
                        <c:if test="${family.signNum gt 0}">
                            <fmt:formatNumber value="${family.signNum}" pattern="0000"/>
                        </c:if>
                    </td>
                    <td><tags:dataDict dataDict="签约状态" value="${family.signStatus}"/></td>
                    <td><tags:dataDict dataDict="补偿方式" value="${family.bcType}"/></td>
                    <td>
                        <a href="javaScript:void(0)" title="点击查看大图" onclick="viewFile('${family.name}','${family.buildArea}',
                                '${family.filePath}','${family.address}');"
                           class="thumbnail" style="width: 80px;height: 60px;">
                            <img src="${family.filePath}" class="myImage">
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
</div>
<div class="footer resizeLayout">
    <tags:pageInfo></tags:pageInfo>
</div>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">上传图片查看</h4>
            </div>
            <div class="modal-body" id="modalBody">
                    <table class="table table-bordered">
                        <tbody>
                        <tr>
                            <td class="fieldName">被征收人：</td>
                            <td class="fieldValue" id="name"></td>
                            <td class="fieldName">建筑面积：</td>
                            <td class="fieldValue" id="area"></td>
                        </tr>
                        <tr>
                            <td class="fieldName">房屋地址：</td>
                            <td class="fieldValue" colspan="3" id="address"></td>
                        </tr>
                        <a href="javaScript:void(0)" class="thumbnail">
                        <img src="" id="file" class="myImage">
                        </a>
                        </tbody>
                    </table>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
                    </div>
            </div>
        </div>
    </div>
</div>
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

    function viewFile(name,area,src,address) {
        $("#name").html(name);
        $("#area").html(area);
        $("#address").html(address);
        $("#file").attr("src",src);
        $("#myModal").modal();
    }
</script>
</body>
</html>