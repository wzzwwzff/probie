<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html>
<head>
    <title>反馈信查看</title>
    <%@include file="/static/common/common.jsp"%>
</head>
<body>
<div class="title">
    <h5>反馈信查看</h5>
</div>
<div class="content">
    <form class="form-horizontal" id="inputForm" method="post" action="feedBackSave?<tags:searchParams/>">
        <input type="hidden" name="complainId" id="complainId" value="${complaintFeedback.id}"/>
        <input type="hidden" name="dataType" value="1"/>
            <table class="table table-bordered">
                <tbody>
                <tr>
                    <td class="fieldName">申诉/投诉人姓名：</td>
                    <td class="fieldValue">
                       ${complaintFeedback.name}
                    </td>
                    <td class="fieldName">申诉/投诉日期：</td>
                    <td class="fieldValue">
                        <fmt:formatDate value='${complaintFeedback.date}' pattern='yyyy-MM-dd'/>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">联系电话：</td>
                    <td class="fieldValue">
                        ${complaintFeedback.phone}
                    </td>
                    <td class="fieldName">现居住地址：</td>
                    <td class="fieldValue">
                        ${complaintFeedback.address}
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">职业：</td>
                    <td class="fieldValue">
                        ${complaintFeedback.job}
                    </td>
                    <td class="fieldName">工作单位：</td>
                    <td class="fieldValue">
                        ${complaintFeedback.workUnit}
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">申诉/投诉事项：</td>
                    <td class="fieldValue" colspan="3">
                        ${complaintFeedback.matter}
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">经办人：</td>
                    <td class="fieldValue">
                        ${complaintFeedback.person}
                    </td>
                    <td class="fieldName">经办日期：</td>
                    <td class="fieldValue">
                        <fmt:formatDate value='${complaintFeedback.runDate}' pattern='yyyy-MM-dd'/>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">处理状态：</td>
                    <td class="fieldValue" colspan="3">
                        <tags:dataDict dataDict="处理状态" value="${complaintFeedback.status}"/>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">处理意见：</td>
                    <td class="fieldValue" colspan="3">
                        ${complaintFeedback.opinion}
                    </td>
                </tr>
                </tbody>
            </table>
        <div class="footer">
            <button class="btn btn-white btn-sm" type="button" onclick="javascript:history.back()"><i class="fa fa-backward"></i>&nbsp;返回</button>
        </div>
    </form>
    <br>
</div>
</body>
</html>
