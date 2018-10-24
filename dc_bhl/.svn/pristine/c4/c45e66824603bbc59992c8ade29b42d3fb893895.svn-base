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
    String fileName ="历史签约信息台账";
    String currentDate = DateUtils.date2string("yyyy-MM-dd",new Date());
    //将文件名称转为iso8859-1编码，防止乱码
    fileName = new String(fileName.getBytes("gbk"), "ISO-8859-1");
    //设置导出弹出框
    response.addHeader("content-disposition", "fileName= "+ fileName +""+ currentDate +".xls");
%>
<html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="ProgId" content="Excel.Sheet"/>
    <meta name="Generator" content="WPS Office ET"/>
    <!--[if gte mso 9]>
    <xml>
        <o:DocumentProperties>
            <o:Created>2018-05-10T11:19:24</o:Created>
            <o:LastAuthor>欠你一场旅行</o:LastAuthor>
            <o:LastSaved>2018-05-10T13:32:13</o:LastSaved>
        </o:DocumentProperties>
        <o:CustomDocumentProperties>
            <o:KSOProductBuildVer dt:dt="string">2052-10.1.0.7346</o:KSOProductBuildVer>
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
        .font0
        {color:windowtext;
            font-size:12.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:"宋体";
            mso-generic-font-family:auto;
            mso-font-charset:134;}
        .font1
        {color:windowtext;
            font-size:22.0pt;
            font-weight:700;
            font-style:normal;
            text-decoration:none;
            font-family:"宋体";
            mso-generic-font-family:auto;
            mso-font-charset:134;}
        .font2
        {color:#333333;
            font-size:12.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:"宋体";
            mso-generic-font-family:auto;
            mso-font-charset:134;}
        .font3
        {color:#000000;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:"宋体";
            mso-generic-font-family:auto;
            mso-font-charset:134;}
        .font4
        {color:#333399;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:"宋体";
            mso-generic-font-family:auto;
            mso-font-charset:134;}
        .font5
        {color:#FFFFFF;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:"宋体";
            mso-generic-font-family:auto;
            mso-font-charset:134;}
        .font6
        {color:#000000;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:"宋体";
            mso-generic-font-family:auto;
            mso-font-charset:134;}
        .font7
        {color:#3F3F3F;
            font-size:11.0pt;
            font-weight:700;
            font-style:normal;
            text-decoration:none;
            font-family:"宋体";
            mso-generic-font-family:auto;
            mso-font-charset:134;}
        .font8
        {color:#7F7F7F;
            font-size:11.0pt;
            font-weight:400;
            font-style:italic;
            text-decoration:none;
            font-family:"宋体";
            mso-generic-font-family:auto;
            mso-font-charset:134;}
        .font9
        {color:#1F497D;
            font-size:11.0pt;
            font-weight:700;
            font-style:normal;
            text-decoration:none;
            font-family:"宋体";
            mso-generic-font-family:auto;
            mso-font-charset:134;}
        .font10
        {color:#800080;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:underline;
            text-underline-style:single;
            font-family:"宋体";
            mso-generic-font-family:auto;
            mso-font-charset:0;}
        .font11
        {color:#9C0006;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:"宋体";
            mso-generic-font-family:auto;
            mso-font-charset:134;}
        .font12
        {color:#9C6500;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:"宋体";
            mso-generic-font-family:auto;
            mso-font-charset:134;}
        .font13
        {color:#3F3F76;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:"宋体";
            mso-generic-font-family:auto;
            mso-font-charset:134;}
        .font14
        {color:#FA7D00;
            font-size:11.0pt;
            font-weight:700;
            font-style:normal;
            text-decoration:none;
            font-family:"宋体";
            mso-generic-font-family:auto;
            mso-font-charset:134;}
        .font15
        {color:#1F497D;
            font-size:13.0pt;
            font-weight:700;
            font-style:normal;
            text-decoration:none;
            font-family:"宋体";
            mso-generic-font-family:auto;
            mso-font-charset:134;}
        .font16
        {color:#FF0000;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:"宋体";
            mso-generic-font-family:auto;
            mso-font-charset:134;}
        .font17
        {color:#006100;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:"宋体";
            mso-generic-font-family:auto;
            mso-font-charset:134;}
        .font18
        {color:#1F497D;
            font-size:18.0pt;
            font-weight:700;
            font-style:normal;
            text-decoration:none;
            font-family:"宋体";
            mso-generic-font-family:auto;
            mso-font-charset:134;}
        .font19
        {color:#0000FF;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:underline;
            text-underline-style:single;
            font-family:"宋体";
            mso-generic-font-family:auto;
            mso-font-charset:0;}
        .font20
        {color:#FA7D00;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:"宋体";
            mso-generic-font-family:auto;
            mso-font-charset:134;}
        .font21
        {color:#1F497D;
            font-size:15.0pt;
            font-weight:700;
            font-style:normal;
            text-decoration:none;
            font-family:"宋体";
            mso-generic-font-family:auto;
            mso-font-charset:134;}
        .font22
        {color:#FFFFFF;
            font-size:11.0pt;
            font-weight:700;
            font-style:normal;
            text-decoration:none;
            font-family:"宋体";
            mso-generic-font-family:auto;
            mso-font-charset:134;}
        .font23
        {color:#000000;
            font-size:11.0pt;
            font-weight:700;
            font-style:normal;
            text-decoration:none;
            font-family:"宋体";
            mso-generic-font-family:auto;
            mso-font-charset:134;}
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
        .style16
        {mso-number-format:"_ \0022\00A5\0022* \#\,\#\#0\.00_ \;_ \0022\00A5\0022* \\-\#\,\#\#0\.00_ \;_ \0022\00A5\0022* \0022-\0022??_ \;_ \@_ ";
            mso-style-name:"货币[0]";
            mso-style-id:7;}
        .style17
        {mso-pattern:auto none;
            background:#EBF1DE;
            color:#000000;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:宋体;
            mso-generic-font-family:auto;
            mso-font-charset:134;
            mso-style-name:"20% - 强调文字颜色 3";}
        .style18
        {mso-pattern:auto none;
            background:#FFCC99;
            color:#3F3F76;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:宋体;
            mso-generic-font-family:auto;
            mso-font-charset:134;
            border:.5pt solid #7F7F7F;
            mso-style-name:"输入";}
        .style19
        {mso-pattern:auto none;
            background:#FFCC99;
            color:#333399;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:宋体;
            mso-generic-font-family:auto;
            mso-font-charset:134;
            border:.5pt solid #808080;
            mso-style-name:"货币";
            mso-style-id:4;}
        .style20
        {mso-pattern:auto none;
            background:#FFFFFF;
            color:#000000;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:宋体;
            mso-generic-font-family:auto;
            mso-font-charset:134;
            mso-style-name:"千位分隔[0]";
            mso-style-id:6;}
        .style21
        {mso-pattern:auto none;
            background:#D8E4BC;
            color:#000000;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:宋体;
            mso-generic-font-family:auto;
            mso-font-charset:134;
            mso-style-name:"40% - 强调文字颜色 3";}
        .style22
        {mso-pattern:auto none;
            background:#FFC7CE;
            color:#9C0006;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:宋体;
            mso-generic-font-family:auto;
            mso-font-charset:134;
            mso-style-name:"差";}
        .style23
        {mso-number-format:"_ \0022\00A5\0022* \#\,\#\#0_ \;_ \0022\00A5\0022* \\-\#\,\#\#0_ \;_ \0022\00A5\0022* \0022-\0022_ \;_ \@_ ";
            mso-style-name:"千位分隔";
            mso-style-id:3;}
        .style24
        {mso-pattern:auto none;
            background:#C4D79B;
            color:#FFFFFF;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:宋体;
            mso-generic-font-family:auto;
            mso-font-charset:134;
            mso-style-name:"60% - 强调文字颜色 3";}
        .style25
        {color:#0000FF;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:underline;
            text-underline-style:single;
            font-family:宋体;
            mso-generic-font-family:auto;
            mso-font-charset:0;
            mso-style-name:"超链接";
            mso-style-id:8;}
        .style26
        {mso-number-format:"_ * \#\,\#\#0_ \;_ * \\-\#\,\#\#0_ \;_ * \0022-\0022_ \;_ \@_ ";
            mso-style-name:"百分比";
            mso-style-id:5;}
        .style27
        {color:#800080;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:underline;
            text-underline-style:single;
            font-family:宋体;
            mso-generic-font-family:auto;
            mso-font-charset:0;
            mso-style-name:"已访问的超链接";
            mso-style-id:9;}
        .style28
        {mso-pattern:auto none;
            background:#FFFFCC;
            border:.5pt solid #B2B2B2;
            mso-style-name:"注释";}
        .style29
        {mso-pattern:auto none;
            background:#DA9694;
            color:#FFFFFF;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:宋体;
            mso-generic-font-family:auto;
            mso-font-charset:134;
            mso-style-name:"60% - 强调文字颜色 2";}
        .style30
        {color:#1F497D;
            font-size:11.0pt;
            font-weight:700;
            font-style:normal;
            text-decoration:none;
            font-family:宋体;
            mso-generic-font-family:auto;
            mso-font-charset:134;
            mso-style-name:"标题 4";}
        .style31
        {color:#FF0000;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:宋体;
            mso-generic-font-family:auto;
            mso-font-charset:134;
            mso-style-name:"警告文本";}
        .style32
        {color:#1F497D;
            font-size:18.0pt;
            font-weight:700;
            font-style:normal;
            text-decoration:none;
            font-family:宋体;
            mso-generic-font-family:auto;
            mso-font-charset:134;
            mso-style-name:"标题";}
        .style33
        {color:#7F7F7F;
            font-size:11.0pt;
            font-weight:400;
            font-style:italic;
            text-decoration:none;
            font-family:宋体;
            mso-generic-font-family:auto;
            mso-font-charset:134;
            mso-style-name:"解释性文本";}
        .style34
        {color:#1F497D;
            font-size:15.0pt;
            font-weight:700;
            font-style:normal;
            text-decoration:none;
            font-family:宋体;
            mso-generic-font-family:auto;
            mso-font-charset:134;
            border-left:none;
            border-top:none;
            border-right:none;
            border-bottom:1.5pt solid #4F81BD;
            mso-style-name:"标题 1";}
        .style35
        {color:#1F497D;
            font-size:13.0pt;
            font-weight:700;
            font-style:normal;
            text-decoration:none;
            font-family:宋体;
            mso-generic-font-family:auto;
            mso-font-charset:134;
            border-left:none;
            border-top:none;
            border-right:none;
            border-bottom:1.5pt solid #A7BFDE;
            mso-style-name:"标题 2";}
        .style36
        {mso-pattern:auto none;
            background:#95B3D7;
            color:#FFFFFF;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:宋体;
            mso-generic-font-family:auto;
            mso-font-charset:134;
            mso-style-name:"60% - 强调文字颜色 1";}
        .style37
        {color:#1F497D;
            font-size:11.0pt;
            font-weight:700;
            font-style:normal;
            text-decoration:none;
            font-family:宋体;
            mso-generic-font-family:auto;
            mso-font-charset:134;
            border-left:none;
            border-top:none;
            border-right:none;
            border-bottom:1.0pt solid #95B3D7;
            mso-style-name:"标题 3";}
        .style38
        {mso-pattern:auto none;
            background:#B1A0C7;
            color:#FFFFFF;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:宋体;
            mso-generic-font-family:auto;
            mso-font-charset:134;
            mso-style-name:"60% - 强调文字颜色 4";}
        .style39
        {mso-pattern:auto none;
            background:#F2F2F2;
            color:#3F3F3F;
            font-size:11.0pt;
            font-weight:700;
            font-style:normal;
            text-decoration:none;
            font-family:宋体;
            mso-generic-font-family:auto;
            mso-font-charset:134;
            border:.5pt solid #3F3F3F;
            mso-style-name:"输出";}
        .style40
        {mso-pattern:auto none;
            background:#F2F2F2;
            color:#FA7D00;
            font-size:11.0pt;
            font-weight:700;
            font-style:normal;
            text-decoration:none;
            font-family:宋体;
            mso-generic-font-family:auto;
            mso-font-charset:134;
            border:.5pt solid #7F7F7F;
            mso-style-name:"计算";}
        .style41
        {mso-pattern:auto none;
            background:#A5A5A5;
            color:#FFFFFF;
            font-size:11.0pt;
            font-weight:700;
            font-style:normal;
            text-decoration:none;
            font-family:宋体;
            mso-generic-font-family:auto;
            mso-font-charset:134;
            border:2.0pt double #3F3F3F;
            mso-style-name:"检查单元格";}
        .style42
        {mso-pattern:auto none;
            background:#FDE9D9;
            color:#000000;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:宋体;
            mso-generic-font-family:auto;
            mso-font-charset:134;
            mso-style-name:"20% - 强调文字颜色 6";}
        .style43
        {mso-pattern:auto none;
            background:#C0504D;
            color:#FFFFFF;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:宋体;
            mso-generic-font-family:auto;
            mso-font-charset:134;
            mso-style-name:"强调文字颜色 2";}
        .style44
        {color:#FA7D00;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:宋体;
            mso-generic-font-family:auto;
            mso-font-charset:134;
            border-left:none;
            border-top:none;
            border-right:none;
            border-bottom:2.0pt double #FF8001;
            mso-style-name:"链接单元格";}
        .style45
        {color:#000000;
            font-size:11.0pt;
            font-weight:700;
            font-style:normal;
            text-decoration:none;
            font-family:宋体;
            mso-generic-font-family:auto;
            mso-font-charset:134;
            border-left:none;
            border-top:.5pt solid #4F81BD;
            border-right:none;
            border-bottom:2.0pt double #4F81BD;
            mso-style-name:"汇总";}
        .style46
        {mso-pattern:auto none;
            background:#C6EFCE;
            color:#006100;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:宋体;
            mso-generic-font-family:auto;
            mso-font-charset:134;
            mso-style-name:"好";}
        .style47
        {mso-pattern:auto none;
            background:#FFEB9C;
            color:#9C6500;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:宋体;
            mso-generic-font-family:auto;
            mso-font-charset:134;
            mso-style-name:"适中";}
        .style48
        {mso-pattern:auto none;
            background:#DAEEF3;
            color:#000000;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:宋体;
            mso-generic-font-family:auto;
            mso-font-charset:134;
            mso-style-name:"20% - 强调文字颜色 5";}
        .style49
        {mso-pattern:auto none;
            background:#4F81BD;
            color:#FFFFFF;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:宋体;
            mso-generic-font-family:auto;
            mso-font-charset:134;
            mso-style-name:"强调文字颜色 1";}
        .style50
        {mso-pattern:auto none;
            background:#DCE6F1;
            color:#000000;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:宋体;
            mso-generic-font-family:auto;
            mso-font-charset:134;
            mso-style-name:"20% - 强调文字颜色 1";}
        .style51
        {mso-pattern:auto none;
            background:#B8CCE4;
            color:#000000;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:宋体;
            mso-generic-font-family:auto;
            mso-font-charset:134;
            mso-style-name:"40% - 强调文字颜色 1";}
        .style52
        {mso-pattern:auto none;
            background:#F2DCDB;
            color:#000000;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:宋体;
            mso-generic-font-family:auto;
            mso-font-charset:134;
            mso-style-name:"20% - 强调文字颜色 2";}
        .style53
        {mso-pattern:auto none;
            background:#E6B8B7;
            color:#000000;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:宋体;
            mso-generic-font-family:auto;
            mso-font-charset:134;
            mso-style-name:"40% - 强调文字颜色 2";}
        .style54
        {mso-pattern:auto none;
            background:#9BBB59;
            color:#FFFFFF;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:宋体;
            mso-generic-font-family:auto;
            mso-font-charset:134;
            mso-style-name:"强调文字颜色 3";}
        .style55
        {mso-pattern:auto none;
            background:#8064A2;
            color:#FFFFFF;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:宋体;
            mso-generic-font-family:auto;
            mso-font-charset:134;
            mso-style-name:"强调文字颜色 4";}
        .style56
        {mso-pattern:auto none;
            background:#E4DFEC;
            color:#000000;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:宋体;
            mso-generic-font-family:auto;
            mso-font-charset:134;
            mso-style-name:"20% - 强调文字颜色 4";}
        .style57
        {mso-pattern:auto none;
            background:#CCC0DA;
            color:#000000;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:宋体;
            mso-generic-font-family:auto;
            mso-font-charset:134;
            mso-style-name:"40% - 强调文字颜色 4";}
        .style58
        {mso-pattern:auto none;
            background:#4BACC6;
            color:#FFFFFF;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:宋体;
            mso-generic-font-family:auto;
            mso-font-charset:134;
            mso-style-name:"强调文字颜色 5";}
        .style59
        {mso-pattern:auto none;
            background:#B7DEE8;
            color:#000000;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:宋体;
            mso-generic-font-family:auto;
            mso-font-charset:134;
            mso-style-name:"40% - 强调文字颜色 5";}
        .style60
        {mso-pattern:auto none;
            background:#92CDDC;
            color:#FFFFFF;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:宋体;
            mso-generic-font-family:auto;
            mso-font-charset:134;
            mso-style-name:"60% - 强调文字颜色 5";}
        .style61
        {mso-pattern:auto none;
            background:#F79646;
            color:#FFFFFF;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:宋体;
            mso-generic-font-family:auto;
            mso-font-charset:134;
            mso-style-name:"强调文字颜色 6";}
        .style62
        {mso-pattern:auto none;
            background:#FCD5B4;
            color:#000000;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:宋体;
            mso-generic-font-family:auto;
            mso-font-charset:134;
            mso-style-name:"40% - 强调文字颜色 6";}
        .style63
        {mso-pattern:auto none;
            background:#FABF8F;
            color:#FFFFFF;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:宋体;
            mso-generic-font-family:auto;
            mso-font-charset:134;
            mso-style-name:"60% - 强调文字颜色 6";}
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
            white-space:normal;
            mso-font-charset:134;}
        .xl66
        {mso-style-parent:style0;
            white-space:normal;
            mso-font-charset:134;}
        .xl67
        {mso-style-parent:style0;
            text-align:left;
            white-space:normal;
            font-size:22.0pt;
            font-weight:700;
            mso-font-charset:134;
            border-left:.5pt solid windowtext;
            border-top:.5pt solid windowtext;
            border-bottom:.5pt solid windowtext;}
        .xl68
        {mso-style-parent:style0;
            text-align:left;
            white-space:normal;
            mso-font-charset:134;
            border-top:.5pt solid windowtext;
            border-bottom:.5pt solid windowtext;}
        .xl69
        {mso-style-parent:style0;
            text-align:center;
            white-space:normal;
            mso-pattern:auto none;
            background:#C0C0C0;
            mso-font-charset:134;
            border:.5pt solid windowtext;}
        .xl70
        {mso-style-parent:style0;
            text-align:center;
            white-space:normal;
            mso-font-charset:134;
            border:.5pt solid windowtext;}
        .xl71
        {mso-style-parent:style0;
            mso-number-format:"\@";
            text-align:center;
            white-space:normal;
            mso-font-charset:134;
            border:.5pt solid windowtext;}
        .xl72
        {mso-style-parent:style0;
            text-align:center;
            white-space:normal;
            mso-font-charset:134;
            border:.5pt solid windowtext;}
        .xl73
        {mso-style-parent:style0;
            text-align:center;
            white-space:normal;
            mso-pattern:auto none;
            background:#BFBFBF;
            mso-font-charset:134;
            border:.5pt solid windowtext;}
        .xl74
        {mso-style-parent:style0;
            text-align:center;
            white-space:normal;
            mso-pattern:auto none;
            background:#BFBFBF;
            mso-font-charset:134;
            border:.5pt solid windowtext;}
        .xl75
        {mso-style-parent:style0;
            text-align:center;
            white-space:normal;
            mso-pattern:auto none;
            background:#BFBFBF;
            color:#333333;
            mso-font-charset:134;
            border:.5pt solid windowtext;}
        .xl76
        {mso-style-parent:style0;
            text-align:left;
            white-space:normal;
            mso-font-charset:134;
            border-top:.5pt solid windowtext;
            border-right:.5pt solid windowtext;
            border-bottom:.5pt solid windowtext;}
        .xl77
        {mso-style-parent:style0;
            mso-number-format:"yyyy/m/d";
            text-align:center;
            white-space:normal;
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
                        <x:DefaultRowHeight>439</x:DefaultRowHeight>
                        <x:Unsynced/>
                        <x:Selected/>
                        <x:Panes>
                            <x:Pane>
                                <x:Number>3</x:Number>
                                <x:ActiveCol>5</x:ActiveCol>
                                <x:ActiveRow>4</x:ActiveRow>
                                <x:RangeSelection>F5</x:RangeSelection>
                            </x:Pane>
                        </x:Panes>
                        <x:ProtectContents>False</x:ProtectContents>
                        <x:ProtectObjects>False</x:ProtectObjects>
                        <x:ProtectScenarios>False</x:ProtectScenarios>
                        <x:Print>
                            <x:ValidPrinterInfo/>
                            <x:PaperSizeIndex>9</x:PaperSizeIndex>
                            <x:HorizontalResolution>600</x:HorizontalResolution>
                            <x:VerticalResolution>600</x:VerticalResolution>
                        </x:Print>
                    </x:WorksheetOptions>
                </x:ExcelWorksheet>
            </x:ExcelWorksheets>
            <x:ProtectStructure>False</x:ProtectStructure>
            <x:ProtectWindows>False</x:ProtectWindows>
            <x:WindowHeight>3855</x:WindowHeight>
            <x:WindowWidth>28740</x:WindowWidth>
        </x:ExcelWorkbook>
    </xml>
    <![endif]-->
</head>
<body link="blue" vlink="purple" class="xl66">
<table width="3261" border="0" cellpadding="0" cellspacing="0" style='width:2445.75pt;border-collapse:collapse;table-layout:fixed;'>
    <col width="77" class="xl66" style='mso-width-source:userset;mso-width-alt:2464;'/>
    <col width="120" class="xl66" style='mso-width-source:userset;mso-width-alt:3840;'/>
    <col width="101" span="2" class="xl66" style='mso-width-source:userset;mso-width-alt:3232;'/>
    <col width="178" class="xl66" style='mso-width-source:userset;mso-width-alt:5696;'/>
    <col width="183" class="xl66" style='mso-width-source:userset;mso-width-alt:5856;'/>
    <col width="92" class="xl66" style='mso-width-source:userset;mso-width-alt:2944;'/>
    <col width="75" class="xl66" style='mso-width-source:userset;mso-width-alt:2400;'/>
    <col width="78" class="xl66" style='mso-width-source:userset;mso-width-alt:2496;'/>
    <col width="128" span="2" class="xl66" style='mso-width-source:userset;mso-width-alt:4096;'/>
    <col width="161" class="xl66" style='mso-width-source:userset;mso-width-alt:5152;'/>
    <col width="87" class="xl66" style='mso-width-source:userset;mso-width-alt:2784;'/>
    <col width="200" class="xl66" style='mso-width-source:userset;mso-width-alt:6400;'/>
    <col width="75" class="xl66" style='mso-width-source:userset;mso-width-alt:2400;'/>
    <col width="54" class="xl66" style='mso-width-source:userset;mso-width-alt:1728;'/>
    <col width="79" class="xl66" style='mso-width-source:userset;mso-width-alt:2528;'/>
    <col width="81" class="xl66" style='mso-width-source:userset;mso-width-alt:2592;'/>
    <col width="79" class="xl66" style='mso-width-source:userset;mso-width-alt:2528;'/>
    <col width="134" class="xl66" style='mso-width-source:userset;mso-width-alt:4288;'/>
    <col width="106" class="xl66" style='mso-width-source:userset;mso-width-alt:3392;'/>
    <col width="118" class="xl66" style='mso-width-source:userset;mso-width-alt:3776;'/>
    <col width="158" class="xl66" style='mso-width-source:userset;mso-width-alt:5056;'/>
    <col width="106" class="xl66" style='mso-width-source:userset;mso-width-alt:3392;'/>
    <col width="83" class="xl66" style='mso-width-source:userset;mso-width-alt:2656;'/>
    <col width="93" class="xl66" style='mso-width-source:userset;mso-width-alt:2976;'/>
    <col width="125" class="xl66" style='mso-width-source:userset;mso-width-alt:4000;'/>
    <col width="261" class="xl66" style='mso-width-source:userset;mso-width-alt:8352;'/>
    <col width="72" span="228" class="xl66" style='mso-width-source:userset;mso-width-alt:2304;'/>
    <tr height="56" style='height:42.00pt;mso-height-source:userset;mso-height-alt:840;'>
        <td class="xl67" height="56" width="3261" colspan="28" style='height:42.00pt;width:2445.75pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str><span style='mso-spacerun:yes;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>历史签约台帐</td>
    </tr>
    <tr height="42.80" class="xl65" style='height:32.10pt;mso-height-source:userset;mso-height-alt:642;'>
        <td class="xl69" height="85.60" rowspan="2" style='height:64.20pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>序号</td>
        <td class="xl69" rowspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>编号</td>
        <td class="xl69" rowspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>联系电话</td>
        <td class="xl69" rowspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>被拆迁人</td>
        <td class="xl69" rowspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>身份证号</td>
        <td class="xl69" rowspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>通信地址</td>
        <td class="xl69" rowspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>邮政编码</td>
        <td class="xl69" rowspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>正式户口</td>
        <td class="xl69" rowspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>安置人口</td>
        <td class="xl69" rowspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>被拆迁人与产权人/承租人关系</td>
        <td class="xl69" rowspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>是否有补充协议</td>
        <td class="xl69" rowspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>地址门牌</td>
        <td class="xl69" rowspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>房屋产别</td>
        <td class="xl69" rowspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>产权单位</td>
        <td class="xl69" rowspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>房屋类型</td>
        <td class="xl69" rowspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>间数</td>
        <td class="xl69" rowspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>使用面积</td>
        <td class="xl69" rowspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>建筑面积</td>
        <td class="xl69" rowspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>用途</td>
        <td class="xl69" rowspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>营业执照号</td>
        <td class="xl73" colspan="3" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>安置人口</td>
        <td class="xl73" rowspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>购房款合计/元<span style='mso-spacerun:yes;'>&nbsp;</span></td>
        <td class="xl73" rowspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>公共维修基金/元<span style='mso-spacerun:yes;'>&nbsp;</span></td>
        <td class="xl73" rowspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>贷款人民币/元</td>
        <td class="xl73" rowspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>签约日期</td>
        <td class="xl73" rowspan="2" style='border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str>备注</td>
    </tr>
    <tr height="42.80" class="xl65" style='height:32.10pt;mso-height-source:userset;mso-height-alt:642;'>
        <td class="xl75" x:str>类别</td>
        <td class="xl75" x:str>姓名</td>
        <td class="xl75" x:str>身份证号</td>
    </tr>
<c:forEach items="${pageInfo.result}" var="historyFamily" varStatus="fstatus">
    <c:forEach items="${historyFamilyPersonList[historyFamily.id]}" var="person" varStatus="pstatus">
        <c:set var="rowHeight" value="${fn:length(historyFamilyPersonList[historyFamily.id])}"/>
    <tr height="41.33" style='height:31.00pt;mso-height-source:userset;mso-height-alt:620;'>
        <c:if test="${pstatus.first}">
            <td class="xl70" height="41.33" style='height:31.00pt;' x:num rowspan="${rowHeight}">${fstatus.count}</td>
            <td class="xl71" x:str rowspan="${rowHeight}">${historyFamily.familyCode}</td>
            <td class="xl71" x:str rowspan="${rowHeight}">${historyFamily.tel}</td>
            <td class="xl71" x:str rowspan="${rowHeight}">${historyFamily.name}</td>
            <td class="xl71" x:str rowspan="${rowHeight}">${historyFamily.idCard}</td>
            <td class="xl71" x:str rowspan="${rowHeight}">${historyFamily.mailAddress}</td>
            <td class="xl71" x:str rowspan="${rowHeight}">${historyFamily.mailCode}</td>
            <td class="xl72" x:num rowspan="${rowHeight}">${historyFamily.hjNum}</td>
            <td class="xl72" x:num rowspan="${rowHeight}">${historyFamily.azPersonNum}</td>
            <td class="xl71" x:str rowspan="${rowHeight}">${historyFamily.relation}</td>
            <td class="xl71" x:str rowspan="${rowHeight}"><tags:dataDict dataDict="是否" value="${historyFamily.bcStatus}"/></td>
            <td class="xl71" x:str rowspan="${rowHeight}">${historyFamily.address}</td>
            <td class="xl71" x:str rowspan="${rowHeight}"><tags:dataDict dataDict="房屋产别" value="${historyFamily.houseType}"/></td>
            <td class="xl71" x:str rowspan="${rowHeight}">${historyFamily.houseCompany}</td>
            <td class="xl71" x:str rowspan="${rowHeight}"><tags:dataDict dataDict="房屋类型" value="${historyFamily.houseStyle}"/></td>
            <td class="xl70" x:num rowspan="${rowHeight}">${historyFamily.houseNum}</td>
            <td class="xl70" x:num rowspan="${rowHeight}">${historyFamily.useArea}</td>
            <td class="xl70" x:num rowspan="${rowHeight}">${historyFamily.buildArea}</td>
            <td class="xl70" x:str rowspan="${rowHeight}"><tags:dataDict dataDict="住宅房屋用途" value="${historyFamily.houseUse}"/><span style='mso-spacerun:yes;'>&nbsp;</span></td>
            <td class="xl70" rowspan="${rowHeight}">${historyFamily.businessCode}</td>
        </c:if>
        <td class="xl70"><tags:dataDict dataDict="安置人口类别" value="${person.type}"/> </td>
        <td class="xl70">${person.name}</td>
        <td class="xl70" x:str>${person.idCard}</td>
        <c:if test="${pstatus.first}">
            <td class="xl70" x:num rowspan="${rowHeight}">${historyFamily.buyHouseMoney}</td>
            <td class="xl70" x:num rowspan="${rowHeight}">${historyFamily.gwMoney}</td>
            <td class="xl70" x:num rowspan="${rowHeight}">${historyFamily.dkMoney}</td>
            <td class="xl77" x:num="42953." rowspan="${rowHeight}"><fmt:formatDate value="${historyFamily.signDate}" pattern="yyyy-MM-dd"/></td>
            <td class="xl70" rowspan="${rowHeight}">${historyFamily.memo}</td>
        </c:if>
    </tr>
    </c:forEach>
    </c:forEach>
    <![if supportMisalignedColumns]>
    <tr width="0" style='display:none;'>
        <td width="77" style='width:58;'></td>
        <td width="120" style='width:90;'></td>
        <td width="101" style='width:76;'></td>
        <td width="178" style='width:134;'></td>
        <td width="183" style='width:137;'></td>
        <td width="92" style='width:69;'></td>
        <td width="75" style='width:56;'></td>
        <td width="78" style='width:59;'></td>
        <td width="128" style='width:96;'></td>
        <td width="161" style='width:121;'></td>
        <td width="87" style='width:65;'></td>
        <td width="200" style='width:150;'></td>
        <td width="75" style='width:56;'></td>
        <td width="54" style='width:41;'></td>
        <td width="79" style='width:59;'></td>
        <td width="81" style='width:61;'></td>
        <td width="79" style='width:59;'></td>
        <td width="134" style='width:101;'></td>
        <td width="106" style='width:80;'></td>
        <td width="118" style='width:89;'></td>
        <td width="158" style='width:119;'></td>
        <td width="106" style='width:80;'></td>
        <td width="83" style='width:62;'></td>
        <td width="93" style='width:70;'></td>
        <td width="125" style='width:94;'></td>
        <td width="261" style='width:196;'></td>
        <td width="72" style='width:54;'></td>
    </tr>
    <![endif]>
</table>
</body>
</html>


