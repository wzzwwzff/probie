<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>拆迁补偿单打印</title>
    <%@include file="/static/common/common.jsp"%>
 <script>
    function printPDF() {
        window.frames["printf"].focus();
        window.frames["printf"].print();
    }
</script>
<style type="text/css">
    #pdf{
        margin-top: 10px;
        width: 100%;
        text-align: center;
    }
</style>
</head>
<body style="overflow: hidden;">
<div class="title resizeLayout">
    <h5> 拆迁补偿单打印</h5>
    <div class="right">
        <a href="javascript:printPDF();" class="btn btn-primary"><i class="fa fa-print" aria-hidden="true"></i> 打印</a>
        <a href="javascript:history.back();" class="btn btn-primary"><i class="fa fa-reply" aria-hidden="true"></i> 返回</a>
    </div>
</div>
<div class="content">
    <div id="pdf">
        <iframe id="printf"  name="printf" src="print?familyId=${familyId}#toolbar=0" style="width: 100%;border: 0px;height: 100%"></iframe>
    </div>
</div>
</body>
</html>
