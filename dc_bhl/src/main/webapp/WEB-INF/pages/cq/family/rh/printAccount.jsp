<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>补偿安置选择参考单打印</title>
    <%@include file="/static/common/common.jsp" %>
    <script>
        function toPrint() {
            document.getElementById("printIframe").contentWindow.focus();    //获得焦点
            document.getElementById("printIframe").contentWindow.print();
        }
    </script>
</head>
<body>
<div class="title"  id="printDiv">
    <h4>【${family.name}】补偿安置选择参考单打印</h4>
    <ul class="nav nav-tabs resizeLayout" style="margin-bottom: 10px;">
        <li <c:if test="${type eq 'back'}"> class="active" </c:if>>
            <a href="printAccount?familyId=${family.id}&type=back">就地安置参考单</a>
        </li>
        <li <c:if test="${type eq 'money'}"> class="active" </c:if>>
            <a href="printAccount?familyId=${family.id}&type=money">货币补偿参考单</a>
        </li>
        <li <c:if test="${type eq 'out'}"> class="active" </c:if>>
            <a href="printAccount?familyId=${family.id}&type=out">货币补偿+异地奖励房源参考单</a>
        </li>
    </ul>
    <div id="printButton" style="position: absolute;top: 8px;right: 15px;">
        <button type="button" class="btn btn-primary" onclick="toPrint()"><i class="fa fa-print"></i>&nbsp;打印</button>
        <button type="button" class="btn btn-primary" onclick="location.href='printAccountList'"><i class="fa fa-backward"></i>&nbsp;返回列表</button>
    </div>
</div>
<div class="content">
    <center>
        <iframe id="printIframe" src="printAccountPDF?familyId=${family.id}&type=${type}&view=rh#toolbar=0" style="width: 100%;height: 99%;"></iframe>
    </center>
</div>
</body>
</html>