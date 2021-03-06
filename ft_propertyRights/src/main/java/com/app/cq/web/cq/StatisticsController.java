package com.app.cq.web.cq;

import com.app.common.model.DataDict;
import com.app.common.service.DataDictService;
import com.app.cq.map.ContractExcelMap;
import com.app.cq.model.*;
import com.app.cq.service.ContractService;
import com.app.cq.service.ProjectService;
import com.app.cq.service.StatisticsService;
import com.app.cq.utils.RedirectAttributesExcel;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.sqds.page.PageInfo;
import com.sqds.utils.Collections3;
import com.sqds.web.ParamUtils;
import com.sqds.web.Servlets;
import com.sun.xml.internal.xsom.impl.scd.Iterators;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.xml.stream.XMLOutputFactory;
import java.lang.reflect.InvocationTargetException;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.jar.Attributes;

@Controller
@RequestMapping("/cq/statistics/*")
public class StatisticsController {

    @Autowired
    private DataDictService dataDictService;
    @Autowired
    private StatisticsService statisticsService;
    @Autowired
    private ProjectService projectService;
    @Autowired
    private ContractService contractService;

    /**
     * 家庭柱状图
     *
     * @param request
     * @param modelMap
     */
    @RequestMapping("familyMsg")
    public void familyMsg(HttpServletRequest request, ModelMap modelMap) {
        List<String> projectNameList = this.projectService.getProjectCount();
        String groupArray = "";
        if (Collections3.isNotEmpty(projectNameList)) {
            for (String projectName : projectNameList) {
                groupArray = groupArray + "'" + projectName + "',";
            }
        }
        modelMap.addAttribute("groupArray", groupArray);
    }


    /**
     * 获取各项目家庭数据
     */
    @RequestMapping("getFamilyMsg")
    @ResponseBody
    public List getFamilyMsg() {
        List list = new ArrayList();
        Map map1 = Maps.newHashMap();
        String familyCountStr = "";
        String projectNameStr = "";

        List<String> projectNameList = this.projectService.getProjectCount();
        Map<String, String> projectCount = this.statisticsService.getFamilyCount();
        if (!Collections3.isEmpty(projectCount) && !Collections3.isEmpty(projectNameList)) {
            for (String projectName1 : projectNameList) {
                for (String projectName : projectCount.keySet()) {
                    if (projectName.equals(projectName1)) {
                        String familyCount = projectCount.get(projectName) == null ? String.valueOf(0) : projectCount.get(projectName);
                        familyCountStr += familyCount + ",";
                        projectNameStr += projectName + ",";
                    }
                }
            }
        }
        String[] splitCount = familyCountStr.split(",");
        String[] splitName = projectNameStr.split(",");
        String splitCount1 = "";
        for (int i = 0; i < splitCount.length; i++) {
            if (i == splitCount.length - 1) {
                splitCount1 += splitCount[i];
            } else {
                splitCount1 += splitCount[i] + ",";
            }
        }

        map1.put("name", splitName[0]);
        map1.put("data", "[" + splitCount1 + "]");
        list.add(map1);
        return list;
    }

    /**
     * 合同柱状图
     *
     * @param request
     * @param modelMap
     */
    @RequestMapping("contractCount")
    public void contractCount(HttpServletRequest request, ModelMap modelMap) {
        Map<String, String> contractCount1 = this.statisticsService.getContractCount();
        Map<String, String> contractCount = this.dataDictService.getMapByParentAttributeNameForValue("项目名称");
        StringBuffer groupArray = new StringBuffer("");
        if (contractCount != null) {
            for (String projectName : contractCount.keySet()) {
                groupArray.append( "'" + projectName + "',");
            }
            groupArray.deleteCharAt(groupArray.lastIndexOf(","));
        }
        modelMap.addAttribute("groupArray", groupArray);
    }

