<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<div class="input-group input-group-sm">
    <div class="input-group-addon">项目名称：</div>
    <tags:searchDataDict name="projectName" className="form-control" fieldType="string" dataDict="项目名称"/>
</div>
<div class="input-group input-group-sm">
    <div class="input-group-addon">申请编号：</div>
    <tags:searchInput name="familyCode" className="form-control" fieldType="string" operator="like"/>
</div>
<div class="input-group input-group-sm">
    <div class="input-group-addon">申请人：</div>
    <tags:searchInput name="name" className="form-control" fieldType="string" operator="like"/>
</div>
<%--<div class="input-group input-group-sm">--%>
    <%--<div class="input-group-addon">证件类型：</div>--%>
    <%--<tags:searchDataDict name="cardType" className="form-control" fieldType="integer" dataDict="证件类型"/>--%>
<%--</div>--%>
<div class="input-group input-group-sm">
    <div class="input-group-addon">证件号码：</div>
    <tags:searchInput name="idCard" className="form-control" fieldType="string" operator="like"/>
</div>
<div class="input-group input-group-sm">
    <div class="input-group-addon">学历信息：</div>
    <tags:searchDataDict name="education" className="form-control" fieldType="integer" dataDict="学历层次"/>
</div>
<div class="input-group input-group-sm">
    <div class="input-group-addon">婚姻状态：</div>
    <tags:searchDataDict name="marryStatus" className="form-control" fieldType="integer" dataDict="婚姻状况"/>
</div>
<div class="input-group input-group-sm">
    <div class="input-group-addon">数据状态：</div>
    <tags:searchDataDict name="dataStatus" className="form-control" fieldType="integer" dataDict="数据状态"/>
</div>
<div class="input-group input-group-sm">
    <div class="input-group-addon">申请日期：</div>
    <tags:searchInput name="applyDate" fieldType="date" operator="ge"/>
    至
    <tags:searchInput name="applyDate" fieldType="date" operator="le"/>
</div>

