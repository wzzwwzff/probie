<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <title>拆除数据登记</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="title">
    <h5>拆除数据登记</h5>
</div>
<div class="content">
    <form class="form-horizontal" id="inputForm" method="post" action="ccSave?<tags:searchParams/>">
        <input type="hidden" name="familyId" id="familyId" value="${family.id}"/>
        <fieldset>
            <legend>一、被拆迁人情况</legend>
            <table class="table table-bordered">
                <tbody>
                <tr>
                    <td class="fieldName">编号：</td>
                    <td class="fieldValue">${family.familyCode}</td>
                    <td class="fieldName">组 别：</td>
                    <td class="fieldValue"><tags:dataDict dataDict="组别" value="${family.groupCode}"/></td>
                </tr>
                <tr>
                    <td class="fieldName">姓名：</td>
                    <td class="fieldValue">${family.name}</td>
                    <td class="fieldName">身份证号：</td>
                    <td class="fieldValue">${family.idCard}</td>
                </tr>
                <tr>
                    <td class="fieldName">性别：</td>
                    <td class="fieldValue"><tags:dataDict dataDict="性别" value="${family.sex}"/></td>
                    <td class="fieldName">出生日期：</td>
                    <td class="fieldValue"><fmt:formatDate value="${family.birthdayDate}" pattern="yyyy-MM-dd"/></td>
                </tr>
                <tr>
                    <td class="fieldName">工作单位：</td>
                    <td class="fieldValue">${family.unit}</td>
                    <td class="fieldName">联系电话：</td>
                    <td class="fieldValue">${family.phone}</td>
                </tr>
                </tbody>
            </table>
        </fieldset>
        <fieldset>
            <legend>二、拆除信息情况</legend>
            <table class="table table-bordered">
                <tbody>
                <tr>
                    <td class="active text-right" width="15%">拆除状态</td>
                    <td class="text-left">
                        <tags:dataDictRadio name="ccState" dataDict="拆除状态" value="${family.ccState}"/>
                    </td>
                </tr>
                <tr>
                    <td class="active text-right">拆除日期</td>
                    <td class="text-left">
                        <jsp:useBean id="date" class="java.util.Date"/>
                        <input class="form-control_short form-date-time datepicker" name="ccDate"
                               value="<fmt:formatDate  value="${empty family.ccDate ? date: family.ccDate}" pattern="yyyy-MM-dd" />">
                    </td>
                </tr>
                <tr>
                    <td class="active text-right">拆除经办人</td>
                    <td class="text-left"><input class="form-control_short" type="text" name="ccPerson"
                                                 value="${empty family.ccPerson ? user.realName : family.ccPerson}">
                    </td>
                </tr>
                <tr>
                    <td class="active text-right">备注</td>
                    <td colspan="3">
                            <textarea id="ccMemo" class="form-control" rows="5"
                                      name="ccMemo">${family.ccMemo}</textarea>
                    </td>
                </tr>
                </tbody>
            </table>
        </fieldset>
        <div class="text-center">
            <input type="submit" class="btn btn-primary" value="保存"/>
            &nbsp;&nbsp;
            <input type="button" class="btn btn-primary" onclick="history.back();" value="返回"/>
        </div>
    </form>
    <br>

</div>
<script>

    $(function(){
        $("input[name='ccState']").click(function(){
            validateCC();
        })
    })

    function validateCC(){
        var value = $("input[name='ccState']:checked").val();
        if (value == "1") {
            $("input[name='ccDate']").val("");
            $("input[name='ccDate']").prop("disabled", "true");
            $("input[name='ccPerson']").val("");
            $("input[name='ccPerson']").prop("disabled", "true");
            $("textarea[name='ccMemo']").val("");
            $("textarea[name='ccMemo']").prop("disabled", "true");
        } else {
            $("input[name='ccDate']").prop("disabled",false);
            $("input[name='ccPerson']").prop("disabled",false);
            $("textarea[name='ccMemo']").prop("disabled",false);
        }
    }
</script>
</body>
</html>
