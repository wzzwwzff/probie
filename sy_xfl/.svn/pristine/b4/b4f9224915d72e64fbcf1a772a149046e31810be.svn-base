<%@ page import="java.util.Map" %>
<%@ page import="com.sqds.utils.StringUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Map<String, String> map = (Map<String, String>) request.getAttribute("map");
    String systemName = StringUtils.getNotNullString(map.get("系统名称"));
%>
<html>
<head>
    <%@include file="/static/common/common.jsp"%>
    <style>
        html,body{ margin:0px;}
    </style>
    <script>
        var open = true;
        function menu(){
            if(open){
                parent.menu.cols="0,*";
                open = false;
                $("#closeMenuSpan").html("打开菜单");
            }else{
                parent.menu.cols="200,*";
                open = true;
                $("#closeMenuSpan").html("关闭菜单");
            }

        }
    </script>
</head>
<body>
<div class="main_header">
    <div class="col-xs-6">
        <div class="logo-title">
            <img src="/static/image/logo.png" width="35">
            <%=systemName%>
        </div>
    </div>
    <div class="col-xs-6 text-right">
        <ul class="nav navbar-top-links navbar-right">
            <li>
                <span class="m-r-sm text-muted welcome-message">欢迎您：${dbUser.realName}（${dbUser.department.departmentName}）</span>
            </li>
            <li style="margin-right: 0px;">
                <a href="javascript:menu();" >
                    <i class="fa fa-tasks"></i> <span id="closeMenuSpan">关闭菜单</span>
                </a>
            </li>
            <li style="margin-right: 0px;">
                <a href="/setting/userSetting/changePasswordForm" target="mainFrame">
                    <i class="fa fa-key"></i> 修改密码
                </a>
            </li>
            <li>
                <a href="../login/logout" target="_parent">
                    <i class="fa fa-sign-out"></i> 退出系统
                </a>
            </li>
        </ul>


    </div>
</div>

</body>
</html>
