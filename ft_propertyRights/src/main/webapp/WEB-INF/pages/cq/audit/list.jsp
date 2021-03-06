<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <meta charset="UTF-8">
    <title>申请家庭信息资格核验列表</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body style="overflow: hidden;">
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
                        <div class="input-group-addon">家庭类型</div>
                        <tags:searchDataDict name="familyType" className="form-control" fieldType="integer" dataDict="家庭类型"/>
                    </div>
                    <div class="input-group input-group-sm">
                        <div class="input-group-addon">学历信息</div>
                        <tags:searchDataDict name="education" className="form-control" fieldType="integer" dataDict="学历层次"/>
                    </div>
                    <div class="input-group input-group-sm">
                        <div class="input-group-addon">婚姻状况</div>
                        <tags:searchDataDict name="marryStatus" className="form-control" fieldType="integer" dataDict="婚姻状况"/>
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
                    <div class="input-group input-group-sm">
                        <div class="input-group-addon">学历复核状态：</div>
                        <tags:searchDataDict name="educationStatus" className="form-control" fieldType="integer" dataDict="审核状态"/>
                    </div>
                    <div class="input-group input-group-sm">
                        <div class="input-group-addon">其他复核状态：</div>
                        <tags:searchDataDict name="otherStatus" className="form-control" fieldType="integer" dataDict="审核状态"/>
                    </div>
                    <button class="btn btn-primary btn-sm" type="submit"><i class="fa fa-search"></i> 查询</button>
                </div>
            </form>
        </div>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th style="text-align: center;" width="5%">序号</th>
                <th style="text-align: center;">项目名称</th>
                <th style="text-align: center;">申请编号</th>
                <th style="text-align: center;">申请人</th>
                <th style="text-align: center;">申请日期</th>
                <th style="text-align: center;">家庭类型</th>
                <th style="text-align: center;">学历信息</th>
                <th style="text-align: center;">婚姻状态</th>
                <th style="text-align: center;">住房审核状态</th>
                <th style="text-align: center;">社保审核状态</th>
                <th style="text-align: center;">婚姻审核状态</th>
                <th style="text-align: center;">年龄审核状态</th>
                <th style="text-align: center;">学历复核状态</th>
                <th style="text-align: center;">其他复核状态</th>
                <th style="text-align: center;">操作</th>
            </tr>
            </thead>
            <tbody>
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
                    <td class="text-center"><tags:dataDict dataDict="审核状态" value="${family.houseStatus}"/></td>
                    <td class="text-center"><tags:dataDict dataDict="审核状态" value="${family.socialStatus}"/></td>
                    <td class="text-center"><tags:dataDict dataDict="审核状态" value="${family.marriageStatus}"/></td>
                    <td class="text-center"><tags:dataDict dataDict="审核状态" value="${family.ageStatus}"/></td>
                    <td class="text-center"><tags:dataDict dataDict="审核状态" value="${family.educationStatus}"/></td>
                    <td class="text-center"><tags:dataDict dataDict="审核状态" value="${family.otherStatus}"/></td>
                    <td class="text-center">
                        <a href='/cq/family/view?familyId=${family.id}&<tags:searchParams/>' title="查看"><i
                                class="fa fa-eye"></i>&nbsp;查看</a>&nbsp;&nbsp;
                        <c:if test="${family.otherStatus == 3 || family.educationStatus ==3 || family.ageStatus ==3 || family.marriageStatus == 3 || family.socialStatus == 3 || family.houseStatus == 3}">
                            <a href="/cq/family/checkStatusForm?familyId=${family.id}&<tags:searchParams></tags:searchParams>"><i class="fa fa-edit"></i>修改</a>&nbsp;&nbsp;
                        </c:if>
                    </td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    <div class="footer resizeLayout"><tags:pageInfo/></div>
</div>
</body>
</html>