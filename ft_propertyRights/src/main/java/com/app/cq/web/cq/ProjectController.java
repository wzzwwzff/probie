package com.app.cq.web.cq;

import com.app.common.model.DataDict;
import com.app.common.service.DataDictService;
import com.app.cq.exception.Precondition;
import com.app.cq.model.Contract;
import com.app.cq.model.House;
import com.app.cq.model.Project;
import com.app.cq.service.ContractService;
import com.app.cq.service.HouseService;
import com.app.cq.service.ProjectService;
import com.app.cq.utils.ReadExcel;
import com.google.common.collect.Maps;
import com.sqds.page.PageInfo;
import com.sqds.utils.Collections3;
import com.sqds.web.ParamUtils;
import com.sqds.web.Servlets;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by zy on 2018/8/10.
 */
@Controller
@RequestMapping("/cq/project/*")
public class ProjectController {

    @Autowired
    private ProjectService projectService;

    @Autowired
    private HouseService houseService;

    @Autowired
    private DataDictService dataDictService;

    @Autowired
    private ContractService contractService;

    /**
     * 项目列表展示
     *
     * @param request
     * @param modelMap
     */
    @RequestMapping("projectList")
    public void projectList(HttpServletRequest request, ModelMap modelMap) {
        PageInfo<Project> pageInfo = new PageInfo<>();
        Servlets.initPageInfo(request, pageInfo);
        pageInfo.setPageSize(Integer.MAX_VALUE);
        pageInfo = this.projectService.list(pageInfo);
        modelMap.addAttribute("pageInfo", pageInfo);
    }

    /**
     * 项目登记或修改
     *
     * @param request
     * @param modelMap
     */
    @RequestMapping("projectForm")
    public void projectForm(HttpServletRequest request, ModelMap modelMap) {
        Integer projectId = ParamUtils.getInt(request, "projectId", 0);
        Project project = this.projectService.get(projectId);
        if (project == null) {
            project = new Project();
        }
        modelMap.addAttribute("project", project);
    }
    /**
     * 项目查看
     *
     * @param request
     * @param modelMap
     */
    @RequestMapping("projectView")
    public void projectView(HttpServletRequest request, ModelMap modelMap) {
        Integer projectId = ParamUtils.getInt(request, "projectId", 0);
        Project project = this.projectService.get(projectId);
        Precondition.checkSqdsArguement(project != null,"未找到数据");
        modelMap.addAttribute("project", project);
    }

    /**
     * 保存项目信息
     *
     * @param request
     */
    @RequestMapping("projectSave")
    public String projectSave(HttpServletRequest request) {
        Integer projectId = ParamUtils.getInt(request, "projectId", 0);
        Project project = this.projectService.get(projectId);
        //是空就是新增，不为空就是修改
        if (project == null) {
            project = new Project();
        }
        Servlets.bind(request, project);
        this.projectService.save(project);
        return "redirect:projectList?" + request.getAttribute("searchParams");
    }

    /**
     * 删除项目信息
     *
     * @param request
     * @return
     */
    @RequestMapping("delProject")
    @ResponseBody
    public Map delProject(HttpServletRequest request) {
        Map map = Maps.newHashMap();

        Integer projectId = ParamUtils.getInt(request, "projectId", 0);
        //判断项目下是否有房源
        Integer count = this.projectService.isExistHouse(projectId);
        if(count>0){
            map.put("result", 2);
        }else{
            this.projectService.delete(projectId);
            map.put("result", 1);
        }
        return map;
    }

    /**
     * 房源信息列表
     *
     * @param request
     * @param modelMap
     */
    @RequestMapping("houseList")
    public void houseList(HttpServletRequest request, ModelMap modelMap) {
        Integer projectId = ParamUtils.getInt(request, "projectId", 0);
        modelMap.addAttribute("projectId", projectId);
        Project project = this.projectService.get(projectId);

        PageInfo<House> pageInfo = new PageInfo<>();
        Servlets.initPageInfo(request, pageInfo);
        pageInfo.addParameter("projectId", projectId);
        pageInfo = this.houseService.houseList(pageInfo);

        modelMap.addAttribute("project", project);
        modelMap.addAttribute("pageInfo", pageInfo);
    }

