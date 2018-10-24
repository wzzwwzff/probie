<%--
  Created by IntelliJ IDEA.
  User: jmdf
  Date: 2018/8/3
  Time: 15:07
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
    <title>修改</title>
    <%@include file="/static/common/common.jsp" %>
    <script src="/static/bigDecimal/BigDecimal-all-last.min.js" type="text/javascript"></script>
    <script type="text/javascript">

    </script>
</head>
<body>
<div class="title"><h5>修改</h5></div>
<form action="xfSave?<tags:searchParams/>" method="post" class="form-inline" id="form">
    <div class="content">
        <input type="hidden" name="familyId" value="${family.id}">
        <%@include file="/WEB-INF/pages/cq/common/form/xfForm.jsp" %>
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

    $(".xf1").blur(function () {
        var va1 = $(".xf1").val();
        $.ajax({
            url:"validateFileNum1",
            dataType:"json",
            data:{
                familyId: ${family.id},
                firstNum: va1
            },
            type:"POST",
            success:function(data){
                if(data == false){
                alert("此顺序号已存在请重新输入");
                $(".xf1").val("");
                }
            },
        });
    });
    $(".xf2").blur(function () {
        var va1 = $(".xf2").val();
        $.ajax({
            url:"validateFileNum2",
            dataType:"json",
            data:{
                familyId: ${family.id},
                secondNum: va1
            },
            type:"POST",
            success:function(data){
                if(data == false){
                alert("此顺序号已存在请重新输入");
                $(".xf2").val("");
                }
            },
        });
    });
    $(".xf3").blur(function () {
        var va1 = $(".xf3").val();
        $.ajax({
            url:"validateFileNum3",
            dataType:"json",
            data:{
                familyId: ${family.id},
                thirdNum: va1
            },
            type:"POST",
            success:function(data){
                if(data == false){
                alert("此顺序号已存在请重新输入");
                $(".xf3").val("");
                }
            },
        });
    });

    //判断数字的合法性
    function regexMatch(number) {
        var reg = /^[-\+]?\d+(\.\d+)?$/;
        number = !reg.test(number) ? 0 : number;
        return number;
    }

</script>
</body>
</html>
