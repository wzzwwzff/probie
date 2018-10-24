<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page import="com.sqds.utils.DateUtils" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //设置浏览器识别
    response.setContentType("application/msexcel;charset=utf-8");
    //设置文件的名称
    String fileName ="非宅信息台账";
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
            <o:Author>user001</o:Author>
            <o:Company>P R C</o:Company>
            <o:Created>2017-12-06T20:17:51</o:Created>
            <o:LastAuthor>欠你一场旅行</o:LastAuthor>
            <o:LastSaved>2018-05-10T10:37:51</o:LastSaved>
        </o:DocumentProperties>
        <o:CustomDocumentProperties>
            <o:KSOProductBuildVer dt:dt="string">2052-10.1.0.7346</o:KSOProductBuildVer>
        </o:CustomDocumentProperties>
    </xml>
    <![endif]-->
    <style>
        <!-- @page
        {margin:0.75in 0.71in 0.75in 0.71in;
            mso-header-margin:0.32in;
            mso-footer-margin:0.32in;}
        tr
        {mso-height-source:auto;
            mso-ruby-visibility:none;}
        col
        {mso-width-source:auto;
            mso-ruby-visibility:none;}
        br
        {mso-data-placement:same-cell;}
        .font0
        {color:#000000;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:"宋体";
            mso-generic-font-family:auto;
            mso-font-charset:134;}
        .font1
        {color:#000000;
            font-size:22.0pt;
            font-weight:700;
            font-style:normal;
            text-decoration:none;
            font-family:"宋体";
            mso-generic-font-family:auto;
            mso-font-charset:134;}
        .font2
        {color:#FFFFFF;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:"宋体";
            mso-generic-font-family:auto;
            mso-font-charset:134;}
        .font3
        {color:#3F3F3F;
            font-size:11.0pt;
            font-weight:700;
            font-style:normal;
            text-decoration:none;
            font-family:"宋体";
            mso-generic-font-family:auto;
            mso-font-charset:134;}
        .font4
        {color:#1F497D;
            font-size:13.0pt;
            font-weight:700;
            font-style:normal;
            text-decoration:none;
            font-family:"宋体";
            mso-generic-font-family:auto;
            mso-font-charset:134;}
        .font5
        {color:#FF0000;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:"宋体";
            mso-generic-font-family:auto;
            mso-font-charset:134;}
        .font6
        {color:#9C0006;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:"宋体";
            mso-generic-font-family:auto;
            mso-font-charset:134;}
        .font7
        {color:#9C6500;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:"宋体";
            mso-generic-font-family:auto;
            mso-font-charset:134;}
        .font8
        {color:#FA7D00;
            font-size:11.0pt;
            font-weight:700;
            font-style:normal;
            text-decoration:none;
            font-family:"宋体";
            mso-generic-font-family:auto;
            mso-font-charset:134;}
        .font9
        {color:#FA7D00;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:"宋体";
            mso-generic-font-family:auto;
            mso-font-charset:134;}
        .font10
        {color:#1F497D;
            font-size:15.0pt;
            font-weight:700;
            font-style:normal;
            text-decoration:none;
            font-family:"宋体";
            mso-generic-font-family:auto;
            mso-font-charset:134;}
        .font11
        {color:#FFFFFF;
            font-size:11.0pt;
            font-weight:700;
            font-style:normal;
            text-decoration:none;
            font-family:"宋体";
            mso-generic-font-family:auto;
            mso-font-charset:134;}
        .font12
        {color:#1F497D;
            font-size:11.0pt;
            font-weight:700;
            font-style:normal;
            text-decoration:none;
            font-family:"宋体";
            mso-generic-font-family:auto;
            mso-font-charset:134;}
        .font13
        {color:#1F497D;
            font-size:18.0pt;
            font-weight:700;
            font-style:normal;
            text-decoration:none;
            font-family:"宋体";
            mso-generic-font-family:auto;
            mso-font-charset:134;}
        .font14
        {color:#0000FF;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:underline;
            text-underline-style:single;
            font-family:"宋体";
            mso-generic-font-family:auto;
            mso-font-charset:134;}
        .font15
        {color:#3F3F76;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:"宋体";
            mso-generic-font-family:auto;
            mso-font-charset:134;}
        .font16
        {color:#7F7F7F;
            font-size:11.0pt;
            font-weight:400;
            font-style:italic;
            text-decoration:none;
            font-family:"宋体";
            mso-generic-font-family:auto;
            mso-font-charset:134;}
        .font17
        {color:#800080;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:underline;
            text-underline-style:single;
            font-family:"宋体";
            mso-generic-font-family:auto;
            mso-font-charset:134;}
        .font18
        {color:#006100;
            font-size:11.0pt;
            font-weight:400;
            font-style:normal;
            text-decoration:none;
            font-family:"宋体";
            mso-generic-font-family:auto;
            mso-font-charset:134;}
        .font19
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
            color:#000000;
            font-size:11.0pt;
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
        {mso-number-format:"_ \0022\00A5\0022* \#\,\#\#0_ \;_ \0022\00A5\0022* \\-\#\,\#\#0_ \;_ \0022\00A5\0022* \0022-\0022_ \;_ \@_ ";
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
        {mso-number-format:"_ \0022\00A5\0022* \#\,\#\#0\.00_ \;_ \0022\00A5\0022* \\-\#\,\#\#0\.00_ \;_ \0022\00A5\0022* \0022-\0022??_ \;_ \@_ ";
            mso-style-name:"货币";
            mso-style-id:4;}
        .style20
        {mso-number-format:"_ * \#\,\#\#0_ \;_ * \\-\#\,\#\#0_ \;_ * \0022-\0022_ \;_ \@_ ";
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
        {mso-number-format:"_ * \#\,\#\#0\.00_ \;_ * \\-\#\,\#\#0\.00_ \;_ * \0022-\0022??_ \;_ \@_ ";
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
            mso-font-charset:134;
            mso-style-name:"超链接";
            mso-style-id:8;}
        .style26
        {mso-number-format:"0%";
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
            mso-font-charset:134;
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
            color:#000000;
            font-size:11.0pt;
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
            text-align:left;
            font-size:22.0pt;
            font-weight:700;
            mso-font-charset:134;
            border:.5pt solid windowtext;}
        .xl67
        {mso-style-parent:style0;
            text-align:center;
            mso-pattern:#000000 none;
            background:#D9D9D9;
            mso-font-charset:134;
            border:.5pt solid windowtext;}
        .xl68
        {mso-style-parent:style0;
            text-align:center;
            white-space:normal;
            mso-pattern:#000000 none;
            background:#D9D9D9;
            mso-font-charset:134;
            border-top:.5pt solid windowtext;
            border-right:.5pt solid windowtext;
            border-bottom:.5pt solid windowtext;}
        .xl69
        {mso-style-parent:style0;
            text-align:center;
            white-space:normal;
            mso-font-charset:134;
            border-left:.5pt solid windowtext;
            border-right:.5pt solid windowtext;
            border-bottom:.5pt solid windowtext;}
        .xl70
        {mso-style-parent:style0;
            text-align:center;
            white-space:normal;
            mso-font-charset:134;
            border-right:.5pt solid windowtext;
            border-bottom:.5pt solid windowtext;}
        .xl71
        {mso-style-parent:style0;
            mso-number-format:"\@";
            text-align:center;
            mso-font-charset:134;
            border-right:.5pt solid windowtext;
            border-bottom:.5pt solid windowtext;}
        .xl72
        {mso-style-parent:style0;
            font-size:22.0pt;
            font-weight:700;
            mso-font-charset:134;}
        .xl73
        {mso-style-parent:style0;
            mso-font-charset:134;}
        -->  </style>
    <!--[if gte mso 9]>
    <xml>
        <x:ExcelWorkbook>
            <x:ExcelWorksheets>
                <x:ExcelWorksheet>
                    <x:Name>Sheet1</x:Name>
                    <x:WorksheetOptions>
                        <x:DefaultRowHeight>270</x:DefaultRowHeight>
                        <x:Selected/>
                        <x:Panes>
                            <x:Pane>
                                <x:Number>3</x:Number>
                                <x:ActiveCol>7</x:ActiveCol>
                                <x:ActiveRow>4</x:ActiveRow>
                                <x:RangeSelection>H5</x:RangeSelection>
                            </x:Pane>
                        </x:Panes>
                        <x:ProtectContents>False</x:ProtectContents>
                        <x:ProtectObjects>False</x:ProtectObjects>
                        <x:ProtectScenarios>False</x:ProtectScenarios>
                        <x:Print>
                            <x:PaperSizeIndex>9</x:PaperSizeIndex>
                        </x:Print>
                    </x:WorksheetOptions>
                </x:ExcelWorksheet>
            </x:ExcelWorksheets>
            <x:ProtectStructure>False</x:ProtectStructure>
            <x:ProtectWindows>False</x:ProtectWindows>
            <x:WindowHeight>5025</x:WindowHeight>
            <x:WindowWidth>25575</x:WindowWidth>
        </x:ExcelWorkbook>
        <x:ExcelName>
            <x:Name>_FilterDatabase</x:Name>
            <x:Hidden/>
            <x:SheetIndex>1</x:SheetIndex>
            <x:Formula>=Sheet1!$A$2:$AS$5</x:Formula>
        </x:ExcelName>
    </xml>
    <![endif]-->
</head>
<body link="blue" vlink="purple">
<table width="4277" border="0" cellpadding="0" cellspacing="0" style='width:3207.75pt;border-collapse:collapse;table-layout:fixed;'>
    <col width="72" span="2" style='width:54.00pt;'/>
    <col width="86" style='mso-width-source:userset;mso-width-alt:2752;'/>
    <col width="72" style='width:54.00pt;'/>
    <col width="106" style='mso-width-source:userset;mso-width-alt:3392;'/>
    <col width="108" style='mso-width-source:userset;mso-width-alt:3456;'/>
    <col width="72" span="2" style='width:54.00pt;'/>
    <col width="199" style='mso-width-source:userset;mso-width-alt:6368;'/>
    <col width="223" style='mso-width-source:userset;mso-width-alt:7136;'/>
    <col width="106" style='mso-width-source:userset;mso-width-alt:3392;'/>
    <col width="72" span="3" style='width:54.00pt;'/>
    <col width="116" style='mso-width-source:userset;mso-width-alt:3712;'/>
    <col width="72" style='width:54.00pt;'/>
    <col width="94" style='mso-width-source:userset;mso-width-alt:3008;'/>
    <col width="104" style='mso-width-source:userset;mso-width-alt:3328;'/>
    <col width="130" style='mso-width-source:userset;mso-width-alt:4160;'/>
    <col width="72" style='width:54.00pt;'/>
    <col width="87" style='mso-width-source:userset;mso-width-alt:2784;'/>
    <col width="72" style='width:54.00pt;'/>
    <col width="82" style='mso-width-source:userset;mso-width-alt:2624;'/>
    <col width="83" style='mso-width-source:userset;mso-width-alt:2656;'/>
    <col width="103" style='mso-width-source:userset;mso-width-alt:3296;'/>
    <col width="72" span="5" style='width:54.00pt;'/>
    <col width="174" style='mso-width-source:userset;mso-width-alt:5568;'/>
    <col width="194" style='mso-width-source:userset;mso-width-alt:6208;'/>
    <col width="95" style='mso-width-source:userset;mso-width-alt:3040;'/>
    <col width="72" style='width:54.00pt;'/>
    <col width="86" style='mso-width-source:userset;mso-width-alt:2752;'/>
    <col width="82" style='mso-width-source:userset;mso-width-alt:2624;'/>
    <col width="197" class="xl65" style='mso-width-source:userset;mso-width-alt:6304;'/>
    <col width="72" span="5" style='width:54.00pt;'/>
    <col width="94" style='mso-width-source:userset;mso-width-alt:3008;'/>
    <col width="72" span="2" style='width:54.00pt;'/>
    <tr height="36" style='height:27.00pt;'>
        <td class="xl66" height="36" width="4205" colspan="45" style='height:27.00pt;width:3153.75pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;' x:str><span style='mso-spacerun:yes;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>非住宅台帐</td>
        <%--<td class="xl72" width="72" style='width:54.00pt;'></td>--%>
    </tr>
    <tr height="54" style='height:40.50pt;'>
        <td class="xl67" height="54" style='height:40.50pt;' x:str>序号</td>
        <td class="xl68" x:str>分指</td>
        <td class="xl68" x:str>组别</td>
        <td class="xl68" x:str>档案编号</td>
        <td class="xl68" x:str>单位联系人</td>
        <td class="xl68" x:str>办公电话</td>
        <td class="xl68" x:str>移动电话</td>
        <td class="xl68" x:str>所属部门</td>
        <td class="xl68" x:str>联系人职务</td>
        <td class="xl68" x:str>单位电子邮箱</td>
        <td class="xl68" x:str>房屋地址门牌</td>
        <td class="xl68" x:str>房屋产权单位名称（全称）</td>
        <td class="xl68" x:str>房屋产权单位办公地址门牌</td>
        <td class="xl68" x:str>房屋日常管理单位</td>
        <td class="xl68" x:str>有无专业管理单位</td>
        <td class="xl68" x:str>现状</td>
        <td class="xl68" x:str>房屋实际使用单位</td>
        <td class="xl68" x:str>房屋产权单位性质</td>
        <td class="xl68" x:str>房屋产权单位隶属关系</td>
        <td class="xl68" x:str>房屋权属证书号</td>
        <td class="xl68" x:str>土地使用证号</td>
        <td class="xl68" x:str>房屋用途</td>
        <td class="xl68" x:str>房屋总建筑面积（M²）</td>
        <td class="xl68" x:str>占地总面积（M²）</td>
        <td class="xl68" x:str>平房建筑面积（M²）</td>
        <td class="xl68" x:str>临时房屋面积（M²）</td>
        <td class="xl68" x:str>无证房屋建筑面积(M²）</td>
        <td class="xl68" x:str>房屋是否用于经营</td>
        <td class="xl68" x:str>营业状态</td>
        <td class="xl68" x:str>房屋有无转租</td>
        <td class="xl68" x:str>有无转租协议</td>
        <td class="xl68" x:str>经营范围（业务）</td>
        <td class="xl68" x:str>营业执照</td>
        <td class="xl68" x:str>注册登记类型</td>
        <td class="xl68" x:str>产权单位法定代表人（单位负责人）</td>
        <td class="xl68" x:str>产权单位行业类别</td>
        <td class="xl68" x:str>产权单位是否有上级法人单位</td>
        <%--<td class="xl68" x:str>产权单位上级法人单位(全称)</td>--%>
        <td class="xl68" x:str>备注</td>
        <td class="xl68" x:str>经营间数</td>
        <td class="xl68" x:str>居住间数</td>
        <td class="xl68" x:str>仓储间数</td>
        <td class="xl68" x:str>其他间数</td>
        <td class="xl68" x:str>间数合计</td>
        <td class="xl68" x:str>预估建筑面积（M²）</td>
        <td class="xl68" x:str>未登记房屋备注</td>
        <td class="xl73"></td>
    </tr>
    <c:forEach items="${pageInfo.result}" var="nonFamily" varStatus="status">
        <tr height="36" style='height:27.00pt;'>
            <td class="xl69" height="36" style='height:27.00pt;' x:num>${status.index + 1}</td>
            <td class="xl70" x:str><tags:dataDict dataDict="分指" value="${nonFamily.bdCode}"/></td>
            <td class="xl70" x:str><tags:dataDict dataDict="组别" value="${nonFamily.groupCode}"/></td>
            <td class="xl70" x:str>${nonFamily.familyCode}</td>
            <td class="xl70" x:str>${nonFamily.unitMan}</td>
            <td class="xl71">${nonFamily.bgTel}</td>
            <td class="xl71" x:str>${nonFamily.ydTel}</td>
            <td class="xl70" x:str>${nonFamily.unit}</td>
            <td class="xl70">${nonFamily.telPersonDuty}</td>
            <td class="xl70">${nonFamily.unitMail}</td>
            <td class="xl70" x:str>${nonFamily.address}</td>
            <td class="xl70" x:str>${nonFamily.unitName}</td>
            <td class="xl70" x:str>${nonFamily.unitAddress}</td>
            <td class="xl70" x:str>${nonFamily.dailyUnit}</td>
            <td class="xl70" x:str><tags:dataDict dataDict="有无" value="${nonFamily.dailyStatus}"/></td>
            <td class="xl70" x:str><tags:dataDict dataDict="现状" value="${nonFamily.status}"/></td>
            <td class="xl70" x:str>${nonFamily.sjUseUnit}</td>
            <td class="xl70" x:str><tags:dataDict dataDict="产权单位性质" value="${nonFamily.unitStatus}"/></td>
            <td class="xl70"><tags:dataDict dataDict="产权单位隶属关系" value="${nonFamily.underRelation}"/></td>
                <%--<td class="xl70">${nonFamily.bdCode}</td>--%>
            <td class="xl70" x:str>${nonFamily.underCode}</td>
            <td class="xl70" x:str>${nonFamily.landUseCode}</td>
            <td class="xl70" x:str><tags:dataDict dataDict="非宅房屋用途" value="${nonFamily.houseUse}"/></td>
            <td class="xl70" x:num>${nonFamily.houseTotalArea}</td>
            <td class="xl70" x:num>${nonFamily.zdTotalArea}</td>
            <td class="xl70" x:num>${nonFamily.pfArea}</td>
            <td class="xl70" x:num>${nonFamily.lsArea}</td>
            <td class="xl70" x:num>${nonFamily.wzArea}</td>
            <td class="xl70" x:str><tags:dataDict dataDict="是否" value="${nonFamily.bussType}"/></td>
            <td class="xl70" x:str><tags:dataDict dataDict="是否" value="${nonFamily.bussStatus}"/></td>
            <td class="xl70" x:str><tags:dataDict dataDict="有无" value="${nonFamily.houseFlag}"/></td>
            <td class="xl70" x:str><tags:dataDict dataDict="有无" value="${nonFamily.xyFlag}"/></td>
            <td class="xl70" x:str>${nonFamily.bussRange}</td>
            <td class="xl71" x:str>${nonFamily.bussCode}</td>
            <td class="xl70" x:str><tags:dataDict dataDict="注册登记类型" value="${nonFamily.djType}"/></td>
                <%--<td class="xl70">${nonFamily.bdCode}</td>--%>
            <td class="xl70" x:str>${nonFamily.unitPerson}</td>
                <%--<td class="xl71">${nonFamily.bdCode}</td>--%>
            <td class="xl70" x:str><tags:dataDict dataDict="产权单位行业类别" value="${nonFamily.unitType}"/></td>
            <td class="xl70" x:str><tags:dataDict dataDict="是否" value="${nonFamily.unitOnStatus}"/></td>
            <td class="xl70">${nonFamily.memo}</td>
            <td class="xl70">${nonFamily.jyNum}</td>
            <td class="xl70">${nonFamily.jzNum}</td>
            <td class="xl70">${nonFamily.ccNum}</td>
            <td class="xl70">${nonFamily.otherNum}</td>
            <td class="xl70">${nonFamily.totalNum}</td>
            <td class="xl70">${nonFamily.ygBuildArea}</td>
            <td class="xl70">${nonFamily.wejMemo}</td>
        </tr>
    </c:forEach>
    <![if supportMisalignedColumns]>
    <tr width="0" style='display:none;'>
        <td width="86" style='width:65;'></td>
        <td width="106" style='width:80;'></td>
        <td width="108" style='width:81;'></td>
        <td width="199" style='width:149;'></td>
        <td width="223" style='width:167;'></td>
        <td width="106" style='width:80;'></td>
        <td width="116" style='width:87;'></td>
        <td width="94" style='width:71;'></td>
        <td width="104" style='width:78;'></td>
        <td width="130" style='width:98;'></td>
        <td width="87" style='width:65;'></td>
        <td width="82" style='width:62;'></td>
        <td width="83" style='width:62;'></td>
        <td width="103" style='width:77;'></td>
        <td width="174" style='width:131;'></td>
        <td width="194" style='width:146;'></td>
        <td width="95" style='width:71;'></td>
        <td width="86" style='width:65;'></td>
        <td width="82" style='width:62;'></td>
        <td width="197" style='width:148;'></td>
        <td width="94" style='width:71;'></td>
    </tr>
    <![endif]>
</table>
</body>
</html>