    /**
     * 获取各项目合同数据
     */
    @RequestMapping("getContractMsg")
    @ResponseBody
    public List getContractMsg() {
        List list = new ArrayList();
        Map map1 = Maps.newHashMap();
        String familyCountStr = "";
        String projectNameStr = "";

//        List<String> projectNameList = this.projectService.getProjectCount();
        Map<String, String> contractCount = this.statisticsService.getContractCount();
        Map<String, String> projectNameList = this.dataDictService.getMapByParentAttributeNameForValue("项目名称");
        if (!Collections3.isEmpty(contractCount) && !Collections3.isEmpty(projectNameList)) {
            for (String projectName1 : projectNameList.keySet()) {
                String familyCount = contractCount.get(projectName1) == null ? String.valueOf(0) : contractCount.get(projectName1);
                familyCountStr += familyCount + ",";
                projectNameStr += projectName1 + ",";
            }
        }
        String[] splitCount = familyCountStr.split(",");
        String[] splitName = projectNameStr.split(",");
        String splitCount1 = "";
        for (int i = 0; i < splitCount.length; i++) {
            if (i == splitCount.length - 1) {
                splitCount1 += splitCount[i];
            } else {
                splitCount1 += splitCount[i] + ",";
            }
        }

        map1.put("name", splitName[0]);
        map1.put("data", "[" + splitCount1 + "]");
        list.add(map1);
        return list;
    }


    /**
     * 分类信息柱状图
     *
     * @param request
     * @param modelMap
     */
    @RequestMapping("fenleiMsg")
    public void fenleiMsg(HttpServletRequest request, ModelMap modelMap) {
        List<Project> projectList = this.projectService.listAll();
        List<Map<String,String>> mapList = statisticsService.getprojectName();
        StringBuffer stringBuffer = null;
        if (Collections3.isNotEmpty(mapList)){
            stringBuffer = new StringBuffer("[");
            for (int i = 0; i<mapList.size(); i++){
                for (String key : mapList.get(i).keySet()){
                    if (key.equals("projectName"))
                    stringBuffer.append("'" + String.valueOf(mapList.get(i).get(key)) + "',");
                }
            }
            stringBuffer.deleteCharAt(stringBuffer.lastIndexOf(","));
            stringBuffer.append("]");
        }

        modelMap.addAttribute("classify", stringBuffer.toString());
    }

    /**
     * 获取分类信息数据
     */
    @RequestMapping("getFenleiMsg")
    @ResponseBody
    public List getFenleiMsg() {
        List list = new ArrayList();

        Map<String,String> houseCount = this.statisticsService.getFenlei();
        Map<String,String> thisArea = this.statisticsService.getThisArea();//是否本区
        Map<String,String> ThisPark = this.statisticsService.getThisPark();//是否园区
        Map<String,String> education = this.statisticsService.getEducation();//学历层次
        Map<String,String> firstOrNot = this.statisticsService.getFirstOrNot();//是否优先组
        for(String key : houseCount.keySet()){
            Map map = Maps.newHashMap();
            map.put("name","[" + key + "]");
            String key1 = houseCount.get(key);
            map.put("data",key1);
            map.put("stack", "stack");
            list.add(map);
        }
        for(String key : thisArea.keySet()){
            Map map = Maps.newHashMap();
            map.put("name","[" + key + "]");
            String key2 = thisArea.get(key);
            map.put("data",key2);
            map.put("stack", "area");
            list.add(map);
        }
        for(String key : ThisPark.keySet()){
            Map map = Maps.newHashMap();
            map.put("name","[" + key + "]");
            String key3 = ThisPark.get(key);
            map.put("data",key3);
            map.put("stack", "park");
            list.add(map);
        }
        for(String key : education.keySet()){
            Map map = Maps.newHashMap();
            map.put("name","[" + key + "]");
            String key4 = education.get(key);
            map.put("data",key4);
            map.put("stack", "education");
            list.add(map);
        }
        for(String key : firstOrNot.keySet()){
            Map map = Maps.newHashMap();
            map.put("name","[" + key + "]");
            String key5 = firstOrNot.get(key);
            map.put("data",key5);
            map.put("stack", "first");
            list.add(map);
        }

        return list;
    }

    /**
     * 房源信息柱状图
     *
     * @param request
     * @param modelMap
     */
    @RequestMapping("houseMsg")
    public void houseMsg(HttpServletRequest request, ModelMap modelMap) {
        List<DataDict> houseTypeList = this.dataDictService.getDataDictList("居室");
        Map<String, Map> houseCount = this.statisticsService.getHouseCount();
        String groupArray = "";
        if (!Collections3.isEmpty(houseCount) && !Collections3.isEmpty(houseTypeList)) {
            for (DataDict dataDict : houseTypeList) {
                for (String houseTypeName : houseCount.keySet()) {
                    if (dataDict.getAttributeName().equals(houseTypeName)) {
                        groupArray = groupArray + "'" + dataDict.getAttributeName() + "',";
                    }
                }
            }
        }
        modelMap.addAttribute("groupArray", groupArray);
    }


