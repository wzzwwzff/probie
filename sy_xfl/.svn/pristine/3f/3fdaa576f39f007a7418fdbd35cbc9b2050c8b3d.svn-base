<%--
  Created by IntelliJ IDEA.
  User: jmdf
  Date: 2018/8/27
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <%@include file="/static/common/common.jsp" %>
    <title>Title</title>
</head>
<body>
<div class="title">
    <h5>非宅信息</h5>
</div>
<div class="content">
        <fieldset>
            <legend>一、被拆迁人情况</legend>
            <table class="table table-bordered">
                <tbody>
                <tr>
                    <td class="fieldName">组别：</td>
                    <td class="fieldValue">
                        <tags:dataDict dataDict="非宅组别" value="${notFamily.groupCode}"/>
                    </td>
                    <td class="fieldName">编号：</td>
                    <td class="fieldValue">${notFamily.familyCode}
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">姓名：</td>
                    <td class="fieldValue">${notFamily.name}
                    </td>
                    <td class="fieldName">坐落：</td>
                    <td class="fieldValue">${notFamily.address}
                </tr>
                <tr>
                    <td class="fieldName">登记时间：</td>
                    <td class="fieldValue"><fmt:formatDate value='${notFamily.addDate}' pattern='yyyy-MM-dd'/>
                    <td class="fieldName">签约时间：</td>
                    <td class="fieldValue"><fmt:formatDate value='${notFamily.qyDate}' pattern='yyyy-MM-dd'/>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">签约状态：</td>
                    <td class="fieldValue"><tags:dataDict dataDict="签约状态" value="${notFamily.qyState}"/></td>
                    <td class="fieldName">地块位置：</td>
                    <td class="fieldValue">${notFamily.dkAddress}</td>
                </tr>
                <tr>
                    <td class="fieldName">操作人：</td>
                    <td class="fieldValue" <c:if test="${notFamily.operatePerson ne '管理员'}">colspan="3"</c:if>><c:if test="${notFamily.operatePerson ne '管理员'}">${notFamily.operatePerson}</c:if></td>
                    <c:if test="${notFamily.operatePerson eq '管理员'}">
                        <td class="fieldName">显示状态：</td>
                        <td class="fieldValue">
                            <tags:dataDict dataDict="显示状态" value="${notFamily.isLive}"/>
                        </td>
                    </c:if>
                </tr>
                </tbody>
            </table>
        </fieldset>
        <div class="footer">
            <button class="btn btn-white btn-sm" type="button" onclick="javascript:history.back()"><i class="fa fa-backward"></i>&nbsp;返回</button>
        </div>
    <br>
</div>
</body>
</html>

