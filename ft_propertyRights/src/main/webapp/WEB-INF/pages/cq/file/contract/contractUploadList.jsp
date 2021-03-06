<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <meta charset="UTF-8">
    <title>合同资料列表</title>
    <%@include file="/static/common/common.jsp" %>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>
<body>
<div class="title">
    <h4 id="installing">合同资料列表&nbsp;【申请编号：${project.familyCode}；产权人姓名：${project.name}】</h4>
</div>
<div class="content">
    <div style="float:right">
        <a href="setUpcontractPaper?contractId=${project.id}" data-width="45%" class="btn btn-info btn-sm myModal"><i
                class="fa fa fa-plus-square"></i> 创建文件夹</a>
        <button class="btn btn-primary btn-sm" type="button" onclick="window.location.href='contractlist'"><i
                class="fa fa-backward"></i>&nbsp;返回列表
        </button>
    </div>

    <table class="table table-bordered table-hover">
        <thead>
        <tr>
            <th class="text-center" width="5%">序号</th>
            <th class="text-center" width="35%">文件名称</th>
            <th class="text-center" width="12%">创建者</th>
            <th class="text-center" width="8%">是否有效</th>
            <th class="text-center" width="12%">更新时间</th>
            <th class="text-center" width="8%">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pageInfo.result}" var="proFile" varStatus="status">
            <tr>

                <td class="text-center">${status.count}</td>
                <td class="text-center"><img style="width: 20px;margin-left: 0px;" src="/static/image/file.png"/><a
                        href='contractRight?fileid=${proFile.id}'>${proFile.fileName}</a></td>
                <td class="text-center">${proFile.uploadPerson}</td>
                <td class="text-center"><tags:dataDict dataDict="是否" value="${proFile.validFlag}"></tags:dataDict></td>
                <td class="text-center"><fmt:formatDate value="${proFile.uploadDate}" pattern="yyyy-MM-dd"/></td>
                <td class="text-center">
                    <a href='setUpcontractPaper?proFileId=${proFile.id}&contractId=${project.id}'><i
                            class='a fa-big fa-edit'></i>修改</a>
                    <a href='javascript:deleteData(${proFile.id});'><i class='a fa-big fa-remove'></i>删除</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="footer resizeLayout">
        <tags:pageInfo/>
    </div>
</div>
</body>
<script>
    /*function deleteData() {
     if (confirm("确定删除吗？")) {

     }
     }*/
    function deleteData(fileId) {
        if (confirm("确定删除？")) {
            $.get("deleteContractData", {fileId: fileId}, function (data) {
                if (data.success == "true") {
                    alert(data.message);
                    location.reload();
                } else {
                    alert(data.message);
                }
            })
        }
    }
</script>
</html>