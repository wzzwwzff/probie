<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>新增标准自建房登记</title>
    <%@include file="/static/common/common.jsp"%>
    <script>
        $(document).ready(function () {
            $("#houseForm").validate({
            });
        });

        function addRow() {
            var rowIndex = $("#housePersonTable tr").length - 1;
            $("#housePersonTable tr:last").clone().insertAfter($("#housePersonTable tr:eq(" + rowIndex + ")"))
            $("#housePersonTable tr:last input").each(function () {
                $(this).val("");
            });
        }

        function familyHouseSave(){
            $.ajax({
                url:"familyHouseSave",
                type:"post",
                data:$("#familyHouseForm").serialize(),
                success:function (data) {
                    if (data.success == "true"){
                        window.location.href="familyHouseForm?familyId=" + data.familyId + "&familyHouseId=" + data.familyHouseId;
                    }else {
                        alert(data.message);
                    }
                }
            })
        }
    </script>
</head>
<body>
<div class="title">
    <h5>【${family.name}】新增标准自建房登记</h5>
</div>
<form id="familyHouseForm" class="form-inline" method="post">
    <input type="hidden" name="familyId" id="familyId" value="${family.id}"/>
    <input type="hidden" name="familyHouseId" id="familyHouseId" value="${familyHouse.id}"/>
    <div class="content">
        <ul class="nav nav-tabs">
            <c:forEach items="${familyHouseList}" var="house" varStatus="status">
                <li>
                    <a href="javascript:void(0)" onclick="location.href='familyHouseForm?familyId=${family.id}&familyHouseId=${house.id}'">标准自建房${status.count}</a>
                </li>
            </c:forEach>
            <li class="active">
                <a  href="javascript:void(0)" onclick="javascript:window.location.href='familyHouseAdd?familyId=${family.id}'"><span class="require"><i class="glyphicon glyphicon-plus"></i>新增标准自建房登记</span></a>
            </li>
        </ul>
        <%@include file="/WEB-INF/pages/cq/family/common/form/familyHouseForm.jsp"%>
    </div><br/><br/><br/>
    <div class="footer resizeLayout">
        <button class="btn btn-primary btn-sm" type="button" onclick="javascript:familyHouseSave();"><i class="fa fa-save"></i>&nbsp;保存</button>&nbsp;&nbsp;
        <button class="btn btn-white btn-sm" type="button" onclick="history.back()"><i class="fa fa-backward"></i>&nbsp;返回</button>
    </div>
</form>
</body>
</html>
