<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>楼盘销控选择</title>
    <%@include file="/static/common/common.jsp" %>
    <style>
        .mybox{
            width: 25px;
            height: 25px;
        }
    </style>
</head>
<body>
<div class="title"><h5>选择显示的安置楼号及地块</h5></div>
<div class="content">
    <h5 class="require">销控展示页面，请用谷歌浏览器，并且鼠标滚轮缩小一下。</h5>
    <form method="get" action="housePic">
        <c:forEach items="${projectList}" var="project">
            <div class="mainDiv" style="float: left;margin-left: 40px">
                <h5>${project.projectName}</h5>
                <c:if test="${ not empty buildNumMap[project.id]}">
                    <ul>
                        <c:forEach items="${buildNumMap[project.id]}" var="buildNum">
                            <li><input type="checkbox" name="buildNum" class="mybox"
                                       value="${project.id}_${buildNum}">${buildNum}号楼
                            </li>
                        </c:forEach>
                    </ul>
                </c:if>
            </div>
        </c:forEach>
        <div style="clear: both;text-align: left;padding-top: 20px;">
            刷新时间间隔（秒）：<input type="text" name="times" id="times" value="10" size="5"/>
            <input type="submit" value="开始显示"/>
        </div>
    </form>
</div>
</body>
</html>
