<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%
    //设置浏览器识别
    response.setContentType("application/msexcel;charset=utf-8");
    //设置文件的名称
    String fileName = (String) request.getAttribute("fileName");
    //将文件名称转为iso8859-1编码，防止乱码
    fileName = new String(fileName.getBytes("gbk"), "ISO-8859-1");
    //设置导出弹出框
    response.addHeader("content-disposition", "fileName=" + fileName + ".xls");
%>
<html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office"
      xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="ProgId" content="Excel.Sheet"/>
    <meta name="Generator" content="WPS Office ET"/>
    <style>
        <!--
        @page {
            margin: 0.75in 0.71in 0.75in 0.71in;
            mso-header-margin: 0.32in;
            mso-footer-margin: 0.32in;
        }

        tr {
            mso-height-source: auto;
            mso-ruby-visibility: none;
        }

        col {
            mso-width-source: auto;
            mso-ruby-visibility: none;
        }

        br {
            mso-data-placement: same-cell;
        }

        td {
            mso-style-parent: style0;
            padding-top: 1px;
            padding-right: 1px;
            padding-left: 1px;
            mso-ignore: padding;
            mso-number-format: "General";
            text-align: general;
            vertical-align: middle;
            white-space: nowrap;
            mso-rotate: 0;
            mso-pattern: auto;
            mso-background-source: auto;
            color: #000000;
            font-size: 11.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: 宋体;
            mso-generic-font-family: auto;
            mso-font-charset: 134;
            border: none;
            mso-protection: locked visible;
        }

        .xl65 {
            mso-style-parent: style0;
            text-align: center;
            font-size: 14.0pt;
            font-weight: 700;
            mso-font-charset: 134;
        }

        .xl66 {
            mso-style-parent: style0;
            text-align: center;
            mso-pattern: auto none;
            background: #A6A6A6;
            mso-font-charset: 134;
            border: .5pt solid windowtext;
        }

        .xl67 {
            mso-style-parent: style0;
            mso-number-format: "\@";
            text-align: center;
            mso-pattern: auto none;
            background: #A6A6A6;
            mso-font-charset: 134;
            border: .5pt solid windowtext;
        }

        .xl68 {
            mso-style-parent: style0;
            text-align: center;
            mso-font-charset: 134;
            border: .5pt solid windowtext;
        }

        .xl69 {
            mso-style-parent: style0;
            mso-number-format: "\@";
            text-align: center;
            mso-font-charset: 134;
            border: .5pt solid windowtext;
        }
        -->  </style>
