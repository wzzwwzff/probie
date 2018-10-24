
<%@ page import="com.app.cq.model.Family" %>
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
<%
    Family family = (Family) request.getAttribute("family");
    int max = (Integer) request.getAttribute("maxFloor");
    List<String> unitList = (List<String>) request.getAttribute("unitList");
    List<House> choosedHouseList = (List<House>) request.getAttribute("choosedHouseList");
    Map<String, String> maxRoomByUnit = (Map<String, String>) request.getAttribute("maxRoomByUnitMap");
    Map<String, House> houseMap = (Map<String, House>) request.getAttribute("houseMap");
    Map<String, DataDict> flagMap = (Map<String, DataDict>) request.getAttribute("flagMap");
    Map<String, Map<String, String>> houseTypeMap = (Map<String, Map<String, String>>) request.getAttribute("houseTypeMap");
    Map<String, String> houseTypeDataDictMap = (Map<String, String>) request.getAttribute("houseTypeDataDictMap");
    Map<String, String> typeMap = (Map<String, String>) request.getAttribute("typeMap");
    String maxUnit = (String) request.getAttribute("maxUnit");
    int column = 0;
%>
<div style="text-align: center;width: 99%;margin-top: 10px;" id="content">
    <span style="color: black;font-size: 18px;">图例：</span>
    <button class="button btn button-circle"
            style="background-color: green;margin-bottom: 10px;width: 25px;height: 25px;"></button>
    <span style="color:green ;font-size: 18px;">可选</span>
    <button class="button btn button-circle"
            style="background-color: red;margin-bottom: 10px;width: 25px;height: 25px;"></button>
    <span style="color: red;font-size: 18px;">已选</span>
    <%--<button class="button btn button-circle"--%>
            <%--style="background-color: lightgray;margin-bottom: 10px;width: 25px;height: 25px;"></button>--%>
    <%--<span style="color: lightgray;font-size: 18px;">不可选</span>--%>
    <br/><br/>

    <%--<button type="button"class="btn btn-danger unitShowOrHideBtn" style="width: 100px;" unitBtn="">显示全部</button>--%>
    <%--<%--%>
        <%--int x = 0;--%>
        <%--//               for (int j = 0; j < temp1.size(); j++) {--%>

        <%--for (int j = temp1.size() - 1; j >= 0; j--){--%>
            <%--String si = (String) temp1.get(j);--%>
    <%--%>--%>
    <%--<button type="button"class="btn btn-warning unitShowOrHideBtn" style="width: 100px;" unitBtn="<%=si%>"><%=si%>单元</button>--%>
    <%--<%--%>
            <%--x++;--%>
        <%--}--%>
    <%--%>--%>
    <%--<script>--%>
        <%--function unitShowOrHide(unitBtn){--%>
            <%--if(unitBtn==""){//显示全部--%>
                <%--$(".buildInfoTable th[units],td[units]").show();--%>
            <%--}else{--%>
                <%--$(".buildInfoTable th[units],td[units]").hide();--%>
                <%--$(".buildInfoTable th[units='"+unitBtn+"'],td[units='"+unitBtn+"']").show();--%>
            <%--}--%>
        <%--}--%>
        <%--$(".unitShowOrHideBtn").click(function(){--%>
            <%--$(".unitShowOrHideBtn").removeClass("btn-danger").removeClass(" btn-warning").addClass(" btn-warning");--%>
            <%--$(this).addClass("btn-danger");--%>
            <%--unitShowOrHide($(this).attr("unitBtn"));--%>
        <%--});--%>
    <%--</script>--%>

    <%
        if (max != 0) {
    %>
    <table id="dataTable" class="table table-bordered buildInfoTable" style="font-size: 18px;">
        <tr>
            <td width="2%" height="35" class="text-center border_right" style="border-left: 2px solid #d1d1d1;border-top: 2px solid #d1d1d1;border-right: 1px solid #D1D1D1;background-color: #F2F2F2;" align="center"><b>户型</b></td>
            <%
                String temp = max + "";
                int maxFloorNum = max; //最大层高
                int[] setNum1 = new int[unitList.size()];
                List temp1 = new ArrayList();
                for (String s : unitList) {
                    temp1.add(s);
                }

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
                        String prefix = (j + 1)+"";
                        prefix = prefix.substring(prefix.length() - 1);

                       Map<String,String> baseInfo = houseTypeMap.get(si);
                        String info = "";
                            String dataDict = baseInfo.get(prefix);//居室/套型
                        if(dataDict != null){
                            String js = houseTypeDataDictMap.get(dataDict);
                            info = "<b>" + js + "</b>";
                        }

            %>
            <td align="center" style="border-top: 2px solid #d1d1d1;background-color: #F2F2F2;
                <%if(j==maxSetNum-1){%>border-right: 6px solid #D1D1D1;<%}%>">
                <%=info%>
            </td>
            <% }
            }%>
        </tr>
        <tr>
            <td width="2%" height="35" class="text-center border_right" style="border-bottom: 1px solid #D1D1D1;background-color: #F2F2F2;border-left: 2px solid #d1d1d1;border-right: 1px solid #D1D1D1;" align="center"><b>房号</b></td>
            <%
                for (int i = 1; i <=Integer.valueOf(maxUnit) ; i++) {
                    Integer roomCount = Integer.valueOf(maxRoomByUnit.get(i+""));
                    for (int j = 1; j <=roomCount ; j++) {
                        String roomNum = "0"+j;
            %>
            <td align="center" style="border-bottom: 1px solid #D1D1D1;background-color: #F2F2F2;<%if(j==roomCount){%>border-right: 6px solid #D1D1D1;<%}%>">
                <b><%=roomNum%></b>
            </td>
            <%
                    }
                }
            %>
        </tr>

        <%
            for (int i = maxFloorNum; i > 0; i--) { %>
        <tr bgcolor="#FFFFFF">
            <td width="2%" height="18" class="text-center border_right" style="border-left: 2px solid #d1d1d1;border-right: 1px solid #D1D1D1;">
                <div align="center"><b><%=i%>层</b>
                </div>
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
//                    for (int j = maxSetNum - 1; j >= 0; j--) {
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
                            showInfo ="<font style='font-size:20px;'>" +house.getHouseNum()+"</font></br>";
                            if (!area.equals("") && !area.equals("0.00㎡")) {
                                showInfo += "<span class='badge'><font style='font-size:14px;'>" + area + "</font></span>";
                            }
                            String br="<br/>";
                            if(house.getHouseType() != null&&!house.getHouseType().equals("")  ){
//                                showInfo +="<br/><font style='font-size:20px;'>"+house.getHouseType()+"</font>&nbsp;&nbsp;";
                                br="";
                            }
                        }

                        String houseStatus = "";
                        if (house != null) {
                            houseStatus = house.getHouseStatus() + "";
                        }
                        if (houseStatus != null && houseStatus.equals("3")) {//伪选的默认为已选
                            houseStatus = "2";
                        }

                        DataDict colorDataDict = flagMap.get(houseStatus);
                        if (colorDataDict != null) {
                            bgColor = colorDataDict.getAttributeColor();
                            if (houseStatus.equals("1")) {
                                bgColor = "green";
                            } else {
                                if (bgColor.equals("#ffff77")) {
                                    bgColor = "#ff4330";
                                }
                            }
                        }
                        if (houseStatus.equals("1")) {
                            StringBuffer tipInfo = new StringBuffer("请确认以下所选房源信息：\n\n");
                            tipInfo.append("项目名称：" + house.getProject().getProjectName() + "\n");
                            tipInfo.append("楼&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 号：" + house.getBuildNum() + "号楼\n");
                            tipInfo.append("单&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 元：" + house.getUnitNum() + "单元\n");
                            tipInfo.append("房&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 号：" + house.getHouseNum() + "\n");
                            tipInfo.append("面&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 积：" + house.getBuildArea() + "㎡\n");
                            tipInfo.append("居&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 室：" + (houseTypeDataDictMap.get(house.getHouseType() + "")) + "\n");
                            click = "onclick ='loadHouse("+house.getId()+")'";
                            cursor = "cursor: pointer";
//                                    showInfo += "<br/><input type='radio' name='houseId' value='" + house.getId() + "," + house.getHouseType() + "," + house.getProject().getProjectCode() + "," + house.getBuildArea() + "' tipInfo='" + tipInfo + "'/>";
//                            }
                        }
                        float width = 0;
                        if (temp1.size() > 0) {
                            width = 95 / maxSetNum / temp1.size();
                        } else {
                            width = 95 / maxSetNum;
                        }

                        //showInfo += "-"+ house.getUnitNum();

            %>
            <td <%=click%> height="40" width="<%=width %>%" bgcolor="<%=bgColor%>"
                                   style="border-radius: 15px;text-align:center;<%if(j==maxSetNum-1){%>border-right: 6px solid #D1D1D1;<%}%>
                           <%if(j==0){%><%}%>;
            <%--style="text-align:center;<%if(j==0){%>border-left:#999999 0px solid;<%}%>--%>
            <%--<%if(j==maxSetNum-1){%>border-left:#999999 3px solid;<%}%>;--%>
                                   <%=cursor%>">
                <%=showInfo %>
                <%--########<%=house.getHouseNum() == null ? "" :StringUtils.getNotNullString(house.getHouseNum())%>--%>
                <%--                	<b><%=roomNum1 %></b><br/><%=area%><br/>--%>

            </td>
            <% }
                s++;
            }
            %>
        </tr>
        <%}%>
        <tr>
            <td style="border-top: 1px solid #D1D1D1;border-left: 2px solid #d1d1d1;border-bottom: 2px solid #d1d1d1;border-right: 1px solid #D1D1D1;background-color: #F2F2F2">
                <div class="out">
                    <b>单元</b>
                </div>
            </td>
            <%

                int p = 0;
                //               for (int j = 0; j < temp1.size(); j++) {
                for (int j = temp1.size() - 1; j >= 0; j--){
                    String si = (String) temp1.get(j);
                    int t = setNum1[p];
                    if (t == 0) {
                        p++;
                        continue;
                    }
            %>
            <td height="25" colspan="<%=t%>" align="center" style="border-top: 1px solid #D1D1D1;background-color: #F2F2F2;border-bottom: 2px solid #d1d1d1;border-left:#999999 1px solid; border-right:#999999 1px solid;border-right: 6px solid #D1D1D1;" units="<%=si%>"><b><%=si%>单元</b></td>
            <%
                    p++;
            }%>
        </tr>
    </table>
    <table border="0" align="center" cellpadding="5" cellspacing="0">
        <tr>
            <td colspan="9" height="10"></td>
        </tr>
        <tr>
            <td colspan="9" height="10"></td>
        </tr>
    </table>
    <%
        }
    %>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 900px;height: 900px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">房源信息</h4>
            </div>
            <div class="modal-body" id="modalBody">
                <input type="hidden" id="houseUuid" name="houseUuid">

                <div id="houseLoad"></div>

                <div class="modal-footer">
                    <button class="btn btn-primary btn-sm" type="button" onclick="javascript:saveBuildInfo()"><i
                            class="fa fa-save"></i>&nbsp;确认房源
                    </button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>

    function loadHouse(houseUuid) {
        $("input:hidden[name='houseUuid']").val(houseUuid);
        $.get("houseInfo", {houseId: houseUuid, _time: new Date().getTime()}, function (data) {
            $("#houseLoad").html(data);
            $("#myModal").modal();
        });
    }
</script>