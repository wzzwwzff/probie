<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <title>评估数据登记</title>
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
    <h5>评估数据登记</h5>
</div>
<div class="content">
    <form class="form-horizontal" id="inputForm" method="post" action="pgSave?<tags:searchParams/>">
        <input type="hidden" name="familyId" id="familyId" value="${family.id}"/>
        <%@include file="/WEB-INF/pages/cq/common/form/pgForm.jsp" %>
        <div class="footer">
            <button class="btn btn-primary btn-sm" type="submit"><i class="fa fa-save"></i>&nbsp;保存</button>
            &nbsp;&nbsp;
            <button class="btn btn-white btn-sm" type="button" onclick="javascript:history.back()"><i class="fa fa-backward"></i>&nbsp;返回</button>
        </div>
    </form>
    <br>

</div>
<script>
    $(function(){
        $("#inputForm").valid();
        $("input").each(function () {
            if ($(this).attr("readonly")) {
                $(this).addClass("grey");
            }
        })
        calQwbcj();
//        calRealZxbz();
        calSum();
//        $(".zx").keyup(function(){
//            calRealZxbz();
//            calSum();
//        })
        $(".fee").keyup(function(){
            calQwbcj();
            calSum();
        })
    })
    function wrapData(v) {
        var reg = /^[-\+]?\d+(\.\d+)?$/;
        v = !reg.test(v) ? 0 : v;
        return v;
    }

    //计算区位补偿价合计
    function  calQwbcj(){
        var inqwFee = wrapData($("input[name='inqwFee']").val());
        var outqwFee = wrapData($("input[name='outqwFee']").val());
        var qwMoney = new BigDecimal("0");
        qwMoney = new BigDecimal(inqwFee+"").add(new BigDecimal(outqwFee+""));
        qwMoney = qwMoney.setScale(2,BigDecimal.ROUND_HALF_UP);
        $("input[name='qwMoney']").val(qwMoney);
    }

//    //计算装修补助
//    function calRealZxbz(){
//        var dezxbzf = parseFloat(wrapData($("input[name='dezxbzf']").val()));
//        var zxbzf = parseFloat(wrapData($("input[name='zxbzf']").val()));
//        var realZxbz = 0;
//        if (zxbzf > dezxbzf) {
//            realZxbz = zxbzf;
//        } else {
//            realZxbz = dezxbzf;
//        }
//        $("#realZxbz").val(realZxbz);
//    }

    //计算合计
    function calSum() {
        var sum = new BigDecimal("0");
        $(".fee").each(function () {
            var fee = new BigDecimal(wrapData($(this).val())+"");
            sum = sum.add(fee);
        })
        sum = sum.setScale(2,BigDecimal.ROUND_HALF_UP);
        $("input[name='pgAllCount']").val(sum);
    }
</script>
</body>
</html>
