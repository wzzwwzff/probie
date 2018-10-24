<%@ page import="java.util.List" %>
<%@ page import="com.sqds.utils.StringUtils" %>
<%@ page import="com.app.common.service.DataDictService" %>
<%@ page import="com.sqds.spring.SpringUtils" %>
<%@ page import="com.app.cq.model.ProjectFile" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%
    List<ProjectFile> fileInfoList = (List<ProjectFile>) request.getAttribute("fileInfoList");
    List<ProjectFile> fileInfoListBack = (List<ProjectFile>) request.getAttribute("fileInfoListBack");
%>
<head>
    <title>项目文件上传管理</title>
    <%@include file="/static/common/common.jsp" %>
    <script src="${ctx}/static/plugin/powerful-album-view/dist/viewer.js"></script>
    <script src="${ctx}/static/plugin/powerful-album-view/assets/js/main.js"></script>
    <link href="${ctx}/static/plugin/uploadify/uploadify.css" rel="stylesheet" type="text/css"/>
    <script src="${ctx}/static/plugin/uploadify/jquery.uploadify.min.js"></script>
    <link rel="stylesheet" href="${ctx}/static/plugin/powerful-album-view/dist/viewer.css">
</head>
<style>
    .titleMy {
        width: 800px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }

    .uploadify-button {
        background-color: transparent;
        border: none;
        padding: 0;
    }

    .uploadify:hover .uploadify-button {
        background-color: transparent;
    }
</style>
<div class="title resizeLayout" style="width: 100%">
   <h4>${family.fileName}文件上传</h4>
    <div style="position: absolute;top: 10px;right: 10px;">
        <button class="btn btn-primary btn-sm" type="button"
                onclick="history.back()"><i
                class="fa fa-backward"></i>&nbsp;返回列表
        </button>
    </div>
