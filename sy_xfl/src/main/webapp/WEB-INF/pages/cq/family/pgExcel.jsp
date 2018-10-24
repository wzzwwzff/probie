<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%
    //设置浏览器识别
    response.setContentType("application/msexcel;charset=utf-8");
    //设置文件的名称
    String fileName = "评估数据台账";
    //将文件名称转为iso8859-1编码，防止乱码
    fileName = new String(fileName.getBytes("gbk"), "ISO-8859-1");
    //设置导出弹出框
    response.addHeader("content-disposition", "fileName=" + fileName + ".xls");
%>
<html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="ProgId" content="Excel.Sheet"/>
    <meta name="Generator" content="WPS Office ET"/>
    <style>
        <!-- @page
        {margin:0.98in 0.75in 0.98in 0.75in;
            mso-header-margin:0.51in;
            mso-footer-margin:0.51in;}
        tr
        {mso-height-source:auto;
            mso-ruby-visibility:none;}
        col
        {mso-width-source:auto;
            mso-ruby-visibility:none;}
        br
        {mso-data-placement:same-cell;}

        .style0
        {mso-number-format:"General";
            text-align:general;
            vertical-align:middle;
            white-space:nowrap;
            mso-rotate:0;
            mso-pattern:auto;
            mso-background-source:auto;
            color:windowtext;
            font-size:12.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:宋体;
            mso-generic-font-family:auto;
            mso-font-charset:134;
            border:none;
            mso-protection:locked visible;
            mso-style-name:"常规";
            mso-style-id:0;}
        td
        {mso-style-parent:style0;
            padding-top:1px;
            padding-right:1px;
            padding-left:1px;
            mso-ignore:padding;
            mso-number-format:"General";
            text-align:general;
            vertical-align:middle;
            white-space:nowrap;
            mso-rotate:0;
            mso-pattern:auto;
            mso-background-source:auto;
            color:windowtext;
            font-size:12.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:宋体;
            mso-generic-font-family:auto;
            mso-font-charset:134;
            border:none;
            mso-protection:locked visible;}
        .xl65
        {mso-style-parent:style0;
            text-align:left;
            mso-pattern:auto none;
            background:#BFBFBF;
            mso-font-charset:134;
            border:.5pt solid windowtext;}
        .xl66
        {mso-style-parent:style0;
            text-align:center;
            white-space:normal;
            mso-pattern:auto none;
            background:#BFBFBF;
            mso-font-charset:134;
            border:.5pt solid windowtext;}
        .xl67
        {mso-style-parent:style0;
            text-align:center;
            mso-font-charset:134;
            border:.5pt solid windowtext;}
        .xl68
        {mso-style-parent:style0;
            text-align:center;
            white-space:normal;
            mso-pattern:auto none;
            background:#BFBFBF;
            mso-font-charset:134;
            border:.5pt solid windowtext;}
        .xl69
        {mso-style-parent:style0;
            text-align:center;
            white-space:normal;
            color:#333333;
            font-size:9.8pt;
            font-weight:700;
            font-family:微软雅黑, sans-serif;
            mso-font-charset:134;}
        -->  </style>
