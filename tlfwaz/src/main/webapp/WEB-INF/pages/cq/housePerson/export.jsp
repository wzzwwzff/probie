<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    response.setContentType("application/msexcel;charset=utf-8");
    String filename = "拟登记权利人信息";
    filename = new String(filename.getBytes("gbk"), "ISO-8859-1");
    response.addHeader("Content-Disposition", "filename=" + filename + ".xls");
%>
<html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office"
      xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="ProgId" content="Excel.Sheet"/>
    <meta name="Generator" content="WPS Office ET"/>
    <!--[if gte mso 9]>
    <xml>
        <o:DocumentProperties>
            <o:Author>jmdf</o:Author>
            <o:Created>2017-02-28T11:14:56</o:Created>
            <o:LastSaved>2017-03-01T09:59:09</o:LastSaved>
            <o:Revision>1</o:Revision>
        </o:DocumentProperties>
        <o:CustomDocumentProperties>
            <o:KSOProductBuildVer dt:dt="string">2052-10.1.0.6206</o:KSOProductBuildVer>
        </o:CustomDocumentProperties>
    </xml>
    <![endif]-->
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

        .font0 {
            color: windowtext;
            font-size: 12.0pt;
            font-weight: 400;
            font-style: normal;
            text-decoration: none;
            font-family: "宋体";
            mso-generic-font-family: auto;
            mso-font-charset: 134;
        }

        .style0 {
            mso-number-format: "General";
            text-align: general;
            vertical-align: middle;
            white-space: nowrap;
            mso-rotate: 0;
            mso-pattern: auto;
            mso-background-source: auto;
            color: windowtext;
            font-size: 12.0pt;
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
            color: windowtext;
            font-size: 12.0pt;
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
            white-space: normal;
            color: #000000;
            font-size: 20.0pt;
            mso-font-charset: 134;
            border: .5pt solid windowtext;
        }

        .xl66 {
            mso-style-parent: style0;
            mso-number-format: "yyyy/m/d";
            text-align: center;
            white-space: normal;
            color: #000000;
            font-size: 11.0pt;
            mso-font-charset: 134;
            border: .5pt solid windowtext;
        }

        .xl67 {
            mso-style-parent: style0;
            text-align: left;
            white-space: normal;
            color: #000000;
            font-size: 11.0pt;
            mso-font-charset: 134;
            border: .5pt solid windowtext;
        }

        .xl68 {
            mso-style-parent: style0;
            mso-font-charset: 134;
            border: .5pt solid windowtext;
        }

        .xl69
        {
            mso-style-parent:style0;
            text-align:center;
            mso-pattern:auto none;
            background:#BFBFBF;
            color:windowtext;
            mso-font-charset:134;
            border:.5pt solid windowtext;
        }

        .xl70 {
            mso-style-parent: style0;
            text-align: center;
            white-space: normal;
            mso-pattern: auto none;
            background: #FFFFFF;
            color: #000000;
            font-size: 10.0pt;
            font-weight: 700;
            mso-font-charset: 134;
            border: .5pt solid windowtext;
        }

        .xl71 {
            mso-style-parent: style0;
            text-align: center;
            mso-font-charset: 134;
            border: .5pt solid windowtext;
        }

        -->  </style>
    <!--[if gte mso 9]>
    <xml>
        <x:ExcelWorkbook>
            <x:ExcelWorksheets>
                <x:ExcelWorksheet>
                    <x:Name>Sheet1</x:Name>
                    <x:WorksheetOptions>
                        <x:DefaultRowHeight>285</x:DefaultRowHeight>
                        <x:Selected/>
                        <x:Panes>
                            <x:Pane>
                                <x:Number>3</x:Number>
                                <x:ActiveCol>0</x:ActiveCol>
                                <x:ActiveRow>5</x:ActiveRow>
                                <x:RangeSelection>A6:G6</x:RangeSelection>
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
            <x:WindowHeight>13635</x:WindowHeight>
            <x:WindowWidth>28695</x:WindowWidth>
        </x:ExcelWorkbook>
        <x:SupBook>
            <x:Path>C:\Users\jmdf\Desktop\</x:Path>
        </x:SupBook>
    </xml>
    <![endif]-->
