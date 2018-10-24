<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>补偿安置协议书打印</title>
    <%@include file="/static/common/common.jsp"%>
 <script>
    function toPrint() {
        window.frames["printf"].focus();
        window.frames["printf"].print();
    }
    function setBuChongStatus(houseUuid) {
        if(${family.buChongStatus eq 2}){
            toPrint();
        }else if (confirm("确定打印并签订补偿安置协议书吗？请注意操作不可逆！")) {
            $.get("setBuChongStatus", {houseUuid: houseUuid,familyId:"${family.id}", _time: new Date().getTime()}, function (data) {
                if (data.code == "0000"){
                    toPrint();
                }else {
                    alert(data.message);
                }
            });
        }
    }
</script>
</head>
<body style="overflow: hidden;">
<div class="title resizeLayout">
    <h5>补偿安置协议书打印</h5>
    <div class="right">
        <a href="javascript:setBuChongStatus();" class="btn btn-primary"><i class="fa fa-print" aria-hidden="true"></i> 打印</a>
        <a href="javascript:history.back();" class="btn btn-primary"><i class="fa fa-backward" aria-hidden="true"></i> 返回</a>
    </div>
</div>
<div class="content">
    <div id="pdf" class="data_table_height_auto">
        <iframe id="printf" name="printf" src="printBuChong?familyId=${family.id}#toolbar=0" style="width: 100%;border: 0px;height: 100%"></iframe>
    </div>
</div>
</body>
</html>