    /**
     * 房源登记或修改
     *
     * @param request
     * @param modelMap
     */
    @RequestMapping("houseForm")
    public void houseForm(HttpServletRequest request, ModelMap modelMap) {
        Integer projectId = ParamUtils.getInt(request, "projectId", 0);
        Integer houseId = ParamUtils.getInt(request, "houseId", 0);
        Project project = projectService.get(projectId);
        House house = houseService.get(houseId);

        if (house == null || house.getId() == null) {
            house = new House();
            if (project != null) {
                house.setProject(project);
            }
        }
        List<Project> projectList = projectService.listAll();
        modelMap.addAttribute("project", project);
        modelMap.addAttribute("house", house);
        modelMap.addAttribute("projectList", projectList);
    }

    /**
     * 保存房源信息
     *
     * @param request
     */
    @RequestMapping("houseSave")
    public String houseSave(HttpServletRequest request) {
        Integer projectId = ParamUtils.getInt(request, "projectId", 0);
        Integer houseId = ParamUtils.getInt(request, "houseId", 0);
        Project project = projectService.get(projectId);
        House house = houseService.get(houseId);

        if (house == null) {
            house = new House();
        }
        Servlets.bind(request, house);
        house.setProject(project);
        houseService.save(house);

        return "redirect:houseList?projectId=" + projectId;
    }

    /**
     * 删除房源信息
     *
     * @param request
     * @return
     */
    @RequestMapping("delHouse")
    public String delHouse(HttpServletRequest request) {
        Integer houseId = ParamUtils.getInt(request, "houseId", 0);
        House house = this.houseService.get(houseId);
        if (houseId != 0) {
            this.houseService.delete(house.getId());
        }
        return "redirect:houseList?projectId="+house.getProject().getId();
    }


    //批量导入项目
    @RequestMapping("plProject")
    public void plProject(){

    }

    /**
     * 项目批量上传
     * @param request
     * @throws IOException
     */
    @RequestMapping("plProjectSave")
    public String plProjectSave(HttpServletRequest request) throws Exception {
        //上传文件
        byte[] filePath = Servlets.uploadFile(request,"file");
        InputStream excelInputStream = new ByteArrayInputStream(filePath);
        List list = ReadExcel.read(excelInputStream,0,true);

        for (int i = 0; i < list.size() ; i++) {
            if (i > 0){
                List row = (List) list.get(i);
                if (!"".equals((String)row.get(0))) {
                    Project project =  new Project();

                    String projectName = (String)row.get(1);       //项目名称
                    String enterprise = (String) row.get(2);       //企业名称
                    String hprogress = (String) row.get(3);         //进展情况
                    Integer progress = 0;
                    if(!hprogress.equals("") && hprogress.equals("建设期")){
                        progress = 1;
                    }
                    if(!hprogress.equals("") && hprogress.equals("运营期")){
                        progress = 2;
                    }
                    String address = (String) row.get(4);          //项目位置
                    String east = (String) row.get(5);             //项目东至
                    String west = (String) row.get(6);             //项目西至
                    String south = (String) row.get(7);            //项目南至
                    String north = (String) row.get(8);            //项目北至
                    String number = (String) row.get(9);          //套数
                    String price = (String) row.get(10);           //销售价格
                    String scale = (String) row.get(11);           //产权比例
                    String houseTypeArea = (String) row.get(12);   //户型面积
                    String unit = (String) row.get(13);             //建设单位
                    String unitPerson = (String) row.get(14);             //建设单位联系人
                    String unitPhone = (String) row.get(15);             //建设单位联系电话
                    String community = (String) row.get(16);             //项目坐落社区街道
                    String cPerson = (String) row.get(17);             //社区街道联系人
                    String cPhone = (String) row.get(18);             //社区街道联系电话
                    String propertyCompany = (String) row.get(19);             //物业公司名称
                    String pPerson = (String) row.get(20);             //物业公司联系人
                    String pPhone = (String) row.get(21);             //物业公司联系电话
                    String rentPrice = (String) row.get(22);             //出租单价

                    String memo = (String) row.get(23);            //备注

                    project.setProjectName(projectName);
                    project.setEnterprise(enterprise);
                    project.setProgress(progress);
                    project.setAddress(address);
                    project.setEast(east);
                    project.setWest(west);
                    project.setSouth(south);
                    project.setNorth(north);
                    if(number != null && !number.equals("")){
                        project.setNumber(Integer.valueOf(number));
                    }
                    project.setPrice(price);
                    project.setScale(scale);
                    project.setHouseTypeArea(houseTypeArea);
                    project.setUnit(unit);
                    project.setUnitPerson(unitPerson);
                    project.setUnitPhone(unitPhone);
                    project.setCommunity(community);
                    project.setcPerson(cPerson);
                    project.setcPhone(cPhone);
                    project.setPropertyCompany(propertyCompany);
                    project.setpPerson(pPerson);
                    project.setpPhone(pPhone);
                    if(rentPrice != null && !rentPrice.equals("")){
                        project.setRentPrice(new BigDecimal(rentPrice));
                    }
                    project.setMemo(memo);

                    this.projectService.save(project);
                }
            }
        }
        return "redirect:projectList";
    }

