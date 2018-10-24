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
    <h5>非宅数据登记</h5>
</div>
<div class="content">
    <form class="form-horizontal" id="inputForm" method="post" action="save?<tags:searchParams/>">
        <input type="hidden" name="notFamilyId" id="notFamilyId" value="${notFamily.id}"/>
            <fieldset>
                <legend>一、被拆迁人情况</legend>
                <table class="table table-bordered">
                    <tbody>
                    <tr>
                        <td class="fieldName">组别：</td>
                        <td class="fieldValue">
                            <tags:dataDictInput dataDict="非宅组别" value="${notFamily.groupCode}" name="groupCode" firstValue="-请选择-" className="required form-control_short"/><span class="require">*</span>
                        </td>
                        <td class="fieldName">编号：</td>
                        <td class="fieldValue">
                            <input type="text" name="familyCode" id="familyCode" class="required form-control_short"
                                   value="${notFamily.familyCode}"/>
                            <span class="require">*</span><span class="require" id="textShow"></span>
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldName">姓名：</td>
                        <td class="fieldValue">
                            <input type="text" name="name" class="required form-control_short" value="${notFamily.name}"/><span
                                class="require">*</span>
                        </td>
                        <td class="fieldName">坐落：</td>
                        <td class="fieldValue"><input type="text" name="address" class="form-control_short" value="${notFamily.address}"/></td>
                    </tr>
                    <tr>
                        <td class="fieldName">登记时间：</td>
                        <td class="fieldValue"><input id="addDate" type="text" class="form-control form-date-time datepicker dateISO"
                                                      name="addDate"
                                                      value="<fmt:formatDate value='${notFamily.addDate}' pattern='yyyy-MM-dd'/>"/></td>
                        <td class="fieldName">签约时间：</td>
                        <td class="fieldValue"><input id="qyDate" type="text" class="form-control form-date-time datepicker dateISO"
                                                      name="qyDate"
                                                      value="<fmt:formatDate value='${notFamily.qyDate}' pattern='yyyy-MM-dd'/>"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldName">签约状态：</td>
                        <td class="fieldValue"><tags:dataDictInput dataDict="签约状态" value="${notFamily.qyState}" name="qyState" className="form-control_short"/></td>
                        <td class="fieldName">地块位置：</td>
                        <td class="fieldValue"><input type="text" name="dkAddress" class="form-control_short" value="${notFamily.dkAddress}"/></td>
                    </tr>
                    <tr>
                        <td class="fieldName">操作人：</td>
                        <td class="fieldValue" <c:if test="${notFamily.operatePerson ne '管理员'}">colspan="3" </c:if>><c:if test="${notFamily.operatePerson ne '管理员'}">${notFamily.operatePerson}</c:if></td>
                        <c:if test="${notFamily.operatePerson eq '管理员'}">
                            <td class="fieldName">显示状态：</td>
                            <td class="fieldValue">
                                <tags:dataDictInput dataDict="显示状态" value="${notFamily.isLive}" name="isLive" className="form-control_short"/>
                            </td>
                        </c:if>
                    </tr>
                    </tbody>
                </table>
            </fieldset>
        <div class="footer">
            <button class="btn btn-primary btn-sm" id="submitButton" type="submit"><i class="fa fa-save"></i>&nbsp;保存</button>
            &nbsp;&nbsp;
            <button class="btn btn-white btn-sm" type="button" onclick="javascript:history.back()"><i class="fa fa-backward"></i>&nbsp;返回</button>
        </div>
    </form>
    <br>
</div>
</body>
<script>
    $(document).ready(function () {
        $("#inputForm").validate({
            rules: {
                familyCode:{
                    remote: "checkRepeat?notFamilyId=${notFamily.id}&_mydate=" + new Date().getTime()
                }
            },
            messages: {
                familyCode: {
                    remote: "编号已经存在"
                }
            }
        });
    });
</script>
</html>
