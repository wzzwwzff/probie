<%@ page import="com.sqds.page.PageInfo" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.app.cq.model.DeskCatalog" %>
<%@ page import="com.app.cq.model.DeskFile" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    PageInfo<DeskCatalog> pageInfo = (PageInfo<DeskCatalog>) request.getAttribute("pageInfo");
    Map<Integer, List<DeskFile>> resultMap = (Map<Integer, List<DeskFile>>) request.getAttribute("resultMap");

%>
<html>
<head>
    <title>主界面</title>
    <%@include file="/static/common/common.jsp"%>
    <link rel="stylesheet" href="${ctx}/static/style/new.css">
</head>
<body style="overflow: hidden;">
<div style="margin-top: 20px;" class="data_form_height_auto">
    <%

        if (pageInfo != null) {
            List<DeskCatalog> fileList = pageInfo.getResult();
            for (DeskCatalog deskCatalog : fileList) {
                List<DeskFile> deskCatalogList = resultMap.get(deskCatalog.getId());
                if (deskCatalogList.size() == 0) {
                    continue;
                }
                String[][] content = new String[deskCatalogList.size()][2];
                Integer index = 0;
                for (DeskFile deskFile : deskCatalogList) {
                    content[index][0] = deskFile.getFileName();
                    content[index][1] = deskFile.getFilePath();
                    index++;
                }
    %>
    <div class="wrapper1" style="width: 15%;float: left;margin-left: 20px;">
        <ul class="month-income">
            <%
                for (String[] s : content) {
            %>
            <li onclick="location.href='../../../../../fileDown.jsp?fileName=<%=s[0]%>.<%=s[1].split("\\.")[1]%>&filePath=<%=s[1]%>'" title="点击下载使用手册" style="height: 53px;">
                <span class="icon-block blue-block"><i class="fa fa-html5 fa-lg"></i></span>
                <h5 style="color: blue;">
                    <%=deskCatalog.getName()%>
                </h5>
                <p>
                <h5><%=s[0]%>
                </h5>
                </p>
            </li>
            <%}%>
        </ul>
    </div>
    <%
            }
        }
    %>
</div>
</body>
</html>
