<%@ page import="com.app.permission.model.Menu" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Vector" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Menu rootMenu = (Menu) request.getAttribute("rootMenu");
    List<Menu> secondMenu = (List) request.getAttribute("secondMenu");
    Map<Integer, List<Menu>> mapMenu = (Map) request.getAttribute("mapMenu");
%>
<html>
<head>
    <%@include file="/static/common/common.jsp"%>
    <script src="/static/plugin/metisMenu/jquery.metisMenu.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#side-menu').metisMenu();
        });
    </script>
    <style>
        html, body {
            margin: 0px;
            height: 100%;
        }

        ::-webkit-scrollbar {
            width: 5px;
            height: 5px;
            background-color: #f1f1f1;
        }

        /*定义滚动条轨道 内阴影+圆角*/
        ::-webkit-scrollbar-track {
            background-color: #f1f1f1;
        }

        /*定义滑块 内阴影+圆角*/
        ::-webkit-scrollbar-thumb {
            background-color: #c1c1c1;
        }
    </style>
</head>
<body>
<div class="sidebar-collapse navbar-default" style="background-color: #2e97ea;height: 100%;overflow: auto">
    <ul class="nav metismenu" id="side-menu">
        <%
            List<String> menuIcon = new Vector<String>();
            menuIcon.add("fa-bar-chart-o");
            menuIcon.add("fa-edit");
            menuIcon.add("fa-desktop");
            menuIcon.add("fa-globe");
            menuIcon.add("fa-yelp");
            menuIcon.add("fa-slack");
            menuIcon.add("fa-joomla");
            menuIcon.add("fa-dribbble");
            menuIcon.add("fa-compass");
            menuIcon.add("fa-chrome");

            int i=0;
            for (Menu s : secondMenu) {
                List<Menu> sonList = mapMenu.get(s.getId());
                if (sonList == null) {
                    sonList = new Vector<Menu>();
                }
                i++;

                int j = i % 9;
        %>
        <li <%=i==1?"class='active'":""%>>
            <a href="#"><i class="fa-big menu-icon-color  <%=menuIcon.get(j)%>"style="color:white"></i> <span class="nav-label"><%=s.getName()%></span><span class="fa arrow"></span></a>
            <ul class="nav nav-second-level">
                <%for (Menu son : sonList) {%>
                <li><a href="<%=son.getMenuUrl()%>" target="mainFrame"><%=son.getName()%>
                </a></li>
                <%}%>
            </ul>
        </li>
        <%
            }
        %>
    </ul>
    <script>
        $("a[target='mainFrame']").click(function(){
            $("a[target='mainFrame']").removeClass("sel");
            $(this).addClass("sel");
        });
    </script>
</div>
</body>
</html>
