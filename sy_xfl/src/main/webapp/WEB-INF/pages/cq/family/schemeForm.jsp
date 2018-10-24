<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <title>方案数据登记</title>
    <%@include file="/static/common/common.jsp"%>
    <script src="/static/bigDecimal/BigDecimal-all-last.min.js" type="text/javascript"></script>
    <style>
        .grey {
            background-color: #ccc;
            border: 1px solid #000000;
        }
    </style>
</head>
<body>
<div class="title">
    <h5>方案数据登记</h5>
</div>
<div class="content">
    <form class="form-horizontal" id="inputForm" method="post" action="schemeSave?<tags:searchParams/>">
        <input type="hidden" name="familyId" id="familyId" value="${family.id}"/>
        <%@include file="/WEB-INF/pages/cq/common/form/faForm.jsp" %>

    <br>

<div class="footer">
    <button class="btn btn-primary btn-sm" type="submit"><i class="fa fa-save"></i>&nbsp;保存</button>
    &nbsp;&nbsp;
    <button class="btn btn-white btn-sm" type="button" onclick="javascript:history.back()"><i class="fa fa-backward"></i>&nbsp;返回</button>
</div>
</div>
</form>
<script>

    function wrapData(v) {
        var reg = /^[-\+]?\d+(\.\d+)?$/;
        v = !reg.test(v) ? 0 : v;
        return v;
    }
    function caltotal() {
        var pgAllCount = new BigDecimal(wrapData("${pgMoney}")+"");
        var sum = new BigDecimal("0");

        sum = sum.add(pgAllCount);
        $(".fee").each(function () {
            var fee = new BigDecimal((wrapData($(this).val()))+"");
            sum = sum.add(fee);
        })
        sum = sum.setScale(2,BigDecimal.ROUND_HALF_UP);
        $("input[name='bcSumTatal']").val(sum);
    }

    $(function(){
        $("#inputForm").valid();
        $("input").each(function () {
            if ($(this).attr("readonly")) {
                $(this).addClass("grey");
            }
        })
        caltotal();
        $(".fee").blur(function(){
            caltotal();
        })
        $("input[name='type']").click(function(){
            calScheme();
        })
    })

    function calScheme(){
        var type = $("input[name='type']:checked").val();
        var familyId = $("input[name='familyId']").val();
        $.get("calScheme",{type:type,familyId:familyId,myTime:new Date().getTime()},function(data){
            if (data.code == "0000") {
                $("input[name='houseControlArea']").val(data.houseArea);
                $("input[name='azfbzFee']").val(data.azfbzFee);
                $("input[name='shbzFee']").val(data.shbzFee);
                caltotal();
            } else {
                alert(data.message);
            }
        })


    }

</script>
</body>
</html>