</div>
<div class="context">
    <div class="data_table_height_auto" style="padding: 0px;">
        <ul id="myTab" class="nav nav-tabs" style="padding: 0px;margin-top: 5px;">
            <li class="active"><a href="#home" onclick="hideprofile();" data-toggle="tab" aria-expanded="true">正常上传资料</a></li>
            <%--<li class=""><a href="#profile" onclick="showprofile();" data-toggle="tab" aria-expanded="false">历史删除资料</a></li>--%>
        </ul>
        <div id="myTabContent" class="tab-content">
            <div class="tab-pane fade active in" style="margin-top: 9px" id="home">
                <table>
                    <tr>
                        <td style="width: 150px;vertical-align: top;" class="text-left">
                            <input type="checkbox" id="myCheckAll"
                                   style="vertical-align: middle;width: 20px;height: 20px;margin-left: 20px"/>全选/反选
                            <a id="batchDown" class="btn btn-primary btn-sm" href="javascript:void(0);"
                               title="批量下载">
                                <i class="fa fa-arrow-circle-down"></i>&nbsp;批量下载
                            </a>
                            <%--<a class="btn btn-danger btn-sm" href="javascript:void(0);"
                               onclick="fileBatchDel()">
                                <i class="fa fa-times-circle"></i>&nbsp;批量删除
                            </a>--%>
                            <c:if test="${not empty typeCheck}">
                                <a class="btn btn-success btn-sm" href="#" onclick="fileBatchCheck(1)">
                                    <i class="glyphicon glyphicon-ok"></i>&nbsp;审核上报
                                </a>
                                <%--<a class="btn btn-danger btn-sm" href="#" onclick="fileBatchCheck(2)">--%>
                                <%--<i class="fa fa-times-circle"></i>&nbsp;批量退回--%>
                                <%--</a>--%>
                            </c:if>
                        </td>
                        <td class="text-left" style="vertical-align: top;">
                            <c:if test="${(empty typeCheck && department ne '1')|| (department eq '1' && user.username eq 'admin')}">
                                <input type="file" name="uploadify" id="uploadify"/>
                            </c:if>
                        </td>
                    </tr>
                </table>
                <c:if test="${fn:length(fileInfoList) eq 0}">
                    <font style="font-weight: bold;font-size: 25px;color: red;">暂无上传文件资料。</font>
                </c:if>
                <div id="fileQueue"></div>
                <%--</div>--%>
                <%--<hr class="hr-stylish-1">--%>
                <div class="docs-galley">
                    <c:if test="${!(empty typeCheck)}">
                        <c:if test="${fn:length(fileInfoList) eq 0}">
                            <font style="font-weight: bold;font-size: 25px;color: red;">暂未上传文件资料，无需审核。</font>
                        </c:if>
                    </c:if>
                    <ul class="docs-pictures clearfix" style="height: 100%">
                        <%
                            String typeCheck = (String) request.getAttribute("typeCheck");
                            Integer index = 1;
                            for (ProjectFile fileInfo : fileInfoList) {
                               /* if (fileInfo.getDeleteState() == 2) {
                                    continue;
                                }*/
                                String filePath = StringUtils.getNotNullString(fileInfo.getFilePath());
                                String fileName = filePath.substring(filePath.lastIndexOf("/") + 1);
                                String s_fileName = "s_" + fileName;
                                String s_filePath = filePath.substring(0, filePath.lastIndexOf("/") + 1) + s_fileName;
                        %>
                        <li style="width: 20%;">
                            <a href="javascript:void(0);"
                                   <%-- <%if (fileInfo.getHandStatus() == 1) {%>
                               style="background-color: orange;"<%}%>
                                    &lt;%&ndash;<%if (fileInfo.getHandStatus() == 1) {%>
                               style="background-color: red;"<%}%>&ndash;%&gt;--%>

                               style="background-color: forestgreen;"
                               class="thumbnail no-margin"
                               data-original-title="" title="点击查看">
                                <input type="checkbox" cqCheckStatus="<%=fileInfo.getId()%>"
                                       style="width: 20px;height: 20px;"
                                       sjCheckStatus="<%=fileInfo.getId()%>" name="imgCheck"
                                       value="<%=fileInfo.getId()%>" id="<%=fileInfo.getFileName()%>"
                                       class="check_img myInput"/>
                                <span style="text-align: right;margin-top: -100px;font-weight: bold;">序号：<%=index%></span>
                                <% index++;%>
                                <c:if test="${fn:length(fileType) eq 4}">
                                    <img data-original="<%=s_filePath%>"
                                         src="<%=s_filePath%>" id="<%=fileInfo.getFileName()%>"
                                         style="height: 180px; width: 100%; display: block;">
                                </c:if>
                                <%--<c:if test="${fn:length(fileType) eq 6}">
                                    <p style="height: 160px;text-align: center;vertical-align: middle;line-height: 45px;"
                                       readonly="true">
                                        <span style="font-weight: bold;text-align: center;font-size: 20px;"><%=fileInfo.getFileName() + "." + fileInfo.getSuffixes()%></span><br/>
                                        <span style="color: red;font-weight: bold;">（不支持在线预览，请点击“下载”查看）</span>
                                    </p>
                                </c:if>--%>
                            </a>
                            <p class="text-center" style="margin-top: -10px;">
                                <a href="javascript:void(0);" class="btn btn-default btn-sm downImg"
                                   fileInfoUuid="<%=fileInfo.getId()%>" title="点击下载此文件"><i
                                        class="glyphicon glyphicon-download-alt"></i>下载</a>
                                <a class="btn btn-danger btn-sm"
                                   onclick="deleteFileInfo('<%=fileInfo.getId()%>')">删除</a>
                                <%--<a class="btn btn-primary btn-sm"
                                   onclick="insertPic('<%=fileInfo.getId()%>')">插入</a>--%>
                            </p>
                        </li>
                        <%
                            }
                        %>
                    </ul>
                </div>
            </div>
           <%-- <div class="tab-pane fade active" id="profile">
                <div class="docs-galley">
                    <c:if test="${fn:length(fileInfoListBack) eq 0}">
                        <font style="font-weight: bold;font-size: 25px;color: red;">暂无删除文件资料。</font>
                    </c:if>
                    <ul class="docs-pictures clearfix">
                        <%
                            for (ProjectFile fileInfo : fileInfoListBack) {
                                if (fileInfo.getDeleteState() == 1) {
                                    continue;
                                }
                                String filePath = StringUtils.getNotNullString(fileInfo.getFilePath());
                                String fileName = filePath.substring(filePath.lastIndexOf("/") + 1);
                                String s_fileName = "s_" + fileName;
                                String s_filePath = filePath.substring(0, filePath.lastIndexOf("/") + 1) + s_fileName;
                        %>
                        <li style="width: 20%;">
                            <a href="javascript:void(0);"
                                    <%if (fileInfo.getDeleteState() == 2) {%>
                               style="background-color: red;"<%}%>
                                    <%if (fileInfo.getDeleteState() == 1) {%>
                               style="background-color: forestgreen;"<%}%>
                               class="thumbnail no-margin"
                               data-original-title="" title="点击查看">
                                &lt;%&ndash;<input type="checkbox" cqCheckStatus="<%=fileInfo.getOneFileStatus()%>"
                                sjCheckStatus="<%=fileInfo.getSjFileStatus()%>" name="imgCheck"
                                value="<%=fileInfo.getUuid()%>" id="<%=fileInfo.getFileName()%>"
                                class="check_img myInput"/>&ndash;%&gt;
                                <c:if test="${fn:length(fileType) eq 4}">
                                    <img data-original="<%=s_filePath%>"
                                         src="<%=s_filePath%>" id="<%=fileInfo.getFileName()%>"
                                         style="height: 200px; width: 100%; display: block;">
                                </c:if>
                                &lt;%&ndash;<c:if test="${fn:length(fileType) eq 6}">
                                    <p style="height: 160px;text-align: center;vertical-align: middle;line-height: 45px;"
                                       readonly="true">
                                        <span style="font-weight: bold;text-align: center;font-size: 20px;"><%=fileInfo.getFileName() + "." + fileInfo.getSuffixes()%></span><br/>
                                        <span style="color: red;font-weight: bold;">（不支持在线预览，请点击“下载”查看）</span>
                                    </p>
                                </c:if>&ndash;%&gt;
                            </a>
                            <p class="text-center">
                                <a href="javascript:void(0);" class="btn btn-default btn-sm downImg"
                                   fileInfoUuid="<%=fileInfo.getId()%>" title="点击下载此文件"><i
                                        class="glyphicon glyphicon-download-alt"></i>下载</a>
                                &lt;%&ndash;<a href="javascript:void(0);" class="btn btn-primary btn-sm seeReason"
                                   fileInfoUuid="<%=fileInfo.getId()%>" title="点击查看退回原因"><i
                                        class="fa fa-eye"></i>&nbsp;原因</a>&ndash;%&gt;
                            </p>
                        </li>
                        <%
                            }
                        %>
                    </ul>
                </div>
            </div>--%>
        </div>
    </div>