</head>
<body link="blue" vlink="purple">
<table width="3898" border="0" cellpadding="0" cellspacing="0" style='width:2338.80pt;border-collapse:collapse;table-layout:fixed;'>
    <col width="63.00" style='mso-width-source:userset;mso-width-alt:1612;'/>
    <col width="98" style='mso-width-source:userset;mso-width-alt:2508;'/>
    <col width="125.00" style='mso-width-source:userset;mso-width-alt:3200;'/>
    <col width="160" style='mso-width-source:userset;mso-width-alt:4096;'/>
    <col width="254" style='mso-width-source:userset;mso-width-alt:6502;'/>
    <col width="188" style='mso-width-source:userset;mso-width-alt:4812;'/>
    <col width="172" style='mso-width-source:userset;mso-width-alt:4403;'/>
    <col width="187" style='mso-width-source:userset;mso-width-alt:4787;'/>
    <col width="221" style='mso-width-source:userset;mso-width-alt:5657;'/>
    <col width="193" style='mso-width-source:userset;mso-width-alt:4940;'/>
    <col width="210" style='mso-width-source:userset;mso-width-alt:5376;'/>
    <col width="198" span="2" style='mso-width-source:userset;mso-width-alt:5068;'/>
    <col width="180" style='mso-width-source:userset;mso-width-alt:4608;'/>
    <col width="216.00" style='mso-width-source:userset;mso-width-alt:5529;'/>
    <col width="134" style='mso-width-source:userset;mso-width-alt:3430;'/>
    <col width="127" style='mso-width-source:userset;mso-width-alt:3251;'/>
    <col width="164" style='mso-width-source:userset;mso-width-alt:4198;'/>
    <col width="172" style='mso-width-source:userset;mso-width-alt:4403;'/>
    <col width="188" style='mso-width-source:userset;mso-width-alt:4812;'/>
    <col width="90" span="5" style='width:54.00pt;'/>
    <tr height="41.67" style='height:25.00pt;mso-height-source:userset;mso-height-alt:500;'>
        <td class="xl65" height="41.67" width="3448" colspan="20" style='height:25.00pt;width:2068.80pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str><span style='mso-spacerun:yes;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>评估台账</td>
        <td width="90" style='width:54.00pt;'></td>
        <td width="90" style='width:54.00pt;'></td>
        <td width="90" style='width:54.00pt;'></td>
        <td width="90" style='width:54.00pt;'></td>
        <td width="90" style='width:54.00pt;'></td>
    </tr>
    <tr height="52" style='height:31.20pt;'>
        <td class="xl66" height="52" style='height:31.20pt;' x:str>序号</td>
        <td class="xl66" x:str>组别</td>
        <td class="xl66" x:str>编号</td>
        <td class="xl66" x:str>姓名</td>
        <td class="xl66" x:str>身份证号</td>
        <td class="xl66" x:str>合法宅基地面积(㎡)</td>
        <td class="xl66" x:str>控制标准面积(㎡)</td>
        <td class="xl66" x:str>超控制标准面积(㎡)</td>
        <td class="xl66" x:str>合法宅基地范围内正式房屋建筑面积(㎡)</td>
        <td class="xl66" x:str>合法宅基地外的房屋建筑面积(㎡)</td>
        <td class="xl66" x:str>评估公司</td>
        <td class="xl66" x:str>宅基地面积控制标准内区位补偿款(元)</td>
        <td class="xl66" x:str>宅基地面积控制标准外区位补偿款(元)</td>
        <td class="xl66" x:str>房屋及附属物重置成新价补偿款(元)</td>
        <td class="xl68" x:str>是否包含未经审批房屋重置成新价(元)</td>
        <td class="xl66" x:str>装修补助费(元)</td>
        <td class="xl66" x:str>分户补偿款(元)</td>
        <td class="xl66" x:str>合法宅基地内空地奖(元)</td>
        <td class="xl66" x:str>评估价款合计(元)</td>
        <td class="xl69" colspan="5" style='mso-ignore:colspan;'></td>
    </tr>
    <c:forEach items="${pageInfo.result}" var="family" varStatus="status">
    <tr height="41.67" style='height:25.00pt;mso-height-source:userset;mso-height-alt:500;'>
        <td class="xl67" height="41.67" style='height:25.00pt;'>${status.count}</td>
        <td class="xl67"><tags:dataDict dataDict="组别" value="${family.groupCode}"/></td>
        <td class="xl67">${family.familyCode}</td>
        <td class="xl67">${family.name}</td>
        <td class="xl67" x:str>${family.idCard}</td>
        <td class="xl67">${family.confirmArea}</td>
        <td class="xl67">${family.controlArea}</td>
        <td class="xl67">${family.outControlArea}</td>
        <td class="xl67">${family.buildArea}</td>
        <td class="xl67">${family.outBuildArea}</td>
        <td class="xl67"><tags:dataDict dataDict="评估公司" value="${family.pgCompany}"/></td>
        <td class="xl67">${family.inqwFee}</td>
        <td class="xl67">${family.outqwFee}</td>
        <td class="xl67">${family.fswFee}</td>
        <td class="xl67"><tags:dataDict dataDict="是否" value="${family.isGiveup}"/></td>
        <td class="xl67">${family.realZxbzFee}</td>
        <td class="xl67">${family.fhbcfFee}</td>
        <td class="xl67">${family.ktjFee}</td>
        <td class="xl67">${family.pgAllCount}</td>
        <td colspan="5" style='mso-ignore:colspan;'></td>
    </tr>
    </c:forEach>
</table>
</body>
</html>
