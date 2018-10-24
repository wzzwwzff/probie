<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>桌面文件上传</title>
    <%@include file="/static/common/common.jsp" %>
    <script src="/static/plugin/powerful-album-view/dist/viewer.js"></script>
    <script src="/static/plugin/powerful-album-view/assets/js/main.js"></script>
    <link href="/static/plugin/uploadify/uploadify.css" rel="stylesheet" type="text/css"/>
    <script src="/static/plugin/uploadify/jquery.uploadify.min.js"></script>
    <link rel="stylesheet" href="/static/plugin/powerful-album-view/dist/viewer.css">
    <style>
        .uploadify-button {
            background-color: transparent;
            border: none;
            padding: 0;
        }

        .uploadify:hover .uploadify-button {
            background-color: transparent;
        }
    </style>
</head>
<body>
<div class="title">
    <h5>桌面文件上传</h5>
</div>
<div class="content">
<div id="myTabContent" class="tab-content">
        <table>
            <tr>
                <%--<td style="width: 450px;height: 15px;vertical-align: top;" class="text-left">--%>
                    <%--<input type="checkbox" id="myCheckAll" style="vertical-align: middle;width: 20px;height: 20px;"/>全选/反选--%>
                    <%--<a id="batchDown" class="btn btn-primary btn-sm" href="javascript:void(0);" title="批量下载"><i class="fa fa-arrow-circle-down"></i>&nbsp;批量下载</a>--%>
                    <%--<a class="btn btn-danger btn-sm" href="javascript:void(0);" onclick="fileBatchDel()"><i class="fa fa-times-circle"></i>&nbsp;批量删除</a>--%>
                <%--</td>--%>
                <td style="vertical-align: top;text-align: center;">
                    <input type="file" name="uploadify" id="uploadify"/>
                </td>
            </tr>
        </table>
        <div id="fileQueue"></div>
        <div class="docs-galley" style="margin-top: 10px;">
            <c:if test="${fn:length(deskFileList) eq 0}">
                <font style="font-weight: bold;font-size: 25px;color: red;">暂未上传文件资料</font>
            </c:if>
            <ul class="docs-pictures clearfix" style="margin-left: -40px;">
                <c:forEach items="${deskFileList}" var="deskFile" varStatus="status">
                    <li style="width: 40%;">
                        <a href="javascript:void(0);" class="thumbnail no-margin">
                            ${status.count}、文件名：${deskFile.fileName}.${deskFile.suffixes}、上传日期：<fmt:formatDate value="${deskFile.uploadDate}" pattern="yyyy年MM月dd日"/>
                        </a>
                        <p class="text-center" style="margin-top: -15px;">
                            <a class="btn btn-danger btn-sm">排序号：${deskFile.number}</a>
                            <a class="btn btn-primary btn-sm" onclick="editNumber('${deskFile.id}','${deskFile.fileName}','${deskFile.number}')">修改排序号</a>
                            <a class="btn btn-danger btn-sm" onclick="deleteDeskFile('${deskFile.id}')">删除</a>
                        </p>
                    </li>
                </c:forEach>
            </ul>
        </div>
</div>
</div>
<div class="modal fade" id="myModalCr" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 40%;">
        <div class="modal-content">
            <form class="form-horizontal" id="myFormCr" method="post">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="myModalLabel">请填写排序号</h4>
                </div>
                <div class="modal-body" id="modalBodyCr">
                    <form class="form-horizontal" id="numberForm" method="post">
                        <input type="hidden" name="deskFileId"/>
                        <table class="table table-bordered">
                            <tr>
                                <td>文件名：</td>
                                <td><span id="name"></span></td>
                            </tr>
                            <tr>
                                <td>排序号：</td>
                                <td><input type="text" class="form-control" name="number"></td>
                            </tr>
                        </table>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" onclick="saveNumber()" class="btn btn-default btn-primary">保存</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
<script>

    function editNumber(deskFileId,deskFileName,deskFileNumber){
        $("input[name='deskFileId']").val(deskFileId);
        $("#name").html(deskFileName);
        $("input[name='number']").val(deskFileNumber);
        $("#myModalCr").modal();
    }

    function saveNumber(){
        var deskFileId = $("input[name='deskFileId']").val();
        var number = $("input[name='number']").val();
        $.ajax({
            url: "saveNumber",
            type: "post",
            data: {deskFileId:deskFileId,number:number},
            success: function (data) {
                if (data.success == "true"){
                    window.location.reload();
                }else {
                    bootstrapQ.msg({msg: data.message, type: 'success'});
                }
            }
        });
    }

    function deleteDeskFile(deskFileId) {
        if (confirm("确定要删除此文件吗?")) {
            $.get("deleteDeskFile", {deskFileId: deskFileId, _date: new Date().getTime()}, function (data) {
                if (data.success == "true") {
                    window.location.reload();
                } else {
                    bootstrapQ.msg({msg: data.message, type: 'success'});
                }
            });
        }
    }

    function saveFile(file) {
        var data = {
            "cataId": "${deskCatalog.id}",
            "filePath": file.filePath,
            "fileName": file.fileName,
            "size": file.size,
            myDate: new Date().getTime()
        };
        $.ajax({
            type: "post",
            url: "saveDeskFile",
            data: data,
            success: function (msg) {
                if (msg.result == "2") {
                    if (uploadErrorFile.length > 0) {
                        uploadErrorFile += "\n";
                    }
                    uploadErrorFile += file.fileName;
                }
            },
            async: false
        });
    }
    function initUpload() {
        $("#uploadify").uploadify({
            'buttonImage': '/static/plugin/uploadify/upfile.jpg',
            'swf': '/static/plugin/uploadify/uploadify.swf',
            'uploader': 'uploadify',
            'formData': {width: 750, height: 750,deskCatalogName:"${deskCatalog.name}"},
            'fileSizeLimit': "${fileMap['文件大小']}",
            'fileTypeExts': "${fileMap['文件类型']}",
            'fileTypeDesc': "${fileMap['文件类型']}",
            'queueID': 'fileQueue',
            'removeTimeout': 3,
            'width': 190,
            'height': 40,
            'overrideEvents': ['onDialogClose', 'onSelectError'],
            'onUploadError': function (file, errorCode, errorMsg, errorString) {
                bootstrapQ.msg({msg: 'The file ' + file.name + ' could not be uploaded: ' + errorString, type: 'danger'});
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
                    bootstrapQ.msg({msg: "以下文件上传失败\n" + uploadErrorFile, type: 'danger'});
                }
                window.location.reload();
            }
        });
    }

    var uploadify_onSelectError = function (file, errorCode, errorMsg) {
        var msgText = "上传失败\n";
        switch (errorCode) {
            case SWFUpload.QUEUE_ERROR.QUEUE_LIMIT_EXCEEDED:
                //this.queueData.errorMsg = "每次最多上传 " + this.settings.queueSizeLimit + "个文件";
                msgText += "每次最多上传 " + this.settings.queueSizeLimit + "个文件";
                break;
            case SWFUpload.QUEUE_ERROR.FILE_EXCEEDS_SIZE_LIMIT:
                msgText += "文件大小超过限制( " + this.settings.fileSizeLimit + " )";
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
        bootstrapQ.msg({msg: msgText, type: 'danger'});
    };

    $(function () {
        initUpload();
    });
</script>