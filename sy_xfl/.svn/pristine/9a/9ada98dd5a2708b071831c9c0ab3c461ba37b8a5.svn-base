<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>打印</title>
    <%@include file="/static/common/common.jsp"%>
    <script>
        function printPDF() {
            $.get("/cq/sign/setActionInfo",{familyId:'${family.id}',type:'finance',mtTime:new Date().getTime()},function(data){
                if (data.code == "0000") {
                    window.frames["printf"].focus();
                    window.frames["printf"].print();
                } else {
                    alert(data.message);
                }
            })

        }
    </script>
</head>
<body style="overflow: hidden;">
<div class="title resizeLayout">
    <h5> 打印会签单</h5>
    <div class="right">
        <a href="javascript:printPDF();" class="btn btn-primary"><i class="fa fa-print" aria-hidden="true"></i> 打印</a>
        <a href="javaScript:history.back()" class="btn btn-primary"><i class="fa fa-backward" aria-hidden="true"></i> 返回</a>
    </div>
</div>
<div class="content">
    <div id="pdf" class="data_table_height_auto">
        <iframe id="printf" name="printf" src="print?familyId=${family.id}#toolbar=0" style="width: 100%;border: 0px;height: 100%"></iframe>
    </div>
</div>
</body>
</html>
