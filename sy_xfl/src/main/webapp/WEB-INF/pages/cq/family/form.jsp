<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <title>拆迁数据登记</title>
    <%@include file="/static/common/common.jsp"%>
    <script src="/static/bigDecimal/BigDecimal-all-last.min.js" type="text/javascript"></script>
    <style>
        .grey {
            background-color: #ccc;
            border: 1px solid #000000;
        }
    </style>
    <script>
        $(document).ready(function () {
            $(".confir").hide();
            $("#inputForm").validate({
                rules: {
                    familyCode:{
                        remote: "checkRepeat?familyId=${family.id}&_mydate=" + new Date().getTime()
                    }
                },
                messages: {
                    familyCode: {
                        remote: "编号已经存在"
                    }
                }
            });
            //验证身份证号
            $(".idCard").each(function(){
                validateIdCard($(this));
            })
            $(".idCard").blur(function(){
                validateIdCard($(this));
            })
            $("input").each(function () {
                if ($(this).attr("readonly")) {
                    $(this).addClass("grey");
                }
            })
            $(".fee").change(function () {
                moneyTotal("fee");
            });
            //验证是否营业
            validateBusiness();
            $("input[name='isBussess']").click(function () {
                validateBusiness();
                validateManager();
            })
            //验证是否免税
            validateDutyFree();
            $("input[name='isDutyFree']").click(function () {
                validateDutyFree();
                validateManager();
            })
            validateManager();
            $("input[name='tctyfFee']").blur(function(){
                validateManager();
            })
            $("input[name='bussessArea']").blur(function(){
                validateManager();
            })

            $(".tt").change(function(){
                setTitle($(this));
            })
        });

        //验证是否免税
        function validateDutyFree() {
            var value = $("input[name='isDutyFree']:checked").val();
            if (value === "1") {
                $(".confirFree").show();
            }
            if (value === "2") {
                $(".confirFree").hide();
            }
        }
        //验证是否营业
        function validateBusiness() {
            var value = $("input[name='isBussess']:checked").val();
            if (value == "2") {
                $(".confir").show();
            }
            if (value == "1") {
                $(".confir").hide();
                $("#bussessArea").val("0");
                $("input[name='tctyfFee']").val("0");
                $("input[name='yyzz']").val("");
                $("input[name='zcgCode']").val("");
            }
        }

        //验证停产停业是否超过标准
        function validateManager() {
            var jyArea = wrapData($("#bussessArea").val());
            var tctyfFee = wrapData($("input[name='tctyfFee']").val());
            var isDutyFree = $("input[name='isDutyFree']:checked").val();
            var isBussess = $("input[name='isBussess']:checked").val();
            $.get("validateManager", {
                jyArea: jyArea,
                tctyfFee: tctyfFee,
                isBussess:isBussess,
                isDutyFree,isDutyFree,
                myTime: new Date().getTime()
            }, function (data) {
                if (data == "false") {
                    $("#managerText").show();
                    $("#submitButton").prop("disabled", true);
                } else {
                    $("#managerText").hide();
                    $("#submitButton").prop("disabled", false);
                }
            })
        }
        function wrapData(v) {
            var reg = /^[-\+]?\d+(\.\d+)?$/;
            v = !reg.test(v) ? 0 : v;
            return v;
        }

        function moneyTotal(className){
            var total = new BigDecimal("0");
            $("."+className).each(function () {
                var money = wrapData($(this).val());
                total = new BigDecimal(total+"").add(new BigDecimal(money+""));
            });

            $("#bcSumFree").html(total+"元");
        }

        function addRow1() {
            var rowIndex = $("#personTable tr").length - 1;
            $("#personTable tr:last").clone().insertAfter($("#personTable tr:eq(" + rowIndex + ")"))
            $("#personTable tr:last input").each(function () {
                $(this).val("");
            });

            $("input[name='f_idCard']").blur(function(){
                validateIdCard($(this));
            });
            $("input[name='f_address']").change(function(){
                setTitle($(this));
            });
            $("input[name='f_memo']").change(function(){
                setTitle($(this));
            })
        }

        function deleteTr1(obj) {//删除人口行
            obj.parent().parent().remove();
        }

        //验证身份证号
        function validateIdCard(obj){
            var idCard = obj.val();
            idCard = idCard.split(" ").join("");
            if (idCard.length > 0) {
                if (idCard.length != 15 && idCard.length != 18) {
                    obj.parent().find("span").text("请输入正确的身份证号");
                }else{
                    obj.parent().find("span").text("");
                }
            }else{
                obj.parent().find("span").text("");
            }
        }

        function setTitle(obj){
            obj.prop("title", obj.val()) ;
        }
    </script>
</head>
<body>
<div class="title">
    <h5>基础数据登记</h5>
</div>
<div class="content">
    <form class="form-horizontal" id="inputForm" method="post" action="save?<tags:searchParams/>">
        <input type="hidden" name="familyId" id="familyId" value="${family.id}"/>
        <%@include file="/WEB-INF/pages/cq/common/form/rhForm.jsp" %>
        <div class="footer">
            <button class="btn btn-primary btn-sm" id="submitButton" type="submit"><i class="fa fa-save"></i>&nbsp;保存</button>
            &nbsp;&nbsp;
            <button class="btn btn-white btn-sm" type="button" onclick="javascript:history.back()"><i class="fa fa-backward"></i>&nbsp;返回</button>
        </div>
    </form>
    <br>
</div>
</body>
</html>
