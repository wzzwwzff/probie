<%@ page import="com.app.cq.en.HouseStatus" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.app.cq.model.House" %>
<%@ page import="com.app.common.model.DataDict" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.sqds.utils.StringUtils" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ALLOW" value="<%=HouseStatus.ALLOW.getIndex()%>"/>
<c:set var="PRETEND" value="<%=HouseStatus.PRETEND.getIndex()%>"/>
<c:set var="SIGNED" value="<%=HouseStatus.SIGNED.getIndex()%>"/>
<%
    int max = (Integer) request.getAttribute("maxFloor");
    List<String> unitList = (List<String>) request.getAttribute("unitList");
    Map<String, String> maxRoomByUnit = (Map<String, String>) request.getAttribute("maxRoomByUnitMap");
    Map<String, House> houseMap = (Map<String, House>) request.getAttribute("houseMap");
    Map<String, DataDict> flagMap = (Map<String, DataDict>) request.getAttribute("flagMap");
    Map<String, Map<String, String>> houseTypeMap = (Map<String, Map<String, String>>) request.getAttribute("houseTypeMap");
    Map<String, String> houseTypeDataDictMap = (Map<String, String>) request.getAttribute("houseTypeDataDictMap");
    Map<String, String> typeMap = (Map<String, String>) request.getAttribute("typeMap");
    int column = 0;
