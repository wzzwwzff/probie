<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>sql执行结果</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="title">
    <h5>${sqlExecuteInfo.sqlTitle}</h5>
</div>
<div class="content">
    <div class="search_button">
        <button class="btn btn-primary btn-sm" id="excelBtn"><i class="fa fa-file-excel-o"></i>&nbsp;导出Excel</button>
        <script>
            $(function () {
                $("#excelBtn").click(function () {
                    $(".table").table2excel({
                        exclude: ".noExl",
                        name: "查询结果统计",
                        filename: "查询结果统计",
                        exclude_img: true,
                        exclude_links: true,
                        exclude_inputs: true
                    });
                });
            });
        </script>
        <button type="button" class="btn btn-sm btn-primary" onclick="location.reload();">
            <i class="fa fa-refresh"></i>&nbsp;刷新
        </button>
            <button type="button" class="btn btn-sm btn-primary" onclick="location.href='list';">
                <i class="fa fa-backward"></i>&nbsp;返回
            </button>
    </div>
    <c:if test="${not empty listMap}">
        <table class="table table-bordered table-hover">
            <thead>
            <tr>
                <th width="5%" class="text-center">序号</th>
                <c:forEach items="${listMap}" var="map" varStatus="status">
                    <c:if test="${status.index==0}">
                        <c:forEach items="${map}" var="item">
                            <th class="text-center">${item.key}</th>
                        </c:forEach>
                    </c:if>
                </c:forEach>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listMap}" var="map" varStatus="status">
                <tr>
                    <td class="text-center">${status.index+1}</td>
                    <c:forEach items="${map}" var="item">
                        <td class="text-center">${item.value}</td>
                    </c:forEach>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>
</body>
</html>
