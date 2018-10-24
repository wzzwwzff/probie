package com.app.cq.web.cq.show;

import com.app.common.model.DataDict;
import com.app.common.service.DataDictService;
import com.app.cq.model.Family;
import com.app.cq.model.House;
import com.app.cq.model.Project;
import com.app.cq.service.FamilyService;
import com.app.cq.service.HouseService;
import com.app.cq.service.ProjectService;
import com.app.cq.service.StatisticsService;
import com.app.cq.utils.Precondition;
import com.google.common.collect.Maps;
import com.sqds.page.PageInfo;
import com.sqds.utils.Collections3;
import com.sqds.web.ParamUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller
@RequestMapping("/cq/show/*")
public class ShowController {

    @Autowired
    private FamilyService familyService;
    @Autowired
    private StatisticsService statisticsService;
    @Autowired
    private ProjectService projectService;
    @Autowired
    private HouseService houseService;
    @Autowired
    private DataDictService dataDictService;

    //选房顺序号展示倒序
    @RequestMapping("xfNumberShowDown")
    public void xfNumberShowDown(){
    }


    /**
     * 获取已选房户数
     *
     * @param request
     * @return
     */
    @RequestMapping("getSignCount")
    @ResponseBody
    public Map<String, Integer> sequenceXF(HttpServletRequest request) {
        Long countShow = statisticsService.getCountShow();
        Integer xfCount = countShow.intValue();
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("total", xfCount);
        return map;
    }

    /**
     * 选房顺序号公示刷新
     *
     * @param request
     * @param modelMap
     */
    @RequestMapping("xfNumberShowItem")
    public void xfNumberShowItem(HttpServletRequest request, ModelMap modelMap) {
        int myPageNo = ParamUtils.getInt(request, "myPageNo", 1);
        int myPageSize = ParamUtils.getInt(request, "myPageSize", 10);

        PageInfo<Family> pageInfo = new PageInfo<Family>();
        pageInfo.setPageSize(myPageSize);
        pageInfo.setPageNo(myPageNo);

        pageInfo = this.statisticsService.xfNumberShow(pageInfo);
        modelMap.addAttribute("pageInfo", pageInfo);
    }

    /**
     * 电子楼盘展示主界面
     */
    @RequestMapping("houseMain")
    public void houseMain(HttpServletRequest request, ModelMap modelMap) {
        //查询出所有的项目名称和楼号，保存至request域中
        List<Project> projectList = this.projectService.listAll();
        Map<Integer, List<String>> buildNumMap = this.houseService.getBuildNum();
        modelMap.addAttribute("projectList", projectList);
        modelMap.addAttribute("buildNumMap", buildNumMap);
    }

    /**
     * 电子楼盘展示中间链接界面
     */
    @RequestMapping("housePic")
    public void housePic(HttpServletRequest request, ModelMap model) {
        int times = ParamUtils.getInt(request, "times", 10);
        if (times <= 0)
            times = 10;

        //将前台所需要的数据封装成数组
        List<Object[]> resultList = new ArrayList<Object[]>();
        int index = 0;
        Object[] objects = null;
        String[] buildNumArray = ParamUtils.getStringParameters(request, "buildNum");
        for (String s : buildNumArray) {
            String projectIdStr = s.substring(0, s.indexOf("_"));
            Integer projectId = Integer.valueOf(projectIdStr);
            String buildNum = s.substring(s.indexOf("_") + 1);
            objects = new Object[3];
            objects[0] = this.projectService.get(projectId).getProjectName();
            objects[1] = projectId;
            objects[2] = buildNum;
            resultList.add(objects);
        }
        model.addAttribute("resultList", resultList);
        model.addAttribute("times", times);
    }

