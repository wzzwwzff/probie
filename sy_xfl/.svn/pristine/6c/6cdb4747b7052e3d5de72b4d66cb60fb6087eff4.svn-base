<%@ page import="java.util.ArrayList" %>
<%@ page import="com.app.cq.model.FamilyPerson" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="com.app.cq.model.Family" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%
    //设置浏览器识别
    response.setContentType("application/msexcel;charset=utf-8");
    //设置文件的名称
    String fileName = "未签约台账";
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
    <!--[if gte mso 9]>
    <xml>
        <o:DocumentProperties>
            <o:Author>JMDF</o:Author>
            <o:Created>2018-03-13T15:17:21</o:Created>
            <o:LastAuthor>JMDF</o:LastAuthor>
            <o:LastSaved>2018-03-13T15:28:45</o:LastSaved>
        </o:DocumentProperties>
        <o:CustomDocumentProperties>
            <o:KSOProductBuildVer dt:dt="string">2052-10.1.0.7224</o:KSOProductBuildVer>
        </o:CustomDocumentProperties>
    </xml>
    <![endif]-->
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
            text-align:center;
            mso-font-charset:134;}
        .xl66
        {mso-style-parent:style0;
            text-align:left;
            mso-pattern:auto none;
            background:#BFBFBF;
            mso-font-charset:134;}
        .xl67
        {mso-style-parent:style0;
            text-align:center;
            mso-pattern:auto none;
            background:#BFBFBF;
            mso-font-charset:134;
            border:.5pt solid windowtext;}
        .xl68
        {mso-style-parent:style0;
            text-align:center;
            mso-font-charset:134;
            border:.5pt solid windowtext;}
        .xl69
        {mso-style-parent:style0;
            mso-number-format:"yyyy/m/d";
            text-align:center;
            mso-font-charset:134;
            border:.5pt solid windowtext;}
        .xl70
        {mso-style-parent:style0;
            text-align:center;
            white-space:normal;
            mso-pattern:auto none;
            background:#BFBFBF;
            mso-font-charset:134;
            border:.5pt solid windowtext;}
        -->  </style>
    <!--[if gte mso 9]>
    <xml>
        <x:ExcelWorkbook>
            <x:ExcelWorksheets>
                <x:ExcelWorksheet>
                    <x:Name>Sheet1</x:Name>
                    <x:WorksheetOptions>
                        <x:DefaultRowHeight>312</x:DefaultRowHeight>
                        <x:Selected/>
                        <x:Panes>
                            <x:Pane>
                                <x:Number>3</x:Number>
                                <x:ActiveCol>1</x:ActiveCol>
                                <x:ActiveRow>3</x:ActiveRow>
                                <x:RangeSelection>B4</x:RangeSelection>
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
            <x:WindowHeight>9924</x:WindowHeight>
            <x:WindowWidth>18468</x:WindowWidth>
        </x:ExcelWorkbook>
    </xml>
    <![endif]-->