%>
<div style="text-align: center;width: 99%;margin-top: 10px;" id="content">
<c:if test="${maxFloor ne 0}">
    <div style="text-align: right;margin-right: 3px">
        <span style="color: black;font-size: 18px;">图例：</span>

        <c:forEach items="${flagMap}" var="flag">
            <c:if test="${flag.key ne PRETEND}">
                <button class="button btn button-circle" style="background-color: ${flag.value.attributeColor};margin-bottom: 10px;width: 20px;height: 20px;"></button>
                <span style="color: ${flag.value.attributeColor};font-size: 18px;">${flag.value.attributeName}</span>
            </c:if>
        </c:forEach>
    </div>
    <br/>
    <%
        if (max != 0) {
    %>
    <table id="dataTable" class="table table-bordered buildInfoTable" style="font-size: 18px;">
        <%

            String temp = max + "";
            int maxFloorNum = max; //最大层高
            int[] setNum1 = new int[unitList.size()];

            List temp1 = new ArrayList();
            for (String s : unitList) {
                temp1.add(s);
            }
        %>
        <tr>
                <%--<td width="4%" height="35" bgcolor="#cccccc" align="center"><b>户型</b></td>--%>
            <%
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

            %>
                <%--<td bgcolor="#cccccc" align="center"
                    <%if(j==maxSetNum-1){%>style="border-left:#999999 3px solid;"<%}%>>
                    <%=info%>
                </td>--%>
            <% }
            }%>
        </tr>

        <tr>
            <td width="2%" style="border-bottom: 1px solid #D1D1D1;background-color: #F2F2F2;font-size: 20px;border-left: 2px solid #d1d1d1;border-top: 2px solid #d1d1d1;border-right: 1px solid #D1D1D1;">
                <div class="out">
                    <b>单元</b>
                </div>
            </td>
            <%

                //int p = 0;
                //               for (int j = 0; j < temp1.size(); j++) {
                for (int j = temp1.size() - 1; j >= 0; j--){
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
            %>
            <td height="25" width="2%" colspan="<%=temp%>" bgcolor="#BDBABD" align="center" style="border-top: 2px solid #d1d1d1;font-size: 20px;background-color: #F2F2F2;border-right: 4px solid #D1D1D1;border-left:#999999 1px solid;border-bottom: 1px solid #D1D1D1;"><b><%=si%>单元</b></td>
            <%
                    //p++;
                }%>
        </tr>

        <%
            for (int i = maxFloorNum; i > 0; i--) { %>
        <tr bgcolor="#FFFFFF">
                <%--楼层号i   1,2,3..--%>
            <td width="4%" height="5%" bgcolor="#F2F2F2" style="border-left: 2px solid #d1d1d1;font-size: 20px;border-right: 1px solid #D1D1D1;">
                <b><%=i%>层
                </b>
            </td>
            <%
                String floorStr = "0" + i;
                if (floorStr.length() > 2) {
                    floorStr = floorStr.substring(1); //层
                }
                s = 0;
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
                    setNum1[s] = maxSetNum;

                    if (i == 1) {
                        column += maxSetNum;
                    }
                    for (int j = 0; j < maxSetNum; j++) {
//                    for (int j = maxSetNum - 1; j >= 0; j--) { {
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
                            String dataDict = houseTypeDataDictMap.get(house.getHouseHold() + "");//居室/套型
                            if (dataDict != null) {
//                                str2 = dataDict.getAttributeName();
                            }
                            showInfo ="<font style='font-size:20px;'>" +house.getHouseNum()+"</font></br>";
                            if (!area.equals("") && !area.equals("0.00㎡")) {
                                showInfo += "<span class='badge'><font style='font-size:17px;'>" + area + "</font></span>";
                            }
                            String br="<br/>";
                            if(house.getHouseHold() != null&&!house.getHouseHold().equals("")  ){
                                showInfo +="<br/><font style='font-size:20px;'>"+(houseTypeDataDictMap.get(house.getHouseHold() + ""))+"</font>&nbsp;&nbsp;";
                                br="";
                            }

                            click = "onclick ='loadHouse("+house.getId()+")'";
                            /*if (!StringUtils.getNotNullInt(house.getStatus()).equals(1)) {
                                showInfo += br+"<input op='"+StringUtils.getNotNullString(house.getMemo())+"' style='' type='radio' title='"
                                        + house.getUnitNum() + "单元" + house.getBuildNum() + "号楼" + house.getHouseNum() + "房' name='hId' value='" + house.getId() + "'/>";
                            }*/
                        }

                        String houseStatus = "";
                        if (house != null) {
                            houseStatus = house.getHouseStatus() + "";
                        }
                        /*伪选默认为已分配显示红色*/
                        if(houseStatus.equals("3")||houseStatus.equals("4")||houseStatus.equals("5")){
                            houseStatus = 2 + "";
                        }
                        DataDict colorDataDict = flagMap.get(houseStatus);
                        if (colorDataDict != null) {
                            bgColor = colorDataDict.getAttributeColor();
                        }

                        float width = 0;
                        if (temp1.size() > 0) {
                            width = 95 / maxSetNum / temp1.size();
                        } else {
                            width = 95 / maxSetNum;
                        }
            %>
            <td <%=click%> height="40" width="<%=width %>%" bgcolor="<%=bgColor%>"
                           style="border-radius: 15px;text-align:center;<%if(j==maxSetNum-1){%>border-right: 4px solid #D1D1D1;<%}%>
                                   "<%if (house != null){%> title="<%=house.getUnitNum() + "单元" + house.getBuildNum() + "号楼" + house.getHouseNum() + "房"%>" <%}%>>
                <%=showInfo %>
            </td>
            <% }
                s++;
            }
            %>
        </tr>
        <%}%>
            <%--楼层单元--%>

        <tr>
            <td width="2%" style="border-top: 1px solid #D1D1D1;background-color: #F2F2F2;font-size: 20px;border-left: 2px solid #d1d1d1;border-bottom: 2px solid #d1d1d1;border-right: 1px solid #D1D1D1;">
                <div class="out">
                    <b>单元</b>
                </div>
            </td>
            <%

                //int p = 0;
                //               for (int j = 0; j < temp1.size(); j++) {
                for (int j = temp1.size() - 1; j >= 0; j--){
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
            %>
            <td height="25" width="2%" colspan="<%=temp%>" bgcolor="#BDBABD" align="center" style="border-top: 1px solid #D1D1D1;border-bottom: 2px solid #d1d1d1;font-size: 20px;background-color: #F2F2F2;border-right: 4px solid #D1D1D1;border-left:#999999 1px solid;"><b><%=si%>单元</b></td>
            <%
                    //p++;
                }%>
        </tr>

    </table>
    <%
        }
    %>
</c:if>
</div>
