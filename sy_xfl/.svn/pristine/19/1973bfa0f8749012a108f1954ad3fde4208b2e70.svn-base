<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>主界面</title>
    <%@include file="/static/common/common.jsp"%>
</head>
<body>
<h2 style="text-align: center;font-weight: bold;">点击下载操作手册</h2>
<hr/>
<div style="margin-top: 20px;" class="data_form_height_auto">
    <div class="wrapper1" style="width: 15%;float: left;margin-left: 20px;">
        <ul class="month-income">
            <%
                String[][] content = {
                        {"操作手册", "/static/plugin/doc/操作手册.docx"},
                };
                for (String[] s : content) {
            %>
            <li onclick="location.href='<%=s[1]%>'" title="点击下载操作手册" style="height: 80px;">
                <span class="icon-block blue-block"><i class="fa fa-html5 fa-lg"></i></span>
                <h3><%=s[0]%></h3>
            </li>
            <%}%>
        </ul>
    </div>
</div>
</body>
</html>