</head>
<body link="blue" vlink="purple">
<table width="328" border="0" cellpadding="0" cellspacing="0" style='width:196.80pt;border-collapse:collapse;table-layout:fixed;'>
    <tr height="58.33" style='height:35.00pt;mso-height-source:userset;mso-height-alt:700;'>
        <c:if test="${familyPerson eq 'familyPerson' && houseInfo eq 'houseInfo'}">
            <td class="xl65" height="58.33" width="704" colspan="${fn:length(theads)+24}" style='height:35.00pt;width:422.40pt;border-right:none;border-bottom:none;' x:str>${title}</td>
        </c:if>
        <c:if test="${familyPerson eq 'familyPerson' && houseInfo eq ''}">
            <td class="xl65" height="58.33" width="704" colspan="${fn:length(theads)+11}" style='height:35.00pt;width:422.40pt;border-right:none;border-bottom:none;' x:str>${title}</td>
        </c:if>
        <c:if test="${familyPerson eq '' && houseInfo eq 'houseInfo'}">
            <td class="xl65" height="58.33" width="704" colspan="${fn:length(theads)+12}" style='height:35.00pt;width:422.40pt;border-right:none;border-bottom:none;' x:str>${title}</td>
        </c:if>
        <c:if test="${familyPerson eq '' && houseInfo eq ''}">
            <td class="xl65" height="58.33" width="704" colspan="${fn:length(theads)+1}" style='height:35.00pt;width:422.40pt;border-right:none;border-bottom:none;' x:str>${title}</td>
        </c:if>
    </tr>
    <c:set var="index" value=""/>
    <tr height="41.67" style='height:25.00pt;mso-height-source:userset;mso-height-alt:500;'>
        <td class="xl66" height="41.67" width="73" style='height:25.00pt;width:43.80pt;' x:str>序号</td>
        <c:forEach items="${theads}" var="item" varStatus="status">
            <c:if test="${item ne '家庭成员' && item ne '房源信息'}">
                <c:if test="${item eq '身份证号'}">
                    <c:set var="index" value="${status.count}"/>
                </c:if>
                <td class="xl67" width="123.00" style='width:73.80pt;' x:str>${item}</td>
            </c:if>
            <c:if test="${item eq '家庭成员'}">
                <c:set var="familyIndex" value="${status.count}"/>
                <td class="xl67" width="123.00" style='width:73.80pt;' x:str>姓名</td>
                <td class="xl67" width="123.00" style='width:73.80pt;' x:str>性别</td>
                <td class="xl67" width="123.00" style='width:73.80pt;' x:str>年龄</td>
                <td class="xl67" width="123.00" style='width:73.80pt;' x:str>身份证号</td>
                <td class="xl67" width="123.00" style='width:73.80pt;' x:str>联系电话</td>
                <td class="xl67" width="123.00" style='width:73.80pt;' x:str>与关系</td>
                <td class="xl67" width="123.00" style='width:73.80pt;' x:str>户口所在地</td>
                <td class="xl67" width="123.00" style='width:73.80pt;' x:str>户籍类型</td>
                <td class="xl67" width="123.00" style='width:73.80pt;' x:str>在册/非在册</td>
                <td class="xl67" width="123.00" style='width:73.80pt;' x:str>生活状态</td>
                <td class="xl67" width="123.00" style='width:73.80pt;' x:str>备注</td>
            </c:if>
            <c:if test="${item eq '房源信息'}">
                <c:set var="houseIndex" value="${status.count}"/>
                <td class="xl67" width="123.00" style='width:73.80pt;' x:str>楼号</td>
                <td class="xl67" width="123.00" style='width:73.80pt;' x:str>单元</td>
                <td class="xl67" width="123.00" style='width:73.80pt;' x:str>房间号</td>
                <td class="xl67" width="123.00" style='width:73.80pt;' x:str>户型</td>
                <td class="xl67" width="123.00" style='width:73.80pt;' x:str>房屋建筑面积</td>
                <td class="xl67" width="123.00" style='width:73.80pt;' x:str>单价</td>
                <td class="xl67" width="123.00" style='width:73.80pt;' x:str>房屋状态</td>
                <%--<td class="xl67" width="123.00" style='width:73.80pt;' x:str>被选日期</td>--%>
                <%--<td class="xl67" width="123.00" style='width:73.80pt;' x:str>操作人员</td>--%>
                <%--<td class="xl67" width="123.00" style='width:73.80pt;' x:str>操作日期</td>--%>
                <td class="xl67" width="123.00" style='width:73.80pt;' x:str>购房人</td>
                <td class="xl67" width="123.00" style='width:73.80pt;' x:str>购房人身份证号</td>
                <td class="xl67" width="123.00" style='width:73.80pt;' x:str>入住状态</td>
                <%--<td class="xl67" width="123.00" style='width:73.80pt;' x:str>入住经办人</td>--%>
                <td class="xl67" width="123.00" style='width:73.80pt;' x:str>入住日期</td>
                <td class="xl67" width="123.00" style='width:73.80pt;' x:str>备注</td>
            </c:if>
        </c:forEach>
    </tr>

    <%--有房源信息和购房信息--%>
    <c:if test="${familyPerson eq 'familyPerson' && houseInfo eq 'houseInfo'}">
        <c:forEach items="${dataList}" var="data" varStatus="status">
            <c:set var="familyPersonList" value="${data[familyIndex-1]}"/>
            <c:set var="houseList" value="${data[houseIndex-1]}"/>
            <c:set var = "fpSize" value="${fn:length(familyPersonList)}"/>
            <c:set var = "houseSize" value="${fn:length(houseList)}"/>
            <c:set var="size" value="${fpSize gt houseSize ? fpSize : houseSize}"/>
            <c:if test="${fpSize ge houseSize}">
                <c:forEach var="familyPerson" items="${familyPersonList}" varStatus="fpStatus">
                    <c:set var="house" value="${houseList[fpStatus.count-1]}"/>
                    <tr height="41.67" style='height:25.00pt;mso-height-source:userset;mso-height-alt:500;'>
                        <c:if test="${fpStatus.first}">
                            <td class="xl68" height="41.67" style='height:25.00pt;' rowspan="${size}">${status.count}</td>
                            <c:forEach items="${data}" var="item" varStatus="fstatus">
                                <c:if test="${fstatus.count lt familyIndex}">
                                    <td class="xl69" rowspan="${size}" x:str>${item}</td>
                                </c:if>
                            </c:forEach>
                        </c:if>
                        <td class="xl69">${familyPerson.pName}</td>
                        <td class="xl69"><tags:dataDict dataDict="性别" value="${familyPerson.pSex}"/></td>
                        <td class="xl69">${familyPerson.age}</td>
                        <td class="xl69">${familyPerson.pIdCard}</td>
                        <td class="xl69">${familyPerson.pPhone}</td>
                        <td class="xl69">${familyPerson.pRelation}</td>
                        <td class="xl69">${familyPerson.pAddress}</td>
                        <td class="xl69"><tags:dataDict dataDict="户籍类型" value="${familyPerson.addressType}"/></td>
                        <td class="xl69"><tags:dataDict dataDict="在册/非在册" value="${familyPerson.isRegistered}"/></td>
                        <td class="xl69">${familyPerson.liveStatus}</td>
                        <td class="xl69">${familyPerson.pMemo}</td>
                        <c:if test="${fpStatus.first}">
                            <c:forEach items="${data}" var="item" varStatus="fstatus">
                                <c:if test="${fstatus.count gt familyIndex && fstatus.count lt houseIndex}">
                                    <td class="xl69" rowspan="${size}" x:str>${item}</td>
                                </c:if>
                            </c:forEach>
                        </c:if>
                        <td class="xl69">${house.buildNum}
                            <c:if test="${house.isSpecial eq 1}">
                            （原房号：${house.houseNumAll}）
                            </c:if></td>
                        <td class="xl69">${house.unitNum}</td>
                        <td class="xl69">${house.houseNum}</td>
                        <td class="xl69"><tags:dataDict dataDict="户型" value="${house.houseType}"/> </td>
                        <td class="xl69">${house.buildArea}</td>
                        <td class="xl69">${house.price}</td>
                        <td class="xl69"><tags:dataDict dataDict="房屋状态" value="${house.houseStatus}"/></td>
                        <%--<td class="x169" x:str><fmt:formatDate value="${house.chooseDate}" pattern="yyyy-MM-dd"/></td>--%>
                        <%--<td class="xl69">${house.opName}</td>--%>
                        <%--<td class="xl69" x:str><fmt:formatDate value="${house.opDate}" pattern="yyyy-MM-dd"/></td>--%>
                        <td class="xl69">${house.hPerson}</td>
                        <td class="xl69">${house.hIdCard}</td>
                        <td class="xl69"><tags:dataDict dataDict="入住状态" value="${house.rzStatus}"/></td>
                        <%--<td class="xl69">${house.rzName}</td>--%>
                        <td class="xl69" x:str><fmt:formatDate value="${house.rzDate}" pattern="yyyy-MM-dd"/></td>
                        <td class="xl69">${house.memo}</td>
                    </tr>
                </c:forEach>
            </c:if>
            <c:if test="${fpSize lt houseSize}">
                <c:forEach var="house" items="${houseList}" varStatus="fpStatus">
                    <c:set var="familyPerson" value="${familyPersonList[fpStatus.count-1]}"/>
                    <tr height="41.67" style='height:25.00pt;mso-height-source:userset;mso-height-alt:500;'>
                        <c:if test="${fpStatus.first}">
                            <td class="xl68" height="41.67" style='height:25.00pt;' rowspan="${size}">${status.count}</td>
                            <c:forEach items="${data}" var="item" varStatus="fstatus">
                                <c:if test="${fstatus.count lt familyIndex}">
                                    <td class="xl69" rowspan="${size}" x:str>${item}</td>
                                </c:if>
                            </c:forEach>
                        </c:if>
                        <td class="xl69">${familyPerson.pName}</td>
                        <td class="xl69"><tags:dataDict dataDict="性别" value="${familyPerson.pSex}"/></td>
                        <td class="xl69">${familyPerson.age}</td>
                        <td class="xl69">${familyPerson.pIdCard}</td>
                        <td class="xl69">${familyPerson.pPhone}</td>
                        <td class="xl69">${familyPerson.pRelation}</td>
                        <td class="xl69">${familyPerson.pAddress}</td>
                        <td class="xl69"><tags:dataDict dataDict="户籍类型" value="${familyPerson.addressType}"/></td>
                        <td class="xl69"><tags:dataDict dataDict="在册/非在册" value="${familyPerson.isRegistered}"/></td>
                        <td class="xl69">${familyPerson.liveStatus}</td>
                        <td class="xl69">${familyPerson.pMemo}</td>
                        <c:if test="${fpStatus.first}">
                            <c:forEach items="${data}" var="item" varStatus="fstatus">
                                <c:if test="${fstatus.count gt familyIndex && fstatus.count lt houseIndex}">
                                    <td class="xl69" rowspan="${size}" x:str>${item}</td>
                                </c:if>
                            </c:forEach>
                        </c:if>
                        <td class="xl69">${house.buildNum}
                            <c:if test="${house.isSpecial eq 1}">
                            （原房号：${house.houseNumAll}）
                            </c:if></td>
                        <td class="xl69">${house.unitNum}</td>
                        <td class="xl69">${house.houseNum}</td>
                        <td class="xl69"><tags:dataDict dataDict="户型" value="${house.houseType}"/> </td>
                        <td class="xl69">${house.buildArea}</td>
                        <td class="xl69">${house.price}</td>
                        <td class="xl69"><tags:dataDict dataDict="房屋状态" value="${house.houseStatus}"/></td>
                        <%--<td class="x169" x:str><fmt:formatDate value="${house.chooseDate}" pattern="yyyy-MM-dd"/></td>--%>
                        <%--<td class="xl69">${house.opName}</td>--%>
                        <%--<td class="x169" x:str><fmt:formatDate value="${house.opDate}" pattern="yyyy-MM-dd"/></td>--%>
                        <td class="xl69">${house.hPerson}</td>
                        <td class="xl69">${house.hIdCard}</td>
                        <td class="xl69"><tags:dataDict dataDict="入住状态" value="${house.rzStatus}"/></td>
                        <%--<td class="xl69">${house.rzName}</td>--%>
                        <td class="x169" x:str><fmt:formatDate value="${house.rzDate}" pattern="yyyy-MM-dd"/></td>
                        <td class="xl69">${house.memo}</td>
                    </tr>
                </c:forEach>
            </c:if>
        </c:forEach>
    </c:if>

    <%--//只有家庭信息--%>
    <c:if test="${familyPerson eq 'familyPerson' && houseInfo eq ''}">
        <c:forEach items="${dataList}" var="data" varStatus="status">
            <c:set var="familyPersonList" value="${data[familyIndex-1]}"/>
            <c:set var="size" value="${fn:length(familyPersonList)}"/>
            <c:forEach var="familyPerson" items="${familyPersonList}" varStatus="fpStatus">
                <tr height="41.67" style='height:25.00pt;mso-height-source:userset;mso-height-alt:500;'>
                    <c:if test="${fpStatus.first}">
                        <td class="xl68" height="41.67" style='height:25.00pt;' rowspan="${size}">${status.count}</td>
                        <c:forEach items="${data}" var="item" varStatus="fstatus">
                            <c:if test="${fstatus.count lt familyIndex}">
                                <td class="xl69" rowspan="${size}" x:str>${item}</td>
                            </c:if>
                        </c:forEach>
                    </c:if>
                    <td class="xl69">${familyPerson.pName}</td>
                    <td class="xl69"><tags:dataDict dataDict="性别" value="${familyPerson.pSex}"/></td>
                    <td class="xl69">${familyPerson.age}</td>
                    <td class="xl69">${familyPerson.pIdCard}</td>
                    <td class="xl69">${familyPerson.pPhone}</td>
                    <td class="xl69">${familyPerson.pRelation}</td>
                    <td class="xl69">${familyPerson.pAddress}</td>
                    <td class="xl69"><tags:dataDict dataDict="户籍类型" value="${familyPerson.addressType}"/></td>
                    <td class="xl69"><tags:dataDict dataDict="在册/非在册" value="${familyPerson.isRegistered}"/></td>
                    <td class="xl69">${familyPerson.liveStatus}</td>
                    <td class="xl69">${familyPerson.pMemo}</td>
                    <c:if test="${fpStatus.first}">
                        <c:forEach items="${data}" var="item" varStatus="fstatus">
                            <c:if test="${fstatus.count gt familyIndex}">
                                <td class="xl69" rowspan="${size}" x:str>${item}</td>
                            </c:if>
                        </c:forEach>
                    </c:if>
                </tr>
            </c:forEach>
        </c:forEach>
    </c:if>

    <%--只有房源信息--%>
    <c:if test="${familyPerson eq '' && houseInfo eq 'houseInfo'}">
        <c:forEach items="${dataList}" var="data" varStatus="status">
            <c:set var="houseList" value="${data[houseIndex-1]}"/>
            <c:set var="size" value="${fn:length(houseList)}"/>
            <c:forEach var="house" items="${houseList}" varStatus="fpStatus">
                <tr height="41.67" style='height:25.00pt;mso-height-source:userset;mso-height-alt:500;'>
                    <c:if test="${fpStatus.first}">
                        <td class="xl68" height="41.67" style='height:25.00pt;' rowspan="${size}">${status.count}</td>
                        <c:forEach items="${data}" var="item" varStatus="fstatus">
                            <c:if test="${fstatus.count lt houseIndex}">
                                <td class="xl69" rowspan="${size}" x:str>${item}</td>
                            </c:if>
                        </c:forEach>
                    </c:if>
                    <td class="xl69">${house.buildNum}
                        <c:if test="${house.isSpecial eq 1}">
                        （原房号：${house.houseNumAll}）
                        </c:if></td>
                    <td class="xl69">${house.unitNum}</td>
                    <td class="xl69">${house.houseNum}</td>
                    <td class="xl69"><tags:dataDict dataDict="户型" value="${house.houseType}"/> </td>
                    <td class="xl69">${house.buildArea}</td>
                    <td class="xl69">${house.price}</td>
                    <td class="xl69"><tags:dataDict dataDict="房屋状态" value="${house.houseStatus}"/></td>
                    <%--<td class="x169" x:str><fmt:formatDate value="${house.chooseDate}" pattern="yyyy-MM-dd"/></td>--%>
                    <%--<td class="xl69">${house.opName}</td>--%>
                    <%--<td class="x169" x:str><fmt:formatDate value="${house.opDate}" pattern="yyyy-MM-dd"/></td>--%>
                    <td class="xl69">${house.hPerson}</td>
                    <td class="xl69">${house.hIdCard}</td>
                    <td class="xl69"><tags:dataDict dataDict="入住状态" value="${house.rzStatus}"/></td>
                    <%--<td class="xl69">${house.rzName}</td>--%>
                    <td class="x169" x:str><fmt:formatDate value="${house.rzDate}" pattern="yyyy-MM-dd"/></td>
                    <td class="xl69">${house.memo}</td>
                </tr>
            </c:forEach>
        </c:forEach>
    </c:if>

    <%--//房源信息和家庭信息都未选--%>
    <c:if test="${familyPerson eq '' && houseInfo eq ''}">
        <c:forEach items="${dataList}" var="data" varStatus="status">
            <tr height="41.67" style='height:25.00pt;mso-height-source:userset;mso-height-alt:500;'>
                <td class="xl68" height="41.67" style='height:25.00pt;'>${status.count}</td>
                <c:forEach items="${data}" var="item" varStatus="statusItem">
                    <c:if test="${statusItem.count ne index}">
                    <td class="xl69">${item}</td>
                </c:if>
                    <%--处理省份证号码格式问题--%>
                    <c:if test="${statusItem.count eq index}">
                        <td class="xl68" x:str>${item}</td>
                    </c:if>
                </c:forEach>
            </tr>
        </c:forEach>
    </c:if>
</table>
</body>
</html>
