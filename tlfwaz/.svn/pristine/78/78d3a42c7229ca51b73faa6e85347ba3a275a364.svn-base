
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>入住通知书打印</title>
    <%@include file="/static/common/common.jsp" %>
    <script>
        function printPDF() {
            window.frames["printIframe"].focus();
            window.frames["printIframe"].print();
        }
    </script>
</head>
<body style="overflow: hidden;">
<div class="title"  id="printDiv">
    <h4>入住通知书打印</h4>
    <div id="printButton" style="position: absolute;top: 8px;right: 15px;">
        <button type="button" class="btn btn-primary" onclick="toPrint()"><i class="fa fa-print"></i>&nbsp;打印</button>
        <button type="button" class="btn btn-primary" onclick="history.back()"><i class="fa fa-backward"></i>&nbsp;返回</button>
    </div>
</div>
<div class="content">
    <center>
        <iframe id="printIframe" name="printIframe" src="printrzReportPDF?familyId=${family.id}&houseId=${house.id}#toolbar=0" style="width: 100%;height: 99%;"></iframe>
    </center>
</div>
</body>
</html>