    /**
     * 获取房源信息数据
     */
    @RequestMapping("getHouseMsg")
    @ResponseBody
    public List getHouseMsg() {
        List list = new ArrayList();

        String houseNumCount = "";
        List<Project> projectList = this.projectService.listAll();
        List<DataDict> houseTypeList = this.dataDictService.getDataDictList("居室");
        Map<String, Map> houseCount = this.statisticsService.getHouseCount();
        if (!Collections3.isEmpty(houseCount) && !Collections3.isEmpty(projectList) && !Collections3.isEmpty(houseTypeList)) {
            for (Project project :projectList) {
                for (DataDict dataDict : houseTypeList) {
                    Object houseNum =houseCount.get(dataDict.getAttributeName()).get(project.getId())== null ? 0 : houseCount.get(dataDict.getAttributeName()).get(project.getId());
                    houseNumCount += houseNum.toString() + ",";
                }
                Map map = Maps.newHashMap();
                map.put("name","[" + project.getProjectName() + "]");
                map.put("data","[" + houseNumCount.substring(0,houseNumCount.length() - 1) + "]");
                map.put("stack", "'male" + project.getId() + "'");
                list.add(map);
                houseNumCount = "";
            }
        }
        return list;
    }

    /**
     * 影像文件信息
     * @param request
     * @param modelMap
     */
    @RequestMapping("videoCount")
    public void videoCount(HttpServletRequest request, ModelMap modelMap) {
        Map<String, String> projectCount = this.statisticsService.getVideoCount();
        String groupArray = "";
        if (!Collections3.isEmpty(projectCount)) {
            for (String projectName : projectCount.keySet()) {
                groupArray = groupArray + "'" + projectName + "',";
            }
        }
        modelMap.addAttribute("groupArray", groupArray);
    }

    /**
     * 获取各项目影像文件数据
     */
    @RequestMapping("getVideoMsg")
    @ResponseBody
    public List getVideoMsg() {
        List list = new ArrayList();
        Map map1 = Maps.newHashMap();
        String familyCountStr = "";
        String projectNameStr = "";

        List<String> projectNameList = this.projectService.getProjectCount();
        Map<String, String> projectCount = this.statisticsService.getVideoCount();
        if (!Collections3.isEmpty(projectCount) && !Collections3.isEmpty(projectNameList)) {
            for (String projectName1 : projectNameList) {
                for (String projectName : projectCount.keySet()) {
                    if (projectName.equals(projectName1)) {
                        String familyCount = projectCount.get(projectName) == null ? String.valueOf(0) : projectCount.get(projectName);
                        familyCountStr += familyCount + ",";
                        projectNameStr += projectName + ",";
                    }
                }
            }
        }
        String[] splitCount = familyCountStr.split(",");
        String[] splitName = projectNameStr.split(",");
        String splitCount1 = "";
        for (int i = 0; i < splitCount.length; i++) {
            if (i == splitCount.length - 1) {
                splitCount1 += splitCount[i];
            } else {
                splitCount1 += splitCount[i] + ",";
            }
        }

        map1.put("name", splitName[0]);
        map1.put("data", "[" + splitCount1 + "]");
        list.add(map1);
        return list;
    }


    /**
     * 核验情况统计
     * @param request
     * @param modelMap
     */
    @RequestMapping("checkStatistics")
    public void checkStatistics(HttpServletRequest request, ModelMap modelMap) {
        Map<String, Map<String, List<String>>> checkStatistics = this.statisticsService.getCheckStatistics();
        Map<String, String> checkStatisticsTotal = this.statisticsService.getCheckStatisticsTotal();
        modelMap.addAttribute("checkStatisticsTotal",checkStatisticsTotal);
        modelMap.addAttribute("totalMap",checkStatistics);
    }
    /**
     * 合同情况统计
     * @param request
     * @param modelMap
     */
    @RequestMapping("contractStatistics")
    public void contractStatistics(HttpServletRequest request, ModelMap modelMap) {
        Map<String, Map<String, List<String>>> contractStatistics = this.statisticsService.getContractStatistics();
        Map<String, String> contractStatisticsTotal = this.statisticsService.getContractStatisticsTotal();
        modelMap.addAttribute("contractStatisticsTotal",contractStatisticsTotal);
        modelMap.addAttribute("totalMap",contractStatistics);
    }
    /**
     * 房源情况统计
     * @param request
     * @param modelMap
     */
    @RequestMapping("houseStatistics")
    public void houseStatistics(HttpServletRequest request, ModelMap modelMap) {
        Map<String, Map<String, List>> houseStatisticsTotal = this.statisticsService.getHouseStatisticsTotal();
        Map<String, List> total = this.statisticsService.getHouseZongTotal();
        List zongTotal = this.statisticsService.getZongTotal();
        modelMap.addAttribute("totalMap",houseStatisticsTotal);
        modelMap.addAttribute("total",total);
        modelMap.addAttribute("zongTotal",zongTotal);
    }

