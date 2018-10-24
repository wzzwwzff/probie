<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>补充协议</title>
    <%@include file="/static/common/common.jsp"%>
    <script>
        var printType = "cj";
        function printPDF() {
            $.get("setActionInfo",{familyId:'${family.id}',type:printType,mtTime:new Date().getTime()},function(data){
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
    <h5>补充协议</h5>
    <div class="right">
        <a href="javascript:printPDF();" class="btn btn-primary"><i class="fa fa-print" aria-hidden="true"></i> 打印</a>
        <a href="javascript:history.back();" class="btn btn-primary"><i class="fa fa-backward" aria-hidden="true"></i> 返回</a>
    </div>
</div>
<div class="form-inline" id="hideCls" style="padding-bottom: 20px;">
    <ul class="nav nav-tabs">
    </ul>
</div>
<div class="content">
    <div id="pdf" class="data_table_height_auto">
        <iframe id="printf" name="printf" src="" style="width: 100%;border: 0px;height: 100%"></iframe>
    </div>
</div>
<script>
    function wrapData(v) {
        var reg = /^[-\+]?\d+(\.\d+)?$/;
        v = !reg.test(v) ? 0 : v;
        return v;
    }
    <c:if test="${param.printPDFType == 'cjAgreement'}">
    init("cj");
    </c:if>
    <c:if test="${param.printPDFType == 'teamAgreement'}">
    init("team");
    </c:if>
    function init(type) {
        printType = type;
        //注意方法的()
        var a = $("a[aid='" + type + "']");
        $("li").removeClass("active");
        a.parent().addClass("active");
        $("#printf").attr("src", "printBcxy?familyId=${family.id}&pdfType="+type+"#toolbar=0");
    }
    $(".nav li a").click(function () {
        var type = $(this).attr("aid");
        init(type);
    });
</script>
</body>
</html>