    //批量导入房源
    @RequestMapping("plHouse")
    public void plHouse(HttpServletRequest request , ModelMap modelMap){
        Integer projectId = ParamUtils.getInt(request, "projectId", 0);
        Project project = this.projectService.get(projectId);
        modelMap.addAttribute("project",project);
    }

    /**
     * 房源信息导出
     *
     * @param request
     * @param modelMap
     */
    @RequestMapping("excelForm")
    public void excelForm(HttpServletRequest request, ModelMap modelMap) {
        Integer projectId = ParamUtils.getInt(request, "projectId", 0);
        Project project = this.projectService.get(projectId);

        PageInfo<House> pageInfo = new PageInfo<>();
        pageInfo.setPageSize(Integer.MAX_VALUE);
        Servlets.initPageInfo(request, pageInfo);
        pageInfo.addParameter("projectId", projectId);
        pageInfo = this.houseService.houseList(pageInfo);

        modelMap.addAttribute("project", project);
        modelMap.addAttribute("pageInfo", pageInfo);
    }

    /**
     * 房源批量上传
     * @param request
     * @throws IOException
     */
    @RequestMapping("plHouseSave")
    public String plHouseSave(HttpServletRequest request) throws Exception {
        //获取项目名
        Integer projectId = ParamUtils.getInt(request, "projectId", 0);
        Project project = this.projectService.get(projectId);

        //上传文件
        byte[] filePath = Servlets.uploadFile(request,"file");
        InputStream excelInputStream = new ByteArrayInputStream(filePath);
        List list = ReadExcel.read(excelInputStream,0,true);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        for (int i = 0; i < list.size() ; i++) {
            if (i > 0){
                List row = (List) list.get(i);
                if (!"".equals((String)row.get(0))) {
                    House house = new House();

                    String buildNum = (String)row.get(1);       //楼号
                    String unitNum = (String) row.get(2);       //单元号
                    String houseNum = (String) row.get(3);      //房间号
                    String typeCode = (String) row.get(4);      //户型编号
                    String hhouseType = (String) row.get(5);          //居室
                    Integer houseType = 0;
                    if(!hhouseType.equals("") && hhouseType.equals("一居室")){
                        houseType = 1;
                    }else if(!hhouseType.equals("") && hhouseType.equals("二居室")){
                        houseType = 2;
                    }else if(!hhouseType.equals("") && hhouseType.equals("三居室")){
                        houseType = 3;
                    }
                    String buildArea = (String) row.get(6);          //建筑面积
                    String scale = (String) row.get(7);              //产权比例
                    String direction = (String) row.get(8);          //朝向
                    String price = (String) row.get(9);         //销售价格
                    String name = (String) row.get(10);            //产权人姓名
                    String idCard = (String) row.get(11);            //产权人身份证号
                    String memo = (String) row.get(12);            //备注

                    house.setBuildNum(buildNum);
                    house.setUnitNum(unitNum);
                    house.setHouseNum(houseNum);
                    house.setTypeCode(typeCode);
                    house.setHouseType(houseType);
                    if(buildArea != null && !buildArea.equals("")){
                        house.setBuildArea(new BigDecimal(buildArea));
                    }
                    house.setScale(scale);
                    house.setDirection(direction);
                    if(price != null && !price.equals("")){
                        house.setPrice(new BigDecimal(price));
                    }
                    house.setName(name);
                    house.setIdCard(idCard);
                    house.setMemo(memo);
                    house.setProject(project);

                    this.houseService.save(house);
                }
            }
        }
        return "redirect:houseList?projectId="+projectId;
    }

