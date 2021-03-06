<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html>
<head>
    <title>财务结算管理</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="title">
    <h5>财务结算管理</h5>
</div>
<div class="content">
    <ul id="myTab" class="nav nav-tabs resizeLayout">
        <li><a href="javascript:void(0);" url="form?familyId=${family.id}">基础信息</a></li>
        <li class="active"><a href="javascript:void(0);" url="jsForm?familyId=${family.id}">财务信息</a></li>
    </ul>
    <script>
        //绑定点击事件
        $("#myTab li a").click(function () {
            $("#myTab li").removeClass("active");
            $(this).parent().addClass("active");
            var url = $(this).attr("url");
            window.location.href=url;
        });
    </script>
    <form class="form-inline" id="inputForm" action="jsSave?<tags:searchParams />" method="post">
        <fieldset>
            <legend>一、基本信息</legend>
            <table class="table table-bordered">
                <input type="hidden" value="${family.id}" name="familyId"/>
                <tbody>
                <tr>
                    <td class="fieldName">所属项目：</td>
                    <td class="fieldValue">${family.project.projectName}</td>
                    <td class="fieldName">所属地块：</td>
                    <td class="fieldValue">${family.area.areaName}</td>
                </tr>
                <tr>
                    <td class="fieldName">档案编号：</td>
                    <td class="fieldValue">${family.familyCode}</td>
                    <td class="fieldName">姓名：</td>
                    <td class="fieldValue">${family.name}</td>
                </tr>
                <tr>
                    <td class="fieldName">性别：</td>
                    <td class="fieldValue">
                        <tags:dataDict value="${family.sex}" dataDict="性别"/>
                    </td>
                    <td class="fieldName">身份证号：</td>
                    <td class="fieldValue">${family.idCard}</td>
                </tr>
                <tr>
                    <td class="fieldName">年龄：</td>
                    <td class="fieldValue">${family.age}</td>
                    <td class="fieldName">联系电话：</td>
                    <td class="fieldValue">${family.phone}</td>
                </tr>
                <tr>
                    <td class="fieldName">联系地址：</td>
                    <td class="fieldValue">${family.address}</td>
                    <td class="fieldName">房屋坐落：</td>
                    <td class="fieldValue">${family.fwzl}</td>
                </tr>
                </tbody>
            </table>
        </fieldset>
        <fieldset>
            <legend>二、结算信息</legend>
            <table class="table table-bordered">
                <tbody>
                <tr>
                    <td class="fieldName">结算状态：</td>
                    <td class="fieldValue"><tags:dataDictRadio name="jsStatus" dataDict="结算状态"
                                                               value="${family.jsStatus}"/></td>
                    <td class="fieldName">结算日期：</td>
                    <td class="fieldValue">
                        <input type="text" name="jsDate"
                               value="<fmt:formatDate value="${family.jsDate}" pattern="yyyy-MM-dd" />"
                               class="form-control form-date-time dateISO" style="width: 130px;height: 33px;"/>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">结算经办人：</td>
                    <td class="fieldValue" colspan="3"><input size="10" type="text" name="jsPerson" class="form-control"
                                                              value="${family.jsPerson eq ''? jsPerson: family.jsPerson}"/>
                    </td>
                </tr>
                <tr>
                    <td class="fieldName">财务批次：</td>
                    <td class="fieldValue"><input size="10" type="text" name="financeBatch" class="form-control number"
                                                  value="${family.financeBatch}" style="width: 5em"/></td>
                    <td class="fieldName">财务批次日期：</td>
                    <td class="fieldValue">
                        <input type="text" name="cwBatchDate"
                               value="<fmt:formatDate value="${family.cwBatchDate}" pattern="yyyy-MM-dd" />"
                               class="form-control form-date-time dateISO" style="width: 130px;height: 33px;"/>
                    </td>
                </tr>
                </tbody>
            </table>
        </fieldset>
        <div class="footer">
            <button class="btn btn-primary btn-bg" type="button" onclick="javascript:jsSave()"><i class="fa fa-save"></i>&nbsp;保存</button>
            <button class="btn btn-white" type="button" onclick="history.back();"><i class="fa fa-backward"></i>&nbsp;取
                消
            </button>
        </div>
    </form>
</div>
</body>
</html>
<script>
    function jsSave() {
        $.ajax({
            url:"jsSave",
            type: "post",
            data: $("#inputForm").serialize(),
            success:function (data) {
                if (data.success == "true"){
                    alert(data.message);
                    window.location.reload();
                }else {
                    alert(data.message);
                }
            }
        })
    }
</script>
