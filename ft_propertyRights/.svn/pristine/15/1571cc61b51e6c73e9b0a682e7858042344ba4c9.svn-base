<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>批量导入审核状态</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="title">
    <h5>批量导入审核状态</h5>
</div>
<div class="content">
    <form id="excelForm">
        <input type="hidden" name="unitId" value="${unit.id}"/>
        <table class="table table-bordered">
            <tr>
                <td class="fieldName" style="width: 5%;">将excel审核状态数据粘贴此处：</td>
                <td class="fieldValue" style="width: 95%;">
                    <textarea id="content" style="width: 98%;height: 400px;background-color: ivory;" class="required"></textarea>
                    <span class="require">
                </span></td>
            </tr>
        </table>
        <div class="text-center">
            <button type="button" class="execute btn btn-primary" onclick="batchStatusSave();"><i class="fa fa-upload"></i>&nbsp;批量导入</button>&nbsp;&nbsp;
            <button type="button" class="execute btn btn-default" onclick="location.href='auditList'"><i class="fa fa-backward"></i>&nbsp;返 回</button>
            <span style="color: red;font-weight: bold;">更新期间禁止操作</span>
        </div>
        <hr/>
        <div style="height: 200px;font-size: 26px;font-weight: bold;">
            <p>注意事项：</p>
            <p>1、请按格式将excel数据复制粘贴至上方区域内，导入前请仔细检查数据格式，以免出现问题；</p>
            <p>2、格式：申请编号 住房审核状态 社保审核状态 婚姻审核状态 年龄审核状态，例如：QZ-15 1  1  1  1;</p>
            <p>3、更新期间请耐心等待;</p>
        </div>
    </form>
    <script>
        $(function () {
            $("#excelForm").validate();
        });

        function batchStatusSave(){
            $(".execute").attr("disabled",true);
            var content = $("#content").val();
            $.get("batchStatusSave",{content:content,_time:new Date().getTime()},function(data){
                alert(data.message);
            });
            $(".execute").attr("disabled",false);
        }
    </script>
</div>
</body>
</html>