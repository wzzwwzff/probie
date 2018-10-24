<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>住宅数据登记</title>
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

        function addRow1() {
            var rowIndex = $("#personTable1 tr").length - 1;
            $("#personTable1 tr:last").clone().insertAfter($("#personTable1 tr:eq(" + rowIndex + ")"))
            $("#personTable1 tr:last input").each(function () {
                $(this).val("");
            });
        }

        function addRow2() {
            var rowIndex = $("#personTable2 tr").length - 1;
            $("#personTable2 tr:last").clone().insertAfter($("#personTable2 tr:eq(" + rowIndex + ")"))
            $("#personTable2 tr:last input").each(function () {
                $(this).val("");
            });
        }
    </script>
</head>
<body>
<div class="title">
    <h5>住宅数据登记</h5>
</div>
<form id="form" class="form-inline" method="post" action="familySave?<tags:searchParams/>">
    <input type="hidden" name="familyId" id="familyId" value="${family.id}"/>
    <div class="content">
        <%@include file="/WEB-INF/pages/cq/family/common/form/familyForm.jsp"%>
    </div><br/><br/><br/>
    <div class="footer resizeLayout">
        <button class="btn btn-primary btn-sm" type="submit"><i class="fa fa-save"></i>&nbsp;保存</button>
        &nbsp;&nbsp;
        <button class="btn btn-white btn-sm" type="button" onclick="history.back()"><i class="fa fa-backward"></i>&nbsp;返回</button>
    </div>
</form>
</body>
</html>
