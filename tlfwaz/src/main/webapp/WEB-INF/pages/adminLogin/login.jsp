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
    boolean keyUsed = Boolean.parseBoolean(String.valueOf("false"));//钥匙盘开关

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
    <link href="/static/style/login.css" rel="stylesheet" type="text/css">
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
            $("#logining_info").html("登录中，请稍后...");
            $("#logining_info").attr("class", "login_success");
            $.ajax({
                url: "adminCheckLogin",
                type: "post",
                data: $("#submitForm").serialize(),
                beforeSend: function () {
                    $("#submitBtn").attr("disabled", "true");
                },
                success: function (result) {
                    if (result.status == 9) {
                        location.href = "/main/main";
                        $("#logining_info").html("登录成功，进去系统...");
                        $("#logining_info").attr("class", "login_success");
                    } else {
                        $("#logining_info").html(result.result);
                        $("#submitBtn").removeAttr("disabled");
                        $("#logining_info").attr("class", "login_error");
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
                $("#logining_info").attr("class", "login_error");
                $("#logining_info").html("请插入钥匙盘");
                return false;
            }

            var keyUID = "";
            keyUID = K1mToken.K1_mTokenGetUID(1);
            if (keyUID == null || keyUID == "") {
                $("#logining_info").attr("class", "login_error");
                $("#logining_info").html("获取设备唯一硬件ID失败,错误码:" + K1mToken.K1_mTokenGetLastError());
                return;
            }

            //进行客户端摘要的计算
            var randomStr = "<%=new String(UkeyBase64.encode(randData.getBytes()))%>";
            var clientDigest = K1mToken.K1_mTokenSHA1WithSeed(keyUID, randomStr);

            if (clientDigest == null || clientDigest == "") {
                $("#logining_info").attr("class", "login_error");
                $("#logining_info").html("钥匙盘错误，请联系技术支持");
                return;
            }
            document.getElementById("uuid").value = keyUID;
            document.getElementById("clientDigest").value = clientDigest;

            $.get("loadUser.do", {guid: keyUID}, function (result) {
                if (result.status == "1") {
                    $("#logining_info").attr("class", "login_success");
                    $("#logining_info").html("用户信息读取成功");
                    $("#username").val(result.username);
                    return true;
                } else {
                    $("#logining_info").attr("class", "login_error");
                    $("#logining_info").html("U-KEY不正确");
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

<body>
<div class="loginPageBody" >
    <div class="loginWrapbg">
        <%if (keyUsed) {%>
        <object id="mTokenPlugin" type="application/x-mtokenplugin" width="0" height="0">
            <param value="pluginLoaded"/>
        </object>
        <%}%>
        <div style="width: 100%; height: 25%; left: 0; top: 0;"></div>
        <div class="loginCt">
            <div style="text-align: center">
                <img src="/static/image/logo.png" style="width: 35px;margin-top: -10px">
                <span style="line-height:70px;font-size: 25px;padding-top:20px;margin-top: 15px;font-family:'微软雅黑','黑体' "><b><%=systemName %></b></span>
            </div>
            <div class="welcome"><span id="logining_info">请输入用户名、密码</span></div>
            <div class="loginBar" id="loginBar">
                <form name="submitForm" id="submitForm">
                    <%if (keyUsed) {%>
                    <input type="hidden" name="clientDigest" id="clientDigest" value=""/>
                    <input type="hidden" name="uuid" id="uuid" value=""/>
                    <%}%>
                    <div class="" style="text-align: center">
                        <div class="fieldWrap">
                            <span class="login_label">用户名：</span>
                            <input name="username" id="username" type="text "class="userName inputText" >
                        </div>

                        <div class="fieldWrap">
                            <span class="login_label">密　码：</span>
                            <input name="password" id="password" type="password" class="passWord inputText" >
                        </div>

                        <%--<%--%>
                            <%--if(codeShow){--%>
                        <%--%>--%>
                        <%--<div class="fieldWrap">--%>
                            <%--<span class="login_label">验证码：</span>--%>
                            <%--<input name="code"  id="code" type="text" class="maskCode inputText">--%>
                            <%--&nbsp;<a href="javascript:reloadCode();"><img id="licenceImg" src="/servlet/validateCodeServlet" alt='验证码,看不清楚? 请点击刷新验证码'></a>--%>
                        <%--</div>--%>
                        <%--<%}%>--%>
                        <div class="loginBtnWrap" onclick="checkLogin();">登 录</div>
                    </div>
                </form>
            </div>
        </div>
        <div class="copyright">
            <%if (keyUsed) {%>
                <a href="/static/plugin/ukey/K1_Setup.exe">UKEY钥匙盘点击下载</a>
            <%}%>
            技术支持：<%=systemSupport%></div>
    </div>
</div>
</body>

</html>