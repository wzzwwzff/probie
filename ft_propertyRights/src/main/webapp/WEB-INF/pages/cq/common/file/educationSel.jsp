<%--
  Created by IntelliJ IDEA.
  User: jmdf
  Date: 2018/8/16
  Time: 18:01
  To change this template use File | Settings | File Templates.
--%>
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
<div class="input-group input-group-sm">
    <div class="input-group-addon">学历信息：</div>
    <tags:searchDataDict name="education" className="form-control" fieldType="integer" dataDict="学历层次"/>
</div>
<div class="input-group input-group-sm">
    <div class="input-group-addon">家庭类型：</div>
    <tags:searchDataDict name="familyType" className="form-control" fieldType="integer" dataDict="家庭类型"/>
</div>
<div class="input-group input-group-sm">
    <div class="input-group-addon">婚姻状态：</div>
    <tags:searchDataDict name="marryStatus" className="form-control" fieldType="integer" dataDict="婚姻状况"/>
</div>
<div class="input-group input-group-sm">
    <div class="input-group-addon">学历复核状态：</div>
    <tags:searchDataDict name="educationStatus" className="form-control" fieldType="integer" dataDict="审核状态"/>
</div>
<div class="input-group input-group-sm">
    <div class="input-group-addon">其他复核状态：</div>
    <tags:searchDataDict name="otherStatus" className="form-control" fieldType="integer" dataDict="审核状态"/>
</div>

