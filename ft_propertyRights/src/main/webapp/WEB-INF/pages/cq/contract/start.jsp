<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<head>
    <title>合同登记入口</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="content">
    <ul class="nav nav-tabs">
        <li class="active">
            <a href="start">合同登记入口</a>
        </li>
        <li>
            <a href="list">合同信息列表</a>
        </li>
    </ul>
    <center>
        <div class="input-group" style="width: 650px;margin-top: 120px;">
            <input type="text" name="familyCode" id="familyCode" placeholder="请输入申请人姓名或身份证号或申请编号" size="38" value="${familyID}" autocomplete="off" class="input form-control"/>
            <input type="hidden" name="familyID" id="familyID" value="${familyID}"/>
            <span class="input-group-btn">
            <button type="button" class="btn btn-primary" disabled
                    onClick="$('#familyID').val($('#familyCode').val());submit()" ><i class="glyphicon glyphicon-stats"></i> 进入合同信息登记页面</button>
            </span>
        </div>
    </center>
</div>
<script>
    $(function(){
        var options = {
            serviceUrl: 'ajaxFamilyInfo',
            minChars: 1, // Minimum request length for triggering autocomplete
            delimiter: /(,|;)\s*/, // Delimiter for separating requests (a character or regex)
            maxHeight: 400, // Maximum height of the suggestion list, in pixels
            width: 500, // List width
            zIndex: 9999, // List's z-index
            deferRequestBy: 0, // Request delay (milliseconds), if you prefer not to send lots of requests while the user is typing. I usually set the delay at 300 ms.
            params: { country: 'Yes'}, // Additional parameters
            onSelect: function(data, value){$("#familyID").val(value);submit()}, // Callback function, triggered if one of the suggested
            noCache: true //set to true, to disable caching
        };
        $('#familyCode').autocomplete(options);//自动完成提示
        jsmethod();
    });

    function jsmethod(){
        $("input[name='familyCode']").focus();//获得输入框焦点
    }
    function submit() {
        var familyCode = $("#familyID").val();//家庭表申请编号
        if (familyCode == undefined || familyCode == "") {
            alert("请输入申请人姓名");
            return;
        }
        $.get('validateIsExists', {familyCode: familyCode, _time: new Date().getTime()}, function (data) {
            if(data.status=="1"){
                location.href = "form?familyId=" + data.familyId + "&contractId=" + data.contractId;
            }else{
                alert(data.message);
            }
        });
    }
</script>
</body>
</html>