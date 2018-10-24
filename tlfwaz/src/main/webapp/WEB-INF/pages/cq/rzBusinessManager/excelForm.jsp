<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page import="java.util.*" language="java" pageEncoding="utf-8" %>
<%
    //设置浏览器的识别
    response.setContentType("application/msexcel;charset=utf-8");
    //设置文件的名字
    String fileName = "入住家庭信息";
    //将文件的名字转化为JBK编码的字体
    fileName = new String(fileName.getBytes("gbk"), "ISO-8859-1");
    //设置导出弹出框
    response.addHeader("Content-Disposition", "fileName=" + fileName + ".xls");
%>
<html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office"
      xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="ProgId" content="Excel.Sheet"/>
    <meta name="Generator" content="WPS Office ET"/>
    <!--[if gte mso 9]>
    <![endif]-->
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
            mso-font-charset: 134;
        }

        .xl66 {
            mso-style-parent: style0;
            mso-number-format: "\@";
            text-align: center;
            mso-font-charset: 134;
        }

        .xl67 {
            mso-style-parent: style0;
            text-align: center;
            font-size: 16.0pt;
            font-weight: 700;
            mso-font-charset: 134;
            border-left: .5pt solid windowtext;
            border-top: .5pt solid windowtext;
            border-bottom: .5pt solid windowtext;
        }

        .xl68 {
            mso-style-parent: style0;
            text-align: center;
            font-size: 16.0pt;
            font-weight: 700;
            mso-font-charset: 134;
            border-top: .5pt solid windowtext;
            border-bottom: .5pt solid windowtext;
        }

        .xl69 {
            mso-style-parent: style0;
            mso-number-format: "\@";
            text-align: center;
            font-size: 16.0pt;
            font-weight: 700;
            mso-font-charset: 134;
            border-top: .5pt solid windowtext;
            border-bottom: .5pt solid windowtext;
        }

        .xl70 {
            mso-style-parent: style0;
            text-align: center;
            mso-font-charset: 134;
            border: .5pt solid windowtext;
        }

        .xl71 {
            mso-style-parent: style0;
            mso-number-format: "\@";
            text-align: center;
            mso-font-charset: 134;
            border: .5pt solid windowtext;
        }

        .xl72 {
            mso-style-parent: style0;
            text-align: center;
            font-size: 16.0pt;
            font-weight: 700;
            mso-font-charset: 134;
            border-top: .5pt solid windowtext;
            border-right: .5pt solid windowtext;
            border-bottom: .5pt solid windowtext;
        }

        -->  </style>
    <!--[if gte mso 9]>
    <xml>
        <x:ExcelWorkbook>
            <x:ExcelWorksheets>
                <x:ExcelWorksheet>
                    <x:Name>Sheet1</x:Name>
                    <x:WorksheetOptions>
                        <x:DefaultRowHeight>288</x:DefaultRowHeight>
                        <x:Selected/>
                        <x:Panes>
                            <x:Pane>
                                <x:Number>3</x:Number>
                                <x:ActiveCol>9</x:ActiveCol>
                                <x:ActiveRow>7</x:ActiveRow>
                                <x:RangeSelection>J8</x:RangeSelection>
                            </x:Pane>
                        </x:Panes>
                        <x:ProtectContents>False</x:ProtectContents>
                        <x:ProtectObjects>False</x:ProtectObjects>
                        <x:ProtectScenarios>False</x:ProtectScenarios>
                        <x:PageBreakZoom>100</x:PageBreakZoom>
                        <x:Print>
                            <x:ValidPrinterInfo/>
                            <x:PaperSizeIndex>9</x:PaperSizeIndex>
                        </x:Print>
                    </x:WorksheetOptions>
                </x:ExcelWorksheet>
            </x:ExcelWorksheets>
            <x:ProtectStructure>False</x:ProtectStructure>
            <x:ProtectWindows>False</x:ProtectWindows>
            <x:SelectedSheets>0</x:SelectedSheets>
            <x:WindowHeight>9924</x:WindowHeight>
            <x:WindowWidth>22943</x:WindowWidth>
        </x:ExcelWorkbook>
    </xml>
    <![endif]-->