</div>
<%--插入model--%>
<div class="modal fade" id="myModalCr" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 40%;">
        <div class="modal-content">
            <form class="form-horizontal" id="myFormCr" method="post">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span
                            aria-hidden="true">&times;</span><span
                            class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="myModalLabel">请填写插入到第几位</h4>
                </div>
                <div class="modal-body" id="modalBodyCr">
                    <table class="table table-bordered">
                        <input type="hidden" name="fileInfoIdsCr" value=""/>
                        <tr>
                            <td class="active text-right" style="width: 40%;">请填写插入到第几位[<span
                                    style="color: red;font-size: 18px;font-weight: bold;">必填</span>]
                            </td>
                            <td>
                                <input type="text" name="insertNum" value="">
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="modal-footer">
                    <button id="submitBtn" type="button" onclick="saveInsert()"
                            class="btn btn-default btn-primary">
                        保存
                    </button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </form>
        </div>
    </div>
</div>
<%@include file="/WEB-INF/pages/cq/common/modal/backReason.jsp" %>
<script src="${ctx}/static/plugin/powerful-album-view/dist/viewer.js"></script>
<script src="${ctx}/static/plugin/powerful-album-view/assets/js/main.js"></script>
<%
    DataDictService dataDictService = (DataDictService) SpringUtils.getWebApplicationContext(request).getBean("dataDictService");
    String fileSize = dataDictService.getDataDictMap("文件上传配置").get("文件大小").getAttributeName();
    String fileTypePZ = dataDictService.getDataDictMap("文件上传配置").get("文件类型").getAttributeName();
    String fileType = (String) request.getAttribute("fileType");
    String cadSuff = dataDictService.getDataDictMap("文件上传配置").get("cad后缀").getAttributeName();
