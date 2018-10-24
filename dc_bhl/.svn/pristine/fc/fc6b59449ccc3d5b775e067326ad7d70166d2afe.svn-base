<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.sqds.utils.DateUtils" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //设置浏览器识别
    response.setContentType("application/msexcel;charset=utf-8");
    //设置文件的名称
    String fileName = "住宅标准自建房信息台账";
    String currentDate = DateUtils.date2string("yyyy-MM-dd", new Date());
    //将文件名称转为iso8859-1编码，防止乱码
    fileName = new String(fileName.getBytes("gbk"), "ISO-8859-1");
    //设置导出弹出框
    response.addHeader("content-disposition", "fileName= " + fileName + "" + currentDate + ".xls");
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
            margin: 0.98in 0.75in 0.98in 0.75in;
            mso-header-margin: 0.51in;
            mso-footer-margin: 0.51in;
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
            color: windowtext;
            font-size: 12.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: 宋体;
            mso-font-charset: 134;
            border: none;
            mso-protection: locked visible;
        }

        .xl65 {
            mso-style-parent: style0;
            white-space: normal;
            mso-font-charset: 134;
        }

        .xl66 {
            mso-style-parent: style0;
            text-align: center;
            white-space: normal;
            mso-font-charset: 134;
        }

        .xl67 {
            mso-style-parent: style0;
            mso-number-format: "0\.00_ ";
            text-align: center;
            white-space: normal;
            mso-font-charset: 134;
        }

        .xl68 {
            mso-style-parent: style0;
            text-align: center;
            white-space: normal;
            mso-font-charset: 134;
        }

        .xl69 {
            mso-style-parent: style0;
            text-align: left;
            white-space: normal;
            font-size: 22.0pt;
            font-weight: 700;
            mso-font-charset: 134;
            border: .5pt solid windowtext;
        }

        .xl70 {
            mso-style-parent: style0;
            text-align: center;
            white-space: normal;
            mso-pattern: auto none;
            background: #C0C0C0;
            mso-font-charset: 134;
            border: .5pt solid windowtext;
        }

        .xl71 {
            mso-style-parent: style0;
            text-align: center;
            white-space: normal;
            mso-pattern: auto none;
            background: #C0C0C0;
            mso-font-charset: 134;
            border-left: .5pt solid windowtext;
            border-top: .5pt solid windowtext;
            border-right: .5pt solid windowtext;
        }

        .xl73 {
            mso-style-parent: style0;
            text-align: center;
            white-space: normal;
            mso-font-charset: 134;
            border: .5pt solid windowtext;
        }

        .xl74 {
            mso-style-parent: style0;
            text-align: center;
            white-space: normal;
            mso-font-charset: 134;
            border-left: .5pt solid windowtext;
            border-top: .5pt solid windowtext;
            border-right: .5pt solid windowtext;
        }

        .xl75 {
            mso-style-parent: style0;
            mso-number-format: "\@";
            text-align: center;
            white-space: normal;
            mso-font-charset: 134;
            border: .5pt solid windowtext;
        }

        .xl81 {
            mso-style-parent: style0;
            text-align: center;
            white-space: normal;
            mso-pattern: auto none;
            background: #C0C0C0;
            mso-font-charset: 134;
            border-left: .5pt solid windowtext;
            border-top: .5pt solid windowtext;
            border-bottom: .5pt solid windowtext;
        }

        .xl85 {
            mso-style-parent: style0;
            text-align: center;
            white-space: normal;
            mso-pattern: auto none;
            background: #BFBFBF;
            mso-font-charset: 134;
            border: .5pt solid windowtext;
        }

        .xl86 {
            mso-style-parent: style0;
            text-align: center;
            white-space: normal;
            mso-pattern: auto none;
            background: #C0C0C0;
            mso-font-charset: 134;
            border: .5pt solid windowtext;
        }

        .xl87 {
            mso-style-parent: style0;
            mso-number-format: "0\.00_ ";
            text-align: center;
            white-space: normal;
            mso-pattern: auto none;
            background: #C0C0C0;
            mso-font-charset: 134;
            border: .5pt solid windowtext;
        }

        .xl88 {
            mso-style-parent: style0;
            text-align: center;
            white-space: normal;
            mso-pattern: auto none;
            background: #C0C0C0;
            mso-font-charset: 134;
            border: .5pt solid windowtext;
        }

        .xl89 {
            mso-style-parent: style0;
            text-align: center;
            white-space: normal;
            mso-pattern: auto none;
            background: #BFBFBF;
            color: #333333;
            mso-font-charset: 134;
            border: .5pt solid windowtext;
        }

        .xl90 {
            mso-style-parent: style0;
            text-align: center;
            white-space: normal;
            mso-font-charset: 134;
            border: .5pt solid windowtext;
        }

        .xl91 {
            mso-style-parent: style0;
            mso-number-format: "0\.00_ ";
            text-align: center;
            white-space: normal;
            mso-font-charset: 134;
            border: .5pt solid windowtext;
        }

        .xl92 {
            mso-style-parent: style0;
            text-align: center;
            white-space: normal;
            mso-font-charset: 134;
            border: .5pt solid windowtext;
        }

        -->  </style>
