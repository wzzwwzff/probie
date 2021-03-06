/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2018-08-06 08:46:29 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.tag;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.app.common.model.DataDict;
import com.app.common.utils.DataDictUtils;
import java.util.List;

public final class webdataDictInput_tag
    extends javax.servlet.jsp.tagext.SimpleTagSupport
    implements org.apache.jasper.runtime.JspSourceDependent {


  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.servlet.jsp.JspContext jspContext;
  private java.io.Writer _jspx_sout;
  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public void setJspContext(javax.servlet.jsp.JspContext ctx) {
    super.setJspContext(ctx);
    java.util.ArrayList _jspx_nested = null;
    java.util.ArrayList _jspx_at_begin = null;
    java.util.ArrayList _jspx_at_end = null;
    this.jspContext = new org.apache.jasper.runtime.JspContextWrapper(ctx, _jspx_nested, _jspx_at_begin, _jspx_at_end, null);
  }

  public javax.servlet.jsp.JspContext getJspContext() {
    return this.jspContext;
  }
  private java.lang.String name;
  private java.lang.String type;
  private java.lang.String dataDict;
  private java.lang.String value;
  private java.lang.String firstValue;
  private java.lang.String className;
  private java.lang.String idName;

  public java.lang.String getName() {
    return this.name;
  }

  public void setName(java.lang.String name) {
    this.name = name;
    jspContext.setAttribute("name", name);
  }

  public java.lang.String getType() {
    return this.type;
  }

  public void setType(java.lang.String type) {
    this.type = type;
    jspContext.setAttribute("type", type);
  }

  public java.lang.String getDataDict() {
    return this.dataDict;
  }

  public void setDataDict(java.lang.String dataDict) {
    this.dataDict = dataDict;
    jspContext.setAttribute("dataDict", dataDict);
  }

  public java.lang.String getValue() {
    return this.value;
  }

  public void setValue(java.lang.String value) {
    this.value = value;
    jspContext.setAttribute("value", value);
  }

  public java.lang.String getFirstValue() {
    return this.firstValue;
  }

  public void setFirstValue(java.lang.String firstValue) {
    this.firstValue = firstValue;
    jspContext.setAttribute("firstValue", firstValue);
  }

  public java.lang.String getClassName() {
    return this.className;
  }

  public void setClassName(java.lang.String className) {
    this.className = className;
    jspContext.setAttribute("className", className);
  }

  public java.lang.String getIdName() {
    return this.idName;
  }

  public void setIdName(java.lang.String idName) {
    this.idName = idName;
    jspContext.setAttribute("idName", idName);
  }

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  private void _jspInit(javax.servlet.ServletConfig config) {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(config.getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(config);
  }

  public void _jspDestroy() {
  }

  public void doTag() throws javax.servlet.jsp.JspException, java.io.IOException {
    javax.servlet.jsp.PageContext _jspx_page_context = (javax.servlet.jsp.PageContext)jspContext;
    javax.servlet.http.HttpServletRequest request = (javax.servlet.http.HttpServletRequest) _jspx_page_context.getRequest();
    javax.servlet.http.HttpServletResponse response = (javax.servlet.http.HttpServletResponse) _jspx_page_context.getResponse();
    javax.servlet.http.HttpSession session = _jspx_page_context.getSession();
    javax.servlet.ServletContext application = _jspx_page_context.getServletContext();
    javax.servlet.ServletConfig config = _jspx_page_context.getServletConfig();
    javax.servlet.jsp.JspWriter out = jspContext.getOut();
    _jspInit(config);
    jspContext.getELContext().putContext(javax.servlet.jsp.JspContext.class,jspContext);
    if( getName() != null ) 
      _jspx_page_context.setAttribute("name", getName());
    if( getType() != null ) 
      _jspx_page_context.setAttribute("type", getType());
    if( getDataDict() != null ) 
      _jspx_page_context.setAttribute("dataDict", getDataDict());
    if( getValue() != null ) 
      _jspx_page_context.setAttribute("value", getValue());
    if( getFirstValue() != null ) 
      _jspx_page_context.setAttribute("firstValue", getFirstValue());
    if( getClassName() != null ) 
      _jspx_page_context.setAttribute("className", getClassName());
    if( getIdName() != null ) 
      _jspx_page_context.setAttribute("idName", getIdName());

    try {

    //TODO 是否必选问题
    StringBuffer stringBuffer = new StringBuffer();
    List<DataDict> dataDictList = DataDictUtils.getDataDictList(request, dataDict);
    String classStr = "";
    if (className != null && !className.equals("")) {
        classStr = "class='" + className + "'";
    }
    String idStr = "";
    if (idName != null && !idName.equals("")) {
        idStr = "id='" + idName + "'";
    }
    if (type == null || type.equals("") || type.equals("select")) {
        stringBuffer.append("<select name=\"" + name + "\" id=\"" + name + "\" "+classStr+" "+idStr+">");
        if (firstValue != null && !"".equals(firstValue)) {
            stringBuffer.append("<option value=\"\">" + firstValue + "</option>");
        }
        for (DataDict dataDict1 : dataDictList) {
            String selected = "";
            if (value != null && dataDict1.getAttributeValue().equals(value)) {
                selected = " selected";
            }
            stringBuffer.append("<option value=\"" + dataDict1.getAttributeValue() + "\" " + selected + ">" + dataDict1.getAttributeName() + "</option>");
        }
        stringBuffer.append("</select>");
    } else {
        int index = 0;
        for (DataDict dataDict1 : dataDictList) {
            index++;
            String selected = "";
            if (value != null && !"".equals(value)) {
                if (dataDict1.getAttributeValue().equals(value)) {
                    selected = "checked";
                } else {
                    if (index == 1) {
                        selected = "checked";
                    }
                }
            } else {
                if (index == 1) {
                    selected = "checked";
                }
            }
            stringBuffer.append("<label><input type=\"" + type + "\" name=\"" + name + "\" id=\"" + name + "\" value=\"" + dataDict1.getAttributeValue() + "\" " + selected + " "+classStr+">" + dataDict1.getAttributeName() + "</label>&nbsp;&nbsp;");
        }
    }

    out.print(stringBuffer.toString());

    } catch( java.lang.Throwable t ) {
      if( t instanceof javax.servlet.jsp.SkipPageException )
          throw (javax.servlet.jsp.SkipPageException) t;
      if( t instanceof java.io.IOException )
          throw (java.io.IOException) t;
      if( t instanceof java.lang.IllegalStateException )
          throw (java.lang.IllegalStateException) t;
      if( t instanceof javax.servlet.jsp.JspException )
          throw (javax.servlet.jsp.JspException) t;
      throw new javax.servlet.jsp.JspException(t);
    } finally {
      jspContext.getELContext().putContext(javax.servlet.jsp.JspContext.class,super.getJspContext());
      ((org.apache.jasper.runtime.JspContextWrapper) jspContext).syncEndTagFile();
    }
  }
}
