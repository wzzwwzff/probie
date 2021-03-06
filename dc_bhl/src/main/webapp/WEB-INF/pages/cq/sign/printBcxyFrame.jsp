<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>补偿安置意向书打印</title>
    <%@include file="/static/common/common.jsp"%>
    <script src="/static/plugin/uploadify/jquery.uploadify.min.js"></script>
    <script>
        function printPDF() {
            window.frames["printf"].focus();
            window.frames["printf"].print();
        }
    </script>
</head>
<body style="overflow: hidden;">
<div class="title resizeLayout">
    <h5>补偿安置意向书打印</h5>
    <div class="right">
        <a href="javascript:history.back();" class="btn btn-primary"><i class="fa fa-backward" aria-hidden="true"></i> 返回</a>
    </div>
</div>
<div class="resizeLayout">
    <c:set var="pageName" value="printBcxyFrame"/>
    <%@include file="tabPage.jsp" %>
</div>
<div class="content">
    <div class="content" style="width: 20%;float: left;">
            <h3>
                <c:if test="${!empty family.signNum}">
                    您的补偿安置意向书顺序号是：<font style="color: #00CC00;font-size: 28px;font-weight: bold;">${family.signNum}</font>
                </c:if>
                <c:if test="${empty family.signNum}">
                    您的补偿安置意向书顺序号是：<font style="color: #00CC00;font-size: 28px;font-weight: bold;">暂未获取</font>
                </c:if>
            </h3>
            <h3>签约步骤：</h3>
            <h3>第①步：<input type="button" class="btn btn-primary" value="打印补偿安置意向书" onclick="printPDF()"/>；</h3>
            <h3>第②步：确认签字并摁手印后，请
                <input type="button" class="btn btn-primary" value="设置为已签约" ${family.signStatus eq 2 ? "disabled" : ""}
                       onclick="javascript:setSignNum('${family.id}')"/>(当前签约状态:
                <c:if test="${family.signStatus eq 1}">
                    <font style="color: #00CC00;font-size: 28px;font-weight: bold;">未签约</font></c:if>
                <c:if test="${family.signStatus eq 2}">
                    <font style="color: #00CC00;font-size: 28px;font-weight: bold;">已签约</font></c:if>
                )。<br/>
            </h3>
        <div class="content">
            <c:if test="${empty family.filePath and family.signStatus eq 1}">
                <h3><input type="file" name="uploadify" id="uploadify"/></h3>
            </c:if>
            <div id="fileQueue"></div>
            <a href="javaScript:void(0)" class="thumbnail">
                <c:choose>
                    <c:when test="${not empty family.filePath}">
                        <img src="${s_filePath}" title="${family.name}" data-original="${s_filePath}" class="myImage">
                    </c:when>
                    <c:otherwise>
                        <img src="/static/image/name.png" title="请上传产权人/承租人照片" data-original="/static/image/name.png" class="myImage"/>
                    </c:otherwise>
                </c:choose>
            </a>
            <h3>产权人/承租人：${family.name}</h3>
            <h3>建筑面积：${family.buildArea}㎡</h3>
            <h3>房屋地址：${family.address}</h3>
        </div>
    </div>
    <div id="pdf" class="data_table_height_auto" style="width: 80%;float: right;overflow-y: hidden;">
        <iframe id="printf" name="printf" src="printBcxy?bcName=${bcName}&familyId=${family.id}#toolbar=0" style="width: 100%;border: 0px;height: 100%"></iframe>
    </div>
</div>
</body>
</html>
<script>
    function saveFile(file) {
        var data = {
            "familyId": "${family.id}",
            "fileType": "*.jpg; *.jpeg",
            "filePath": file.filePath,
            myDate: new Date().getTime()
        };
        $.ajax({
            type: "post",
            url: "saveFileItem",
            data: data,
            success: function (data) {
                var filePath = data.imgSrc;
                $(".myImage").attr("src",filePath);
                $(".myImage").attr("title",'${family.name}');
            },
            async: false
        });
    }

    function initUpload() {
        $("#uploadify").uploadify({
            'buttonImage': '/static/plugin/uploadify/upfile.jpg',
            'swf': '/static/plugin/uploadify/uploadify.swf',
            'uploader': '/cq/sign/uploadify',//上传后台方法
            'formData': {width: 750, height: 750},
            'fileTypeExts': "*.jpg; *.jpeg;",//上传格式
            'queueSizeLimit':1,//最大上传多少张
            'queueID': 'fileQueue',//定位到上面的上传按钮
            'removeTimeout': 0.5,//上传进度条消失时间
            'width': 140,//上传进度条
            'height': 40,//上传进度条

            'overrideEvents': ['onDialogClose', 'onSelectError'],
            'onUploadError': function (file, errorCode, errorMsg, errorString) {
                alert('The file ' + file.name + ' could not be uploaded: ' + errorString);
            },
            'onSelectError': uploadify_onSelectError,
            'onUploadStart': function (file) {
                uploadErrorFile = "";
            },
            'onUploadComplete': function (file) {
            },
            'onUploadSuccess': function (file, data, response) {
                var jsonObject = jQuery.parseJSON(data);
                saveFile(jsonObject);
            },
            'onQueueComplete': function () {
                if (uploadErrorFile.length > 0) {
                    alert("以下文件上传失败\n" + uploadErrorFile);
                }
            }
        });
    }

    var uploadify_onSelectError = function (file, errorCode, errorMsg) {
        var msgText = "上传失败\n";
        switch (errorCode) {
            case SWFUpload.QUEUE_ERROR.QUEUE_LIMIT_EXCEEDED:
                msgText += "只能上传 " + this.settings.queueSizeLimit + "个文件";
                break;
            case SWFUpload.QUEUE_ERROR.ZERO_BYTE_FILE:
                msgText += "文件大小为0";
                break;
            case SWFUpload.QUEUE_ERROR.INVALID_FILETYPE:
                msgText += "文件格式不正确，仅限 " + this.settings.fileTypeExts;
                break;
            default:
                msgText += "错误代码：" + errorCode + "\n" + errorMsg;
        }
        alert(msgText);
    };

    $(function () {
        initUpload();
    });

    function setSignNum(familyId) {
        if (confirm("确定要将该家庭设置为已签约状态吗？")) {
            $.get("setSign", {familyId: familyId, _date: new Date().getTime()}, function (data) {
                if (data.success == "true") {
                    window.location.href="/cq/sign/printNumber?familyId=" + familyId;
                } else {
                    alert(data.message);
                }
            })
        }
    }
</script>
