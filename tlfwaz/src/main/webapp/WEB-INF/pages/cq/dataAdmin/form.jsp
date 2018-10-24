<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>基础数据登记</title>
    <%@include file="/static/common/common.jsp"%>
    <script>
        $(document).ready(function () {
            $("#form").validate({
                rules: {
                    familyCode:{
                        remote: "checkRepeat?familyId=${family.id}&_mydate=" + new Date().getTime()
                    }
                },
                messages: {
                    familyCode: {
                        remote: "家庭编号已存在"
                    }
                }
            });
        });

        //家庭成员增行
        function addRow1() {
            var rowIndex = $("#personTable1 tr").length - 1;
            $("#personTable1 tr:last").clone().insertAfter($("#personTable1 tr:eq(" + rowIndex + ")"))
            $("#personTable1 tr:last input").each(function () {
                $(this).val("");
            });
        }
        //残疾增行
        function addRow2() {
            var rowIndex = $("#personTable2 tr").length - 1;
            $("#personTable2 tr:last").clone().insertAfter($("#personTable2 tr:eq(" + rowIndex + ")"))
            $("#personTable2 tr:last input").each(function () {
                $(this).val("");
            });
        }
        //低保增行
        function addRow3() {
            var rowIndex = $("#personTable3 tr").length - 1;
            $("#personTable3 tr:last").clone().insertAfter($("#personTable3 tr:eq(" + rowIndex + ")"))
            $("#personTable3 tr:last input").each(function () {
                $(this).val("");
            });
        }

        function deleteTr1(index) {//删除家庭成员
            $("#" + index + "_tr1").remove();
        }

        function deleteTr2(index) {//删除家庭残疾成员
            $("#" + index + "_tr2").remove();
        }

        function deleteTr3(index) {//删除家庭低保成员
            $("#" + index + "_tr3").remove();
        }
    </script>
</head>
<body>
<div class="title">
    <h5>基础数据管理</h5>
</div>
<form id="rhForm" class="form-inline" method="post" action="save">
    <input type="hidden" name="familyId" id="familyId" value="${family.id}"/>
    <div class="content">
        <ul id="myTab" class="nav nav-tabs resizeLayout">
            <li class="active"><a href="javascript:void(0);" url="form?familyId=${family.id}">基础信息</a></li>
            <li><a href="javascript:void(0);" url="jsForm?familyId=${family.id}">财务信息</a></li>
        </ul>
        <script>
            //绑定点击事件
            $("#myTab li a").click(function () {
                $("#myTab li").removeClass("active");
                $(this).parent().addClass("active");
                var url = $(this).attr("url");
                window.location.href=url;
            });
        </script>
        <%@include file="dataAdminForm.jsp"%>
    </div>
    <div class="footer resizeLayout">
        <button class="btn btn-primary btn-bg" type="button" onclick="javascript:save()"><i class="fa fa-save"></i>&nbsp;保存</button>
        &nbsp;&nbsp;
        <button class="btn btn-white btn-bg" type="button" onclick="history.back()"><i class="fa fa-backward"></i>&nbsp;返回</button>
    </div>
</form>
</body>
<script>
    function save() {
        $.ajax({
            url:"save",
            type: "post",
            data: $("#rhForm").serialize(),
            success:function (data) {
                if (data.success == "true"){
                    alert(data.message);
                    window.location.reload();
                }else {
                    alert(data.message);
                }
            }
        })
    }
</script>
</html>
