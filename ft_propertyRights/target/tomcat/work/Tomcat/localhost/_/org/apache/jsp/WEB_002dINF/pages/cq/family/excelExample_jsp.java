/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2018-08-15 10:02:44 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.pages.cq.family;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;

public final class excelExample_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=utf-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

    //设置浏览器的识别
    response.setContentType("application/msexcel;charset=utf-8");
    //设置文件的名字
    String fileName = "本市户籍家庭信息模板";
    //将文件的名字转化为JBK编码的字体
    fileName = new String(fileName.getBytes("gbk"), "ISO-8859-1");
    //设置导出弹出框
    response.addHeader("Content-Disposition", "fileName=" + fileName + ".xls");

      out.write("\r\n");
      out.write("<html xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\"\r\n");
      out.write("      xmlns:x=\"urn:schemas-microsoft-com:office:excel\" xmlns=\"http://www.w3.org/TR/REC-html40\">\r\n");
      out.write("<head>\r\n");
      out.write("    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/>\r\n");
      out.write("    <meta name=\"ProgId\" content=\"Excel.Sheet\"/>\r\n");
      out.write("    <meta name=\"Generator\" content=\"WPS Office ET\"/>\r\n");
      out.write("    <!--[if gte mso 9]>\r\n");
      out.write("    <![endif]-->\r\n");
      out.write("    <style>\r\n");
      out.write("        <!--\r\n");
      out.write("        @page {\r\n");
      out.write("            margin: 0.75in 0.71in 0.75in 0.71in;\r\n");
      out.write("            mso-header-margin: 0.32in;\r\n");
      out.write("            mso-footer-margin: 0.32in;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        tr {\r\n");
      out.write("            mso-height-source: auto;\r\n");
      out.write("            mso-ruby-visibility: none;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        col {\r\n");
      out.write("            mso-width-source: auto;\r\n");
      out.write("            mso-ruby-visibility: none;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        br {\r\n");
      out.write("            mso-data-placement: same-cell;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        td {\r\n");
      out.write("            mso-style-parent: style0;\r\n");
      out.write("            padding-top: 1px;\r\n");
      out.write("            padding-right: 1px;\r\n");
      out.write("            padding-left: 1px;\r\n");
      out.write("            mso-ignore: padding;\r\n");
      out.write("            mso-number-format: \"General\";\r\n");
      out.write("            text-align: general;\r\n");
      out.write("            vertical-align: middle;\r\n");
      out.write("            white-space: nowrap;\r\n");
      out.write("            mso-rotate: 0;\r\n");
      out.write("            mso-pattern: auto;\r\n");
      out.write("            mso-background-source: auto;\r\n");
      out.write("            color: #000000;\r\n");
      out.write("            font-size: 11.0pt;\r\n");
      out.write("            font-weight: 400;\r\n");
      out.write("            font-style: normal;\r\n");
      out.write("            text-decoration: none;\r\n");
      out.write("            font-family: 宋体;\r\n");
      out.write("            mso-generic-font-family: auto;\r\n");
      out.write("            mso-font-charset: 134;\r\n");
      out.write("            border: none;\r\n");
      out.write("            mso-protection: locked visible;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .xl65 {\r\n");
      out.write("            mso-style-parent: style0;\r\n");
      out.write("            text-align: center;\r\n");
      out.write("            mso-font-charset: 134;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .xl66 {\r\n");
      out.write("            mso-style-parent: style0;\r\n");
      out.write("            mso-number-format: \"\\@\";\r\n");
      out.write("            text-align: center;\r\n");
      out.write("            mso-font-charset: 134;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .xl67 {\r\n");
      out.write("            mso-style-parent: style0;\r\n");
      out.write("            text-align: center;\r\n");
      out.write("            font-size: 16.0pt;\r\n");
      out.write("            font-weight: 700;\r\n");
      out.write("            mso-font-charset: 134;\r\n");
      out.write("            border-left: .5pt solid windowtext;\r\n");
      out.write("            border-top: .5pt solid windowtext;\r\n");
      out.write("            border-bottom: .5pt solid windowtext;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .xl68 {\r\n");
      out.write("            mso-style-parent: style0;\r\n");
      out.write("            text-align: center;\r\n");
      out.write("            font-size: 16.0pt;\r\n");
      out.write("            font-weight: 700;\r\n");
      out.write("            mso-font-charset: 134;\r\n");
      out.write("            border-top: .5pt solid windowtext;\r\n");
      out.write("            border-bottom: .5pt solid windowtext;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .xl69 {\r\n");
      out.write("            mso-style-parent: style0;\r\n");
      out.write("            mso-number-format: \"\\@\";\r\n");
      out.write("            text-align: center;\r\n");
      out.write("            font-size: 16.0pt;\r\n");
      out.write("            font-weight: 700;\r\n");
      out.write("            mso-font-charset: 134;\r\n");
      out.write("            border-top: .5pt solid windowtext;\r\n");
      out.write("            border-bottom: .5pt solid windowtext;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .xl70 {\r\n");
      out.write("            mso-style-parent: style0;\r\n");
      out.write("            text-align: center;\r\n");
      out.write("            mso-font-charset: 134;\r\n");
      out.write("            border: .5pt solid windowtext;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .xl71 {\r\n");
      out.write("            mso-style-parent: style0;\r\n");
      out.write("            mso-number-format: \"\\@\";\r\n");
      out.write("            text-align: center;\r\n");
      out.write("            mso-font-charset: 134;\r\n");
      out.write("            border: .5pt solid windowtext;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .xl72 {\r\n");
      out.write("            mso-style-parent: style0;\r\n");
      out.write("            text-align: center;\r\n");
      out.write("            font-size: 16.0pt;\r\n");
      out.write("            font-weight: 700;\r\n");
      out.write("            mso-font-charset: 134;\r\n");
      out.write("            border-top: .5pt solid windowtext;\r\n");
      out.write("            border-right: .5pt solid windowtext;\r\n");
      out.write("            border-bottom: .5pt solid windowtext;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        -->  </style>\r\n");
      out.write("    <!--[if gte mso 9]>\r\n");
      out.write("    <xml>\r\n");
      out.write("        <x:ExcelWorkbook>\r\n");
      out.write("            <x:ExcelWorksheets>\r\n");
      out.write("                <x:ExcelWorksheet>\r\n");
      out.write("                    <x:Name>Sheet1</x:Name>\r\n");
      out.write("                    <x:WorksheetOptions>\r\n");
      out.write("                        <x:DefaultRowHeight>288</x:DefaultRowHeight>\r\n");
      out.write("                        <x:Selected/>\r\n");
      out.write("                        <x:Panes>\r\n");
      out.write("                            <x:Pane>\r\n");
      out.write("                                <x:Number>3</x:Number>\r\n");
      out.write("                                <x:ActiveCol>9</x:ActiveCol>\r\n");
      out.write("                                <x:ActiveRow>7</x:ActiveRow>\r\n");
      out.write("                                <x:RangeSelection>J8</x:RangeSelection>\r\n");
      out.write("                            </x:Pane>\r\n");
      out.write("                        </x:Panes>\r\n");
      out.write("                        <x:ProtectContents>False</x:ProtectContents>\r\n");
      out.write("                        <x:ProtectObjects>False</x:ProtectObjects>\r\n");
      out.write("                        <x:ProtectScenarios>False</x:ProtectScenarios>\r\n");
      out.write("                        <x:PageBreakZoom>100</x:PageBreakZoom>\r\n");
      out.write("                        <x:Print>\r\n");
      out.write("                            <x:ValidPrinterInfo/>\r\n");
      out.write("                            <x:PaperSizeIndex>9</x:PaperSizeIndex>\r\n");
      out.write("                        </x:Print>\r\n");
      out.write("                    </x:WorksheetOptions>\r\n");
      out.write("                </x:ExcelWorksheet>\r\n");
      out.write("            </x:ExcelWorksheets>\r\n");
      out.write("            <x:ProtectStructure>False</x:ProtectStructure>\r\n");
      out.write("            <x:ProtectWindows>False</x:ProtectWindows>\r\n");
      out.write("            <x:SelectedSheets>0</x:SelectedSheets>\r\n");
      out.write("            <x:WindowHeight>9924</x:WindowHeight>\r\n");
      out.write("            <x:WindowWidth>22943</x:WindowWidth>\r\n");
      out.write("        </x:ExcelWorkbook>\r\n");
      out.write("    </xml>\r\n");
      out.write("    <![endif]-->\r\n");
      out.write("</head>\r\n");
      out.write("<body link=\"blue\" vlink=\"purple\" class=\"xl65\">\r\n");
      out.write("<table width=\"1290\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"\r\n");
      out.write("       style='width:774.00pt;border-collapse:collapse;table-layout:fixed;'>\r\n");
      out.write("    <col width=\"81\" class=\"xl65\" style='mso-width-source:userset;mso-width-alt:2369;'/>\r\n");
      out.write("    <col width=\"103\" class=\"xl65\" style='mso-width-source:userset;mso-width-alt:3013;'/>\r\n");
      out.write("    <col width=\"294\" class=\"xl65\" style='mso-width-source:userset;mso-width-alt:2369;'/>\r\n");
      out.write("    <col width=\"156.00\" class=\"xl65\" style='mso-width-source:userset;mso-width-alt:5500;'/>\r\n");
      out.write("    <col width=\"97\" class=\"xl65\" style='mso-width-source:userset;mso-width-alt:2837;'/>\r\n");
      out.write("    <col width=\"130\" class=\"xl65\" style='mso-width-source:userset;mso-width-alt:3803;'/>\r\n");
      out.write("    <col width=\"132\" class=\"xl66\" style='mso-width-source:userset;mso-width-alt:3861;'/>\r\n");
      out.write("    <col width=\"126.00\" class=\"xl65\" style='mso-width-source:userset;mso-width-alt:3686;'/>\r\n");
      out.write("    <col width=\"294\" class=\"xl65\" style='mso-width-source:userset;mso-width-alt:3800;'/>\r\n");
      out.write("    <col width=\"144.00\" class=\"xl65\" style='mso-width-source:userset;mso-width-alt:6000;'/>\r\n");
      out.write("    <col width=\"81\" span=\"27\" class=\"xl65\" style='mso-width-source:userset;mso-width-alt:2369;'/>\r\n");
      out.write("    <col width=\"294\" class=\"xl65\" style='mso-width-source:userset;mso-width-alt:6000;'/>\r\n");
      out.write("    <col width=\"81\" span=\"26\" class=\"xl65\" style='mso-width-source:userset;mso-width-alt:2369;'/>\r\n");
      out.write("    <tr height=\"56.67\" style='height:34.00pt;mso-height-source:userset;mso-height-alt:680;'>\r\n");
      out.write("        <td class=\"xl67\" height=\"56.67\" width=\"1290\" colspan=\"46\"\r\n");
      out.write("            style='height:34.00pt;width:774.00pt;border-right:.5pt solid windowtext;border-bottom:.5pt solid windowtext;'\r\n");
      out.write("            x:str>本市户籍家庭信息模板\r\n");
      out.write("        </td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr height=\"41.67\" style='height:25.00pt;mso-height-source:userset;mso-height-alt:500;'>\r\n");
      out.write("        <td class=\"xl70\" height=\"41.67\" style='height:25.00pt;' x:str>序号</td>\r\n");
      out.write("        <td class=\"xl70\" x:str>项目名称</td>\r\n");
      out.write("        <td class=\"xl70\" x:str>申请编号</td>\r\n");
      out.write("        <td class=\"xl70\" x:str>姓名</td>\r\n");
      out.write("        <td class=\"xl70\" x:str>年龄</td>\r\n");
      out.write("        <td class=\"xl70\" x:str>证件号码类型</td>\r\n");
      out.write("        <td class=\"xl70\" x:str>证件号码</td>\r\n");
      out.write("        <td class=\"xl70\" x:str>婚姻状况</td>\r\n");
      out.write("        <td class=\"xl71\" x:str>户籍所在地</td>\r\n");
      out.write("        <td class=\"xl70\" x:str>工作地（社保缴纳地）</td>\r\n");
      out.write("        <td class=\"xl70\" x:str>京籍是否是本区</td>\r\n");
      out.write("        <td class=\"xl70\" x:str>申请日期</td>\r\n");
      out.write("        <td class=\"xl70\" x:str>前配偶姓名</td>\r\n");
      out.write("        <td class=\"xl70\" x:str>前配偶证件类型</td>\r\n");
      out.write("        <td class=\"xl70\" x:str>前配偶证件号码</td>\r\n");
      out.write("        <td class=\"xl70\" x:str>离婚日期</td>\r\n");
      out.write("        <td class=\"xl70\" x:str>联系人姓名</td>\r\n");
      out.write("        <td class=\"xl70\" x:str>联系人手机号码</td>\r\n");
      out.write("        <td class=\"xl70\" x:str>联系人通讯地址</td>\r\n");
      out.write("        <td class=\"xl70\" x:str>联系人邮编</td>\r\n");
      out.write("        <td class=\"xl70\" x:str>联系人备注</td>\r\n");
      out.write("        <td class=\"xl70\" x:str>摇号批次</td>\r\n");
      out.write("        <td class=\"xl70\" x:str>摇号编号</td>\r\n");
      out.write("        <td class=\"xl70\" x:str>摇号组别</td>\r\n");
      out.write("        <td class=\"xl70\" x:str>摇号结果</td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <![if supportMisalignedColumns]>\r\n");
      out.write("    <tr width=\"0\" style='display:none;'>\r\n");
      out.write("        <td width=\"81\" style='width:49pt;'></td>\r\n");
      out.write("        <td width=\"103\" style='width:62pt;'></td>\r\n");
      out.write("        <td width=\"160\" style='width:96pt;'></td>\r\n");
      out.write("        <td width=\"156\" style='width:94pt;'></td>\r\n");
      out.write("        <td width=\"97\" style='width:58pt;'></td>\r\n");
      out.write("        <td width=\"130\" style='width:78pt;'></td>\r\n");
      out.write("        <td width=\"132\" style='width:79pt;'></td>\r\n");
      out.write("        <td width=\"126\" style='width:76pt;'></td>\r\n");
      out.write("        <td width=\"161\" style='width:97pt;'></td>\r\n");
      out.write("        <td width=\"144\" style='width:86pt;'></td>\r\n");
      out.write("        <td width=\"81\" style='width:49pt;'></td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <![endif]>\r\n");
      out.write("</table>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
