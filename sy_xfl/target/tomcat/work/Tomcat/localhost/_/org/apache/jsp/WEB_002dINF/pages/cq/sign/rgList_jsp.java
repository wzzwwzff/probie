/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2018-09-05 02:39:34 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.pages.cq.sign;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class rgList_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(5);
    _jspx_dependants.put("/WEB-INF/tags/pageInfo.tag", Long.valueOf(1530235428978L));
    _jspx_dependants.put("/WEB-INF/tags/searchInput.tag", Long.valueOf(1530235428973L));
    _jspx_dependants.put("/WEB-INF/tags/searchDataDict.tag", Long.valueOf(1530235429001L));
    _jspx_dependants.put("/WEB-INF/tags/dataDict.tag", Long.valueOf(1530235428986L));
    _jspx_dependants.put("/static/common/common.jsp", Long.valueOf(1530235432151L));
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvarStatus_005fvar_005fitems;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvarStatus_005fvar_005fitems = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.release();
    _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvarStatus_005fvar_005fitems.release();
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
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("    <title>认购协议管理列表</title>\r\n");
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
      out.write("/static/plugin/tableExcel/jquery.table2excel.js\"></script>");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<div class=\"title\">\r\n");
      out.write("    <h5>认购协议管理列表</h5>\r\n");
      out.write("</div>\r\n");
      out.write("<div class=\"content\">\r\n");
      out.write("    <div class=\"search form-inline\" >\r\n");
      out.write("        <div class=\"search\">\r\n");
      out.write("            <div class=\"search_content\">\r\n");
      out.write("                <form id=\"search\" class=\"form-search\">\r\n");
      out.write("                    <div class=\"form-group\">\r\n");
      out.write("                        <div class=\"input-group input-group-sm\">\r\n");
      out.write("                            <div class=\"input-group-addon\">组别</div>\r\n");
      out.write("                            ");
      if (_jspx_meth_tags_005fsearchDataDict_005f0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("                        </div>\r\n");
      out.write("\r\n");
      out.write("                        <div class=\"input-group input-group-sm\">\r\n");
      out.write("                            <div class=\"input-group-addon\">编号</div>\r\n");
      out.write("                            ");
      if (_jspx_meth_tags_005fsearchInput_005f0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"input-group input-group-sm\">\r\n");
      out.write("                            <div class=\"input-group-addon\">姓名</div>\r\n");
      out.write("                            ");
      if (_jspx_meth_tags_005fsearchInput_005f1(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"input-group input-group-sm\">\r\n");
      out.write("                            <div class=\"input-group-addon\">房屋坐落</div>\r\n");
      out.write("                            ");
      if (_jspx_meth_tags_005fsearchInput_005f2(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"input-group input-group-sm\">\r\n");
      out.write("                            <div class=\"input-group-addon\">签约状态</div>\r\n");
      out.write("                            ");
      if (_jspx_meth_tags_005fsearchDataDict_005f1(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <button type=\"submit\" class=\"btn btn-primary btn-sm\"><i class=\"fa fa-search\"></i>&nbsp;查询</button>\r\n");
      out.write("                        <a href=\"/cq/sign/updateOneTime\" class=\"btn btn-primary btn-sm\">批量更新</a>&nbsp;&nbsp;\r\n");
      out.write("                    </div>\r\n");
      out.write("                </form>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <table class=\"table table-bordered table-hover table-striped\">\r\n");
      out.write("            <thead>\r\n");
      out.write("            <tr>\r\n");
      out.write("                <th class=\"text-center\" width=\"5%\">序号</th>\r\n");
      out.write("                <th class=\"text-center\">编号</th>\r\n");
      out.write("                <th class=\"text-center\">组别</th>\r\n");
      out.write("                <th class=\"text-center\">姓名</th>\r\n");
      out.write("                <th class=\"text-center\">房屋坐落</th>\r\n");
      out.write("                <th class=\"text-center\">合法宅基地面积(㎡)</th>\r\n");
      out.write("                <th class=\"text-center\">合法宅基地范围内正式房屋建筑面积 (㎡)</th>\r\n");
      out.write("                <th class=\"text-center\">安置人口</th>\r\n");
      out.write("                ");
      out.write("\r\n");
      out.write("                <th class=\"text-center\">安置房认购修改</th>\r\n");
      out.write("                <th width=\"8%\" class=\"text-center\">操作</th>\r\n");
      out.write("            </tr>\r\n");
      out.write("            </thead>\r\n");
      out.write("            ");
      if (_jspx_meth_c_005fforEach_005f0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("        </table>\r\n");
      out.write("        ");
      if (_jspx_meth_tags_005fpageInfo_005f0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
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

  private boolean _jspx_meth_tags_005fsearchDataDict_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  tags:searchDataDict
    org.apache.jsp.tag.websearchDataDict_tag _jspx_th_tags_005fsearchDataDict_005f0 = (new org.apache.jsp.tag.websearchDataDict_tag());
    _jsp_instancemanager.newInstance(_jspx_th_tags_005fsearchDataDict_005f0);
    _jspx_th_tags_005fsearchDataDict_005f0.setJspContext(_jspx_page_context);
    // /WEB-INF/pages/cq/sign/rgList.jsp(29,28) name = className type = java.lang.String reqTime = true required = false fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_tags_005fsearchDataDict_005f0.setClassName("form-control");
    // /WEB-INF/pages/cq/sign/rgList.jsp(29,28) name = name type = java.lang.String reqTime = true required = true fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_tags_005fsearchDataDict_005f0.setName("groupCode");
    // /WEB-INF/pages/cq/sign/rgList.jsp(29,28) name = fieldType type = java.lang.String reqTime = true required = true fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_tags_005fsearchDataDict_005f0.setFieldType("string");
    // /WEB-INF/pages/cq/sign/rgList.jsp(29,28) name = dataDict type = java.lang.String reqTime = true required = true fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_tags_005fsearchDataDict_005f0.setDataDict("组别");
    _jspx_th_tags_005fsearchDataDict_005f0.doTag();
    _jsp_instancemanager.destroyInstance(_jspx_th_tags_005fsearchDataDict_005f0);
    return false;
  }

  private boolean _jspx_meth_tags_005fsearchInput_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  tags:searchInput
    org.apache.jsp.tag.websearchInput_tag _jspx_th_tags_005fsearchInput_005f0 = (new org.apache.jsp.tag.websearchInput_tag());
    _jsp_instancemanager.newInstance(_jspx_th_tags_005fsearchInput_005f0);
    _jspx_th_tags_005fsearchInput_005f0.setJspContext(_jspx_page_context);
    // /WEB-INF/pages/cq/sign/rgList.jsp(34,28) name = name type = java.lang.String reqTime = true required = true fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_tags_005fsearchInput_005f0.setName("f.familyCode");
    // /WEB-INF/pages/cq/sign/rgList.jsp(34,28) name = fieldType type = java.lang.String reqTime = true required = true fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_tags_005fsearchInput_005f0.setFieldType("string");
    // /WEB-INF/pages/cq/sign/rgList.jsp(34,28) name = operator type = java.lang.String reqTime = true required = true fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_tags_005fsearchInput_005f0.setOperator("like");
    // /WEB-INF/pages/cq/sign/rgList.jsp(34,28) name = className type = java.lang.String reqTime = true required = false fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_tags_005fsearchInput_005f0.setClassName("form-control");
    _jspx_th_tags_005fsearchInput_005f0.doTag();
    _jsp_instancemanager.destroyInstance(_jspx_th_tags_005fsearchInput_005f0);
    return false;
  }

  private boolean _jspx_meth_tags_005fsearchInput_005f1(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  tags:searchInput
    org.apache.jsp.tag.websearchInput_tag _jspx_th_tags_005fsearchInput_005f1 = (new org.apache.jsp.tag.websearchInput_tag());
    _jsp_instancemanager.newInstance(_jspx_th_tags_005fsearchInput_005f1);
    _jspx_th_tags_005fsearchInput_005f1.setJspContext(_jspx_page_context);
    // /WEB-INF/pages/cq/sign/rgList.jsp(38,28) name = name type = java.lang.String reqTime = true required = true fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_tags_005fsearchInput_005f1.setName("f.name");
    // /WEB-INF/pages/cq/sign/rgList.jsp(38,28) name = fieldType type = java.lang.String reqTime = true required = true fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_tags_005fsearchInput_005f1.setFieldType("string");
    // /WEB-INF/pages/cq/sign/rgList.jsp(38,28) name = operator type = java.lang.String reqTime = true required = true fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_tags_005fsearchInput_005f1.setOperator("like");
    // /WEB-INF/pages/cq/sign/rgList.jsp(38,28) name = className type = java.lang.String reqTime = true required = false fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_tags_005fsearchInput_005f1.setClassName("form-control");
    _jspx_th_tags_005fsearchInput_005f1.doTag();
    _jsp_instancemanager.destroyInstance(_jspx_th_tags_005fsearchInput_005f1);
    return false;
  }

  private boolean _jspx_meth_tags_005fsearchInput_005f2(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  tags:searchInput
    org.apache.jsp.tag.websearchInput_tag _jspx_th_tags_005fsearchInput_005f2 = (new org.apache.jsp.tag.websearchInput_tag());
    _jsp_instancemanager.newInstance(_jspx_th_tags_005fsearchInput_005f2);
    _jspx_th_tags_005fsearchInput_005f2.setJspContext(_jspx_page_context);
    // /WEB-INF/pages/cq/sign/rgList.jsp(42,28) name = name type = java.lang.String reqTime = true required = true fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_tags_005fsearchInput_005f2.setName("f.houseAddress");
    // /WEB-INF/pages/cq/sign/rgList.jsp(42,28) name = fieldType type = java.lang.String reqTime = true required = true fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_tags_005fsearchInput_005f2.setFieldType("string");
    // /WEB-INF/pages/cq/sign/rgList.jsp(42,28) name = operator type = java.lang.String reqTime = true required = true fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_tags_005fsearchInput_005f2.setOperator("like");
    // /WEB-INF/pages/cq/sign/rgList.jsp(42,28) name = className type = java.lang.String reqTime = true required = false fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_tags_005fsearchInput_005f2.setClassName("form-control");
    _jspx_th_tags_005fsearchInput_005f2.doTag();
    _jsp_instancemanager.destroyInstance(_jspx_th_tags_005fsearchInput_005f2);
    return false;
  }

  private boolean _jspx_meth_tags_005fsearchDataDict_005f1(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  tags:searchDataDict
    org.apache.jsp.tag.websearchDataDict_tag _jspx_th_tags_005fsearchDataDict_005f1 = (new org.apache.jsp.tag.websearchDataDict_tag());
    _jsp_instancemanager.newInstance(_jspx_th_tags_005fsearchDataDict_005f1);
    _jspx_th_tags_005fsearchDataDict_005f1.setJspContext(_jspx_page_context);
    // /WEB-INF/pages/cq/sign/rgList.jsp(46,28) name = name type = java.lang.String reqTime = true required = true fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_tags_005fsearchDataDict_005f1.setName("qyState");
    // /WEB-INF/pages/cq/sign/rgList.jsp(46,28) name = className type = java.lang.String reqTime = true required = false fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_tags_005fsearchDataDict_005f1.setClassName("form-control");
    // /WEB-INF/pages/cq/sign/rgList.jsp(46,28) name = fieldType type = java.lang.String reqTime = true required = true fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_tags_005fsearchDataDict_005f1.setFieldType("integer");
    // /WEB-INF/pages/cq/sign/rgList.jsp(46,28) name = dataDict type = java.lang.String reqTime = true required = true fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_tags_005fsearchDataDict_005f1.setDataDict("签约状态");
    _jspx_th_tags_005fsearchDataDict_005f1.doTag();
    _jsp_instancemanager.destroyInstance(_jspx_th_tags_005fsearchDataDict_005f1);
    return false;
  }

  private boolean _jspx_meth_c_005fforEach_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:forEach
    org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_005fforEach_005f0 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvarStatus_005fvar_005fitems.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
    _jspx_th_c_005fforEach_005f0.setPageContext(_jspx_page_context);
    _jspx_th_c_005fforEach_005f0.setParent(null);
    // /WEB-INF/pages/cq/sign/rgList.jsp(70,12) name = items type = javax.el.ValueExpression reqTime = true required = false fragment = false deferredValue = true expectedTypeName = java.lang.Object deferredMethod = false methodSignature = null
    _jspx_th_c_005fforEach_005f0.setItems(new org.apache.jasper.el.JspValueExpression("/WEB-INF/pages/cq/sign/rgList.jsp(70,12) '${pageInfo.result}'",_el_expressionfactory.createValueExpression(_jspx_page_context.getELContext(),"${pageInfo.result}",java.lang.Object.class)).getValue(_jspx_page_context.getELContext()));
    // /WEB-INF/pages/cq/sign/rgList.jsp(70,12) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fforEach_005f0.setVar("family");
    // /WEB-INF/pages/cq/sign/rgList.jsp(70,12) name = varStatus type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fforEach_005f0.setVarStatus("status");
    int[] _jspx_push_body_count_c_005fforEach_005f0 = new int[] { 0 };
    try {
      int _jspx_eval_c_005fforEach_005f0 = _jspx_th_c_005fforEach_005f0.doStartTag();
      if (_jspx_eval_c_005fforEach_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\r\n");
          out.write("                <tr>\r\n");
          out.write("                    <td class=\"text-center\">");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${status.count}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
          out.write("</td>\r\n");
          out.write("                    <td class=\"text-center\">");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${family.familyCode}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
          out.write("</td>\r\n");
          out.write("                    <td class=\"text-center\">");
          if (_jspx_meth_tags_005fdataDict_005f0(_jspx_th_c_005fforEach_005f0, _jspx_page_context, _jspx_push_body_count_c_005fforEach_005f0))
            return true;
          out.write("</td>\r\n");
          out.write("                    <td class=\"text-center\">");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${family.name}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
          out.write("</td>\r\n");
          out.write("                    <td class=\"text-left\">");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${family.houseAddress}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
          out.write("</td>\r\n");
          out.write("                    <td class=\"text-center\">");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${family.confirmArea}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
          out.write("</td>\r\n");
          out.write("                    <td class=\"text-center\">");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${family.buildArea}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
          out.write("</td>\r\n");
          out.write("                    <td class=\"text-center\">");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${family.personNum}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
          out.write("</td>\r\n");
          out.write("                    ");
          out.write("\r\n");
          out.write("                    <td class=\"text-center\"><a href='/cq/sign/rgForm?familyId=");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${family.id}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
          out.write('&');
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageInfo.searchParams}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
          out.write("'\r\n");
          out.write("                                               title=\"补充修改\">修改</a></td>\r\n");
          out.write("                    <td class=\"text-center\">\r\n");
          out.write("                        <a href='printRgxyFrame?familyId=");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${family.id}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
          out.write('&');
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageInfo.searchParams}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
          out.write("'\r\n");
          out.write("                           title=\"打印补充协议\"><i class=\"fa fa-print\"></i>&nbsp;打印认购协议\r\n");
          out.write("                        </a>\r\n");
          out.write("                    </td>\r\n");
          out.write("                </tr>\r\n");
          out.write("            ");
          int evalDoAfterBody = _jspx_th_c_005fforEach_005f0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fforEach_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (java.lang.Throwable _jspx_exception) {
      while (_jspx_push_body_count_c_005fforEach_005f0[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_c_005fforEach_005f0.doCatch(_jspx_exception);
    } finally {
      _jspx_th_c_005fforEach_005f0.doFinally();
      _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvarStatus_005fvar_005fitems.reuse(_jspx_th_c_005fforEach_005f0);
    }
    return false;
  }

  private boolean _jspx_meth_tags_005fdataDict_005f0(javax.servlet.jsp.tagext.JspTag _jspx_th_c_005fforEach_005f0, javax.servlet.jsp.PageContext _jspx_page_context, int[] _jspx_push_body_count_c_005fforEach_005f0)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  tags:dataDict
    org.apache.jsp.tag.webdataDict_tag _jspx_th_tags_005fdataDict_005f0 = (new org.apache.jsp.tag.webdataDict_tag());
    _jsp_instancemanager.newInstance(_jspx_th_tags_005fdataDict_005f0);
    _jspx_th_tags_005fdataDict_005f0.setJspContext(_jspx_page_context);
    _jspx_th_tags_005fdataDict_005f0.setParent(_jspx_th_c_005fforEach_005f0);
    // /WEB-INF/pages/cq/sign/rgList.jsp(74,44) name = dataDict type = java.lang.String reqTime = true required = true fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_tags_005fdataDict_005f0.setDataDict("组别");
    // /WEB-INF/pages/cq/sign/rgList.jsp(74,44) name = value type = java.lang.String reqTime = true required = false fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_tags_005fdataDict_005f0.setValue((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${family.groupCode}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
    _jspx_th_tags_005fdataDict_005f0.doTag();
    _jsp_instancemanager.destroyInstance(_jspx_th_tags_005fdataDict_005f0);
    return false;
  }

  private boolean _jspx_meth_tags_005fpageInfo_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  tags:pageInfo
    org.apache.jsp.tag.webpageInfo_tag _jspx_th_tags_005fpageInfo_005f0 = (new org.apache.jsp.tag.webpageInfo_tag());
    _jsp_instancemanager.newInstance(_jspx_th_tags_005fpageInfo_005f0);
    _jspx_th_tags_005fpageInfo_005f0.setJspContext(_jspx_page_context);
    _jspx_th_tags_005fpageInfo_005f0.doTag();
    _jsp_instancemanager.destroyInstance(_jspx_th_tags_005fpageInfo_005f0);
    return false;
  }
}
