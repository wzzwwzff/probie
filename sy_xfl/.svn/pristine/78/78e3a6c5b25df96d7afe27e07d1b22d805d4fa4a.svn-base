<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>低保残疾大病管理</title>
    <%@include file="/static/common/common.jsp"%>
    <script src="/static/bigDecimal/BigDecimal-all-last.min.js" type="text/javascript"></script>
</head>
<body>
<div class="title">
    <h5>低保残疾大病管理</h5>
</div>
<div class="content">
    <form class="form-horizontal" id="inputForm" method="post" action="difficultySave?<tags:searchParams/>">
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
                    <td class="fieldName">房屋坐落：</td>
                    <td class="fieldValue" colspan="3">${family.houseAddress}</td>
                </tr>
                </tbody>
            </table>
        </fieldset>
        <fieldset>
            <legend>五、其他信息</legend>
            <table class="table table-bordered">
                <tbody>
                <tr>
                    <td class="fieldName">低保【证】：</td>
                    <td class="fieldValue"><input class="form-control_short digits" type="text" name="dbNum" size="8"
                                                  value="${family.dbNum}"/>
                    </td>
                    <td class="fieldName">残疾【证】：</td>
                    <td class="fieldValue"><input class="form-control_short digits" type="text" name="cjNum" size="8"
                                                  value="${family.cjNum}"/>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">大病【人】：</td>
                    <td class="fieldValue" colspan="3"><input class="form-control_short digits" type="text" name="dabNum"
                                                              size="8" value="${family.dabNum}"/>
                    </td>
                </tr>
                </tbody>
            </table>
        </fieldset>

        <div class="footer">
            <button class="btn btn-primary btn-sm" type="submit"><i class="fa fa-save"></i>&nbsp;保存</button>
            &nbsp;&nbsp;
            <button class="btn btn-white btn-sm" type="button" onclick="javascript:history.back()"><i class="fa fa-backward"></i>&nbsp;返回</button>
        </div>
    </form>
    <br>

</div>
<script>
    $(function(){
        $("#inputForm").valid();
    })
</script>
</body>
</html>