    /**
     * 数据综合查询
     * @param request
     * @param model
     */
    @RequestMapping("dataQuery")
    public void dailyDataExport(HttpServletRequest request, ModelMap model) {
        Map<String,String> projectName = this.dataDictService.getMapByParentAttributeNameForName("项目名称");
        model.addAttribute("projectName",projectName);

        Map<String, String> allotStatus = this.dataDictService.getMapByParentAttributeNameForName("分配状态");
        model.addAttribute("allotStatus", allotStatus);

        Map<String, String> houseStatusMap = this.dataDictService.getMapByParentAttributeNameForName("审核状态");
        model.addAttribute("houseStatusMap", houseStatusMap);

        Map<String, String> socialStatusMap = this.dataDictService.getMapByParentAttributeNameForName("审核状态");
        model.addAttribute("socialStatusMap", socialStatusMap);

        Map<String, String> marriageStatusMap = this.dataDictService.getMapByParentAttributeNameForName("审核状态");
        model.addAttribute("marriageStatusMap", marriageStatusMap);

        Map<String, String> ageStatusMap = this.dataDictService.getMapByParentAttributeNameForName("审核状态");
        model.addAttribute("ageStatusMap", ageStatusMap);

        Map<String, String> educationStatusMap = this.dataDictService.getMapByParentAttributeNameForName("审核状态");
        model.addAttribute("educationStatusMap", educationStatusMap);

        Map<String, String> seniorityStatusMap = this.dataDictService.getMapByParentAttributeNameForName("审核状态");
        model.addAttribute("seniorityStatusMap", seniorityStatusMap);

        Map<String, String> reviewStatusMap = this.dataDictService.getMapByParentAttributeNameForName("复核状态");
        model.addAttribute("reviewStatusMap", reviewStatusMap);

        Map<String, String> isBeijingArea = this.dataDictService.getMapByParentAttributeNameForName("是否");
        model.addAttribute("isBeijingArea", isBeijingArea);

        Map<String, String> isFirstGroup = this.dataDictService.getMapByParentAttributeNameForName("是否");
        model.addAttribute("isFirstGroup", isFirstGroup);

        Map<String, String> thisPark = this.dataDictService.getMapByParentAttributeNameForName("是否");
        model.addAttribute("thisPark", thisPark);

        Map<String, String> dataStatusMap = this.dataDictService.getMapByParentAttributeNameForName("数据状态");
        model.addAttribute("dataStatusMap", dataStatusMap);

        Map<String, String> familyTypeMap = this.dataDictService.getMapByParentAttributeNameForName("家庭类型");
        model.addAttribute("familyTypeMap", familyTypeMap);

        Map<String, String> statusMap = this.dataDictService.getMapByParentAttributeNameForName("合同数据状态");
        model.addAttribute("statusMap", statusMap);

        Map<String, String> education = this.dataDictService.getMapByParentAttributeNameForName("学历层次");
        model.addAttribute("education", education);

        Map<String, String> learning = this.dataDictService.getMapByParentAttributeNameForName("学习形式");
        model.addAttribute("learning", learning);

        Map<String, String> signStatusMap = this.dataDictService.getMapByParentAttributeNameForName("签约状态");
        model.addAttribute("signStatusMap", signStatusMap);

    }

    /**
     * 综合查询
     */
    @RequestMapping("result")
    public void result(HttpServletRequest request, ModelMap modelMap) {
        PageInfo<Family> pageInfo = new PageInfo<Family>();
        Servlets.initPageInfo(request, pageInfo);
        pageInfo = this.statisticsService.getListForCompositeSearch(pageInfo, request);
        modelMap.addAttribute("postValue", pageInfo.getPostValue());
        modelMap.addAttribute("pageInfo", pageInfo);
    }

