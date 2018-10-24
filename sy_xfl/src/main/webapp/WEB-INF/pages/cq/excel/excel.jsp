<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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


        .style0 {
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
            mso-style-name: "常规";
            mso-style-id: 0;
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
<table width="328" border="0" cellpadding="0" cellspacing="0"
       style='width:196.80pt;border-collapse:collapse;table-layout:fixed;'>
    <tr height="58.33" style='height:35.00pt;mso-height-source:userset;mso-height-alt:700;'>
        <td class="xl65" height="58.33" width="704" colspan="${fn:length(theads)+1}"
            style='height:35.00pt;width:422.40pt;border-right:none;border-bottom:none;' x:str>${title}</td>
    </tr>
    <c:set var="index" value=""/>
    <tr height="41.67" style='height:25.00pt;mso-height-source:userset;mso-height-alt:500;'>
        <td class="xl66" height="41.67" width="73" style='height:25.00pt;width:43.80pt;' x:str>序号</td>
        <c:forEach items="${theads}" var="item" varStatus="status">

            <c:if test="${item ne '家庭成员'}">
                <c:if test="${item eq '身份证号码'}">
                    <c:set var="index" value="${status.count}"/>
                </c:if>
                <td class="xl67" width="123.00" style='width:73.80pt;' x:str>${item}</td>
            </c:if>
            <c:if test="${item eq '家庭成员'}">
                <c:set var="familyPersonIndex" value="${status.count}"/>
                <td class="xl67" width="123.00" style='width:73.80pt;' x:str>姓名</td>
                <td class="xl67" width="123.00" style='width:73.80pt;' x:str>性别</td>
                <td class="xl67" width="123.00" style='width:73.80pt;' x:str>身份证号</td>
                <td class="xl67" width="123.00" style='width:73.80pt;' x:str>年龄</td>
                <td class="xl67" width="123.00" style='width:73.80pt;' x:str>与户主关系</td>
                <td class="xl67" width="123.00" style='width:73.80pt;' x:str>婚姻状况</td>
                <td class="xl67" width="123.00" style='width:73.80pt;' x:str>工作单位</td>
                <td class="xl67" width="123.00" style='width:73.80pt;' x:str>是否是独生子女</td>
                <td class="xl67" width="123.00" style='width:73.80pt;' x:str>是否怀孕</td>
                <td class="xl67" width="123.00" style='width:73.80pt;' x:str>户口迁入时间</td>
                <td class="xl67" width="123.00" style='width:73.80pt;' x:str>是否为安置人口</td>
                <td class="xl67" width="123.00" style='width:73.80pt;' x:str>联系方式</td>
                <td class="xl67" width="123.00" style='width:73.80pt;' x:str>现住址</td>
                <td class="xl67" width="123.00" style='width:73.80pt;' x:str>备注</td>
            </c:if>
        </c:forEach>
    </tr>
    <c:if test="${familyPerson eq 'familyPerson'}">
        <c:forEach items="${dataList}" var="data" varStatus="status">
            <c:set var="familyPersonList" value="${data[familyPersonIndex-1]}"/>
            <c:set var="size" value="${fn:length(familyPersonList)}"/>
            <c:forEach var="familyPerson" items="${familyPersonList}" varStatus="fpStatus">
                <tr height="41.67" style='height:25.00pt;mso-height-source:userset;mso-height-alt:500;'>
                    <c:if test="${fpStatus.first}">
                        <td class="xl68" height="41.67" style='height:25.00pt;' rowspan="${size}">${status.count}</td>
                    </c:if>
                    <c:forEach items="${data}" var="item" varStatus="fstatus">
                        <c:if test="${fpStatus.first}">
                            <c:if test="${fstatus.count ne familyPersonIndex}">
                                <c:if test="${theads[fstatus.index] eq '身份证号码' || theads[fstatus.index] eq '出生日期' || fn:contains(theads[fstatus.index],'时间') eq true}">
                                    <td class="xl69" rowspan="${size}" x:str>${item}</td>
                                </c:if>
                                <c:if test="${theads[fstatus.index] ne '身份证号码' && theads[fstatus.index] ne '出生日期' && fn:contains(theads[fstatus.index],'时间') ne true}">
                                    <td class="xl68" rowspan="${size}">${item}</td>
                                </c:if>
                            </c:if>
                        </c:if>
                            <c:if test="${fstatus.count eq familyPersonIndex}">
                                <td class="xl69">${familyPerson.personName}</td>
                                <td class="xl69"><tags:dataDict dataDict="性别" value="${familyPerson.sex}"/></td>
                                <td class="xl69">${familyPerson.idCard}</td>
                                <td class="xl69">${familyPerson.age}</td>
                                <td class="xl69">${familyPerson.relation}</td>
                                <td class="xl69"><tags:dataDict dataDict="婚姻状况" value="${familyPerson.marrType}"/></td>
                                <td class="xl69">${familyPerson.unit}</td>
                                <td class="xl69"><tags:dataDict dataDict="是否" value="${familyPerson.oneType}"/></td>
                                <td class="xl69"><tags:dataDict dataDict="是否" value="${familyPerson.pregnancyType}"/></td>
                                <td class="xl69"><c:set var="qrDate" value="${familyPerson.qrDate}" />${fn:substring(qrDate,0,10)}</td>
                                <td class="xl69"><tags:dataDict dataDict="是否" value="${familyPerson.pregnancyType}"/></td>
                                <td class="xl69">${familyPerson.tel}</td>
                                <td class="xl69">${familyPerson.address}</td>
                                <td class="xl69">${familyPerson.memo}</td>
                            </c:if>
                        </c:forEach>
                </tr>
            </c:forEach>
        </c:forEach>
    </c:if>
    <c:if test="${familyPerson eq ''}">
        <c:forEach items="${dataList}" var="data" varStatus="status">
            <tr height="41.67" style='height:25.00pt;mso-height-source:userset;mso-height-alt:500;'>
                <td class="xl68" height="41.67" style='height:25.00pt;'>${status.count}</td>
                <c:forEach items="${data}" var="item" varStatus="statusItem">
                    <c:set var="num" value="${statusItem.count-1}"/>
                    <c:if test="${theads[num] eq '身份证号码'|| theads[num] eq '出生日期' || fn:contains(theads[num],'时间') eq true}">
                    <td class="xl69">${item}</td>
                    </c:if>
                    <%--处理省份证号码格式问题--%>
                    <c:if test="${theads[num] ne '身份证号码' && theads[num] ne '出生日期' && fn:contains(theads[num],'时间') ne true}">
                        <td class="xl68">${item}</td>
                    </c:if>
                </c:forEach>
            </tr>
        </c:forEach>
    </c:if>
</table>
</body>
</html>
