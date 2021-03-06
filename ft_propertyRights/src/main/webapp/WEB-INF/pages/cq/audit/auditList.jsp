<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>申请家庭信息审核列表</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="title">
    <h5>申请家庭信息审核列表</h5>
</div>
<div class="content">
    <div class="search_content resizeLayout">
        <form class="form-inline" role="form" id="search">
            <div class="form-group">
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">项目名称：</div>
                    <tags:searchDataDict name="projectName" className="form-control" fieldType="string" dataDict="项目名称"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">申请编号</div>
                    <tags:searchInput name="familyCode" className="form-control" fieldType="string" operator="like"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">姓名</div>
                    <tags:searchInput name="name" className="form-control" fieldType="string" operator="like"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">证件号码</div>
                    <tags:searchInput name="idCard" className="form-control" fieldType="string" operator="like"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">学历信息</div>
                    <tags:searchDataDict name="education" className="form-control" fieldType="integer" dataDict="学历层次"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">申请日期：</div>
                    <tags:searchInput name="applyDate" fieldType="date" operator="ge"/>
                    至
                    <tags:searchInput name="applyDate" fieldType="date" operator="le"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">婚姻状况</div>
                    <tags:searchDataDict name="marryStatus" className="form-control" fieldType="integer" dataDict="婚姻状况"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">数据状态</div>
                    <tags:searchDataDict name="dataStatus" className="form-control" fieldType="integer" dataDict="数据状态"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">家庭类型</div>
                    <tags:searchDataDict name="familyType" className="form-control" fieldType="integer" dataDict="家庭类型"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">住房审核状态</div>
                    <tags:searchDataDict name="houseStatus" className="form-control" fieldType="integer" dataDict="审核状态"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">社保审核状态</div>
                    <tags:searchDataDict name="socialStatus" className="form-control" fieldType="integer" dataDict="审核状态"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">婚姻审核状态</div>
                    <tags:searchDataDict name="marriageStatus" className="form-control" fieldType="integer" dataDict="审核状态"/>
                </div>
                <div class="input-group input-group-sm">
                    <div class="input-group-addon">年龄审核状态</div>
                    <tags:searchDataDict name="ageStatus" className="form-control" fieldType="integer" dataDict="审核状态"/>
                </div>
                <button type="submit" class="btn btn-sm btn-primary"><i class="fa fa-search"></i> 查询</button>&nbsp;&nbsp;
                <button class="btn btn-primary btn-sm" type="button" onclick="location.href='batchStatus'"><i class="fa fa-upload"></i> 批量更新审核状态</button>
                <a href="excelAuditTrouble" class="btn btn-primary btn-sm"><i class="fa fa-file-excel-o"></i> 导出审核不通过名单信息</a>&nbsp;&nbsp;
            </div>
        </form>
    </div>
    <table class="table table-bordered table-hover table-striped">
        <thead>
        <tr>
            <th class="text-center" width="5%">序号</th>
            <th class="text-center">项目名称</th>
            <th class="text-center">申请编号</th>
            <th class="text-center">申请人</th>
            <th class="text-center">申请日期</th>
            <th class="text-center">家庭类型</th>
            <th class="text-center">学历信息</th>
            <th class="text-center">婚姻状况</th>
            <th class="text-center">数据状态</th>
            <th class="text-center">住房审核状态</th>
            <th class="text-center">社保审核状态</th>
            <th class="text-center">婚姻审核状态</th>
            <th class="text-center">年龄审核状态</th>
            <th class="text-center">操作</th>
        </tr>
        </thead>
        <c:forEach items="${pageInfo.result}" var="family" varStatus="status">
            <tr>
                <td class="text-center">${status.count}</td>
                <td style="text-align: center;"><tags:dataDict dataDict="项目名称" value="${family.projectName}" /></td>
                <td class="text-center">${family.familyCode}</td>
                <td class="text-center">${family.name}</td>
                <td class="text-center"><fmt:formatDate value="${family.applyDate}" pattern="yyyy年MM月dd日"/></td>
                <td class="text-center"><tags:dataDict dataDict="家庭类型" value="${family.familyType}"/> </td>
                <td class="text-center"><tags:dataDict dataDict="学历层次" value="${family.education}" /></td>
                <td class="text-center"><tags:dataDict dataDict="婚姻状况" value="${family.marryStatus}"/> </td>
                <td class="text-center"><tags:dataDict dataDict="数据状态" value="${family.dataStatus}"/> </td>
                <td class="text-center">
                    <c:if test="${family.houseStatus == 1}">
                        <a href="javaScript:houseHandle(${family.id})"><i class="fa fa-edit"></i>&nbsp;<span
                                style="color: blue;"><tags:dataDict dataDict="审核状态" value="${family.houseStatus}"/></span></a>
                    </c:if>
                    <c:if test="${family.houseStatus == 3}">
                        <a href="javaScript:houseHandle(${family.id})"><i class="fa fa-edit"></i>&nbsp;<span
                                style="color: blue;"><tags:dataDict dataDict="审核状态" value="${family.houseStatus}"/></span></a>
                    </c:if>
                    <c:if test="${family.houseStatus == 2}">
                        <a href="javaScript:houseCancel(${family.id})"><i class="fa fa-edit"></i>&nbsp;<span
                                style="color: blue;"><tags:dataDict dataDict="审核状态" value="${family.houseStatus}"/></span></a>
                    </c:if>
                </td>
                <td class="text-center">
                    <c:if test="${family.socialStatus == 1}">
                        <a href="javaScript:socialHandle(${family.id})"><i class="fa fa-edit"></i>&nbsp;<span
                        style="color: blue;"><tags:dataDict dataDict="审核状态" value="${family.socialStatus}"/></span></a>
                    </c:if>
                    <c:if test="${family.socialStatus == 3}">
                        <a href="javaScript:socialHandle(${family.id})"><i class="fa fa-edit"></i>&nbsp;<span
                        style="color: blue;"><tags:dataDict dataDict="审核状态" value="${family.socialStatus}"/></span></a>
                    </c:if>
                    <c:if test="${family.socialStatus == 2}">
                        <a href="javaScript:socialCancel(${family.id})"><i class="fa fa-edit"></i>&nbsp;<span
                                style="color: blue;"><tags:dataDict dataDict="审核状态" value="${family.socialStatus}"/></span></a>
                    </c:if>
                </td>
                <td class="text-center">
                    <c:if test="${family.marriageStatus == 1}">
                        <a href="javaScript:marryHandle(${family.id})"><i class="fa fa-edit"></i>&nbsp;<span
                                style="color: blue;"><tags:dataDict dataDict="审核状态" value="${family.marriageStatus}"/></span></a>
                    </c:if>
                    <c:if test="${family.marriageStatus == 3}">
                        <a href="javaScript:marryHandle(${family.id})"><i class="fa fa-edit"></i>&nbsp;<span
                                style="color: blue;"><tags:dataDict dataDict="审核状态" value="${family.marriageStatus}"/></span></a>
                    </c:if>
                    <c:if test="${family.marriageStatus == 2}">
                        <a href="javaScript:marryCancel(${family.id})"><i class="fa fa-edit"></i>&nbsp;<span
                                style="color: blue;"><tags:dataDict dataDict="审核状态" value="${family.marriageStatus}"/></span></a>
                    </c:if>
                </td>
                <td class="text-center">
                    <c:if test="${family.ageStatus == 1}">
                        <a href="javaScript:ageHandle(${family.id})"><i class="fa fa-edit"></i>&nbsp;<span
                                style="color: blue;"><tags:dataDict dataDict="审核状态" value="${family.ageStatus}"/></span></a>
                    </c:if>
                    <c:if test="${family.ageStatus == 3}">
                        <a href="javaScript:ageHandle(${family.id})"><i class="fa fa-edit"></i>&nbsp;<span
                                style="color: blue;"><tags:dataDict dataDict="审核状态" value="${family.ageStatus}"/></span></a>
                    </c:if>
                    <c:if test="${family.ageStatus == 2}">
                        <a href="javaScript:ageCancel(${family.id})"><i class="fa fa-edit"></i>&nbsp;<span
                                style="color: blue;"><tags:dataDict dataDict="审核状态" value="${family.ageStatus}"/></span></a>
                    </c:if>
                </td>
                <td class="text-center">
                    <a href='/cq/family/view?familyId=${family.id}&<tags:searchParams/>' title="查看"><i
                            class="fa fa-eye"></i>&nbsp;查看</a>&nbsp;&nbsp;
                </td>
            </tr>
        </c:forEach>
    </table>
    <div class="footer resizeLayout"><tags:pageInfo/></div>
