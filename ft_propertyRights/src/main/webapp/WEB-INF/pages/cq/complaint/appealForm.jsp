<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html>
<head>
    <title>投诉信息登记</title>
    <%@include file="/static/common/common.jsp"%>
    <script>
        $(document).ready(function () {
            $("#inputForm").validate({
            });
        });
    </script>
</head>
<body>
<div class="title">
    <h5>投诉信息登记</h5>
</div>
<div class="content">
    <form class="form-horizontal" id="inputForm" method="post" action="appealSave?<tags:searchParams/>">
        <input type="hidden" name="complainId" id="complainId" value="${complaintFeedback.id}"/>
        <input type="hidden" name="dataType" value="2"/>
            <table class="table table-bordered">
                <tbody>
                <tr>
                    <td class="fieldName"><span class="require">*</span>姓名：</td>
                    <td class="fieldValue">
                        <input type="text" name="name" class="required form-control" style="width: 10em;" value="${complaintFeedback.name}"/>
                    </td>
                    <td class="fieldName">投诉日期：</td>
                    <td class="fieldValue">
                        <input type="text" name="date" class="form-control form-date-time datepicker dateISO" style="width: 130px;height: 33px;"
                               value="<fmt:formatDate value='${complaintFeedback.date}' pattern='yyyy-MM-dd'/>"/>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">联系电话：</td>
                    <td class="fieldValue">
                        <input type="text" name="phone" class="form-control" style="width: 10em;"  value="${complaintFeedback.phone}"/>
                    </td>
                    <td class="fieldName">现居住地址：</td>
                    <td class="fieldValue">
                        <input type="text" name="address" class="form-control" style="width: 20em;" value="${complaintFeedback.address}"/>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">职业：</td>
                    <td class="fieldValue">
                        <input type="text" name="job" class="form-control" style="width: 10em;"  value="${complaintFeedback.job}"/>
                    </td>
                    <td class="fieldName">工作单位：</td>
                    <td class="fieldValue">
                        <input type="text" name="workUnit" class="form-control" style="width: 20em;"  value="${complaintFeedback.workUnit}"/>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">投诉事项：</td>
                    <td class="fieldValue" colspan="3">
                        <textarea name="matter" class="form-control" style="width:1000px;height:100px">${complaintFeedback.matter}</textarea>
                    </td>
                </tr>
                </tbody>
            </table>
        <div class="footer">
            <button class="btn btn-primary btn-sm" id="submitButton" type="submit"><i class="fa fa-save"></i>&nbsp;保存</button>
            &nbsp;&nbsp;
            <button class="btn btn-white btn-sm" type="button" onclick="javascript:history.back()"><i class="fa fa-backward"></i>&nbsp;返回</button>
        </div>
    </form>
    <br>
</div>
</body>
</html>