    /**
     * 电子楼盘展示显示界面
     */
    @RequestMapping("housePicItem")
    public void housePicItem(HttpServletRequest request, ModelMap modelMap) {
        Integer projectId = ParamUtils.getInt(request, "searchProject", 0);
        String buildNum = ParamUtils.getString(request, "searchBuildNum", "");
        Project project = this.projectService.get(projectId);

        Map<String, String> houseTypeDataDictMap = this.dataDictService.getMapByParentAttributeNameForValue("房屋户型");
        List<String> unitList = this.houseService.distinctUnit(project.getId(), buildNum);// 获取所有单元
        // 各个单元的最大房号<单元号，最大房号>
        Map<String, String> maxRoomByUnitMap = this.houseService.getMaxRoomByUnit(project.getId(), buildNum);
        // 最大楼层
        int maxFloor = this.houseService.getMaxFloor(project.getId(), buildNum);
        // 所有房源
        List<House> houseList = this.houseService.listHouse(project.getId(), buildNum);
        Map<String, House> houseMap = new HashMap<String, House>();// <单元-房号:house>
        if (Collections3.isNotEmpty(houseList) && houseList.size() > 0) {
            for (House house : houseList) {
                String code = house.getUnitNum() + "-" + house.getHouseNum();
                houseMap.put(code, house);
            }
        }
        //单元  房号  居室
        Map<String, Map<String, String>> houseTypeMap = this.houseService.getHouseTypeByProjectIdAndBuildNum(project.getId(), buildNum);
        List<DataDict> flagList = dataDictService.getDataDictList("房屋状态");
        List<DataDict> typeList = dataDictService.getDataDictList("房屋居室");
        Map<String, DataDict> flagMap = Maps.newLinkedHashMap();
        Map<String, String> typeMap = Maps.newLinkedHashMap();
        if (Collections3.isNotEmpty(flagList)) {
            for (DataDict dataDict : flagList) {
                flagMap.put(dataDict.getAttributeValue(), dataDict);
            }
        }
        if (Collections3.isNotEmpty(typeList)) {
            for (DataDict dataDict : typeList) {
                typeMap.put(dataDict.getAttributeValue(), dataDict.getAttributeColor());
            }
        }
        modelMap.addAttribute("project", project);
        modelMap.addAttribute("buildNum", buildNum);
        modelMap.addAttribute("unitList", unitList);
        modelMap.addAttribute("maxRoomByUnitMap", maxRoomByUnitMap);
        modelMap.addAttribute("maxFloor", maxFloor);
        modelMap.addAttribute("houseMap", houseMap);
        modelMap.addAttribute("houseTypeMap", houseTypeMap);
        modelMap.addAttribute("houseTypeDataDictMap", houseTypeDataDictMap);
        modelMap.addAttribute("flagMap", flagMap);
        modelMap.addAttribute("typeMap", typeMap);
    }

    /**
     * 签约情况公示分指
     * @param request
     * @param modelMap
     */
    @RequestMapping("signChartShow")
    public void signChartShow(HttpServletRequest request,ModelMap modelMap){
        List<DataDict> dataDictList = this.dataDictService.getDataDictList("分指");
        String groupArray = "";
        if (Collections3.isNotEmpty(dataDictList)){
            for (DataDict dataDict : dataDictList) {
                groupArray = groupArray + "'" + dataDict.getAttributeName() + "',";
            }
        }
        modelMap.addAttribute("groupArray",groupArray);
    }