</head>
<body link="blue" vlink="purple" class="xl65">
<table width="1790" border="0" cellpadding="0" cellspacing="0"
       style='width:1342.50pt;border-collapse:collapse;table-layout:fixed;'>
    <col width="77" span="3" class="xl65" style='mso-width-source:userset;mso-width-alt:2464;'/>
    <col width="120" class="xl65" style='mso-width-source:userset;mso-width-alt:3840;'/>
    <col width="101" class="xl65" style='mso-width-source:userset;mso-width-alt:3232;'/>
    <col width="178" class="xl65" style='mso-width-source:userset;mso-width-alt:5696;'/>
    <col width="217" class="xl65" style='mso-width-source:userset;mso-width-alt:6944;'/>
    <col width="87" class="xl65" style='mso-width-source:userset;mso-width-alt:2784;'/>
    <col width="64" class="xl66" style='mso-width-source:userset;mso-width-alt:2048;'/>
    <col width="88" class="xl67" style='mso-width-source:userset;mso-width-alt:2816;'/>
    <col width="90" class="xl68" style='mso-width-source:userset;mso-width-alt:2880;'/>
    <col width="179" class="xl68" style='mso-width-source:userset;mso-width-alt:5728;'/>
    <col width="106" class="xl65" style='mso-width-source:userset;mso-width-alt:3392;'/>
    <col width="171" class="xl65" style='mso-width-source:userset;mso-width-alt:5472;'/>
    <col width="158" class="xl65" style='mso-width-source:userset;mso-width-alt:5056;'/>
    <col width="72" span="228" class="xl65" style='mso-width-source:userset;mso-width-alt:2304;'/>
    <col width="72" span="13" class="xl65" style='mso-width-source:userset;mso-width-alt:2304;'/>
    <tr height="56" style='height:42.00pt;mso-height-source:userset;mso-height-alt:840;'>
        <td class="xl69" height="56" width="1790" colspan="15"
            style='height:42.00pt;width:1342.50pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'
            x:str><span style='mso-spacerun:yes;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>住宅标准自建房信息台帐
        </td>
    </tr>
    <tr height="42.80" style='height:32.10pt;mso-height-source:userset;mso-height-alt:642;'>
        <td class="xl70" height="85.60" rowspan="2" style='height:64.20pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>序号</td>
        <td class="xl71" rowspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>分指</td>
        <td class="xl71" rowspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>组别</td>
        <td class="xl70" rowspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>编号</td>
        <td class="xl70" rowspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>被拆迁人</td>
        <td class="xl70" rowspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>身份证号</td>
        <td class="xl70" rowspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>地址门牌</td>
        <td class="xl70" rowspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>房屋产别</td>
        <td class="xl81" colspan="4" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>自建房信息</td>
        <td class="xl85" colspan="3" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>标准自建房内家庭成员</td>
    </tr>
    <tr height="42.80" style='height:32.10pt;mso-height-source:userset;mso-height-alt:642;'>
        <td class="xl86" x:str>间数</td>
        <td class="xl87" x:str>面积（㎡）</td>
        <td class="xl88" x:str>房主姓名</td>
        <td class="xl88" x:str>房主身份证号</td>
        <td class="xl89" x:str>姓名</td>
        <td class="xl89" x:str>身份证号</td>
        <td class="xl89" x:str>与房主关系</td>
    </tr>
    <c:forEach items="${pageInfo.result}" var="family" varStatus="fstatus">
        <c:forEach items="${familyHouseList[family.id]}" var="familyHouse" varStatus="fhstatus">
            <c:set var="fHeight" value="${familyHeightList[family.id]}"/>
            <c:set var="fhHeight" value="${fn:length(familyHousePersonList[familyHouse.id])}"/>
            <c:forEach items="${familyHousePersonList[familyHouse.id]}" var="person" varStatus="pstatus">
                <tr height="41.33" style='height:31.00pt;mso-height-source:userset;mso-height-alt:620;'>
                <c:if test="${fhstatus.first && pstatus.first}">
                    <td rowspan="${fHeight}" class="xl73" height="124" style='height:93.00pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:num>${fstatus.count}</td>
                    <td rowspan="${fHeight}" class="xl74" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str><tags:dataDict dataDict="分指" value="${family.bdCode}"/></td>
                    <td rowspan="${fHeight}" class="xl74" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str><tags:dataDict dataDict="组别" value="${family.groupCode}"/></td>
                    <td rowspan="${fHeight}" class="xl75" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>${family.familyCode}</td>
                    <td rowspan="${fHeight}" class="xl75" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>${family.name}</td>
                    <td rowspan="${fHeight}" class="xl75" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>${family.idCard}</td>
                    <td rowspan="${fHeight}" class="xl75" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>${family.address}</td>
                    <td rowspan="${fHeight}" class="xl75" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str><tags:dataDict dataDict="房屋产别" value="${family.houseType}"/></td>
                </c:if>
                <c:if test="${pstatus.first}">
                    <td rowspan="${fhHeight}" class="xl90" x:num>${familyHouse.houseNum}</td>
                    <td rowspan="${fhHeight}" class="xl91" x:num>${familyHouse.houseArea}</td>
                    <td rowspan="${fhHeight}" class="xl92" x:str>${familyHouse.name}</td>
                    <td rowspan="${fhHeight}" class="xl92" x:str>${familyHouse.idCard}</td>
                </c:if>
                <td class="xl73" x:str>${person.name}</td>
                <td class="xl73" x:str>${person.idCard}</td>
                <td class="xl73" x:str>${person.relation}</td>
            </c:forEach>
        </c:forEach>
        </tr>
    </c:forEach>
    <![if supportMisalignedColumns]>
    <tr width="0" style='display:none;'>
        <td width="77" style='width:58;'></td>
        <td width="120" style='width:90;'></td>
        <td width="101" style='width:76;'></td>
        <td width="178" style='width:134;'></td>
        <td width="217" style='width:163;'></td>
        <td width="87" style='width:65;'></td>
        <td width="64" style='width:48;'></td>
        <td width="88" style='width:66;'></td>
        <td width="90" style='width:68;'></td>
        <td width="179" style='width:134;'></td>
        <td width="106" style='width:80;'></td>
        <td width="171" style='width:128;'></td>
        <td width="158" style='width:119;'></td>
        <td width="72" style='width:54;'></td>
        <td width="72" style='width:54;'></td>
    </tr>
    <![endif]>
</table>
</body>
</html>