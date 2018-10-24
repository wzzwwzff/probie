<%--
  Created by IntelliJ IDEA.
  User: jmdf
  Date: 2018/8/24
  Time: 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page language="java" pageEncoding="utf-8" %>
<%
    //设置浏览器的识别
    response.setContentType("application/msexcel;charset=utf-8");
    //设置文件的名字
    String fileName = "导出定期资格审核信息";
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
    <col width="81" span="26" class="xl65" style='mso-width-source:userset;mso-width-alt:2369;'/>
    <tr height="56.67" style='height:34.00pt;mso-height-source:userset;mso-height-alt:680;'>
        <td class="xl67" height="56.67" width="1290" colspan="38"
            style='height:34.00pt;width:774.00pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'
            x:str>定期资格审核信息
        </td>
    </tr>
    <tr height="41.67" style='height:25.00pt;mso-height-source:userset;mso-height-alt:500;'>
        <td class="xl70" height="41.67" style='height:25.00pt;' x:str>序号</td>
        <td class="xl70" x:str>项目名称</td>
        <td class="xl70" x:str>家庭类型</td>
        <td class="xl70" x:str>申请编号</td>
        <td class="xl70" x:str>姓名</td>
        <td class="xl70" x:str>年龄</td>
        <td class="xl70" x:str>证件号码类型</td>
        <td class="xl70" x:str>证件号码</td>
        <td class="xl70" x:str>资格审核状态</td>
        <td class="xl70" x:str>婚姻状况</td>
        <td class="xl71" x:str>户籍所在地</td>
        <td class="xl70" x:str>工作地（社保缴纳地）</td>
        <td class="xl70" x:str>暂住证/居住证/登记卡编号</td>
        <td class="xl70" x:str>是否本区</td>
        <td class="xl70" x:str>申请日期</td>
        <td class="xl70" x:str>前配偶姓名</td>
        <td class="xl70" x:str>前配偶证件类型</td>
        <td class="xl70" x:str>前配偶证件号码</td>
        <td class="xl70" x:str>离婚日期</td>
        <td class="xl70" x:str>联系人姓名</td>
        <td class="xl70" x:str>联系人手机号码</td>
        <td class="xl70" x:str>联系人通讯地址</td>
        <td class="xl70" x:str>联系人邮编</td>
        <td class="xl70" x:str>联系人备注</td>
        <td class="xl70" x:str>摇号批次</td>
        <td class="xl70" x:str>摇号编号</td>
        <td class="xl70" x:str>摇号组别</td>
        <td class="xl70" x:str>摇号结果</td>
        <td class="xl70" x:str>是否是优先组</td>
        <td class="xl70" x:str>社保是否符合连续缴纳12个月要求</td>
        <td class="xl70" x:str>学历</td>
        <td class="xl70" x:str>学习形式</td>
        <td class="xl70" x:str>是否是园区</td>
        <td class="xl70" x:str>学历证书在线验证码</td>
        <td class="xl70" x:str>职务</td>
        <td class="xl70" x:str>工作单位</td>
        <td class="xl70" x:str>单位联系人</td>
        <td class="xl70" x:str>单位联系电话</td>
    </tr>
    <c:forEach items="${pageInfo.result}" var="family" varStatus="status">
        <tr height="41.67" style='height:25.00pt;mso-height-source:userset;mso-height-alt:500;'>
            <td class="xl70" height="41.67" style='height:25.00pt;'>${status.count}</td>
            <td class="xl70"><tags:dataDict dataDict="项目名称" value="${family.projectName}"/></td>
            <td class="xl70"><tags:dataDict dataDict="家庭类型" value="${family.familyType}"/></td>
            <td class="xl70">${family.familyCode}</td>
            <td class="xl70">${family.name}</td>
            <td class="xl70">${family.age}</td>
            <td class="xl70"><tags:dataDict dataDict="证件类型" value="${family.cardType}"/></td>
            <td class="xl70" x:str>${family.idCard}</td>
            <td class="xl70"><tags:dataDict dataDict="复核状态" value="${family.seniorityStatus}"/></td>
            <td class="xl70"><tags:dataDict dataDict="婚姻状况" value="${family.marryStatus}"/></td>
            <td class="xl70">${family.address}</td>
            <td class="xl70"><tags:dataDict dataDict="工作地（社保缴纳地）" value="${family.workUnit}"/></td>
            <td class="xl70">${family.registerCode}</td>
            <td class="xl70"><tags:dataDict dataDict="是否" value="${family.thisArea}"/></td>
            <td class="xl71"><fmt:formatDate value="${family.applyDate}" pattern="yyyy-MM-dd" /></td>
            <td class="xl70">${family.exSpouseName}</td>
            <td class="xl70"><tags:dataDict dataDict="证件类型" value="${family.exCardType}"/></td>
            <td class="xl70">${family.exIdCard}</td>
            <td class="xl71"><fmt:formatDate value="${family.divorceDate}" pattern="yyyy-MM-dd" /></td>
            <td class="xl70">${family.contactName}</td>
            <td class="xl70">${family.phone}</td>
            <td class="xl70">${family.currentAddres}</td>
            <td class="xl70">${family.postCode}</td>
            <td class="xl70">${family.memo}</td>
            <td class="xl70">${family.shakingBatch}</td>
            <td class="xl70">${family.shakingCode}</td>
            <td class="xl70">${family.shakingGroup}</td>
            <td class="xl70">${family.shakingResult}</td>
            <td class="xl70"><tags:dataDict dataDict="是否" value="${family.firstOrNot}"/></td>
            <td class="xl70"><tags:dataDict dataDict="是否" value="${family.continuity}"/></td>
            <td class="xl70"><tags:dataDict dataDict="学历层次" value="${family.education}"/></td>
            <td class="xl70"><tags:dataDict dataDict="学习形式" value="${family.learning}"/></td>
            <td class="xl70"><tags:dataDict dataDict="是否" value="${family.thisPark}"/></td>
            <td class="xl70">${family.educationCode}</td>
            <td class="xl70">${family.job}</td>
            <td class="xl70">${family.unit}</td>
            <td class="xl70">${family.unitPerson}</td>
            <td class="xl70">${family.unitPhone}</td>
        </tr>
    </c:forEach>
    <![if supportMisalignedColumns]>
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
        <td width="81" style='width:49pt;'></td>
    </tr>
    <![endif]>
</table>
</body>
</html>

