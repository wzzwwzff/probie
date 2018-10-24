<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>结算证明打印</title>
    <%@include file="/static/common/common.jsp" %>
    <script>
        function toPrint() {
            document.getElementById("printIframe").contentWindow.focus();    //获得焦点
            document.getElementById("printIframe").contentWindow.print();
        }
    </script>
</head>
<body  oncontextmenu=self.event.returnValue=false>
<div class="title"  id="printDiv">
    <h4>【${family.name}】结算证明</h4>
    <div id="printButton" style="position: absolute;top: 8px;right: 15px;">
        <button type="button" class="btn btn-primary" onclick="toPrint();"><i class="fa fa-print"></i>&nbsp;打印</button>
        <button type="button" class="btn btn-primary" onclick="history.back()"><i class="fa fa-backward"></i>&nbsp;返回</button>
    </div>
</div>
<center>
    <iframe id="printIframe" src="printJsPDF?familyId=${family.id}#toolbar=0" style="width: 100%;height: 99%;"></iframe>
</center>
</body>
</html>