</head>
<body link="blue" vlink="purple">
<table width="1608" border="0" cellpadding="0" cellspacing="0"
       style='width:1206.00pt;border-collapse:collapse;table-layout:fixed;'>
    <col width="72" span="2" style='mso-width-source:userset;mso-width-alt:2304;'/>
    <col width="135" style='mso-width-source:userset;mso-width-alt:4320;'/>
    <col width="85" style='mso-width-source:userset;mso-width-alt:2720;'/>
    <col width="173" class="xl65" style='mso-width-source:userset;mso-width-alt:5536;'/>
    <col width="135" style='mso-width-source:userset;mso-width-alt:7200;'/>
    <col width="225" style='mso-width-source:userset;mso-width-alt:4320;'/>
    <col width="114" style='mso-width-source:userset;mso-width-alt:3648;'/>
    <col width="93" style='mso-width-source:userset;mso-width-alt:4320;'/>
    <col width="117" style='mso-width-source:userset;mso-width-alt:3744;'/>
    <col width="79" style='mso-width-source:userset;mso-width-alt:2528;'/>
    <col width="86" style='mso-width-source:userset;mso-width-alt:2752;'/>
    <col width="72" style='mso-width-source:userset;mso-width-alt:2304;'/>
    <col width="67" style='mso-width-source:userset;mso-width-alt:3872;'/>
    <col width="121" style='mso-width-source:userset;mso-width-alt:8000;'/>
    <col width="146" style='mso-width-source:userset;mso-width-alt:5706;'/>
    <col width="180" style='mso-width-source:userset;mso-width-alt:10208;'/>
    <col width="319" style='mso-width-source:userset;mso-width-alt:4672;'/>
    <tr height="33.33" style='height:25.00pt;mso-height-source:userset;mso-height-alt:500;'>
        <td class="x171" height="66.67" width="2291" colspan="18" rowspan="2" style='height:50.00pt;width:1718.25pt;border-right:none;border-bottom:none;text-align: center' x:str>拟登记权利人数据</td>
    </tr>
    <tr height="33.33" style='height:25.00pt;mso-height-source:userset;mso-height-alt:500;'/>
    <tr height="33.33" style='height:25.00pt;mso-height-source:userset;mso-height-alt:500;'>
        <td class="xl69" height="66.67" rowspan="2" style='height:50.00pt;border-right:none;border-bottom:.5pt solid windowtext;' x:str>序号</td>
        <td class="xl69" colspan="6" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>基本信息</td>
        <td class="xl69" colspan="11" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>选房信息</td>
    </tr>
    <tr height="33.33" style='height:25.00pt;mso-height-source:userset;mso-height-alt:500;'>
        <td class="xl69" x:str>家庭编号</td>
        <td class="xl69" x:str>被征收人</td>
        <td class="xl69" x:str>身份证号</td>
        <td class="xl69" x:str>联系电话</td>
        <td class="xl69" x:str>房屋坐落</td>
        <td class="xl69" x:str>建筑面积（㎡）</td>
        <td class="xl69" x:str>安置项目</td>
        <td class="xl69" x:str>楼号</td>
        <td class="xl69" x:str>单元号</td>
        <td class="xl69" x:str>房号</td>
        <td class="xl69" x:str>居室</td>
        <td class="xl69" x:str>面积（㎡）</td>
        <td class="xl69" x:str>选房时间</td>
        <td class="xl69" x:str>拟登记权利人</td>
        <td class="xl69" x:str>身份证号</td>
        <td class="xl69" x:str>购房款（元）</td>
        <td class="xl69" x:str>购房款合计（元）</td>
    </tr>
    <c:forEach items="${pageInfo.result}" var="family" varStatus="status1">
        <c:forEach varStatus="status2" var="house" items="${houseListMap[family.id]}">
            <c:set var="lenth" value="${houseListMap[family.id].size()}"/>
            <tr height="33.33" style='height:25.00pt;mso-height-source:userset;mso-height-alt:500;'>
                <c:if test="${status2.index eq 0}">
                    <td height="33.33" style='height:25.00pt;' class="xl71" x:str rowspan="${lenth}">${status1.index+1}</td>
                    <td class="xl71" x:str rowspan="${lenth}">${family.familyCode}</td>
                    <td class="xl71" x:str rowspan="${lenth}">${family.name}</td>
                    <td class="xl71" x:str rowspan="${lenth}">${family.idCard}</td>
                    <td class="xl71" x:str rowspan="${lenth}">${family.phone}</td>
                    <td class="xl71" x:str rowspan="${lenth}">${family.address}</td>
                    <td class="xl71" x:str rowspan="${lenth}">${family.azArea}</td>
                </c:if>
                <td class="xl71" x:str>${house.azProject.projectName}</td>
                <td class="xl71" x:str>${house.buildNum}</td>
                <td class="xl71" x:str>${house.unitNum}</td>
                <td class="xl71" x:str>${house.houseNum}</td>
                <td class="xl71" x:str><tags:dataDict dataDict="户型" value="${fn:trim(house.houseType)}"/></td>
                <td class="xl71"><fmt:formatNumber value="${house.buildArea}" pattern="##.00"/> </td>
                <td class="xl71" x:str><fmt:formatDate value="${house.chooseDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td class="xl71" x:str>${house.hPerson eq null?family.name:house.hPerson}</td>
                <td class="xl71" x:str>${house.hPerson eq null?family.idCard:house.hIdCard}</td>
                <td class="xl71" x:num>${house.price}</td>
                <%--购房款（扣除项）
                <c:if test="${status2.index eq 0}">
                    <td class="xl71" x:num rowspan="${lenth}">${family.purchaseHouseFee}</td>
                </c:if>--%>
            </tr>
        </c:forEach>
    </c:forEach>
    <![if supportMisalignedColumns]>
    <tr width="0" style='display:none;'>
        <td width="130" style='width:98pt;'></td>
        <td width="125" style='width:94pt;'></td>
        <td width="161" style='width:121pt;'></td>
        <td width="192" style='width:144pt;'></td>
        <td width="159" style='width:119pt;'></td>
        <td width="306" style='width:230pt;'></td>
        <td width="125" style='width:94pt;'></td>
        <td width="120" style='width:90pt;'></td>
        <td width="109" style='width:82pt;'></td>
    </tr>
    <![endif]>
</table>
</body>
</html>