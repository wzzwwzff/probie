/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2018-10-23 01:51:06 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.pages.cq.publicShow;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.app.cq.en.HouseStatus;
import java.util.List;
import java.util.Map;
import com.app.cq.model.House;
import com.app.common.model.DataDict;
import java.util.ArrayList;
import com.sqds.utils.StringUtils;

public final class housePicItem_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

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
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      //  c:set
      org.apache.taglibs.standard.tag.rt.core.SetTag _jspx_th_c_005fset_005f0 = (org.apache.taglibs.standard.tag.rt.core.SetTag) _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.SetTag.class);
      _jspx_th_c_005fset_005f0.setPageContext(_jspx_page_context);
      _jspx_th_c_005fset_005f0.setParent(null);
      // /WEB-INF/pages/cq/publicShow/housePicItem.jsp(13,0) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fset_005f0.setVar("ALLOW");
      // /WEB-INF/pages/cq/publicShow/housePicItem.jsp(13,0) name = value type = javax.el.ValueExpression reqTime = true required = false fragment = false deferredValue = true expectedTypeName = java.lang.Object deferredMethod = false methodSignature = null
      _jspx_th_c_005fset_005f0.setValue(HouseStatus.ALLOW.getIndex());
      int _jspx_eval_c_005fset_005f0 = _jspx_th_c_005fset_005f0.doStartTag();
      if (_jspx_th_c_005fset_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.reuse(_jspx_th_c_005fset_005f0);
        return;
      }
      _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.reuse(_jspx_th_c_005fset_005f0);
      out.write('\r');
      out.write('\n');
      //  c:set
      org.apache.taglibs.standard.tag.rt.core.SetTag _jspx_th_c_005fset_005f1 = (org.apache.taglibs.standard.tag.rt.core.SetTag) _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.SetTag.class);
      _jspx_th_c_005fset_005f1.setPageContext(_jspx_page_context);
      _jspx_th_c_005fset_005f1.setParent(null);
      // /WEB-INF/pages/cq/publicShow/housePicItem.jsp(14,0) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fset_005f1.setVar("PRETEND");
      // /WEB-INF/pages/cq/publicShow/housePicItem.jsp(14,0) name = value type = javax.el.ValueExpression reqTime = true required = false fragment = false deferredValue = true expectedTypeName = java.lang.Object deferredMethod = false methodSignature = null
      _jspx_th_c_005fset_005f1.setValue(HouseStatus.PRETEND.getIndex());
      int _jspx_eval_c_005fset_005f1 = _jspx_th_c_005fset_005f1.doStartTag();
      if (_jspx_th_c_005fset_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.reuse(_jspx_th_c_005fset_005f1);
        return;
      }
      _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.reuse(_jspx_th_c_005fset_005f1);
      out.write('\r');
      out.write('\n');
      //  c:set
      org.apache.taglibs.standard.tag.rt.core.SetTag _jspx_th_c_005fset_005f2 = (org.apache.taglibs.standard.tag.rt.core.SetTag) _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.SetTag.class);
      _jspx_th_c_005fset_005f2.setPageContext(_jspx_page_context);
      _jspx_th_c_005fset_005f2.setParent(null);
      // /WEB-INF/pages/cq/publicShow/housePicItem.jsp(15,0) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fset_005f2.setVar("SIGNED");
      // /WEB-INF/pages/cq/publicShow/housePicItem.jsp(15,0) name = value type = javax.el.ValueExpression reqTime = true required = false fragment = false deferredValue = true expectedTypeName = java.lang.Object deferredMethod = false methodSignature = null
      _jspx_th_c_005fset_005f2.setValue(HouseStatus.SIGNED.getIndex());
      int _jspx_eval_c_005fset_005f2 = _jspx_th_c_005fset_005f2.doStartTag();
      if (_jspx_th_c_005fset_005f2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.reuse(_jspx_th_c_005fset_005f2);
        return;
      }
      _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.reuse(_jspx_th_c_005fset_005f2);
      out.write('\r');
      out.write('\n');

    int max = (Integer) request.getAttribute("maxFloor");
    List<String> unitList = (List<String>) request.getAttribute("unitList");
    Map<String, String> maxRoomByUnit = (Map<String, String>) request.getAttribute("maxRoomByUnitMap");
    Map<String, House> houseMap = (Map<String, House>) request.getAttribute("houseMap");
    Map<String, DataDict> flagMap = (Map<String, DataDict>) request.getAttribute("flagMap");
    Map<String, Map<String, String>> houseTypeMap = (Map<String, Map<String, String>>) request.getAttribute("houseTypeMap");
    Map<String, String> houseTypeDataDictMap = (Map<String, String>) request.getAttribute("houseTypeDataDictMap");
    Map<String, String> typeMap = (Map<String, String>) request.getAttribute("typeMap");
    int column = 0;

      out.write("\r\n");
      out.write("<div style=\"text-align: center;width: 99%;margin-top: 10px;\" id=\"content\">\r\n");
      //  c:if
      org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
      _jspx_th_c_005fif_005f0.setPageContext(_jspx_page_context);
      _jspx_th_c_005fif_005f0.setParent(null);
      // /WEB-INF/pages/cq/publicShow/housePicItem.jsp(28,0) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fif_005f0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${maxFloor ne 0}", java.lang.Boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false)).booleanValue());
      int _jspx_eval_c_005fif_005f0 = _jspx_th_c_005fif_005f0.doStartTag();
      if (_jspx_eval_c_005fif_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\r\n");
          out.write("    <div style=\"text-align: right;margin-right: 3px\">\r\n");
          out.write("        <span style=\"color: black;font-size: 18px;\">图例：</span>\r\n");
          out.write("\r\n");
          out.write("        ");
          out.write("\r\n");
          out.write("            ");
          out.write("\r\n");
          out.write("            ");
          out.write("\r\n");
          out.write("            ");
          out.write("\r\n");
          out.write("            ");
          out.write("\r\n");
          out.write("        ");
          out.write("\r\n");
          out.write("        <button class=\"button btn button-circle\"\r\n");
          out.write("                style=\"background-color: green;margin-bottom: 10px;width: 25px;height: 25px;\"></button>\r\n");
          out.write("        <span style=\"color:green ;font-size: 18px;\">可选</span>\r\n");
          out.write("        <button class=\"button btn button-circle\"\r\n");
          out.write("                style=\"background-color: red;margin-bottom: 10px;width: 25px;height: 25px;\"></button>\r\n");
          out.write("        <span style=\"color: red;font-size: 18px;\">已选</span>\r\n");
          out.write("        <button class=\"button btn button-circle\"\r\n");
          out.write("                style=\"background-color: #0080FF;margin-bottom: 10px;width: 25px;height: 25px;\"></button>\r\n");
          out.write("        <span style=\"color: #0080FF;font-size: 18px;\">已换签</span>\r\n");
          out.write("    </div>\r\n");
          out.write("    <br/>\r\n");
          out.write("    ");

        if (max != 0) {
    
          out.write("\r\n");
          out.write("    <table  id=\"dataTable\" width=\"100%\" border=\"1\" align=\"center\" cellpadding=\"1\" cellspacing=\"1\" bgcolor=\"#999999\">\r\n");
          out.write("        ");


            String temp = max + "";
            int maxFloorNum = max; //最大层高
            int[] setNum1 = new int[unitList.size()];

            List temp1 = new ArrayList();
            for (String s : unitList) {
                temp1.add(s);
            }
        
          out.write("\r\n");
          out.write("        <tr>\r\n");
          out.write("                ");
          out.write("\r\n");
          out.write("            ");

                int s = 0;
                for (int ii = temp1.size() - 1; ii >= 0; ii--) {
//                for (int ii = 0; ii < temp1.size(); ii++) {
                    String si = (String) temp1.get(ii);
                    int maxSetNum = 0;

                    String roomCode = (String) maxRoomByUnit.get(si);
                    if (roomCode == null) {
                        setNum1[s] = 0;
                        s++;
                        continue;
                    }
                    temp = roomCode.substring(roomCode.length() - 2);
                    maxSetNum = Integer.parseInt(temp);


                    for (int j = 0; j < maxSetNum; j++) {
//                     for (int j = maxSetNum - 1; j >= 0; j--) {
                        String prefix = "0" + (j + 1);
                        prefix = prefix.substring(prefix.length() - 2);

                        Map<String,String> baseInfo = houseTypeMap.get(si);
                        String info = "";
                        String dataDict = baseInfo.get(prefix);//居室/套型
                        if(dataDict != null){
                            String js = houseTypeDataDictMap.get(dataDict);
                            info = "<b>" + js + "</b>";
                        }

            
          out.write("\r\n");
          out.write("                ");
          out.write("\r\n");
          out.write("            ");
 }
            }
          out.write("\r\n");
          out.write("        </tr>\r\n");
          out.write("\r\n");
          out.write("        <tr>\r\n");
          out.write("            <td bgcolor=\"#cccccc\" height=\"35\">\r\n");
          out.write("                <div class=\"out\">\r\n");
          out.write("                    <span class=\"bm\">楼层</span>/<span class=\"em\">单元</span>\r\n");
          out.write("                </div>\r\n");
          out.write("            </td>\r\n");
          out.write("            ");


                //int p = 0;
                for (int j = 0; j < temp1.size(); j++) {
                //for (int j = temp1.size() - 1; j >= 0; j--){
                    //单元号
                    String si = (String) temp1.get(j);
                    //房间号
                    String roomCode = (String) maxRoomByUnit.get(si);
                    //截取房间号后两位
                    temp = roomCode.substring(roomCode.length() - 2);
                    //int t = setNum1[p];
                    /*if (t == 0) {
                        p++;
                        continue;
                    }*/
            
          out.write("\r\n");
          out.write("            <td height=\"25\" colspan=\"");
          out.print(temp);
          out.write("\" bgcolor=\"#BDBABD\" align=\"center\" style=\"border-left:#999999 1px solid; border-right:#999999 1px solid;\">");
          out.print(si);
          out.write("单元</td>\r\n");
          out.write("            ");

                    //p++;
                }
          out.write("\r\n");
          out.write("        </tr>\r\n");
          out.write("\r\n");
          out.write("        ");

            for (int i = maxFloorNum; i > 0; i--) { 
          out.write("\r\n");
          out.write("        <tr bgcolor=\"#FFFFFF\">\r\n");
          out.write("                ");
          out.write("\r\n");
          out.write("            <td width=\"4%\" height=\"18\" bgcolor=\"#D6D3D6\">\r\n");
          out.write("                <div align=\"center\">");
          out.print(i);
          out.write("\r\n");
          out.write("                </div>\r\n");
          out.write("            </td>\r\n");
          out.write("            ");

                String floorStr = "0" + i;
                if (floorStr.length() > 2) {
                    floorStr = floorStr.substring(1); //层
                }
                s = 0;
                //for (int ii = temp1.size() - 1; ii >= 0; ii--) {
                for (int ii = 0; ii < temp1.size(); ii++) {
                    String si = (String) temp1.get(ii);
                    int maxSetNum = 0;

                    String roomCode = (String) maxRoomByUnit.get(si);
                    if (roomCode == null) {
                        setNum1[s] = 0;
                        s++;
                        continue;
                    }

                    temp = roomCode.substring(roomCode.length() - 2);
                    maxSetNum = Integer.parseInt(temp);
                    setNum1[s] = maxSetNum;

                    if (i == 1) {
                        column += maxSetNum;
                    }
                    //for (int j = 0; j < maxSetNum; j++) {
                    for (int j = maxSetNum - 1; j >= 0; j--) {
                        String roomNum = "0" + (j + 1);
                        if (roomNum.length() > 2) {
                            roomNum = roomNum.substring(roomNum.length() - 2, roomNum.length());
                        }
                        String room1 = floorStr + roomNum;
                        String bgColor = "#ffffff";


                        House house = (House) houseMap.get(si + "-" + room1);
                        String roomNum1 = "";
                        String area = "";
                        String showInfo = "";
                        String click = "";   // 点击事件
                        String cursor = "";
                        String str2 = "";
                        if (house != null) {
                            area = StringUtils.getNotNullDecimal(house.getBuildArea());
                            if (!area.equals("") && !area.equals("0")) {
                                area = area + "㎡";
                            }
//                            roomNum1 = house.getMemo();
                            String dataDict = houseTypeDataDictMap.get(house.getHouseType() + "");//居室/套型
                            if (dataDict != null) {
//                                str2 = dataDict.getAttributeName();
                            }
                            showInfo ="<font style='font-size:20px;'>" +house.getHouseNum()+"</font>"+ "&nbsp;&nbsp;&nbsp;";
                            if (!area.equals("") && !area.equals("0.00㎡")) {
                                showInfo += "<font style='font-size:17px;color:yellow;'>" + area + "</font>";
                            }
                            String br="<br/>";
                            if(house.getHouseType() != null&&!house.getHouseType().equals("")  ){
                                showInfo +="<br/><font style='font-size:20px;'>"+(houseTypeDataDictMap.get(house.getHouseType() + ""))+"</font>&nbsp;&nbsp;";
                                br="";
                            }

//                            click = "onclick ='loadHouse("+house.getId()+")'";
                            /*if (!StringUtils.getNotNullInt(house.getStatus()).equals(1)) {
                                showInfo += br+"<input op='"+StringUtils.getNotNullString(house.getMemo())+"' style='' type='radio' title='"
                                        + house.getUnitNum() + "单元" + house.getBuildNum() + "号楼" + house.getHouseNum() + "房' name='hId' value='" + house.getId() + "'/>";
                            }*/
                        }

                        String houseStatus = "";
                        if (house != null) {
                            houseStatus = house.getHouseStatus() + "";
                        }
                        if(houseStatus.equals("1")){
                            bgColor = "green";
                        }
                        /*伪选默认为已分配显示红色*/
                        if(houseStatus.equals("3")){
                            houseStatus = 2 + "";
                            bgColor = "red";
                        }
                        if(houseStatus.equals("2")){
                            bgColor = "red";
                        }
                        DataDict colorDataDict = flagMap.get(houseStatus);
//                        if (colorDataDict != null) {
//                            bgColor = colorDataDict.getAttributeColor();
//                        }

                        //已换签显示
                        if(house != null && house.getFamily() != null){
                            if(house.getFamily().getSignStatus() == 2){
                                bgColor = "#0080FF";
                            }
                        }

                        float width = 0;
                        if (temp1.size() > 0) {
                            width = 95 / maxSetNum / temp1.size();
                        } else {
                            width = 95 / maxSetNum;
                        }
            
          out.write("\r\n");
          out.write("            <td height=\"40\" width=\"");
          out.print(width );
          out.write("%\" bgcolor=\"");
          out.print(bgColor);
          out.write("\" class='msg_tk'\r\n");
          out.write("                           style=\"text-align:center;cursor: pointer;");
if(j==maxSetNum-1){
          out.write("border-left:#999999 0px solid;");
}
          out.write("\r\n");
          out.write("                                   ");
if(j==0){
          out.write("border-left:#999999 3px solid;");
}
          out.write(';');
          out.write('"');
if (house != null){
          out.write(" title=\"");
          out.print(house.getUnitNum() + "单元" + house.getBuildNum() + "号楼" + house.getHouseNum() + "房");
          out.write('"');
          out.write(' ');
}
          out.write(">\r\n");
          out.write("                    ");
          out.write("\r\n");
          out.write("                    ");
          out.write("\r\n");
          out.write("                ");
          out.print(showInfo );
          out.write("\r\n");
          out.write("            </td>\r\n");
          out.write("            ");
 }
                s++;
            }
            
          out.write("\r\n");
          out.write("        </tr>\r\n");
          out.write("        ");
}
          out.write("\r\n");
          out.write("            ");
          out.write("\r\n");
          out.write("\r\n");
          out.write("\r\n");
          out.write("    </table>\r\n");
          out.write("    ");

        }
    
          out.write("\r\n");
          out.write("    </div>\r\n");
          int evalDoAfterBody = _jspx_th_c_005fif_005f0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fif_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f0);
        return;
      }
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f0);
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