/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2018-10-24 03:08:59 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.pages.permission.menu;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/static/common/common.jsp", Long.valueOf(1540205387503L));
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fif_0026_005ftest;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.release();
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.release();
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
      response.setContentType("text/html; charset=UTF-8");
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
      out.write("<!DOCTYPE html>\r\n");
      out.write("<HTML>\r\n");
      out.write("<HEAD>\r\n");
      out.write("    <TITLE>菜单管理</TITLE>\r\n");
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
      out.write("<link rel=\"stylesheet\"  href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/static/datetimepicker/bootstrap-datetimepicker.min.css\" media=\"screen\">\r\n");
      out.write("\r\n");
      out.write("<script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/static/jquery/1.11.3/jquery.min.js\"></script>\r\n");
      out.write("<script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/static/bootstrap-3.3.5/js/bootstrap.min.js\"></script>\r\n");
      out.write("<script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/static/bootstrap-3.3.5/js/bootstrapQ.js\"></script>\r\n");
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
      out.write("<script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/static/datetimepicker/bootstrap-datetimepicker.js\" charset=\"UTF-8\" type=\"text/javascript\"></script>\r\n");
      out.write("<script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/static/datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js\" charset=\"UTF-8\" type=\"text/javascript\"></script>");
      out.write("\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/static/plugin/zTree_v3-master/css/zTreeStyle/zTreeStyle.css\">\r\n");
      out.write("    <script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/static/plugin/zTree_v3-master/js/jquery.ztree.core.js\"></script>\r\n");
      out.write("    <SCRIPT type=\"text/javascript\">\r\n");
      out.write("        var setting = {\r\n");
      out.write("            async: {\r\n");
      out.write("                enable: true,\r\n");
      out.write("                url: \"menuJson\"\r\n");
      out.write("            },\r\n");
      out.write("            callback: {\r\n");
      out.write("                beforeAsync: beforeAsync,\r\n");
      out.write("                onAsyncSuccess: onAsyncSuccess,\r\n");
      out.write("                onClick: onClick,\r\n");
      out.write("                onRightClick: OnRightClick\r\n");
      out.write("            },\r\n");
      out.write("            view: {\r\n");
      out.write("                nameIsHTML: true\r\n");
      out.write("            }\r\n");
      out.write("        };\r\n");
      out.write("        function onClick() {\r\n");
      out.write("            $(\"#menuInfo\").empty();\r\n");
      out.write("            $(\"#menuInfoLoad\").show();\r\n");
      out.write("            var nodes = zTree.getSelectedNodes();\r\n");
      out.write("            if (nodes.length > 0) {\r\n");
      out.write("                var id = nodes[0].id;//id\r\n");
      out.write("                //菜单信息显示出来\r\n");
      out.write("                var url=\"/permission/menu/manager?id=\"+id+\"&_time=\"+new Date().getTime();\r\n");
      out.write("                $(\"#iframepage\").attr(\"src\",url);\r\n");
      out.write("            }\r\n");
      out.write("        }\r\n");
      out.write("        function beforeAsync() {\r\n");
      out.write("            $(\"#load\").show();\r\n");
      out.write("        }\r\n");
      out.write("        function onAsyncSuccess() {\r\n");
      out.write("            $(\"#load\").hide();\r\n");
      out.write("        }\r\n");
      out.write("        function OnRightClick(event, treeId, treeNode) {\r\n");
      out.write("            if (!treeNode && event.target.tagName.toLowerCase() != \"button\" && $(event.target).parents(\"a\").length == 0) {\r\n");
      out.write("                zTree.cancelSelectedNode();\r\n");
      out.write("                showRMenu(\"root\", event.clientX, event.clientY);\r\n");
      out.write("            } else if (treeNode && !treeNode.noR) {\r\n");
      out.write("                zTree.selectNode(treeNode);\r\n");
      out.write("                showRMenu(\"node\", event.clientX, event.clientY);\r\n");
      out.write("            }\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        function showRMenu(type, x, y) {\r\n");
      out.write("            $(\"#rMenu ul\").show();\r\n");
      out.write("            if (type == \"root\") {\r\n");
      out.write("                $(\"#m_del\").hide();\r\n");
      out.write("                $(\"#m_check\").hide();\r\n");
      out.write("                $(\"#m_unCheck\").hide();\r\n");
      out.write("            } else {\r\n");
      out.write("                $(\"#m_del\").show();\r\n");
      out.write("                $(\"#m_check\").show();\r\n");
      out.write("                $(\"#m_unCheck\").show();\r\n");
      out.write("            }\r\n");
      out.write("            rMenu.css({\"top\": y + \"px\", \"left\": x + \"px\", \"visibility\": \"visible\"});\r\n");
      out.write("\r\n");
      out.write("            $(\"body\").bind(\"mousedown\", onBodyMouseDown);\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        function hideRMenu() {\r\n");
      out.write("            if (rMenu) rMenu.css({\"visibility\": \"hidden\"});\r\n");
      out.write("            $(\"body\").unbind(\"mousedown\", onBodyMouseDown);\r\n");
      out.write("        }\r\n");
      out.write("        function onBodyMouseDown(event) {\r\n");
      out.write("            if (!(event.target.id == \"rMenu\" || $(event.target).parents(\"#rMenu\").length > 0)) {\r\n");
      out.write("                rMenu.css({\"visibility\": \"hidden\"});\r\n");
      out.write("            }\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        var zTree, rMenu;\r\n");
      out.write("        $(document).ready(function () {\r\n");
      out.write("            $.fn.zTree.init($(\"#treeDemo\"), setting);\r\n");
      out.write("            zTree = $.fn.zTree.getZTreeObj(\"treeDemo\");\r\n");
      out.write("            rMenu = $(\"#rMenu\");\r\n");
      out.write("            $(\"#menuInfoLoad\").hide();\r\n");
      out.write("        });\r\n");
      out.write("\r\n");
      out.write("        //添加下级菜单\r\n");
      out.write("        function addMenu() {\r\n");
      out.write("            hideRMenu();\r\n");
      out.write("            var nodes = zTree.getSelectedNodes();\r\n");
      out.write("            if (nodes.length > 0) {\r\n");
      out.write("                var id = nodes[0].id;\r\n");
      out.write("                addOrEdit(id, \"\");\r\n");
      out.write("            }\r\n");
      out.write("        }\r\n");
      out.write("        function editMenu() {\r\n");
      out.write("            hideRMenu();\r\n");
      out.write("            var nodes = zTree.getSelectedNodes();\r\n");
      out.write("            if (nodes.length > 0) {\r\n");
      out.write("                var id = nodes[0].id;\r\n");
      out.write("                addOrEdit(\"\", id);\r\n");
      out.write("            }\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        function deleteMenu() {\r\n");
      out.write("            hideRMenu();\r\n");
      out.write("            if (confirm(\"确认删除当前菜单吗？\")) {\r\n");
      out.write("                var nodes = zTree.getSelectedNodes();\r\n");
      out.write("                if (nodes.length > 0) {\r\n");
      out.write("                    var id = nodes[0].id;\r\n");
      out.write("                    $.get(\"deleteMenu.do\", {id: id}, function (result) {\r\n");
      out.write("                        if (result.success == \"true\") {\r\n");
      out.write("                            zTree.reAsyncChildNodes(null, \"refresh\", true);\r\n");
      out.write("                        }else{\r\n");
      out.write("                            alert(result.message);\r\n");
      out.write("                        }\r\n");
      out.write("                    });\r\n");
      out.write("                }\r\n");
      out.write("            }\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("    </SCRIPT>\r\n");
      out.write("    <style type=\"text/css\">\r\n");
      out.write("        div#rMenu {\r\n");
      out.write("            position: absolute;\r\n");
      out.write("            visibility: hidden;\r\n");
      out.write("            top: 0;\r\n");
      out.write("            background-color: #cccccc;\r\n");
      out.write("            text-align: left;\r\n");
      out.write("            padding: 2px;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        div#rMenu ul li {\r\n");
      out.write("            margin: 0px 0px;\r\n");
      out.write("            padding: 4px 5px;\r\n");
      out.write("            cursor: pointer;\r\n");
      out.write("            list-style: none outside none;\r\n");
      out.write("            background-color: #ffffff;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        ul, li {\r\n");
      out.write("            margin: 0;\r\n");
      out.write("            padding: 0;\r\n");
      out.write("        }\r\n");
      out.write("    </style>\r\n");
      out.write("</HEAD>\r\n");
      out.write("<BODY oncontextmenu=\"self.event.returnValue=false\">\r\n");
      out.write("<DIV class=\"title\"><h5>菜单管理</h5></DIV>\r\n");
      out.write("<DIV class=\"content\">\r\n");
      out.write("    ");
      if (_jspx_meth_c_005fif_005f0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("    <table class=\"table table-bordered\">\r\n");
      out.write("        <thead>\r\n");
      out.write("        <tr>\r\n");
      out.write("            <th class=\"text-center\" width=\"20%\">菜单</th>\r\n");
      out.write("            <th class=\"text-center\" width=\"80%\">菜单详情</th>\r\n");
      out.write("        </tr>\r\n");
      out.write("        </thead>\r\n");
      out.write("        <tbody>\r\n");
      out.write("        <tr>\r\n");
      out.write("            <td class=\"text-left\" valign=\"top\">\r\n");
      out.write("                ");
      out.write("\r\n");
      out.write("                <span id=\"load\"><img src=\"/static/image/loading.gif\"/>信息加载中...</span>\r\n");
      out.write("                <ul id=\"treeDemo\" class=\"ztree\"></ul>\r\n");
      out.write("                ");
      out.write("\r\n");
      out.write("            </td>\r\n");
      out.write("            <td class=\"text-center\" valign=\"top\">\r\n");
      out.write("                <iframe src=\"\" marginheight=\"0\" marginwidth=\"0\" frameborder=\"0\" scrolling=\"yes\" width=\"100%\" height=\"100%\"  id=\"iframepage\" name=\"iframepage\" ></iframe>\r\n");
      out.write("                <script>\r\n");
      out.write("                    $(function(){\r\n");
      out.write("                        $(\"#iframepage\").load(function(){\r\n");
      out.write("                            $(this).height($(document.body).height()-200);\r\n");
      out.write("                        });\r\n");
      out.write("                    });\r\n");
      out.write("                    $(window).resize(function () {          //当浏览器大小变化时\r\n");
      out.write("                        $(\"#iframepage\").height($(document.body).height()-200);\r\n");
      out.write("                    });\r\n");
      out.write("                </script>\r\n");
      out.write("            </td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        </tbody>\r\n");
      out.write("    </table>\r\n");
      out.write("    <div id=\"rMenu\">\r\n");
      out.write("        <ul>\r\n");
      out.write("            <li id=\"m_add\" onclick=\"addMenu();\">添加下级菜单</li>\r\n");
      out.write("            <li id=\"m_del\" onclick=\"editMenu();\">修改</li>\r\n");
      out.write("            <li id=\"m_check\" onclick=\"deleteMenu();\">删除</li>\r\n");
      out.write("        </ul>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"modal\" id=\"myModal\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"myModalLabel\">\r\n");
      out.write("        <div class=\"modal-dialog\" role=\"document\">\r\n");
      out.write("            <div class=\"modal-content\">\r\n");
      out.write("                <div class=\"modal-header\">\r\n");
      out.write("                    <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>\r\n");
      out.write("                    <h4 class=\"modal-title\" id=\"myModalLabel\">菜单信息登记</h4>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"modal-body\" id=\"myModalBoday\">加载中...</div>\r\n");
      out.write("                <div class=\"modal-footer\">\r\n");
      out.write("                    <button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">关闭</button>\r\n");
      out.write("                    <button type=\"button\" class=\"btn btn-primary\" data-dismiss=\"modal\" id=\"queryBtn\">确定</button>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <script>\r\n");
      out.write("        function addOrEdit(parentId, id) {\r\n");
      out.write("            //打开弹出层\r\n");
      out.write("            if(id==0){\r\n");
      out.write("                $(\"#myModalLabel\").html(\"菜单信息登记\");\r\n");
      out.write("            }else{\r\n");
      out.write("                $(\"#myModalLabel\").html(\"菜单信息修改\");\r\n");
      out.write("            }\r\n");
      out.write("            $(\"#myModal\").modal({backdrop:false});\r\n");
      out.write("            $(\"#myModalBoday\").html(\"加载中...\");\r\n");
      out.write("            var url = \"form\";\r\n");
      out.write("//            location.href = url + \"?parentId=\" + parentId + \"&id=\" + id;\r\n");
      out.write("            $.get(url, {parentId: parentId, id: id, datetime: new Date().getTime()}, function (data) {\r\n");
      out.write("                $(\"#myModalBoday\").html(data);\r\n");
      out.write("            });\r\n");
      out.write("            $(\"#queryBtn\").click(function(data){\r\n");
      out.write("                $('#inputForm').submit();\r\n");
      out.write("            });\r\n");
      out.write("        }\r\n");
      out.write("    </script>\r\n");
      out.write("</DIV>\r\n");
      out.write("</BODY>\r\n");
      out.write("</HTML>\r\n");
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

  private boolean _jspx_meth_c_005fif_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_005fif_005f0.setPageContext(_jspx_page_context);
    _jspx_th_c_005fif_005f0.setParent(null);
    // /WEB-INF/pages/permission/menu/index.jsp(150,4) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fif_005f0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${not empty message}", java.lang.Boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false)).booleanValue());
    int _jspx_eval_c_005fif_005f0 = _jspx_th_c_005fif_005f0.doStartTag();
    if (_jspx_eval_c_005fif_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\r\n");
        out.write("        <div id=\"message\" class=\"alert alert-success\">\r\n");
        out.write("            <button data-dismiss=\"alert\" class=\"close\">×</button>\r\n");
        out.write("                ");
        out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${message}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
        out.write("\r\n");
        out.write("        </div>\r\n");
        out.write("    ");
        int evalDoAfterBody = _jspx_th_c_005fif_005f0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_005fif_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f0);
    return false;
  }
}