    /**
     * 获取各分指签约数据
     */
    @RequestMapping("getSignJson1")
    @ResponseBody
    public List getSignJson1(){
        List list = new ArrayList();
        Map map1 = Maps.newHashMap();
        Map map2 = Maps.newHashMap();

        String signTotalStr = "";
        String noSignTotalStr = "";
        String signStr;
        String noSignStr;

        Map<String, Map> resMap = this.statisticsService.getStatisticsByBd();
        if (!Collections3.isEmpty(resMap)){
            for (String bdCode : resMap.keySet()){
                Integer signCount = resMap.get(bdCode).get("signCount") == null ? 0 : Integer.valueOf(resMap.get(bdCode).get("signCount").toString());
                Integer noSignCount = resMap.get(bdCode).get("noSignCount") == null ? 0 : Integer.valueOf(resMap.get(bdCode).get("noSignCount").toString());
                signStr = signCount.toString();
                noSignStr = noSignCount.toString();
                signTotalStr += signStr + ",";
                noSignTotalStr += noSignStr + ",";
            }
        }
        map1.put("name", "未签约");
        map1.put("data", "[" + noSignTotalStr.substring(0, noSignTotalStr.length() - 1) + "]");
        map2.put("name", "已签约");
        map2.put("data", "[" + signTotalStr.substring(0, signTotalStr.length() - 1) + "]");
        list.add(map1);
        list.add(map2);
        return list;
    }

    /**
     * 获取所有分指累计签约数量
     */
    @RequestMapping("getSignJson2")
    @ResponseBody
    public Map getSignJson2() {
        Map<String,Integer> resultMap = this.statisticsService.getCountByBd();
        Integer familyCount = resultMap.get("familyCount");
        Integer signCount = resultMap.get("signCount");
        Map<String, String> map = Maps.newHashMap();
        map.put("type", "pie");
        map.put("name", "百分比");
        map.put("data", "[[\"已签约\"," + signCount + "],[\"未签约\"," + String.valueOf(familyCount - signCount) + "]]");
        return map;
    }

    //得到数据（入户，签约，甲方，拆除）分指
    @RequestMapping("dataTable")
    public void dataTable(HttpServletRequest request,ModelMap modelMap){
        String type = ParamUtils.getString(request,"type","");
        String paramName = "";
        String paramDate = "";
        if (type.equals("qy")){
            paramName = "signStatus";
            paramDate = "signDate";
        }else if (type.equals("jf")){
            paramName = "jsStatus";
            paramDate = "jfDate";
        }
        List<Map> list = statisticsService.getData(paramName,paramDate);
        Map<String,Map> map = new HashMap<>();
        if (list!=null && list.size()>0){
            for (Map m:list){
                String bdCode = String.valueOf(m.get("bdCode"));
                map.put(bdCode,m);
            }
        }
        List<DataDict> dataDictList = dataDictService.getDataDictList("分指");

        if (dataDictList != null && dataDictList.size()>0) {
            for (DataDict dataDict:dataDictList) {
                try {
                    String attributeValue = dataDict.getAttributeValue();
                    Object signCount = map.get(attributeValue).get("signCount");
                    String s = String.valueOf(signCount);
                    dataDict.setAttributeColor(s);
                } catch (NullPointerException nul) {
                    nul.printStackTrace();
                }
            }
        }

        modelMap.addAttribute("dataDictList",dataDictList);
        modelMap.addAttribute("map",map);
        modelMap.addAttribute("type",type);
    }

    /**
     * 签约情况公示分组
     * @param request
     * @param modelMap
     */
    @RequestMapping("signChartByGroup")
    public void signChartByGroup(HttpServletRequest request,ModelMap modelMap){
        String bdCode = ParamUtils.getString(request, "bdCode", "");
        Precondition.checkAjaxArguement(!bdCode.equals(""),"1234","数据错误");
        List<DataDict> dataDictList = this.dataDictService.getDataDictList("组别");
        String groupArray = "";
        if (Collections3.isNotEmpty(dataDictList)){
            for (DataDict dataDict : dataDictList) {
                groupArray = groupArray + "'" + dataDict.getAttributeName() + "',";
            }
        }
        modelMap.addAttribute("groupArray",groupArray);
        modelMap.addAttribute("bdCode",bdCode);
    }