%>
<script>

    //查看此档案的退回原因
    $(".seeReason").click(function () {
        var fileInfoUuid = $(this).attr("fileInfoUuid");

        $.get("/xljbsc/common/file/form/getBackReason", {
            fileInfoUuid: fileInfoUuid,
            _date: new Date().getTime()
        }, function (data) {
            $("#seeBackReason").text(data);
            $("#myModalSee").modal();
        });

    });

    //一键全选
    function checkMethod() {
        $("#myCheckAll").click(function () {
            //判断当前是否选中
            var bl = $(this).is(":checked");
//                    var prefix = $(this).attr("name");
            $("input[name='imgCheck']").prop('checked', bl);
        });
    }


    //批量审核文件
    function fileBatchCheck(index) {
        var url = "";
        var info = "";
        if (index == 1) {
            info = "审核";
            url = "fileBatchCheck";
        } else if (index == 2) {
            info = "退回";
            url = "fileBatchBack";
        }
        var checkFileIds = [];//定义一个数组
        $('input[name="imgCheck"]:checked').each(function () {//遍历复选框，其中选中的执行函数
            var sjStatus = $(this).attr("sjCheckStatus");
            if (sjStatus == 2) {
                alert("不能审核或者退回审计已经审核的档案资料，请重新选择！");
                return;
            }
            checkFileIds.push("'" + $(this).val() + "'");//将选中的值添加到数组chk_value中
        });
        if (checkFileIds.length == 0) {
            alert("请重新选择照片");
            return;
        } else {
            if (confirm("确认" + info + "这" + checkFileIds.length + "张照片吗？")) {
                $.post(url, {fileInfoIds: checkFileIds.join(",")}, function (data) {
                    if (data.code == "0000") {
                        commonReload();
                    } else {
                        alert(data.message);
                    }
                })
            }
        }
    }

    function insertPic(fileInfoUuid) {
        $("input[name='fileInfoIdsCr']").val(fileInfoUuid);
        $("#myModalCr").modal();
    }


    function saveInsert() {
        var indexNum = $("input[name='insertNum']").val();
        var fileInfoIdsCr = $("input[name='fileInfoIdsCr']").val();
        if (indexNum == 0) {
            alert("请重新输入插入到第几位！");
        } else {
            $.get("insertPic", {
                index: indexNum,
                fileType: "${fileType}",
                fileInfoIdsCr: fileInfoIdsCr,
                familyUuid: "${family.id}",
                _time: new Date().getTime()
            }, function (data) {
                if (data.code == "0000") {
                    commonReload();
                } else {
                    alert("插入出错，请重试！");
                }
            });
        }
    }


    //    $(".myImage").click(function () {
    //        var fileInfoName = $(this).attr("id");
    //        $("input[id='" + fileInfoName + "']").attr("checked", "true");
    //    });

    //批量删除文件
    function fileBatchDel() {
        var checkFileIds = [];//定义一个数组
        $('input[name="imgCheck"]:checked').each(function () {//遍历复选框，其中选中的执行函数
            var cqCheckStatus = $(this).attr("cqCheckStatus");
            if (cqCheckStatus == 2) {
                alert("选择了已审核的图片，请重新选择图片！");
                return;
            }
            checkFileIds.push("'" + $(this).val() + "'");//将选中的值添加到数组chk_value中
        });
        if (checkFileIds.length == 0) {
            alert("请选择照片");
            return;
        } else {
            if (confirm("确认删除这" + checkFileIds.length + "张照片吗？")) {
                $.post("fileBatchDel", {fileInfoIds: checkFileIds.join(",")}, function (data) {
                    if (data.code == "0000") {
                        commonReload();
                    } else {
                        alert(data.message);
                    }
                })
            }
        }
    }


    $("#batchDown").click(function () {
        var checkbox = $("input:checkbox[name='imgCheck']:checked");
        var ids = "";
        if (!(checkbox == undefined || checkbox.length == 0)) {
            var checkboxArray = new Array();
            for (var i = 0, len = checkbox.length; i < len; i++) {
                checkboxArray.push("'" + checkbox[i].value + "'");
            }
            ids = checkboxArray.join(",");
        } else {
            alert("请选择图片！");
            return;
        }
        batchDownFile(ids);
    });


    $(".downImg").click(function () {
        var fileInfoUuid = "'" + $(this).attr("fileInfoUuid") + "'";
        batchDownFile(fileInfoUuid);
    });

    //批量下载
    function batchDownFile(ids) {
        location.href = "downProjectFile?ids=" + ids;
    }


    function saveFile(file) {
        var data = {
            "familyUuid": "${family.id}",
            "fileType": "0101",
            "filePath": file.filePath,
            "fileName": file.fileName,
            "size": file.size,
            myDate: new Date().getTime()
        };
        $.ajax({
            type: "post",
            url: "saveProjectFile",
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
            'uploader': '/fileUpload/uploadify',
            'formData': {width: 750, height: 750},
            <%if(!fileSize.equals("0") && fileType.length() != 6){%>
            'fileSizeLimit': '<%=fileSize%>',
            <%}%>
            <%if(!fileTypePZ.equals("/") && fileType.length() != 6){%>
            'fileTypeExts': "<%=fileTypePZ%>",
            'fileTypeDesc': "<%=fileTypePZ%>",
            <%}%>
            <%if(fileType.length() == 6){%>
            'fileTypeExts': "<%=cadSuff%>",
            'fileTypeDesc': "<%=cadSuff%>",
            <%}%>
            'queueID': 'fileQueue',
            'removeTimeout': 3,
            'width': 190,
            'height': 40,
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
                commonReload();
            }
        });
    }

    function commonReload() {
        //全局变量
        location.reload();
        /*buttonClick = "${fileType}";
        refreshMyPage(buttonClick);*/
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
        alert(msgText);
    };

    $(function () {
        checkMethod();
        initUpload();
        $("#profile").hide(); //初始化隐藏历史删除资料
    });

    //点击正常上传资料隐藏历史删除资料
    function hideprofile(){
        $("#profile").hide();
    }
    /*点击历史删除资料显示删除图片列表*/
    function  showprofile(){
        $("#profile").show();
    }

    function deleteFileInfo(uuid,deleteYn) {
        if (deleteYn == 2){
            alert("不能删除已上报的图片，请重新选择图片！");
            return;
        }else{
            if (confirm("确定要删除此图片吗?")) {
                $.get("deleteProjectInfo", {uuid: uuid, _date: new Date().getTime()}, function (data) {
                    if (data.code == "0000") {
                        commonReload();
                    } else {
                        alert(data.message);
                    }
                });
            }
        }
    }
   /* resizeLayout_form();
    $(window).resize(function () {
        resizeLayout_form();
    })*/
</script>