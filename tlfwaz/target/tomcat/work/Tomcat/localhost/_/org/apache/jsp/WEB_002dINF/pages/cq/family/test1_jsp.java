/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2018-09-10 05:53:39 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.pages.cq.family;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.sqds.web.Servlets;

public final class test1_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/static/common/common.jsp", Long.valueOf(1536294693491L));
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.release();
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
      response.setContentType("text/html;charset=UTF-8");
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
      out.write("\r\n");

    Servlets.setNoCacheHeader(response);

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"UTF-8\">\r\n");
      out.write("    <title>审计财务上报</title>\r\n");
      out.write("    ");
      out.write('\r');
      out.write('\n');
      if (_jspx_meth_c_005fset_005f0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html;charset=utf-8\" />\r\n");
      out.write("<meta http-equiv=\"Cache-Control\" content=\"no-store\" />\r\n");
      out.write("<meta http-equiv=\"Pragma\" content=\"no-cache\" />\r\n");
      out.write("<meta http-equiv=\"Expires\" content=\"0\" />\r\n");
      out.write("<meta http-equiv=X-UA-Compatible content=\"IE=edge,chrome=1\">\r\n");
      out.write("<meta content=always name=referrer>\r\n");
      out.write("<meta name=\"renderer\" content=\"webkit\">\r\n");
      out.write("\r\n");
      out.write("<link type=\"image/x-icon\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/static/images/favicon.ico\" rel=\"shortcut icon\">\r\n");
      out.write("\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/static/bootstrap-3.3.5/css/bootstrap.min.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/static/style/style.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/static/style/sea.css\">\r\n");
      out.write('\r');
      out.write('\n');
      out.write("\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/static/plugin/font-awesome/css/font-awesome.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/static/plugin/datepicker/css/datepicker.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/static/plugin/jquery-validation/1.11.1/validate.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/static/plugin/zTree_v3-master/css/zTreeStyle/zTreeStyle.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/static/plugin/autocomplete/styles.css\">\r\n");
      out.write("<link href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/static/datetimepicker/bootstrap-datetimepicker.min.css\" rel=\"stylesheet\" media=\"screen\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/static/jquery/1.11.3/jquery.min.js\"></script>\r\n");
      out.write("<script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/static/bootstrap-3.3.5/js/bootstrap.min.js\"></script>\r\n");
      out.write("<script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/static/plugin/datepicker/js/bootstrap-datepicker.js\"></script>\r\n");
      out.write("<script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/static/plugin/jquery-validation/1.11.1/jquery.validate.min.js\" type=\"text/javascript\"></script>\r\n");
      out.write("<script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/static/plugin/jquery-validation/1.11.1/messages_bs_zh.js\" type=\"text/javascript\"></script>\r\n");
      out.write("<script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/static/js/common.js\"></script>\r\n");
      out.write("<script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/static/plugin/zTree_v3-master/js/jquery.ztree.core.js\"></script>\r\n");
      out.write("<script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/static/plugin/zTree_v3-master/js/jquery.ztree.excheck.min.js\"></script>\r\n");
      out.write("<script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/static/plugin/tableExcel/jquery.table2excel.js\"></script>\r\n");
      out.write("<script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/static/plugin/autocomplete/jquery.autocomplete.js\"></script>\r\n");
      out.write("<script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/static/plugin/autocomplete/jquery.autocomplete-min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/static/datetimepicker/bootstrap-datetimepicker.js\" charset=\"UTF-8\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/static/datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js\" charset=\"UTF-8\"></script>");
      out.write("\r\n");
      out.write("    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/>\r\n");
      out.write("    <style>\r\n");
      out.write("        #chooseInfo ul li {\r\n");
      out.write("            list-style-type: none;\r\n");
      out.write("            background-color: \t#FF8001;\r\n");
      out.write("            width: 150px;\r\n");
      out.write("            height: 50px;\r\n");
      out.write("            font-size: 17px;\r\n");
      out.write("            text-align: center;\r\n");
      out.write("            margin-left: 10px;\r\n");
      out.write("            margin-bottom: 10px;\r\n");
      out.write("            margin-top: 20px;\r\n");
      out.write("            float: left;\r\n");
      out.write("            cursor: pointer;\r\n");
      out.write("\r\n");
      out.write("            /*文字过多...显示*/\r\n");
      out.write("            overflow: hidden;\r\n");
      out.write("            text-overflow: ellipsis;\r\n");
      out.write("            white-space: nowrap;\r\n");
      out.write("        }\r\n");
      out.write("    </style>\r\n");
      out.write("</head>\r\n");
      out.write("<body style=\"overflow-y: hidden;\">\r\n");
      out.write("<div class=\"content\">\r\n");
      out.write("    <div class=\"form-inline\" id=\"hideCls\" style=\"padding-bottom: 20px;\">\r\n");
      out.write("        <ul class=\"nav nav-tabs\">\r\n");
      out.write("            <li class=\"active\"><a href=\"auditReport?projectName=");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${projectName}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\">数据上报</a></li>\r\n");
      out.write("            <li><a href=\"reportList?projectName=");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${projectName}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\">已上报数据</a></li>\r\n");
      out.write("        </ul>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"row\" style=\"margin-left: 0px;margin-right: 0px;\">\r\n");
      out.write("        <div class=\"col-lg-12\">\r\n");
      out.write("            <div style=\"height: 5%;text-align: center;font-size: 40px;\">\r\n");
      out.write("                <span style=\"color: orange;font-weight: bold;\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${projectNameMap[projectName]}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("</span>待上报协议数据（<span id=\"chooseCount\" >");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${chooseCount}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("</span>户）\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("            <hr class=\"project-index-hr\">\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"col-lg-6\" style=\"height: 600px;\" >\r\n");
      out.write("            <div>\r\n");
      out.write("                <form class=\"form-inline\" style=\"text-align: left;\">\r\n");
      out.write("                    <span style=\"font-weight: bold;font-size: 20px;\">制表日期：</span>\r\n");
      out.write("                    <input name=\"date\" type=\"text\" id=\"startDate\"\r\n");
      out.write("                           style=\"width: 170px;height: 33px;background-image:url(/static/plugin/datepicker/img/icon.png); background-repeat:no-repeat; background-position:right center;\"\r\n");
      out.write("                           class=\"form-control datetimePicker dateISO\">\r\n");
      out.write("                    至\r\n");
      out.write("                    <input name=\"date\" type=\"text\" id=\"endDate\"\r\n");
      out.write("                           style=\"width: 170px;height: 33px;background-image:url(/static/plugin/datepicker/img/icon.png); background-repeat:no-repeat; background-position:right center;\"\r\n");
      out.write("                           class=\"form-control datetimePicker dateISO\">\r\n");
      out.write("                    <button type=\"button\" class=\"btn btn-primary\" onclick=\"getChooseList()\"><i class=\"fa fa-search\"></i>&nbsp;提取家庭</button>\r\n");
      out.write("                </form>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div id=\"info\" style=\"height: 95%;border:1px solid #a5b6c8;margin-top: 10px;overflow-y: auto;\">\r\n");
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"col-lg-6\" style=\"height: 600px;\">\r\n");
      out.write("            <div class=\"search_content\" style=\"text-align: left;height: 95%;width: 100%;\" >\r\n");
      out.write("                <form class=\"form-inline test\" style=\"text-align: left;width: 100%;\">\r\n");
      out.write("                    <div class=\"input-group\">\r\n");
      out.write("                        <div class=\"input-group-addon\">被征收人</div>\r\n");
      out.write("                        <input type=\"text\" id=\"name\" class=\"form-control search2\" size=\"10\"/>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"input-group\">\r\n");
      out.write("                        <div class=\"input-group-addon\">协议编号</div>\r\n");
      out.write("                        <input type=\"text\" id=\"searchContractCode\" class=\"form-control search2\" size=\"10\"/>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <button type=\"button\" onclick=\"getSearchList()\" class=\"btn btn-primary\" ><i class=\"fa fa-search\"></i>&nbsp;查询</button>　\r\n");
      out.write("                </form>　\r\n");
      out.write("                <div id=\"chart2\" style=\"text-align: center;vertical-align: top;\">\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <div class=\"footer\">\r\n");
      out.write("        <button type=\"button\" class=\"btn btn-danger\" onclick=\"generateBatch()\"><i class=\"fa fa-magic\"></i>&nbsp;上报数据,并发起支付</button>　　　\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    ");
      out.write("\r\n");
      out.write("    <div class=\"modal\" id=\"myModal\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"myModalLabel\">\r\n");
      out.write("        <div class=\"modal-dialog\" role=\"document\" style=\"width: 800px;\">\r\n");
      out.write("            <div class=\"modal-content\">\r\n");
      out.write("                <div class=\"modal-header\">\r\n");
      out.write("                    <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>\r\n");
      out.write("                    <h4 class=\"modal-title\" id=\"myModalLabel\">协议数据</h4>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"modal-body\" id=\"myModalBoday\">\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"modal-footer\">\r\n");
      out.write("                    <button class=\"btn btn-danger\" id=\"printButton\" onclick=\"removeItemContent()\"><i class=\"fa fa-print\" ></i>&nbsp;移除</button>\r\n");
      out.write("                    <button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\"><i class=\"fa fa-close\"></i>&nbsp;关闭</button>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</body>\r\n");
      out.write("<script>\r\n");
      out.write("\r\n");
      out.write("    //input 回车事件\r\n");
      out.write("    $(function(){\r\n");
      out.write("        $('.search2').bind('keypress',function(event){\r\n");
      out.write("            if(event.keyCode == \"13\"){\r\n");
      out.write("                getUnChooseList();\r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
      out.write("//        //方法二如下\r\n");
      out.write("//        $(document).keydown(function(e) {\r\n");
      out.write("//            if (e.keyCode == 13) {\r\n");
      out.write("//                //dologin();\r\n");
      out.write("//            }\r\n");
      out.write("//        });\r\n");
      out.write("    });\r\n");
      out.write("\r\n");
      out.write("    getChooseList();\r\n");
      out.write("    getUnChooseList();\r\n");
      out.write("\r\n");
      out.write("    //添加\r\n");
      out.write("    function add(id,name,contractCode){\r\n");
      out.write("//        var res = confirm('确定要将该家庭加入到本批次吗？');\r\n");
      out.write("        var text = \"<li title='查看详情' class='chooseId' id=\"+ id+\" value=\"+ id +\"  onclick='javascript:view(\"+ id+\");'><span>\"+ name+\"<br/>\"+ contractCode+\"</span></li>\";\r\n");
      out.write("        var isExit = false;//如果为true退出循环\r\n");
      out.write("        var chooseCount = $(\"#chooseCount\").html();\r\n");
      out.write("//        if(!res){\r\n");
      out.write("//            return;\r\n");
      out.write("//        }\r\n");
      out.write("\r\n");
      out.write("        $(\"li\").each(function(){\r\n");
      out.write("            var chooseId = $(this).val();\r\n");
      out.write("            if (chooseId == id ){\r\n");
      out.write("                bootstrapQ.msg({msg: \"该家庭已添加，无需重复添加！\", type: 'danger'});\r\n");
      out.write("                isExit =true;\r\n");
      out.write("                return false;\r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
      out.write("        if (isExit){\r\n");
      out.write("            return\r\n");
      out.write("        }else {\r\n");
      out.write("            $(\"#chooseList\").append(text);\r\n");
      out.write("            chooseCount++;\r\n");
      out.write("            $(\"#chooseCount\").html(chooseCount);\r\n");
      out.write("        }\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    //移除\r\n");
      out.write("    function removeItemContent(){\r\n");
      out.write("        var id= $(\"#contractId\").val();\r\n");
      out.write("        var chooseCount = $(\"#chooseCount\").html();\r\n");
      out.write("        $(\"#myModal\").modal('hide');\r\n");
      out.write("        $(\"#\"+id).remove();\r\n");
      out.write("        chooseCount--;\r\n");
      out.write("        $(\"#chooseCount\").html(chooseCount);\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    //    查看协议信息\r\n");
      out.write("    function view(contractId){\r\n");
      out.write("        $.get(\"contractInfo\", {contractId: contractId,myTime:new Date().getTime()}, function (data) {\r\n");
      out.write("            $(\"#myModalBoday\").html(data);\r\n");
      out.write("        });\r\n");
      out.write("        $(\"#myModal\").modal();\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    //提取家庭\r\n");
      out.write("    function getChooseList(){\r\n");
      out.write("        var startDate = $(\"#startDate\").val();\r\n");
      out.write("        var endDate = $(\"#endDate\").val();\r\n");
      out.write("        $.get(\"chooseList\", {startDate: startDate,endDate: endDate,projectName:'");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${projectName}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("',myTime:new Date().getTime()}, function (data) {\r\n");
      out.write("            $(\"#info\").html(data);\r\n");
      out.write("            $(\"#chooseCount\").html($(\"#count\").val());\r\n");
      out.write("        });\r\n");
      out.write("        getUnChooseList();\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    //提取剩下的家庭\r\n");
      out.write("    function getUnChooseList(){\r\n");
      out.write("        var name = $(\"#name\").val();\r\n");
      out.write("        var searchContractCode = $(\"#searchContractCode\").val();\r\n");
      out.write("        $.get(\"unChooseList\", {name: name,contractCode: searchContractCode,projectName:'");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${projectName}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("',myTime:new Date().getTime()}, function (data) {\r\n");
      out.write("            $(\"#chart2\").html(data);\r\n");
      out.write("        });\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    //查询家庭\r\n");
      out.write("    function getSearchList(){\r\n");
      out.write("        var name = $(\"#name\").val();\r\n");
      out.write("        var searchContractCode = $(\"#searchContractCode\").val();\r\n");
      out.write("        $.get(\"unChooseList\", {name: name,contractCode: searchContractCode,projectName:'");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${projectName}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("',myTime:new Date().getTime()}, function (data) {\r\n");
      out.write("            $(\"#chart2\").html(data);\r\n");
      out.write("        });\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    //生成批次\r\n");
      out.write("    function generateBatch(){\r\n");
      out.write("        var chooseIds=\"\";\r\n");
      out.write("        var chooseId =\"\";\r\n");
      out.write("        $(\".chooseId\").each(function () {\r\n");
      out.write("            chooseId = $(this).val();\r\n");
      out.write("            chooseIds += chooseId + \",\"\r\n");
      out.write("        });\r\n");
      out.write("        if(chooseIds.length>0){\r\n");
      out.write("            chooseIds = chooseIds.substring(0,chooseIds.length-1);\r\n");
      out.write("            var options = {\r\n");
      out.write("                backdrop: true,\r\n");
      out.write("                id: \"confirm\",\r\n");
      out.write("                title: \"提示\",\r\n");
      out.write("                msg: \"确认上报数据吗？\"\r\n");
      out.write("            };\r\n");
      out.write("            bootstrapQ.confirm(options, function () {\r\n");
      out.write("                $.get(\"generateBatch\", {chooseIds:chooseIds,projectName:'");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${projectName}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("', myTime:new Date().getTime()}, function (data) {\r\n");
      out.write("                    if (data.code == \"0000\"){\r\n");
      out.write("                        location.href='reportList?projectName='+'");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${projectName}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("';\r\n");
      out.write("                    }else{\r\n");
      out.write("                        bootstrapQ.msg({msg: data.message, type: 'danger',time:20000});\r\n");
      out.write("                    }\r\n");
      out.write("                });\r\n");
      out.write("            });\r\n");
      out.write("        }else {\r\n");
      out.write("            bootstrapQ.msg({msg: \"请选择需要上报的数据\", type: 'danger'});\r\n");
      out.write("        }\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    //日期控件\r\n");
      out.write("    $(\".searchDate\").datetimepicker({\r\n");
      out.write("        format: 'yyyy-mm-dd',//显示格式\r\n");
      out.write("        language: 'zh-CN',\r\n");
      out.write("//        pickerPosition: 'top-right',\r\n");
      out.write("        todayHighlight: 1,//今天高亮\r\n");
      out.write("        minView: 2,  //日期最小选择的范围\r\n");
      out.write("        startView: 2, //设置开始视图为月\r\n");
      out.write("        minuteStep: 1, //分钟间隔为1\r\n");
      out.write("        forceParse: 0,\r\n");
      out.write("        showMeridian: 1,\r\n");
      out.write("        autoclose: 1,//选择后自动关闭\r\n");
      out.write("        showSecond: false, //显示秒\r\n");
      out.write("        todayBtn: true\r\n");
      out.write("    })\r\n");
      out.write("</script>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
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

  private boolean _jspx_meth_c_005fset_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:set
    org.apache.taglibs.standard.tag.rt.core.SetTag _jspx_th_c_005fset_005f0 = (org.apache.taglibs.standard.tag.rt.core.SetTag) _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.SetTag.class);
    _jspx_th_c_005fset_005f0.setPageContext(_jspx_page_context);
    _jspx_th_c_005fset_005f0.setParent(null);
    // /static/common/common.jsp(2,0) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fset_005f0.setVar("ctx");
    // /static/common/common.jsp(2,0) name = value type = javax.el.ValueExpression reqTime = true required = false fragment = false deferredValue = true expectedTypeName = java.lang.Object deferredMethod = false methodSignature = null
    _jspx_th_c_005fset_005f0.setValue(new org.apache.jasper.el.JspValueExpression("/static/common/common.jsp(2,0) '${pageContext.request.contextPath}'",_el_expressionfactory.createValueExpression(_jspx_page_context.getELContext(),"${pageContext.request.contextPath}",java.lang.Object.class)).getValue(_jspx_page_context.getELContext()));
    int _jspx_eval_c_005fset_005f0 = _jspx_th_c_005fset_005f0.doStartTag();
    if (_jspx_th_c_005fset_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.reuse(_jspx_th_c_005fset_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.reuse(_jspx_th_c_005fset_005f0);
    return false;
  }
}
