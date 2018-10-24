<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>打印</title>
    <%@include file="/static/common/common.jsp" %>
    <style>
        html,
        body {
            height: 100%;
        }
    </style>
    <script type="text/javascript">
        function toPrint() {
            document.getElementById("printIframe").contentWindow.focus();    //获得焦点
            document.getElementById("printIframe").contentWindow.print();
        }
    </script>
</head>
<body style="height: 100%;">
<div class="title printHide"><h4>【${family.name}】签约结果告知单</h4>
    <div style="position: absolute;top: 8px;right: 15px;" id="printDiv">
        <button class="btn btn-primary" onclick="javascript:toPrint()"><i class="fa fa-print"></i>&nbsp;打印</button>
        <button class="btn btn-primary" onclick="location.href='bcxyList'"><i class="fa fa-backward"></i>&nbsp;返回</button>
    </div>
</div>
<div class="content">
    <c:set var="pageName" value="printNumber"/>
    <%@include file="tabPage.jsp" %>
</div>
<center>
    <div class="content">
        <div class="data_table_height_auto" style="overflow: hidden;">
            <iframe id="printIframe" src="printNumberPDF?familyId=${family.id}&status=yes" style="width: 100%;height: 99%;"></iframe>
        </div>
    </div>
</center>
</body>
</html>