<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.sqds.utils.StringUtils" %>
<%@ page import="com.sqds.utils.UkeyBase64" %>
<%@ page import="java.util.Random" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Map<String, String> map = (Map<String, String>) request.getAttribute("map");
    String systemName = StringUtils.getNotNullString(map.get("系统名称"));
    String systemVersion = "  " + StringUtils.getNotNullString(map.get("系统版本"));
    String systemMemo = StringUtils.getNotNullString(map.get("系统描述"));
    String systemSupport = StringUtils.getNotNullString(map.get("技术支持"));
    boolean codeShow = Boolean.parseBoolean(String.valueOf(request.getAttribute("codeShow")));//验证码开关
    boolean keyUsed = Boolean.parseBoolean(String.valueOf(request.getAttribute("keyUsed")));//钥匙盘开关

    String randData = "";
    int b = 0;
    int a = 0;
    Random r = new Random();
    for (int i = 0; i < 32; i++) {
        a = r.nextInt(26);
        b = (char) (a + 65);
        randData += new Character((char) b).toString();
    }
    session.setAttribute("randData", randData);
%>
<html>
<head>
    <title><%=systemName%>--登录</title>
    <meta http-equiv=X-UA-Compatible content="IE=edge,chrome=1">
    <meta content=always name=referrer>
    <script src="${ctx}/static/jquery/1.11.3/jquery.min.js"></script>
    <link id="style_link" href="/static/style/login.css" rel="stylesheet" type="text/css">
    <script src="/static/js/cloud.js" type="text/javascript"></script>
    <%if (keyUsed) {%>
    <script src="/static/plugin/ukey/mToken_K1.js" type="text/javascript"></script>
    <script src="/static/plugin/ukey/mToken_K1Plugin.js" type="text/javascript"></script>
    <script src="/static/plugin/ukey/base64.js" type="text/javascript"></script>
    <%}%>
    <style>
        .login_success {
            color: green;
        }

        .login_error {
            color: red;
        }
    </style>
    <script type="text/javascript">
        function checkLogin() {
            $("#showInfo").html("登录中，请稍后...");
            $("#showInfo").attr("class", "login_success");
            $.ajax({
                url: "checkLogin",
                type: "post",
                data: $("#submitForm").serialize(),
                beforeSend: function () {
                    $("#submitBtn").attr("disabled", "true");
                },
                success: function (result) {
                    if (result.status == 9) {
                        location.href = "/main/main";
                        $("#showInfo").html("登录成功，进去系统...");
                        $("#showInfo").attr("class", "login_success");
                    } else {
                        $("#showInfo").html(result.result);
                        $("#submitBtn").removeAttr("disabled");
                        $("#showInfo").attr("class", "login_error");
                        reloadCode();
                    }
                },
                error: function () {
                    $("#submitBtn").removeAttr("disabled");
                }
            });
        }
        <%if(keyUsed){%>
        function loadUser() {
            K1mToken.LoadLibrary();
            var keyNumber = 0;
            keyNumber = K1mToken.K1_mTokenFindDevice();
            if (keyNumber < 1) {
                $("#showInfo").attr("class", "login_error");
                $("#showInfo").html("请插入钥匙盘");
                return false;
            }

            var keyUID = "";
            keyUID = K1mToken.K1_mTokenGetUID(1);
            if (keyUID == null || keyUID == "") {
                $("#showInfo").attr("class", "login_error");
                $("#showInfo").html("获取设备唯一硬件ID失败,错误码:" + K1mToken.K1_mTokenGetLastError());
                return;
            }

            //进行客户端摘要的计算
            var randomStr = "<%=new String(UkeyBase64.encode(randData.getBytes()))%>";
            var clientDigest = K1mToken.K1_mTokenSHA1WithSeed(keyUID, randomStr);

            if (clientDigest == null || clientDigest == "") {
                $("#showInfo").attr("class", "login_error");
                $("#showInfo").html("钥匙盘错误，请联系技术支持");
                return;
            }
            document.getElementById("uuid").value = keyUID;
            document.getElementById("clientDigest").value = clientDigest;

            $.get("loadUser.do", {guid: keyUID}, function (result) {
                if (result.status == "1") {
                    $("#showInfo").attr("class", "login_success");
                    $("#showInfo").html("用户信息读取成功");
                    $("#username").val(result.username);
                    return true;
                } else {
                    $("#showInfo").attr("class", "login_error");
                    $("#showInfo").html("U-KEY不正确");
                    return false;
                }
            });
            return true;

        }

        <%}%>
        $(document).ready(function () {
            <%if(keyUsed){%>
            $("#username").attr("readonly", "readonly");
            loadUser();
            <%}%>
            $(this).keypress(function (e) {
                switch (e.which) {
                    case 13:
                        checkLogin();
                        break;
                }
            });
        });
        function reloadCode() {
            var checkcode = $("#licenceImg").get(0);
            checkcode.src = "/servlet/validateCodeServlet?t=" + new Date().getTime();
        }
    </script>
</head>

<body style="background-color: rgb(28, 119, 172); background-image: url(../../../static/image/login/light.png); overflow-x: hidden; overflow-y: hidden; background-position: -112.50000000000023px 0px; background-repeat: no-repeat no-repeat; ">
<div id="mainBody">
    <div id="cloud1" class="cloud" style="background-position: 600.7000000000031px 100px; "></div>
    <div id="cloud2" class="cloud" style="background-position: 137px 460px; "></div>
</div>

<%if (keyUsed) {%>
<object id="mTokenPlugin" type="application/x-mtokenplugin" width="0" height="0">
    <param value="pluginLoaded"/>
</object>
<%}%>
<form name="loginForm" id="submitForm" style="overflow: hidden;">
    <%--<input type="hidden" name="clientDigest" id="clientDigest" value=""/>--%>
    <%--<input type="hidden" name="uuid" id="uuid" value=""/>--%>
    <div class="loginbody">
        <span class="systemlogo"></span>
        <div class="loginbox" style="position: absolute;left: 32%;">
            <ul>
                <li><input name="username" id="username" type="text" class="loginuser" value="" />
                </li>
                <li><input name="password" id="password" type="password" class="loginpwd" value=""/></li>
                <li><input name="loginSubmit" type="button" class="loginbtn" value="登录" onclick="checkLogin();"/>
                    <!--			<label><input name="" type="checkbox" value="" checked="checked"/>记住密码</label>-->
                    <label id="showInfo" style="text-align: left;"></label>
                </li>
            </ul>
        </div>
    </div>
    <div class="loginbm" style="color:#fff;font-weight: bold;">
        <%if (keyUsed) {%>
        <a href="/static/plugin/ukey/K1_Setup.exe">UKEY钥匙盘点击下载</a>
        <%}%>
        技术支持：<%=systemSupport%>
    </div>
</form>

</body>

</html>