    /**
     * 合同信息查看
     */
    @RequestMapping("mainView")
    public void mainView(HttpServletRequest request, ModelMap modelMap) {
        Integer familyId = ParamUtils.getInt(request, "familyId", 0);
        Contract contract = this.contractService.getContractByfamilyid(familyId);

        Family family = contract.getFamily();

        modelMap.addAttribute("contract",contract);
        modelMap.addAttribute("family",family);
    }

    @RequestMapping("resultExcel")
    public String resultExcel(HttpServletRequest request, RedirectAttributes redirectAttributes) throws IllegalAccessException, NoSuchMethodException, InvocationTargetException {
        Map<String, String> projectNameMap = this.dataDictService.getMapByParentAttributeNameForValue("项目名称");
        Map<String, String> exCardTypeMap = this.dataDictService.getMapByParentAttributeNameForValue("证件类型"); //前配偶证件类型
        Map<String, String> cardTypeMap = this.dataDictService.getMapByParentAttributeNameForValue("证件类型"); //证件类型
        Map<String, String> statusMap = this.dataDictService.getMapByParentAttributeNameForValue("合同数据状态");
        Map<String, String> thisAreaMap = this.dataDictService.getMapByParentAttributeNameForValue("是否"); //京籍是否是本区
        Map<String, String> firstOrNotMap = this.dataDictService.getMapByParentAttributeNameForValue("是否"); //是否优先组
        Map<String, String> houseStatusMap = this.dataDictService.getMapByParentAttributeNameForValue("审核状态"); //住房审核状态
        Map<String, String> seniorityStatusMap = this.dataDictService.getMapByParentAttributeNameForValue("复核状态"); //资格复核状态
        Map<String, String> marryStatusMap = this.dataDictService.getMapByParentAttributeNameForValue("婚姻状况");
        Map<String, String> workUnitMap = this.dataDictService.getMapByParentAttributeNameForValue("工作地（社保缴纳地）");
        Map<String, String> familyTypeMap = this.dataDictService.getMapByParentAttributeNameForValue("家庭类型");
        Map<String, String> residencePermitMap = this.dataDictService.getMapByParentAttributeNameForValue("工作居住证类型");
        Map<String, String> armyTypeMap = this.dataDictService.getMapByParentAttributeNameForValue("军官（警官）证件");
        Map<String, String> signStatusMap = this.dataDictService.getMapByParentAttributeNameForValue("签约状态");
        Map<String, String> dataStatusMap = this.dataDictService.getMapByParentAttributeNameForValue("数据状态");
        Map<String, String> educationMap = this.dataDictService.getMapByParentAttributeNameForValue("学历层次");
        Map<String, String> learningMap = this.dataDictService.getMapByParentAttributeNameForValue("学习形式");
        Map<String, String> houesStatusMap = this.dataDictService.getMapByParentAttributeNameForValue("分配状态");
        Map<String, String> houseTypeMap = this.dataDictService.getMapByParentAttributeNameForValue("居室");

        PageInfo<Contract> pageInfo = new PageInfo<Contract>();
        Servlets.initPageInfo(request, pageInfo);
        pageInfo.setPageSize(Integer.MAX_VALUE);
        pageInfo = this.statisticsService.getListForSearch(pageInfo, request);
        List dataList = Lists.newArrayList();
        //存储列名
        List<String> theadsList = new ArrayList<String>();
        //存储字段名
        List<String> nameList = new ArrayList<String>();
        String familyPerson = "";

        if (pageInfo.getTotalCount() > 0) {
            Enumeration<String> param = request.getParameterNames();
            while (param.hasMoreElements()) {
                String name = param.nextElement();
                //当不是查询条件时
                if (name.indexOf("search_") == -1) {
                    if (!name.equals("h_house")){
                        String thead = ContractExcelMap.excelMap().get(name).toString();
                        theadsList.add(thead);
                        nameList.add(name);
                    }else {
                        theadsList.add("楼号");
                        theadsList.add("单元号");
                        theadsList.add("房间号");
                        theadsList.add("户型编号");
                        theadsList.add("居室");
                        theadsList.add("建筑面积");
                        nameList.add(name);
                    }
                }
                if (name.equals("f_familyPerson")){
                    familyPerson = "familyPerson";
                }
            }

            Map<Integer, List<FamilyPerson>> familyPersonMap = statisticsService.getFamilyPersonMap();
            Map<Integer, List<Contract>> houseInfoMap = statisticsService.getHouseMap();

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            for (Contract contract : (List<Contract>) pageInfo.getResult()) {
                //合同编号
                List list = new ArrayList();

                for (int i = 0; i < nameList.size(); i++) {
                    String value = "";
                    String property = nameList.get(i);
                    List<FamilyPerson> familyPersonList = null;
                    House houseInfo = null;
                    if (property.indexOf("f_") == 0) {
                        if(!property.equals("f_familyPerson")){
                            value = BeanUtils.getProperty(contract.getFamily(), property.split("_")[1]);
                        }else{
                            familyPersonList = familyPersonMap.get(contract.getFamily().getId());
                            if(familyPersonList==null){
                                familyPersonList = new ArrayList<FamilyPerson>();
                            }
                            if(familyPersonList.size()==0){
                                familyPersonList.add(new FamilyPerson());
                            }
                            list.add(familyPersonList);
                        }
                    } else if (property.indexOf("h_") == 0){
                        houseInfo = houseInfoMap.get(contract.getId()).get(0).getHouse();
                        if(houseInfo==null){
                            houseInfo = new House();
                        }
                        if(property.equals("h_rentName")){
                            list.add(houseInfo.getRentName());
                        }else if (property.equals("h_house")){
                            list.add(houseInfo.getBuildNum());
                            list.add(houseInfo.getUnitNum());
                            list.add(houseInfo.getHouseNum());
                            list.add(houseInfo.getTypeCode());
                            value = String.valueOf(houseInfo.getHouseType());
                            value = houseTypeMap.get(value) == null ? "" : houseTypeMap.get(value);
                            list.add(value);
                            list.add(houseInfo.getHouseType());
                            list.add(houseInfo.getBuildArea());
                        }else if (property.equals("h_rentIdCard")){
                            list.add(houseInfo.getRentIdCard());
                        }else if (property.equals("h_rentDate")){
                            if (houseInfo.getRentDate() != null){
                                list.add(sdf.format(houseInfo.getRentDate()));
                            } else{
                                list.add(houseInfo.getRentDate());
                            }
                        }else if(property.equals("h_status")){
                            value = String.valueOf(houseInfo.getStatus());
                            value = houesStatusMap.get(value) == null ? "" : houesStatusMap.get(value);
                            list.add(value);
                        }
                    }else {
                        value = BeanUtils.getProperty(contract, property);
                    }

                    if (value != null && (value.equals("0.00") || value.equals("0"))) {
                        value = "";
                    }
                    if (property.equals("f_projectName")) {
                        value = projectNameMap.get(value) == null ? "" : projectNameMap.get(value);
                    } else if (property.equals("f_exCardType")) {
                        value = exCardTypeMap.get(value) == null ? "" : exCardTypeMap.get(value);
                    } else if (property.equals("status")) {
                        value = statusMap.get(value) == null ? "" : statusMap.get(value);
                    } else if (property.equals("f_thisArea") || property.equals("f_thisPark") || property.equals("f_continuity")) {
                        value = thisAreaMap.get(value) == null ? "" : thisAreaMap.get(value);
                    } else if (property.equals("f_firstOrNot")) {
                        value = firstOrNotMap.get(value) == null ? "" : firstOrNotMap.get(value);
                    } else if (property.equals("f_houseStatus")  || property.equals("f_socialStatus") || property.equals("f_marriageStatus") || property.equals("f_ageStatus") || property.equals("f_educationStatus") || property.equals("f_otherStatus")) {
                        value = houseStatusMap.get(value) == null ? "" : houseStatusMap.get(value);
                    } else if (property.equals("f_seniorityStatus")) {
                        value = seniorityStatusMap.get(value) == null ? "" : seniorityStatusMap.get(value);
                    }else if (property.equals("f_cardType")) {
                        value = cardTypeMap.get(value) == null ? "" : cardTypeMap.get(value);
                    }else if (property.equals("f_marryStatus")) {
                        value = marryStatusMap.get(value) == null ? "" : marryStatusMap.get(value);
                    }else if (property.equals("f_workUnit")) {
                        value = workUnitMap.get(value) == null ? "" : workUnitMap.get(value);
                    }else if (property.equals("f_familyType")) {
                        value = familyTypeMap.get(value) == null ? "" : familyTypeMap.get(value);
                    }else if (property.equals("f_residencePermit")) {
                        value = residencePermitMap.get(value) == null ? "" : residencePermitMap.get(value);
                    }else if (property.equals("f_handleType")) {
                        value = exCardTypeMap.get(value) == null ? "" : exCardTypeMap.get(value);
                    }else if (property.equals("f_armyType")) {
                        value = armyTypeMap.get(value) == null ? "" : armyTypeMap.get(value);
                    }else if (property.equals("f_signStatus")) {
                        value = signStatusMap.get(value) == null ? "" : signStatusMap.get(value);
                    }else if (property.equals("f_dataStatus")) {
                        value = dataStatusMap.get(value) == null ? "" : dataStatusMap.get(value);
                    }else if (property.equals("f_education")) {
                        value = educationMap.get(value) == null ? "" : educationMap.get(value);
                    }else if (property.equals("f_learning")) {
                        value = learningMap.get(value) == null ? "" : learningMap.get(value);
                    }else if (property.equals("f_divorceDate") || property.equals("signDate") || property.equals("operateDate") || property.equals("f_applyDate") || property.equals("f_startDate") || property.equals("f_endDate")) {
                        if (value == null) {
                            value = "";
                        }else{
                            try {
                                Date date = sdf.parse(value);
                                value = sdf.format(date);
                            } catch (ParseException e) {
                                e.printStackTrace();
                            }
                        }
                    }
                    if (value == null) {
                        value = "";
                    }
                    if (!property.equals("f_familyPerson") && property.indexOf("h_") != 0){
                        list.add(value);
                    }
                }
                dataList.add(list);
            }
        }
        RedirectAttributesExcel.addFlashAttribute(redirectAttributes, "综合信息台账", "综合信息台账", theadsList.toArray(new String[theadsList.size()]), dataList,familyPerson);
        return "redirect:/cq/common/export/excel";
    }


