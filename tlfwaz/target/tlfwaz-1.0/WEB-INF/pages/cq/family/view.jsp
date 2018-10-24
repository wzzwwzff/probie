<%--
  Created by IntelliJ IDEA.
  User: jmdf
  Date: 2018/9/5
  Time: 14:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <title>家庭数据信息</title>
    <%@include file="/static/common/common.jsp" %>
</head>
<body>
<div class="title">
    <h4 style="color: #0d88cc">家庭信息</h4>
</div>
<div class="content">
        <div class=" doc-content" style="position: relative;">
            <fieldset>
                <legend>一、基本信息</legend>
                <table class="table table-bordered">
                    <tbody>
                    <tr>
                        <td class="fieldName">所属项目：</td>
                        <td class="fieldValue">
                            ${family.project.projectName}
                        </td>
                        <td class="fieldName">所属地块：</td>
                        <td class="fieldValue">
                            ${family.area.areaName}
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldName">档案编号：</td>
                        <td class="fieldValue">
                            ${family.familyCode}
                        </td>
                        <td class="fieldName">姓名：</td>
                        <td class="fieldValue">
                            ${family.name}
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldName">性别：</td>
                        <td class="fieldValue">
                            <div style="float: left">
                                <tags:dataDict value="${family.sex}" dataDict="性别"/>
                            </div>
                        </td>
                        <td class="fieldName">身份证号：</td>
                        <td class="fieldValue">
                            ${family.idCard}
                        </td>
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
                    <tr>
                        <td class="fieldName">补偿款总计：</td>
                        <td class="fieldValue">${family.totalMoney}</td>
                        <td class="fieldName">已选房套数：</td>
                        <td class="fieldValue">${family.houseNum}</td>
                    </tr>
                    <tr>
                        <td class="fieldName">已选房面积：</td>
                        <td class="fieldValue">${family.azArea}</td>
                        <td class="fieldName">购房指标：</td>
                        <td class="fieldValue">${family.gfArea}</td>
                    </tr>
                    <tr>
                        <td class="fieldName">超15㎡内面积：</td>
                        <td class="fieldValue">${family.inArea}</td>
                        <td class="fieldName">超15㎡外面积：</td>
                        <td class="fieldValue">${family.outArea}</td>
                    </tr>
                    <tr>
                        <td class="fieldName">超标内房款(4000／㎡)：</td>
                        <td class="fieldValue">${family.inHouseMoney}</td>
                        <td class="fieldName">超标外房款(6000／㎡)：</td>
                        <td class="fieldValue">${family.outHouseMoney}</td>
                    </tr>
                    <tr>
                        <td class="fieldName">总购房款：</td>
                        <td class="fieldValue">${family.totalHouseMoney}</td>
                        <td class="fieldName">签约日期：</td>
                        <td class="fieldValue">
                            <fmt:formatDate value="${family.signDate}" pattern="yyyy-MM-dd" />
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldName">回迁日期：</td>
                        <td class="fieldValue">
                            <fmt:formatDate value="${family.moveBackDate}" pattern="yyyy-MM-dd" />
                        </td>
                        <td class="fieldName">选房批次：</td>
                        <td class="fieldValue">${family.xfBatch}</td>
                    </tr>
                    <tr>
                        <td class="fieldName">选房状态：</td>
                        <td class="fieldValue"><tags:dataDict dataDict="选房状态" value="${family.xfStatus}"/> </td>
                        <td class="fieldName">选房日期：</td>
                        <td class="fieldValue">
                            <fmt:formatDate value="${family.xfDate}" pattern="yyyy-MM-dd" />
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldName">选房顺序号：</td>
                        <td class="fieldValue">${family.xfNum}</td>
                        <td class="fieldName">认购协议打印日期：</td>
                        <td class="fieldValue">
                            <fmt:formatDate value="${family.xyPrintDate}" pattern="yyyy-MM-dd" />
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldName">结算状态：</td>
                        <td class="fieldValue"><tags:dataDict dataDict="结算状态" value="${family.jsStatus}"/></td>
                        <td class="fieldName">结算日期：</td>
                        <td class="fieldValue">
                            <fmt:formatDate value="${family.jsDate}" pattern="yyyy-MM-dd" />
                        </td>
                    </tr>
                    <tr>
                        <td class="fieldName">结算经办人：</td>
                        <td class="fieldValue">${family.jsPerson}</td>
                        <td class="fieldName">备注：</td>
                        <td class="fieldValue">
                            ${family.memo}
                        </td>
                    </tr>
                    </tbody>
                </table>
            </fieldset>
            <fieldset>
                <legend>二、家庭成员信息</legend>
                <%--<table class="table table-bordered">--%>
                <%--<tbody>--%>
                <%--<tr>--%>
                <%--<td class="fieldName">家庭人口数：</td>--%>
                <%--<td class="fieldValue" colspan="3"><input type="text" name="count" id="count" value="${family.count}" readonly class="form-control"--%>
                <%--style="width: 5em"/></td>--%>
                <%--</tr>--%>
                <%--</tbody>--%>
                <%--</table>--%>
                <table class="table table-bordered" id="personTable" style="margin-top: -5px;">
                    <thead>
                    <tr>
                        <th class="text-center">姓名</th>
                        <th class="text-center">性别</th>
                        <th class="text-center">证件号码</th>
                        <th class="text-center">联系电话</th>
                        <th class="text-center">关系</th>
                        <th class="text-center">户口所在地</th>
                        <th class="text-center">在册/非在册</th>
                        <th class="text-center">备注</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:set value="${-1}" var="countFamilyP" />
                    <c:forEach begin="0" end="${fn:length(familyPersonList)}" var="i" varStatus="status">
                        <tr>
                            <c:set value="${countFamilyP + 1}" var="countFamilyP" />
                            <input type="hidden" class="form-control" name="pId" value="${familyPersonList[i].id}"/>
                            <td align="center">
                                ${familyPersonList[i].pName}
                            </td>
                            <td align="center">
                                <tags:dataDict value="${familyPersonList[i].pSex}" dataDict="性别"/>
                            </td>
                            <td align="center">
                                ${familyPersonList[i].pIdCard}
                            </td>
                            <td align="center">
                                ${familyPersonList[i].pPhone}
                            </td>
                            <td align="center">
                                ${familyPersonList[i].pRelation}
                            </td>
                            <td align="center">
                                ${familyPersonList[i].pAddress}
                            </td>
                            <td align="center">
                                <tags:dataDict value="${familyPersonList[i].isRegistered}" dataDict="在册/非在册"/>
                            </td>
                            <td align="center">
                                ${familyPersonList[i].pMemo}
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </fieldset>
            <br />
            <div class="footer">
                <button onclick="history.back()" type="button" class="btn btn-white"><i class="fa fa-backward"></i> 返 回
                </button>
            </div>
        </div>
</div>
</body>
</html>