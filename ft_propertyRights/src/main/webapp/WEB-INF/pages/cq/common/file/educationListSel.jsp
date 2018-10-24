<%--
  Created by IntelliJ IDEA.
  User: jmdf
  Date: 2018/8/24
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<div class="input-group input-group-sm">
    <div class="input-group-addon">姓名：</div>
    <tags:searchInput name="name" className="form-control" fieldType="string" operator="like"/>
</div>
<div class="input-group input-group-sm">
    <div class="input-group-addon">更新日期：</div>
    <tags:searchInput name="updateDate" fieldType="date" operator="ge"/>
    至
    <tags:searchInput name="updateDate" fieldType="date" operator="le"/>
</div>
<div class="input-group input-group-sm">
    <div class="input-group-addon">学历类别：</div>
    <tags:searchInput name="educationCategory" className="form-control" fieldType="string" operator="like"/>
</div>
<div class="input-group input-group-sm">
    <div class="input-group-addon">性别：</div>
    <tags:searchDataDict name="sex" className="form-control" fieldType="integer" dataDict="性别"/>
</div>
<div class="input-group input-group-sm">
    <div class="input-group-addon">学历层次：</div>
    <tags:searchInput name="level" className="form-control" fieldType="string" operator="like"/>
</div>
<div class="input-group input-group-sm">
    <div class="input-group-addon">学习形式：</div>
    <tags:searchInput name="learning" className="form-control" fieldType="string" operator="like"/>
</div>

