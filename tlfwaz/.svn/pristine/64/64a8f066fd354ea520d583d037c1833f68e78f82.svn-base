<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <title>特殊家庭入口</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="content">
    <ul class="nav nav-tabs">
        <li class="active">
            <a href="specialList">特殊家庭入口</a>
        </li>
        <li>
            <a href="specialFamilyList">特殊家庭列表</a>
        </li>
    </ul>
    <div>
        <center>
            <div class="input-group" style="width: 650px;margin-top: 120px;">
                <input type="text" name="familyCode" id="familyCode" placeholder="请输入被征收人姓名或家庭编号" size="38" value="${familyID}" autocomplete="off" class="input form-control"/>
                <input type="hidden" name="familyID" id="familyID" value="${familyID}"/>
                <span class="input-group-btn">
                <button type="button" class="btn btn-primary" disabled
                        onClick="$('#familyID').val($('#familyCode').val());submit()" ><i class="glyphicon glyphicon-stats"></i> 进入特殊家庭管理页面</button>
                </span>
            </div>
        </center>
    </div>
</div>
</body>
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
        $('#familyCode').autocomplete(options);
        jsmethod();
    })

    function jsmethod(){
        $("input[name='familyCode']").focus();
    }
    function submit() {
        var familyCode = $("#familyID").val();
        if (familyCode == undefined || familyCode == "") {
            alert("请输入被征收人姓名");
            return;
        }
        $.get('/cq/chooseHouse/validateIsExists', {familyCode: familyCode, _time: new Date().getTime()}, function (data) {
            if(data.status=="1"){
                location.href = "specialForm?familyId=" + data.familyId;
            }else{
                alert(data.message);
            }
        });
    }
</script>
</html>