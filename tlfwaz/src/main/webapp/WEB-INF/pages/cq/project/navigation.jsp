<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="main_header">
    <div class="col-xs-6">
        <div class="logo-title">
            <img src="/static/image/logo.jpg" width="35">
            ${systemName}
        </div>
    </div>
    <div class="col-xs-6 text-right">
        <ul class="nav navbar-top-links navbar-right" id="menu">
            <%--<li style="font-size: 30px;"><a href="/cq/project/index" target="menuFrame">项目管理</a></li>--%>
            <li>
                <span class="m-r-sm text-muted welcome-message">欢迎您：${user.realName}（${user.department.departmentName}）</span>
            </li>
            <li style="margin-right: 0px;">
                <a href="../../setting/userSetting/changePasswordForm" target="mainFrame">
                    <i class="fa fa-key"></i> 修改密码
                </a>
            </li>
            <li>
                <a href="../../login/logout" target="_parent">
                    <i class="fa fa-sign-out"></i> 退出系统
                </a>
            </li>
        </ul>
    </div>
</div>