</head>
<body link="blue" vlink="purple" class="xl65">
<table width="1290" border="0" cellpadding="0" cellspacing="0"
       style='width:774.00pt;border-collapse:collapse;table-layout:fixed;'>
    <col width="81" class="xl65" style='mso-width-source:userset;mso-width-alt:2369;'/>
    <col width="103" class="xl65" style='mso-width-source:userset;mso-width-alt:3013;'/>
    <col width="294" class="xl65" style='mso-width-source:userset;mso-width-alt:2369;'/>
    <col width="156.00" class="xl65" style='mso-width-source:userset;mso-width-alt:5500;'/>
    <col width="97" class="xl65" style='mso-width-source:userset;mso-width-alt:2837;'/>
    <col width="130" class="xl65" style='mso-width-source:userset;mso-width-alt:3803;'/>
    <col width="132" class="xl66" style='mso-width-source:userset;mso-width-alt:3861;'/>
    <col width="126.00" class="xl65" style='mso-width-source:userset;mso-width-alt:3686;'/>
    <col width="294" class="xl65" style='mso-width-source:userset;mso-width-alt:3800;'/>
    <col width="144.00" class="xl65" style='mso-width-source:userset;mso-width-alt:6000;'/>
    <col width="81" span="27" class="xl65" style='mso-width-source:userset;mso-width-alt:2369;'/>
    <col width="294" class="xl65" style='mso-width-source:userset;mso-width-alt:6000;'/>
    <col width="180" span="26" class="xl65" style='mso-width-source:userset;mso-width-alt:2369;'/>
    <tr height="56.67" style='height:34.00pt;mso-height-source:userset;mso-height-alt:680;'>
        <td class="xl67" height="56.67" width="1290" colspan="13"
            style='height:34.00pt;width:774.00pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'
            x:str>入住家庭信息
        </td>
    </tr>
    <thead>
    <tr>
        <th rowspan="2" class="xl70" height="41.67" style='height:25.00pt;' x:str>序号</th>
        <th colspan="4" class="xl70" x:str>基本信息</th>
        <th colspan="8" class="xl70" x:str>选房信息</th>
    </tr>
    <tr height="41.67" style='height:25.00pt;mso-height-source:userset;mso-height-alt:500;'>
        <td class="xl70" x:str>家庭编号</td>
        <td class="xl70" x:str>被征收人</td>
        <td class="xl70" x:str>身份证号</td>
        <td class="xl70" x:str>房屋坐落</td>
        <td class="xl70" x:str>项目名称</td>
        <td class="xl70" x:str>楼号</td>
        <td class="xl70" x:str>单元</td>
        <td class="xl70" x:str>房号</td>
        <td class="xl70" x:str>户型</td>
        <td class="xl70" x:str>居室面积/㎡</td>
        <td class="xl70" x:str>选房时间</td>
        <td class="xl70" x:str>入住状态</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach varStatus="status1" var="family" items="${pageInfo.result}">
        <c:forEach varStatus="status2" var="house" items="${houseListMap[family.id]}">
            <c:set var="lenth" value="${houseListMap[family.id].size()}"/>
            <tr>
                <c:if test="${status2.index eq 0}">
                    <td class="xl70" x:str height="41.67" style='height:25.00pt;' rowspan="${lenth}">${status1.index+1}</td>
                    <td class="xl70" x:str rowspan="${lenth}">${family.familyCode}</td>
                    <td class="xl70" x:str rowspan="${lenth}">${family.name}</td>
                    <td class="xl70" x:str rowspan="${lenth}">${family.idCard}</td>
                    <td class="xl70" x:str rowspan="${lenth}">${family.fwzl}</td>
                </c:if>
                <td class="xl70" x:str >${house.azProject.projectName}</td>
                <td class="xl70" x:str >${house.buildNum}</td>
                <td class="xl70" x:str >${house.unitNum}</td>
                <td class="xl70" x:str >${house.houseNum}</td>
                <td class="xl70" x:str ><tags:dataDict dataDict="户型" value="${fn:trim(house.houseType)}"/></td>
                <td class="xl70" x:num ><fmt:formatNumber value="${house.buildArea}" pattern="##.00"/></td>
                <td class="xl70" x:str ><fmt:formatDate value="${house.chooseDate}" pattern="yyyy-MM-dd"/></td>
                <td class="xl70" x:str ><tags:dataDict dataDict="入住状态" value="${fn:trim(house.rzStatus)}"/></td>
            </tr>
        </c:forEach>
    </c:forEach>
    </tbody>
    <tr width="0" style='display:none;'>
        <td width="81" style='width:49pt;'></td>
        <td width="103" style='width:62pt;'></td>
        <td width="160" style='width:96pt;'></td>
        <td width="156" style='width:94pt;'></td>
        <td width="97" style='width:58pt;'></td>
        <td width="130" style='width:78pt;'></td>
        <td width="132" style='width:79pt;'></td>
        <td width="126" style='width:76pt;'></td>
        <td width="161" style='width:97pt;'></td>
        <td width="144" style='width:86pt;'></td>
        <td width="105" style='width:58pt;'></td>
        <td width="110" style='width:88pt;'></td>
        <td width="110" style='width:88pt;'></td>
    </tr>
</table>
</body>
</html>