    /**
     * 合同信息列表
     * @param request
     * @param modelMap
     */
    @RequestMapping("contractList")
    public void list(HttpServletRequest request, ModelMap modelMap){
        PageInfo<Contract> pageInfo = new PageInfo<>();
        Servlets.initPageInfo(request,pageInfo);
        pageInfo = this.contractService.contractList(pageInfo);
        modelMap.put("pageInfo",pageInfo);
    }

    /**
     * 合同综合台账查看
     * @param request
     * @return
     */
    @RequestMapping("view")
    public void view(HttpServletRequest request,ModelMap modelMap){
        Integer contractId = ParamUtils.getInt(request, "contractId", 0);
        Contract contract = this.contractService.get(contractId);

        modelMap.addAttribute("contract",contract);
    }

    /**
     * 导出合同信息台账
     */
    @RequestMapping("excelForm")
    public void excelForm(HttpServletRequest request, ModelMap modelMap) {
        PageInfo<Contract> pageInfo = new PageInfo<Contract>();
        pageInfo.setPageSize(Integer.MAX_VALUE);
        Servlets.initPageInfo(request, pageInfo);

        pageInfo = this.contractService.contractList(pageInfo);

        modelMap.addAttribute("pageInfo", pageInfo);
    }

    /**
     * 分类统计
     * @param request
     * @param modelMap
     */
    @RequestMapping("fenleiCount")
    public void fenleiCount(HttpServletRequest request, ModelMap modelMap) {
        Map<String, List<String>> fenleiStatistics = this.statisticsService.getFenLeiCount();
        List<String> fenLeiTotalCount = this.statisticsService.getFenLeiTotalCount();
        modelMap.addAttribute("fenleiStatistics",fenleiStatistics);
        modelMap.addAttribute("fenLeiTotalCount",fenLeiTotalCount);
    }
    /**
     * 弃房率统计
     * @param request
     * @param modelMap
     */
    @RequestMapping("discardingHouse")
    public void discardingHouse(HttpServletRequest request, ModelMap modelMap) {
        Map<String, List<String>> discardingStatistics = this.statisticsService.getdiscardingHouseCount();
        List<String> discardingTotalCount = this.statisticsService.getdiscardingHouseTotalCount();
        modelMap.addAttribute("discardingStatistics",discardingStatistics);
        modelMap.addAttribute("discardingTotalCount",discardingTotalCount);
    }

}
