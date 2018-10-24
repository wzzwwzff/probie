<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/static/common/common.jsp" %>
    <title>入户信息修改</title>
</head>
<body>
<div class="title"><h5>入户信息修改</h5></div>
<form method="post" id="rhForm" class="form-inline">
    <div class="content">
        <input type="hidden" name="familyId" value="${family.id}">
        <%@include file="main.jsp"%>
        <%@include file="/WEB-INF/pages/cq/common/form/rhForm.jsp" %>
    </div>
    <div class="footer">
        <button class="btn btn-primary btn-sm" type="button" onclick="javascript:rhSave()"><i class="fa fa-save"></i>&nbsp;保存</button>
        &nbsp;&nbsp;
        <button class="btn btn-white btn-sm" type="button" onclick="location.href='list'"><i class="fa fa-backward"></i>&nbsp;返回</button>
    </div>
</form>
<script>
    function rhSave() {
        $.ajax({
            url:"rhSave",
            type: "post",
            data: $("#rhForm").serialize(),
            success:function (data) {
                if (data.code == "0000"){
                    alert("保存成功");
                }else {
                    alert(data.message);
                }
            }
        })
    }

    $(document).ready(function () {
        $(".confir").hide();
        $("#inputForm").validate({
            rules: {
                familyCode:{
                    remote: "checkRepeat?familyId=${family.id}&_mydate=" + new Date().getTime()
                }
            },
            messages: {
                familyCode: {
                    remote: "编号已经存在"
                }
            }
        });

        $(".fee").change(function () {
            moneyTotal("fee");
        });
        $("input[name='manageFlag']").click(function () {
            var value = $("input[name='manageFlag']:checked").val();
            if(value === "1"){
                $(".confir").show();
            }
            if(value === "2"){
                $(".confir").hide();
                $("#jyArea").val("0");
            }
        });

    });

    function wrapData(v) {
        var reg = /^[-\+]?\d+(\.\d+)?$/;
        v = !reg.test(v) ? 0 : v;
        return v;
    }

    function moneyTotal(className){
        var total = new BigDecimal("0");
        $("."+className).each(function () {
            var money = wrapData($(this).val());
            total = new BigDecimal(total+"").add(new BigDecimal(money+""));
        });

        $("#bcSumFree").html(total+"元");
    }

    function addRow1() {
        var rowIndex = $("#personTable tr").length - 1;
        $("#personTable tr:last").clone().insertAfter($("#personTable tr:eq(" + rowIndex + ")"))
        $("#personTable tr:last input").each(function () {
            $(this).val("");
        });

    }


    function deleteTr1(index) {//删除人口行
        $("#" + index + "_tr").remove();
    }

</script>
</body>
</html>

