<%--
  Created by IntelliJ IDEA.
  User: jmdf
  Date: 2018/7/30
  Time: 16:56
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>认购方案修改</title>
    <%@include file="/static/common/common.jsp" %>
    <script src="/static/bigDecimal/BigDecimal-all-last.min.js" type="text/javascript"></script>
    <script type="text/javascript">

    </script>
</head>
<body>
<div class="title"><h5>认购方案登记</h5></div>
<form action="rgSave?<tags:searchParams/>" method="post" class="form-inline" id="form">
    <div class="content">
        <input type="hidden" name="familyId" value="${family.id}">
        <%@include file="/WEB-INF/pages/cq/common/form/rgForm.jsp" %>
    </div>
    <div class="footer">
        <button class="btn btn-primary btn-lg" type="submit"><i class="fa fa-save"></i>&nbsp;保存</button>&nbsp;&nbsp;
        <button class="btn btn-white btn-lg" type="button" onclick="history.back()"><i class="fa fa-backward"></i>&nbsp;返回</button>
    </div>
</form>
<script>
    $(function () {
        $("#form").validate({
            onsubmit: true,// 是否在提交时验证,默认也是true
        });
    });

    //判断数字的合法性
    function regexMatch(number) {
        var reg = /^[-\+]?\d+(\.\d+)?$/;
        number = !reg.test(number) ? 0 : number;
        return number;
    }

    var specialStatus=${specialStatus};

    $(".azArea").keyup(function () {//计算预选房安置面积
        var houseArea = parseFloat(0);//实际选房的总面积
        var houseCount = parseFloat(0); //实际选房套数总和
        var houseControlArea = ${empty family.houseControlArea ? 0:family.houseControlArea};//房屋控制面积
        var oneAZHouse = $("input[name='oneAZHouse']").val();
        var twoAZHouse = $("input[name='twoAZHouse']").val();
        var threeAZHouse = $("input[name='threeAZHouse']").val();
        var fourAZHouse = $("input[name='fourAZHouse']").val();
        var fiveAZHouse = $("input[name='fiveAZHouse']").val();

        oneAZHouse = regexMatch(oneAZHouse);
        twoAZHouse = regexMatch(twoAZHouse);
        threeAZHouse = regexMatch(threeAZHouse);
        fourAZHouse = regexMatch(fourAZHouse);
        fiveAZHouse = regexMatch(fiveAZHouse);
        houseArea = ((oneAZHouse * 50) + (twoAZHouse * 80) + (threeAZHouse * 90) + (fourAZHouse * 100) + (fiveAZHouse * 125));
        houseCount = (parseFloat(oneAZHouse) + parseFloat(twoAZHouse) + parseFloat(threeAZHouse) + parseFloat(fourAZHouse) + parseFloat(fiveAZHouse));

        if((houseArea - houseControlArea) > 0&&specialStatus!=1){
            $(this).val("0");
            alert("您的选房面积不能大于安置面积，请重新选择！");
            return false;
        }else{
            $("input[name='azHouseTotal']").val(houseCount);
            $("input[name='azHouseAreaTotal']").val(houseArea);
        }


    });

</script>
</body>
</html>