    //房源配组查看
    @RequestMapping("housePic")
    public void housePic(){

    }

    /**
     * 房源配组ztree项目楼号获取
     *
     * @param request
     */
    @RequestMapping("dataJson")
    @ResponseBody
    public List dataJson(HttpServletRequest request) {

        List<Project> projectList = projectService.listAll();//项目
        //按照组别封装数据为json格式
        List<Map> jsonList = new ArrayList<Map>();

        for (int i = 0; i < projectList.size(); i++) {
            Map<String, Object> m = new LinkedHashMap<String, Object>();
            m.put("name", projectList.get(i).getProjectName());
            List childrenList = houseService.getHouseNumInfo(projectList.get(i).getId());
            List<Map> list = new ArrayList<Map>();
            for (int j = 0; j < childrenList.size(); j++) {
                Map map = new HashMap();
                map.put("id", projectList.get(i).getId());
                map.put("name", childrenList.get(j) + "号楼");
                //Object[] objects=(Object[])childrenList.get(j);
                //map.put("name", objects[1] + "号楼");
                //map.put("houseId", objects[0]);
                map.put("icon", "/static/plugin/zTree_v3-master/css/zTreeStyle/img/diy/1_close.png");
                list.add(map);
            }
            m.put("children", list);
            m.put("open", true);
            jsonList.add(m);
        }
        return jsonList;
    }

    /**
     * 加载楼盘图
     *
     * @param request
     * @param modelMap
     */
    @RequestMapping("housePicChooses")
    public void housePicChooses(HttpServletRequest request, ModelMap modelMap,int id, String buildNum){
        Integer projectUuid = id;
        Project project = this.projectService.get(projectUuid);

        Map<String, String> houseTypeDataDictMap = this.dataDictService.getMapByParentAttributeNameForValue("居室");
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
        List<DataDict> flagList = dataDictService.getDataDictList("房源状态");
        List<DataDict> typeList = dataDictService.getDataDictList("居室");
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

    //房源配组信息回显
    @RequestMapping("houseMsg")
    public void houseMsg(HttpServletRequest request, ModelMap modelMap){
        Integer houseId = ParamUtils.getInt(request, "houseId", 0);
        House house = this.houseService.get(houseId);
        modelMap.addAttribute("house", house);

        Integer projectId = ParamUtils.getInt(request, "projectId", 0);
        Project project = this.projectService.get(projectId);
        modelMap.addAttribute("project", project);

        //根据houseId查合同
        Contract contract = this.contractService.getContractByhouseid(houseId);
        if(contract != null){
            modelMap.addAttribute("contract", contract);
        }
    }

}