    /**
     * 获取各分组签约数据
     */
    @RequestMapping("getSignJsonByGroup1")
    @ResponseBody
    public List getSignJsonByGroup1(HttpServletRequest request){
        String bdCode = ParamUtils.getString(request, "bdCode", "");
        Precondition.checkAjaxArguement(!bdCode.equals(""),"1234","数据错误");
        List list = new ArrayList();
        Map map1 = Maps.newHashMap();
        Map map2 = Maps.newHashMap();

        String signTotalStr = "";
        String noSignTotalStr = "";
        String signStr;
        String noSignStr;

        Map<String, Map> resMap = this.statisticsService.getStatisticsByGroup(bdCode);
        if (!Collections3.isEmpty(resMap)){
            for (String groupCode : resMap.keySet()){
                Integer signCount = resMap.get(groupCode).get("signCount") == null ? 0 : Integer.valueOf(resMap.get(groupCode).get("signCount").toString());
                Integer noSignCount = resMap.get(groupCode).get("noSignCount") == null ? 0 : Integer.valueOf(resMap.get(groupCode).get("noSignCount").toString());
                signStr = signCount.toString();
                noSignStr = noSignCount.toString();
                signTotalStr += signStr + ",";
                noSignTotalStr += noSignStr + ",";
            }
        }
        map1.put("name", "未签约");
        map1.put("data", "[" + noSignTotalStr.substring(0, noSignTotalStr.length() - 1) + "]");
        map2.put("name", "已签约");
        map2.put("data", "[" + signTotalStr.substring(0, signTotalStr.length() - 1) + "]");
        list.add(map1);
        list.add(map2);
        return list;
    }

    /**
     * 获取所有分组累计签约数量
     */
    @RequestMapping("getSignJsonByGroup2")
    @ResponseBody
    public Map getSignJsonByGroup2(HttpServletRequest request) {
        String bdCode = ParamUtils.getString(request, "bdCode", "");
        Precondition.checkAjaxArguement(!bdCode.equals(""),"1234","数据错误");
        Map<String,Integer> resultMap = this.statisticsService.getCountByGroup(bdCode);
        Integer familyCount = resultMap.get("familyCount");
        Integer signCount = resultMap.get("signCount");
        Map<String, String> map = Maps.newHashMap();
        map.put("type", "pie");
        map.put("name", "百分比");
        map.put("data", "[[\"已签约\"," + signCount + "],[\"未签约\"," + String.valueOf(familyCount - signCount) + "]]");
        return map;
    }

    //得到数据（入户，签约，甲方，拆除）分组
    @RequestMapping("dataTable2")
    public void dataTable2(HttpServletRequest request,ModelMap modelMap){
        String type = ParamUtils.getString(request,"type","");
        String bdCode = ParamUtils.getString(request, "bdCode", "");
        Precondition.checkAjaxArguement(!bdCode.equals(""),"1234","数据错误");
        String paramName = "";
        String paramDate = "";
        if (type.equals("qy")){
            paramName = "signStatus";
            paramDate = "signDate";
        }else if (type.equals("jf")){
            paramName = "jsStatus";
            paramDate = "jfDate";
        }
        List<Map> list = statisticsService.getDataByGroup(paramName,paramDate,bdCode);
        Map<String,Map> map = new HashMap<>();
        if (list!=null && list.size()>0){
            for (Map m:list){
                String groupCode = String.valueOf(m.get("groupCode"));
                map.put(groupCode,m);
            }
        }
        List<DataDict> dataDictList = dataDictService.getDataDictList("组别");
        int size = map.keySet().size();
        dataDictList = dataDictList.subList(0,size);
        if (dataDictList != null && dataDictList.size()>0) {
            for (DataDict dataDict:dataDictList) {
                try {
                    String attributeValue = dataDict.getAttributeValue();
                    if (map.get(attributeValue) == null){
                        break;
                    }
                    Object signCount = map.get(attributeValue).get("signCount");
                    String s = String.valueOf(signCount);
                    dataDict.setAttributeColor(s);
                } catch (NullPointerException nul) {
                    nul.printStackTrace();
                }
            }
        }

        modelMap.addAttribute("dataDictList",dataDictList);
        modelMap.addAttribute("map",map);
        modelMap.addAttribute("type",type);
    }
}
