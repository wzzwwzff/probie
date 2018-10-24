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
            <%--<c:if test="${flag.key ne PRETEND}">--%>
            <button class="button btn button-circle" style="background-color: ${flag.value.attributeColor};margin-bottom: 10px;width: 20px;height: 20px;"></button>
            <span style="color: ${flag.value.attributeColor};font-size: 18px;">${flag.value.attributeName}</span>
            <%--</c:if>--%>
        </c:forEach>
    </div>
    <%--<button class="btn btn-primary btn-sm" id="excelBtn"><i class="fa fa-file-excel-o"></i>&nbsp;导出Excel</button><br/>--%>
    <br/>
    <%
        if (max != 0) {
    %>
    <table  id="dataTable" width="100%" border="1" align="center" cellpadding="1" cellspacing="1" bgcolor="#999999">
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
            <td bgcolor="#cccccc" height="35">
                <div class="out">
                    <span class="bm">楼层</span>/<span class="em">单元</span>
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
            <td height="25" colspan="<%=temp%>" bgcolor="#BDBABD" align="center" style="border-left:#999999 1px solid; border-right:#999999 1px solid;"><%=si%>单元</td>
            <%
                    //p++;
                }%>
        </tr>

        <%
            for (int i = maxFloorNum; i > 0; i--) { %>
        <tr bgcolor="#FFFFFF">
                <%--楼层号i   1,2,3..--%>
            <td width="4%" height="18" bgcolor="#D6D3D6">
                <div align="center"><%=i%>
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
                            String dataDict = houseTypeDataDictMap.get(house.getHouseType() + "");//居室/套型
                            if (dataDict != null) {
//                                str2 = dataDict.getAttributeName();
                            }
                            showInfo ="<font style='font-size:20px;'>" +house.getHouseNum()+"</font></br>";
                            if (!area.equals("") && !area.equals("0.00㎡")) {
                                showInfo += "<font style='font-size:17px;'>" + area + "</font>";
                            }
                            String br="<br/>";
                            if(house.getHouseType() != null&&!house.getHouseType().equals("")  ){
                                showInfo +="<br/><font style='font-size:20px;'>"+(houseTypeDataDictMap.get(house.getHouseType() + ""))+"室"+"</font>&nbsp;&nbsp;";
                                br="";
                            }
                            if (house.getStatus() == 2) {
                                showInfo += br+"<input op='"+StringUtils.getNotNullString(house.getMemo())+"' style='' type='radio' title='"
                                        + house.getUnitNum() + "单元" + house.getBuildNum() + "号楼" + house.getHouseNum() + "房' name='hId' value='" + house.getId() + "'/>";
                            }
                            if(house.getStatus() != 2){
                                click = "onclick ='loadHouse("+house.getId()+")'";
                            }
                        }

                        String houseStatus = "";
                        if (house != null) {
                            houseStatus = house.getStatus() + "";
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
            <td <%=click%> height="40" width="<%=width %>%" bgcolor="<%=bgColor%>" class='msg_tk'
                style="text-align:center;cursor: pointer;c<%if(j==maxSetNum-1){%>border-left:#999999 0px solid;<%}%>
                        <%if(j==0){%>border-left:#999999 3px solid;<%}%>;" <%if (house != null){%> title="<%=house.getUnitNum() + "单元" + house.getBuildNum() + "号楼" + house.getHouseNum() + "房"%>" <%}%>>
                    <%--style="text-align:center;<%if(j==0){%>border-left:#999999 0px solid;<%}%>--%>
                    <%--<%if(j==maxSetNum-1){%>border-left:#999999 3px solid;<%}%>;">--%>
                <%=showInfo %>
            </td>
            <% }
                s++;
            }
            %>
        </tr>
        <%}%>
            <%--楼层单元--%>


    </table>
    <%
        }
    %>
    </div>

    <!------------------------------------合同弹框------------------------------------>
    <div class="modal" style="z-index: 999" id="myModall" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document" style="width: 900px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">转租信息登记</h4>
                </div>
                <div class="modal-body" id="myModalBodayy">

                </div>
                <%--<div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-close"></i>关闭</button>
                    <button class="btn btn-primary btn-sm" onclick="toSubmit()" type="submit"><i class="fa fa-save"></i>&nbsp;保存</button>
                </div>--%>
            </div>
        </div>
    </div>

</c:if>
<script>
    //点击弹框
    $(function () {
        $("input[name='hId']").bind("click", function () {
            var num = $(this).attr("title");
            var a = $(this).attr("op");
            var houseId= $(this).attr("value");
            addOrEdit($(this).val(), num,a,houseId);
        });
    });

    //未分配房源点击
    function loadHouse(houseId) {
        var nodes = zTree.getSelectedNodes();
        var projectId = nodes[0].id;//项目id
        $.get("houseMsg",{houseId:houseId,projectId:projectId},function(data){
            $("#myModalBodayy").html(data);
            $("#myModall").modal({backdrop: false});
        });
    }
</script>