<%--
  Created by IntelliJ IDEA.
  User: jmdf
  Date: 2018/9/7
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>选房批次通知单</title>
    <%@include file="/static/common/common.jsp"%>
    <script>
        function printPDF() {
                    window.frames["printf"].focus();
                    window.frames["printf"].print();
        }
    </script>
</head>
<body style="overflow: hidden;">
<div class="title resizeLayout">
    <h5> 选房批次通知单</h5>
    <div class="right">
        <a href="javascript:printPDF();" class="btn btn-primary"><i class="fa fa-print" aria-hidden="true"></i> 打印</a>
        <a href="javascript:history.back();" class="btn btn-primary"><i class="fa fa-backward" aria-hidden="true"></i> 返回</a>
    </div>
</div>
<div class="content">
    <div id="pdf" class="data_table_height_auto">
        <iframe id="printf" name="printf" src="printXf?familyId=${familyId}#toolbar=0" style="width: 100%;border: 0px;height: 100%"></iframe>
    </div>
</div>
</body>
</html>

