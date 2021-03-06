<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>评估报告查看</title>
    <%@include file="/static/common/common.jsp"%>
    <script src="/static/plugin/uploadify/jquery.uploadify.min.js"></script>
</head>
<body>
<div class="title">
    <h5>评估数据录入</h5>
</div>
<form id="pgForm" class="form-inline" method="post" action="pgSave?<tags:searchParams/>">
    <input type="hidden" name="familyId" id="familyId" value="${family.id}"/>
    <div class="content">
        <fieldset>
            <legend>一、被拆迁人信息</legend>
            <table class="table table-bordered">
                <tr>
                    <td class="fieldName">编号</td>
                    <td class="fieldValue" colspan="3">${family.familyCode}</td>
                </tr>
                <tr>
                    <td class="fieldName">分指</td>
                    <td class="fieldValue"><tags:dataDict dataDict="分指" value="${family.bdCode}"/></td>
                    <td class="fieldName">组别</td>
                    <td class="fieldValue"><tags:dataDict dataDict="组别" value="${family.groupCode}"/></td>
                </tr>
                <tr>
                    <td class="fieldName">被拆迁人</td>
                    <td class="fieldValue">${family.name}</td>
                    <td class="fieldName">联系电话</td>
                    <td class="fieldValue">${family.tel}</td>
                </tr>
                <tr>
                    <td class="fieldName">身份证号</td>
                    <td class="fieldValue">${family.idCard}</td>
                    <td class="fieldName">婚姻状况</td>
                    <td class="fieldValue"><tags:dataDict dataDict="婚姻状况" value="${family.marryStatus}"/></td>
                </tr>
            </table>
        </fieldset>
        <fieldset>
            <legend>二、评估数据信息</legend>
            <table class="table table-bordered">
                <tr>
                    <td class="fieldName">评估公司名称</td>
                    <td class="fieldValue" colspan="3"></td>
                </tr>
                <tr>
                    <td class="fieldName">房屋价值</td>
                    <td class="fieldValue"><input readonly type="text" class="form-control number" name="houseMoney" value="${family.houseMoney}"/></td>
                    <td class="fieldName">房屋装修及附属物</td>
                    <td class="fieldValue"><input readonly type="text" class="form-control number" name="fitPgMoney" value="${family.fitPgMoney}"/></td>
                </tr>
                <tr>
                    <td class="fieldName">房屋重置成新价</td>
                    <td class="fieldValue" colspan="3"><input readonly type="text" class="form-control number" name="houseNewMoney" value="${family.houseNewMoney}"/></td>
                </tr>
            </table>
        </fieldset>
        <fieldset>
            <legend>三、评估报告</legend>
                <h3><input type="file" name="uploadify" id="uploadify"/></h3>
                <div id="fileQueue"></div>
                <a href="javaScript:void(0)" class="thumbnail">
                <c:choose>
                <c:when test="${not empty family.pgFilePath}">
                <img src="${s_filePath}" title="${family.name}" data-original="${s_filePath}" class="myImage">
                </c:when>
                <c:otherwise>
                <img src="/static/image/pgbg.jpg" title="请上传评估报告" data-original="/static/image/name.png" class="myImage"/>
                </c:otherwise>
                </c:choose>
                </a>
        </fieldset>
    </div><br/><br/><br/>
    <div class="footer resizeLayout">
        <button class="btn btn-white btn-sm" type="button" onclick="history.back()"><i class="fa fa-backward"></i>&nbsp;返回</button>
    </div>
</form>
</body>
</html>

<script>
    function saveFile(file) {
        var data = {
            "familyId": "${family.id}",
            "fileType": "*.jpg; *.pdf; *.jpeg",
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
            'uploader': '/cq/family/rh/uploadify',//上传后台方法
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
</script>