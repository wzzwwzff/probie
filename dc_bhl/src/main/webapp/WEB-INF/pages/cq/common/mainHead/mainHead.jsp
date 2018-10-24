<%--
  Created by IntelliJ IDEA.
  User: jmdf
  Date: 2018/9/19
  Time: 16:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="input-group input-group-sm">
    <div class="input-group-addon">家庭编号</div>
    <tags:searchInput name="f.familyCode" fieldType="string" operator="like" className="form-control"/>
</div>

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
    <div class="input-group-addon">数据锁定状态</div>
    <tags:searchDataDict name="f.sureStatus" fieldType="integer" dataDict="锁定状态" className="form-control"/>
</div>
<div class="input-group input-group-sm">
    <div class="input-group-addon">审计初审状态</div>
    <tags:searchDataDict name="f.firstCheckStatus" fieldType="integer" dataDict="初审状态" className="form-control"/>
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
</script>