</div>
</body>
<script>
    function houseCancel(familyId) {
        if (confirm("确认修改该家庭审核状态为未通过吗？")) {
            $.get("houseCancel", {familyId: familyId}, function (data) {
                if (data.code == "0000") {
                    location.reload();
                } else {
                    alert(data.message);
                }
            })
        }
    }
    function houseHandle(familyId) {
        if (confirm("确认修改该家庭审核状态为通过吗？")) {
            $.get("houseHandle", {familyId: familyId}, function (data) {
                if (data.code == "0000") {
                    location.reload();
                } else {
                    alert(data.message);
                }
            })
        }
    }
    function socialCancel(familyId) {
        if (confirm("确认修改该家庭审核状态为未通过吗？")) {
            $.get("socialCancel", {familyId: familyId}, function (data) {
                if (data.code == "0000") {
                    location.reload();
                } else {
                    alert(data.message);
                }
            })
        }
    }
    function socialHandle(familyId) {
        if (confirm("确认修改该家庭审核状态为通过吗？")) {
            $.get("socialHandle", {familyId: familyId}, function (data) {
                if (data.code == "0000") {
                    location.reload();
                } else {
                    alert(data.message);
                }
            })
        }
    }
    function marryCancel(familyId) {
        if (confirm("确认修改该家庭审核状态为未通过吗？")) {
            $.get("marryCancel", {familyId: familyId}, function (data) {
                if (data.code == "0000") {
                    location.reload();
                } else {
                    alert(data.message);
                }
            })
        }
    }
    function marryHandle(familyId) {
        if (confirm("确认修改该家庭审核状态为通过吗？")) {
            $.get("marryHandle", {familyId: familyId}, function (data) {
                if (data.code == "0000") {
                    location.reload();
                } else {
                    alert(data.message);
                }
            })
        }
    }
    function ageCancel(familyId) {
        if (confirm("确认修改该家庭审核状态为未通过吗？")) {
            $.get("ageCancel", {familyId: familyId}, function (data) {
                if (data.code == "0000") {
                    location.reload();
                } else {
                    alert(data.message);
                }
            })
        }
    }
    function ageHandle(familyId) {
        if (confirm("确认修改该家庭审核状态为通过吗？")) {
            $.get("ageHandle", {familyId: familyId}, function (data) {
                if (data.code == "0000") {
                    location.reload();
                } else {
                    alert(data.message);
                }
            })
        }
    }

</script>
</html>