</head>
<body link="blue" vlink="purple">
<table width="9512.00" border="0" cellpadding="0" cellspacing="0" style='width:5707.20pt;border-collapse:collapse;table-layout:fixed;'>
    <col width="72.00" style='mso-width-source:userset;mso-width-alt:1843;'/>
    <col width="115" style='mso-width-source:userset;mso-width-alt:2944;'/>
    <col width="102.00" style='mso-width-source:userset;mso-width-alt:2611;'/>
    <col width="123.00" span="2" style='mso-width-source:userset;mso-width-alt:3148;'/>
    <col width="107" style='mso-width-source:userset;mso-width-alt:2739;'/>
    <col width="128" style='mso-width-source:userset;mso-width-alt:3276;'/>
    <col width="125.00" style='mso-width-source:userset;mso-width-alt:3200;'/>
    <col width="98" style='mso-width-source:userset;mso-width-alt:2508;'/>
    <col width="215" style='mso-width-source:userset;mso-width-alt:5504;'/>
    <col width="162" style='mso-width-source:userset;mso-width-alt:4147;'/>
    <col width="105" style='mso-width-source:userset;mso-width-alt:2688;'/>
    <col width="109.00" style='mso-width-source:userset;mso-width-alt:2790;'/>
    <col width="119" style='mso-width-source:userset;mso-width-alt:3046;'/>
    <col width="206" style='mso-width-source:userset;mso-width-alt:5273;'/>
    <col width="178" style='mso-width-source:userset;mso-width-alt:4556;'/>
    <col width="90" span="2" style='width:54.00pt;'/>
    <col width="136" style='mso-width-source:userset;mso-width-alt:3481;'/>
    <col width="90" span="8" style='width:54.00pt;'/>
    <col width="155" style='mso-width-source:userset;mso-width-alt:3968;'/>
    <col width="173" style='mso-width-source:userset;mso-width-alt:4428;'/>
    <col width="141.00" style='mso-width-source:userset;mso-width-alt:3609;'/>
    <col width="123.00" style='mso-width-source:userset;mso-width-alt:3148;'/>
    <col width="137" style='mso-width-source:userset;mso-width-alt:3507;'/>
    <col width="66" style='mso-width-source:userset;mso-width-alt:1689;'/>
    <col width="267.00" style='mso-width-source:userset;mso-width-alt:6835;'/>
    <col width="90" style='width:54.00pt;'/>
    <col width="112" style='mso-width-source:userset;mso-width-alt:2867;'/>
    <col width="90" span="2" style='width:54.00pt;'/>
    <col width="100" style='mso-width-source:userset;mso-width-alt:2560;'/>
    <col width="105" style='mso-width-source:userset;mso-width-alt:2688;'/>
    <col width="202" style='mso-width-source:userset;mso-width-alt:5171;'/>
    <col width="90" span="2" style='width:54.00pt;'/>
    <col width="132" style='mso-width-source:userset;mso-width-alt:3379;'/>
    <col width="134" style='mso-width-source:userset;mso-width-alt:3430;'/>
    <col width="91" style='mso-width-source:userset;mso-width-alt:2329;'/>
    <col width="166" style='mso-width-source:userset;mso-width-alt:4249;'/>
    <col width="97" style='mso-width-source:userset;mso-width-alt:2483;'/>
    <col width="161" style='mso-width-source:userset;mso-width-alt:4121;'/>
    <col width="180" style='mso-width-source:userset;mso-width-alt:4608;'/>
    <col width="175" style='mso-width-source:userset;mso-width-alt:4480;'/>
    <col width="152" style='mso-width-source:userset;mso-width-alt:3891;'/>
    <col width="178" style='mso-width-source:userset;mso-width-alt:4556;'/>
    <col width="182" style='mso-width-source:userset;mso-width-alt:4659;'/>
    <col width="169" style='mso-width-source:userset;mso-width-alt:4326;'/>
    <col width="150" style='mso-width-source:userset;mso-width-alt:3840;'/>
    <col width="151" style='mso-width-source:userset;mso-width-alt:3865;'/>
    <col width="154" style='mso-width-source:userset;mso-width-alt:3942;'/>
    <col width="148" style='mso-width-source:userset;mso-width-alt:3788;'/>
    <col width="152" style='mso-width-source:userset;mso-width-alt:3891;'/>
    <col width="121" style='mso-width-source:userset;mso-width-alt:3097;'/>
    <col width="143" style='mso-width-source:userset;mso-width-alt:3660;'/>
    <col width="151" style='mso-width-source:userset;mso-width-alt:3865;'/>
    <col width="140" style='mso-width-source:userset;mso-width-alt:3584;'/>
    <col width="149" style='mso-width-source:userset;mso-width-alt:3814;'/>
    <col width="166" style='mso-width-source:userset;mso-width-alt:4249;'/>
    <col width="149" style='mso-width-source:userset;mso-width-alt:3814;'/>
    <col width="137" style='mso-width-source:userset;mso-width-alt:3507;'/>
    <col width="109.00" style='mso-width-source:userset;mso-width-alt:2790;'/>
    <col width="130" style='mso-width-source:userset;mso-width-alt:3328;'/>
    <col width="134" style='mso-width-source:userset;mso-width-alt:3430;'/>
    <col width="103" style='mso-width-source:userset;mso-width-alt:2636;'/>
    <col width="154" style='mso-width-source:userset;mso-width-alt:3942;'/>
    <tr height="41.67" style='height:25.00pt;mso-height-source:userset;mso-height-alt:500;'>
        <td class="xl66" height="41.67" width="9512.00" colspan="69" style='height:25.00pt;width:5707.20pt;border-right:none;border-bottom:none;' x:str><span style='mso-spacerun:yes;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>签约台账</td>
    </tr>
    <tr height="41.67" class="xl65" style='height:25.00pt;mso-height-source:userset;mso-height-alt:500;'>
        <td class="xl67" height="41.67" colspan="27" style='height:25.00pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>家庭信息</td>
        <td class="xl67" colspan="13" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>家庭成员</td>
        <td class="xl67" colspan="4" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>人口信息</td>
        <td class="xl67" colspan="25" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>补偿情况</td>
    </tr>
    <tr height="60" class="xl65" style='height:36.00pt;mso-height-source:userset;mso-height-alt:720;'>
        <td class="xl67" height="60" style='height:36.00pt;' x:str>序号</td>
        <td class="xl67" x:str>编号</td>
        <td class="xl67" x:str>组别</td>
        <td class="xl67" x:str>姓名</td>
        <td class="xl67" x:str>身份证号</td>
        <td class="xl67" x:str>房屋坐落</td>
        <td class="xl70" x:str>合法宅基地面积(㎡)</td>
        <td class="xl70" x:str>控制标准面积(㎡)</td>
        <td class="xl70" x:str>超控制标准面积(㎡)</td>
        <td class="xl70" x:str>合法宅基地范围内正式房屋建筑面积(㎡)</td>
        <td class="xl70" x:str>合法宅基地外的房屋建筑面积(㎡)</td>
        <td class="xl67" x:str>是否营业</td>
        <td class="xl67" x:str>是否免税</td>
        <td class="xl67" x:str>营业面积(㎡)</td>
        <td class="xl70" x:str>是否有缴费种养殖地</td>
        <td class="xl67" x:str>电话</td>
        <td class="xl67" x:str>空调</td>
        <td class="xl67" x:str>网络宽带</td>
        <td class="xl67" x:str>有线电视</td>
        <td class="xl67" x:str>热水器</td>
        <td class="xl67" x:str>低保</td>
        <td class="xl67" x:str>残疾</td>
        <td class="xl67" x:str>大病</td>
        <td class="xl67" x:str>营业执照名称</td>
        <td class="xl67" x:str>营业执照注册号</td>
        <td class="xl67" x:str>登记日期</td>
        <td class="xl67" x:str>其他情况说明</td>
        <td class="xl67" x:str>姓名</td>
        <td class="xl67" x:str>性别</td>
        <td class="xl67" x:str>身份证号</td>
        <td class="xl67" x:str>年龄</td>
        <td class="xl67" x:str>与户主关系</td>
        <td class="xl67" x:str>婚姻状况</td>
        <td class="xl67" x:str>工作单位</td>
        <td class="xl70" x:str>是否是独生子女</td>
        <td class="xl67" x:str>是否怀孕</td>
        <td class="xl67" x:str>户口迁入时间</td>
        <td class="xl67" x:str>是否为安置人口</td>
        <td class="xl67" x:str>联系方式</td>
        <td class="xl67" x:str>备注</td>
        <td class="xl67" x:str>安置人口</td>
        <td class="xl67" x:str>大龄未婚人数</td>
        <td class="xl67" x:str>独生子女人数</td>
        <td class="xl67" x:str>怀孕人数</td>
        <td class="xl67" x:str>安置类型</td>
        <td class="xl67" x:str>安置面积</td>
        <td class="xl67" x:str>评估公司</td>
        <td class="xl70" x:str>宅基地面积控制标准内区位补偿款</td>
        <td class="xl70" x:str>宅基地面积控制标准外区位补偿款</td>
        <td class="xl70" x:str>宅基地区位补偿款</td>
        <td class="xl70" x:str>房屋及附属物重置成新价补偿款</td>
        <td class="xl70" x:str>是否包含未经审批房屋重置成新价</td>
        <td class="xl70" x:str>装修补助费</td>
        <td class="xl70" x:str>分户补偿款</td>
        <td class="xl70" x:str>合法宅基地内空地奖</td>
        <td class="xl70" x:str>评估价款合计</td>
        <td class="xl70" x:str>搬家补助费</td>
        <td class="xl70" x:str>安置房补助费</td>
        <td class="xl70" x:str>人员安置补助费</td>
        <td class="xl70" x:str>生活补助费</td>
        <td class="xl70" x:str>停产停业补助费</td>
        <td class="xl70" x:str>独生子女补助费</td>
        <td class="xl70" x:str>住房困难补助费</td>
        <td class="xl70" x:str>周转补助费</td>
        <td class="xl70" x:str>移机费</td>
        <td class="xl70" x:str>提前搬家奖</td>
        <td class="xl70" x:str>合法利用奖</td>
        <td class="xl70" x:str>其他</td>
        <td class="xl70" x:str>拆迁补偿款总计</td>
    </tr>
        <c:forEach items="${pageInfo.result}" var="family" varStatus="status">
            <c:set var="familyPersonList" value="${map[family.id]}"/>
            <c:set var="size" value="${fn:length(familyPersonList)}"/>
        <c:if test="${empty familyPersonList}">
            <c:set var="familyPersonList" value="<%=Arrays.asList(new FamilyPerson())%>"/>
        </c:if>
        <c:forEach var="familyPerson" varStatus="statusItem" items="${familyPersonList}">
    <tr height="41.67" class="xl65" style='height:25.00pt;mso-height-source:userset;mso-height-alt:500;'>
        <c:if test="${statusItem.count eq 1}">
            <td class="xl68" height="41.67" style='height:25.00pt;' rowspan="${size}">${status.count}</td>
            <td class="xl68" rowspan="${size}">${family.familyCode}</td>
            <td class="xl68" rowspan="${size}"><tags:dataDict dataDict="组别" value="${family.groupCode}"/></td>
            <td class="xl68" rowspan="${size}">${family.name}</td>
            <td class="xl68" rowspan="${size}" x:str>${family.idCard}</td>
            <td class="xl68" rowspan="${size}">${family.houseAddress}</td>
            <td class="xl68" rowspan="${size}">${family.confirmArea}</td>
            <td class="xl68" rowspan="${size}">${family.controlArea}</td>
            <td class="xl68" rowspan="${size}">${family.outControlArea}</td>
            <td class="xl68" rowspan="${size}">${family.buildArea}</td>
            <td class="xl68" rowspan="${size}">${family.outBuildArea}</td>
            <td class="xl68" rowspan="${size}"><tags:dataDict dataDict="是否" value="${family.isBussess}"/></td>
            <td class="xl68" rowspan="${size}"><tags:dataDict dataDict="是否" value="${family.isDutyFree}"/></td>
            <td class="xl68" rowspan="${size}">${family.bussessArea}</td>
            <td class="xl68" rowspan="${size}"><tags:dataDict dataDict="是否" value="${family.isLandFee}"/></td>
            <td class="xl68" rowspan="${size}">${family.telephoneNum}</td>
            <td class="xl68" rowspan="${size}">${family.airConditionerNum}</td>
            <td class="xl68" rowspan="${size}">${family.broadbandNum}</td>
            <td class="xl68" rowspan="${size}">${family.tvNum}</td>
            <td class="xl68" rowspan="${size}">${family.waterHeaterNum}</td>
            <td class="xl68" rowspan="${size}">${family.dbNum}</td>
            <td class="xl68" rowspan="${size}">${family.cjNum}</td>
            <td class="xl68" rowspan="${size}">${family.dabNum}</td>
            <td class="xl68" rowspan="${size}">${family.yyzz}</td>
            <td class="xl68" rowspan="${size}">${family.zcgCode}</td>
            <td class="xl68" rowspan="${size}"><fmt:formatDate value="${family.addDate}" pattern="yyyy年MM月dd日"/></td>
            <td class="xl68" rowspan="${size}">${family.summary}</td>
        </c:if>
        <td class="xl68">${familyPerson.personName}</td>
        <td class="xl68"><tags:dataDict dataDict="性别" value="${familyPerson.sex}"/></td>
        <td class="xl68" x:str>${familyPerson.idCard}</td>
        <td class="xl68">${familyPerson.age}</td>
        <td class="xl68">${familyPerson.relation}</td>
        <td class="xl68"><tags:dataDict dataDict="婚姻状况" value="${familyPerson.marrType}"/></td>
        <td class="xl68">${familyPerson.unit}</td>
        <td class="xl68"><tags:dataDict dataDict="是否" value="${familyPerson.oneType}"/></td>
        <td class="xl68"><tags:dataDict dataDict="是否" value="${familyPerson.pregnancyType}"/></td>
        <td class="xl68"><fmt:formatDate value="${familyPerson.qrDate}" pattern="yyyy年MM月dd日"/></td>
        <td class="xl68"><tags:dataDict dataDict="是否" value="${familyPerson.status}"/></td>
        <td class="xl68" x:str>${familyPerson.tel}</td>
        <td class="xl68">${familyPerson.memo}</td>
        <c:if test="${statusItem.count eq 1}">
            <td class="xl68" rowspan="${size}">${family.personNum}</td>
            <td class="xl68" rowspan="${size}">${family.personNo}</td>
            <td class="xl68" rowspan="${size}">${family.personOne}</td>
            <td class="xl68" rowspan="${size}">${family.personPregnancy}</td>
            <td class="xl68" rowspan="${size}"><tags:dataDict  dataDict="安置类型" value="${family.type}"/></td>
            <td class="xl68" rowspan="${size}">${family.houseControlArea}</td>
            <td class="xl68" rowspan="${size}"><tags:dataDict dataDict="评估公司" value="${family.pgCompany}"/></td>
            <td class="xl68" rowspan="${size}">${family.inqwFee}</td>
            <td class="xl68" rowspan="${size}">${family.outqwFee}</td>
            <td class="xl68" rowspan="${size}">${family.qwMoney}</td>
            <td class="xl68" rowspan="${size}">${family.fswFee}</td>
            <td class="xl68" rowspan="${size}"><tags:dataDict dataDict="是否" value="${family.isGiveup}"/></td>
            <td class="xl68" rowspan="${size}">${family.realZxbzFee}</td>
            <td class="xl68" rowspan="${size}">${family.fhbcfFee}</td>
            <td class="xl68" rowspan="${size}">${family.ktjFee}</td>
            <td class="xl68" rowspan="${size}">${family.pgAllCount}</td>
            <td class="xl68" rowspan="${size}">${family.bjbzFee}</td>
            <td class="xl68" rowspan="${size}">${family.azfbzFee}</td>
            <td class="xl68" rowspan="${size}">${family.rybzFee}</td>
            <td class="xl68" rowspan="${size}">${family.shbzFee}</td>
            <td class="xl68" rowspan="${size}">${family.tctyfFee}</td>
            <td class="xl68" rowspan="${size}">${family.onlyFee}</td>
            <td class="xl68" rowspan="${size}">${family.zfknFee}</td>
            <td class="xl68" rowspan="${size}">${family.lsazfFee}</td>
            <td class="xl68" rowspan="${size}">${family.yjfSumFee}</td>
            <td class="xl68" rowspan="${size}">${family.tqbjfFee}</td>
            <td class="xl68" rowspan="${size}">${family.confirmFee}</td>
            <td class="xl68" rowspan="${size}">${family.otherfFee}</td>
            <td class="xl68" rowspan="${size}">${family.bcSumTatal}</td>
        </c:if>
    </tr>
    </c:forEach>
    </c:forEach>
    <tr height="130" style='height:78.00pt;mso-xlrowspan:5;'>
        <td height="130" colspan="73" style='height:78.00pt;mso-ignore:colspan;'></td>
    </tr>
    <tr height="26" style='height:15.60pt;'>
        <td height="26" colspan="47" style='height:15.60pt;mso-ignore:colspan;'></td>
        <td class="xl65"></td>
        <td colspan="25" style='mso-ignore:colspan;'></td>
    </tr>
    <![if supportMisalignedColumns]>
    <tr width="0" style='display:none;'>
        <td width="72" style='width:43;'></td>
        <td width="115" style='width:69;'></td>
        <td width="102" style='width:61;'></td>
        <td width="123" style='width:74;'></td>
        <td width="107" style='width:64;'></td>
        <td width="128" style='width:77;'></td>
        <td width="125" style='width:75;'></td>
        <td width="98" style='width:59;'></td>
        <td width="215" style='width:129;'></td>
        <td width="162" style='width:97;'></td>
        <td width="105" style='width:63;'></td>
        <td width="109" style='width:65;'></td>
        <td width="119" style='width:71;'></td>
        <td width="206" style='width:124;'></td>
        <td width="178" style='width:107;'></td>
        <td width="136" style='width:82;'></td>
        <td width="155" style='width:93;'></td>
        <td width="173" style='width:104;'></td>
        <td width="141" style='width:85;'></td>
        <td width="123" style='width:74;'></td>
        <td width="137" style='width:82;'></td>
        <td width="66" style='width:40;'></td>
        <td width="267" style='width:160;'></td>
        <td width="112" style='width:67;'></td>
        <td width="100" style='width:60;'></td>
        <td width="105" style='width:63;'></td>
        <td width="202" style='width:121;'></td>
        <td width="132" style='width:79;'></td>
        <td width="134" style='width:80;'></td>
        <td width="91" style='width:55;'></td>
        <td width="166" style='width:100;'></td>
        <td width="97" style='width:58;'></td>
        <td width="161" style='width:97;'></td>
        <td width="180" style='width:108;'></td>
        <td width="175" style='width:105;'></td>
        <td width="152" style='width:91;'></td>
        <td width="178" style='width:107;'></td>
        <td width="182" style='width:109;'></td>
        <td width="169" style='width:101;'></td>
        <td width="150" style='width:90;'></td>
        <td width="151" style='width:91;'></td>
        <td width="154" style='width:92;'></td>
        <td width="148" style='width:89;'></td>
        <td width="152" style='width:91;'></td>
        <td width="121" style='width:73;'></td>
        <td width="143" style='width:86;'></td>
        <td width="151" style='width:91;'></td>
        <td width="140" style='width:84;'></td>
        <td width="149" style='width:89;'></td>
        <td width="166" style='width:100;'></td>
        <td width="149" style='width:89;'></td>
        <td width="137" style='width:82;'></td>
        <td width="109" style='width:65;'></td>
        <td width="130" style='width:78;'></td>
        <td width="134" style='width:80;'></td>
        <td width="103" style='width:62;'></td>
        <td width="154" style='width:92;'></td>
    </tr>
    <![endif]>
</table>
</body>
</html>
