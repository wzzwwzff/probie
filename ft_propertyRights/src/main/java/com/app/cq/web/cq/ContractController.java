package com.app.cq.web.cq;

import com.app.common.model.DataDict;
import com.app.common.service.DataDictService;
import com.app.cq.en.DataPhase;
import com.app.cq.exception.Precondition;
import com.app.cq.exception.Response;
import com.app.cq.model.*;
import com.app.cq.service.*;
import com.app.cq.utils.ReadExcel;
import com.app.permission.utils.UserSession;
import com.google.common.collect.Maps;
import com.sqds.exception.SqdsException;
import com.sqds.page.PageInfo;
import com.sqds.utils.Collections3;
import com.sqds.utils.StringUtils;
import com.sqds.web.ParamUtils;
import com.sqds.web.Servlets;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by jmdf on 2018/8/9.
 */
@Controller
@RequestMapping("/cq/contract/*")
public class ContractController {
    @Resource
    private FamilyService familyService;
    @Resource
    private ContractService contractService;
    @Resource
    private HouseService houseService;
    @Resource
    private ProjectService projectService;
    @Resource
    private DataDictService dataDictService;
    @Resource
    private ActionInfoService actionInfoService;
    @Resource
    private FamilyPersonService familyPersonService;
    @Resource
    private HistoryInfoService historyInfoService;

    /**
     * 合同信息登记入口
     */
    @RequestMapping("start")
    public void start(){}

    /**
     * 合同信息列表
     * @param request
     * @param modelMap
     */
    @RequestMapping("list")
    public void list(HttpServletRequest request, ModelMap modelMap){
        PageInfo<Contract> pageInfo = new PageInfo<>();
        Servlets.initPageInfo(request,pageInfo);
        pageInfo = this.contractService.contractList(pageInfo);
        modelMap.put("pageInfo",pageInfo);
    }

    /**
     * 合同信息登记修改
     */
    @RequestMapping("form")
    public void form(HttpServletRequest request, ModelMap modelMap) {
        Integer contractId = ParamUtils.getInt(request, "contractId", 0);
        Integer familyId = ParamUtils.getInt(request, "familyId", 0);

        Family  family = this.familyService.get(familyId);
        Precondition.checkSqdsArguement(family != null, "数据错误，请重试！");
        Contract  contract = this.contractService.get(contractId);

        String projectName=family.getProjectName();
        //查项目下楼号集合
        if(projectName != null){
            Project project = this.projectService.getProject(projectName);
            List<Integer> buildNums = this.houseService.buildingNumList(project.getId());
            modelMap.addAttribute("buildNums", buildNums);
        }

        if (contract == null) {
            contract = new Contract();
        }

        modelMap.addAttribute("contract", contract);
        modelMap.addAttribute("family", family);
        modelMap.addAttribute("person", UserSession.getUserFromSession(request).getRealName());
    }

    /**
     * 合同查看
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
     * 合同信息保存
     * @param request
     * @return
     */
    @RequestMapping("save")
    public String save(HttpServletRequest request){
        Integer familyId = ParamUtils.getInt(request, "familyId", 0);
        Integer houseId = ParamUtils.getInt(request, "houseId", 0);
        Family family = this.familyService.get(familyId);

        //保存家庭签约状态
        family.setSignStatus(2);
        this.familyService.save(family);

        Integer contractId = ParamUtils.getInt(request, "contractId", 0);
        Contract  contract = this.contractService.get(contractId);
        if (contract == null) {
            contract = new Contract();
        }

        //根据项目/楼号/单元/房号查出house
        String projectName = ParamUtils.getString(request, "projectName", "");
        Project project = this.projectService.getProject(projectName);
        Integer projectId = project.getId();
        String buildNum = ParamUtils.getString(request, "buildNum", "");
        String unitNum = ParamUtils.getString(request, "unitNum", "");
        String houseNum = ParamUtils.getString(request, "houseNum", "");
        House house = this.houseService.getUniHouse(projectId, buildNum, unitNum, houseNum);
        //设置房源状态为已分配
        if(house != null){
            house.setStatus(2);
            //设置产权人/身份证号   转租转售回显使用
            house.setName(family.getName());
            house.setIdCard(family.getIdCard());
            this.houseService.save(house);
        }
        //房源修改的情况
        House oldHouse = this.houseService.get(houseId);
        if(oldHouse != null && (oldHouse.getId() != house.getId())){
            oldHouse.setStatus(1);
            //设置产权人/身份证号
            oldHouse.setName(null);
            oldHouse.setIdCard(null);
            this.houseService.save(oldHouse);
        }

        contract.setFamily(family);
        contract.setHouse(house);
        contract.setProject(house.getProject());
        Servlets.bind(request,contract);
        this.contractService.save(contract);

        List<FamilyPerson> familyPersonList = this.familyPersonService.listByFamilyId(family.getId());
        List<Contract> contractList = this.contractService.listByFamilyId(family.getId());
        //保存历史记录
        this.historyInfoService.saveHistoryInfo(request,family,familyPersonList,contractList, DataPhase.CONTRACT.getIndex());
        return "redirect:list?" +"&"+request.getAttribute("searchParams");
    }

    /**
     * 查找家庭信息
     * @param request
     * @param response
     */
    @RequestMapping("ajaxFamilyInfo")
    @ResponseBody
    public void ajaxFamilyInfo(HttpServletRequest request,HttpServletResponse response) {
        String query = ParamUtils.getString(request,"query","");
        List<Family> list = this.familyService.listByParam(query);
        if (list == null || list.size() == 0) {
            return;
        }
        StringBuffer jsonstr = new StringBuffer();
        jsonstr.append("{query:'" + query + "',suggestions:[");
        int index = list.size();
        int i = 0;
        for (Family family : list) {
            String str = StringUtils.getNotNullString(family.getName()) + "   "
                    + StringUtils.getNotNullString(family.getIdCard())+ "    "
                    +StringUtils.getNotNullString(family.getFamilyCode());
            jsonstr.append("'" + str + "'");
            if ((i + 1) != index) {
                jsonstr.append(",");
            }
            i += 1;
        }
        jsonstr.append("],data:[");
        i = 0;// 初始化i
        for (Family family : list) {
            String str = StringUtils.getNotNullString(family.getFamilyCode());
            jsonstr.append("'" + str + "'");
            if ((i + 1) != index) {
                jsonstr.append(",");
            }
            i += 1;
        }
        jsonstr.append("]}");
        PrintWriter out = null;
        try {
            out = response.getWriter();
            response.setContentType("application/json; charset=utf-8");
            // 防止JSP页面缓存造成ajax数据不刷新
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);

            out.print(jsonstr.toString());
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (out != null) {
                out.close();
            }
        }
    }


    /**
     * 验证家庭信息是否存在
     *
     * @param request
     */
    @RequestMapping("validateIsExists")
    @ResponseBody
    public Map validateIsExists(HttpServletRequest request) {

        String familyCode = ParamUtils.getString(request, "familyCode", "");

        Family family = null;
        int status = 1;
        String message = "";

        try {
            family = this.familyService.findOneByProperty("familyCode",familyCode);
        } catch (Exception e) {
            status = 3;
            message = "输入数据有误";
        }

        int familyId = 0;
        Integer contractId = 0;
        if (family == null) {
            status = 2;
            message = "找不到该户数据，请检查输入内容是否正确";
        }

        if (status == 1) {
            familyId = family.getId();
            Contract contract = this.contractService.getContractByfamilyid(familyId);
            if(contract != null){
                contractId = contract.getId();
                status = 4;
                message = "该户家庭已登记，请核对！";
            }
        }

        Map map = new HashMap();
        map.put("status", status);
        map.put("message", message);
        map.put("familyId", familyId);
        map.put("contractId", contractId);
        return map;
    }

    /**
     * 删除
     * @param request
     * @return
     */
    @RequestMapping("delete")
    @ResponseBody
    public Map<String,String> delete(ServletRequest request){
        Integer contractId = ParamUtils.getInt(request, "contractId", 0);
        Integer houseId = ParamUtils.getInt(request, "houseId", 0);
        Contract  contract = this.contractService.get(contractId);
        House house = this.houseService.get(houseId);

        Precondition.checkSqdsArguement(contract != null, "数据错误，请重试！");
        this.contractService.delete(contract.getId());
        //房源状态重置
        if(house != null){
            house.setStatus(1);
            //设置产权人/身份证号
            house.setName(null);
            house.setIdCard(null);
            this.houseService.save(house);
        }
        Map<String,String> map = new HashMap<String, String>();
        map.put("success","true");
        return map;
    }

    /**
     * 合同信息登记
     */
    @RequestMapping("contractRegisit")
    public void contractRegisit(){}

    /**
     * 合同登记ztree获取
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
    @RequestMapping("loadBuildPic")
    public void loadBuildPic(HttpServletRequest request, ModelMap modelMap,int id, String buildNum){
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

    //合同登记信息回显
    @RequestMapping("contractMsg")
    public void contractMsg(HttpServletRequest request, ModelMap modelMap){
        Integer houseId = ParamUtils.getInt(request, "houseId", 0);
        House house = this.houseService.get(houseId);
        modelMap.addAttribute("house", house);

        //根据houseId查合同，已分配的情况下要回显合同信息
        if(house.getStatus() != 1){
            Contract contract = this.contractService.getContractByhouseid(houseId);
            modelMap.addAttribute("contract", contract);
        }
        Integer projectId = ParamUtils.getInt(request, "projectId", 0);
        Project project = this.projectService.get(projectId);
        modelMap.addAttribute("project", project);
    }

    /**
     * 合同登记保存
     * @param request
     * @return
     */
    @RequestMapping("contractSave")
    public String contractSave(HttpServletRequest request){
        //家庭申请编号
        String familyCode = ParamUtils.getString(request, "familyCode", "");
        //根据编号查出家庭
        Family family = this.familyService.selectFamilyByFamilyCode(familyCode);

        //合同获取
        Integer contractId = ParamUtils.getInt(request, "contractId", 0);
        Contract contract = this.contractService.get(contractId);
        if (contract == null) {
            contract = new Contract();
        }

        //保存家庭签约状态
        family.setSignStatus(2);
        this.familyService.save(family);

        //房源获取
        Integer houseId = ParamUtils.getInt(request, "houseId", 0);
        House house = this.houseService.get(houseId);
        //登记合同将房源状态设为已分配
        house.setStatus(2);
        //设置产权人/身份证号   转租转售回显使用
        house.setName(family.getName());
        house.setIdCard(family.getIdCard());
        this.houseService.save(house);


        contract.setHouse(house);
        contract.setFamily(family);
        contract.setProject(house.getProject());
        Servlets.bind(request,contract);
        this.contractService.save(contract);

        List<FamilyPerson> familyPersonList = this.familyPersonService.listByFamilyId(family.getId());
        List<Contract> contractList = this.contractService.listByFamilyId(family.getId());
        //保存历史记录
        this.historyInfoService.saveHistoryInfo(request,family,familyPersonList,contractList, DataPhase.CONTRACT.getIndex());
        return "redirect:list?" +"&"+request.getAttribute("searchParams");
    }

    /**
     * 点击楼号楼盘图
     * @param request
     * @return
     */
    @RequestMapping("buildPic")
    public void buildPic(HttpServletRequest request,ModelMap modelMap){
        String projectName = ParamUtils.getString(request, "projectName", "");
        Project project = this.projectService.getProject(projectName);
        String buildNum = ParamUtils.getString(request, "buildNum", "");

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

    /**
     * 合同上报跳转
     * @param request
     * @return
     */
    @RequestMapping("contractReport")
    public void contractReport(HttpServletRequest request,ModelMap modelMap){
        Integer contractId = ParamUtils.getInt(request, "contractId", 0);
        Contract contract = this.contractService.get(contractId);
        modelMap.addAttribute("contract",contract);
    }

    /**
     * 合同上报
     * @param request
     * @return
     */
    @RequestMapping("reportData")
    @ResponseBody
    public Response reportData(HttpServletRequest request){
        Integer contractId = ParamUtils.getInt(request, "contractId", 0);
        Contract contract = this.contractService.get(contractId);
        contract.setStatus(2);
        this.contractService.save(contract);

        Response response = new Response();
        response.setCode("1111");
        Family family = contract.getFamily();
        //保存动作记录
        String operateType = "合同数据上报";
        this.actionInfoService.saveActionInfo(family,operateType);
        return response;
    }

    /**
     * 撤销上报
     */
    @RequestMapping("cancelCheck")
    @ResponseBody
    public Response cancelCheck(HttpServletRequest request, ModelMap modelMap) {
        Integer contractId = ParamUtils.getInteger(request, "contractId", 0);
        Contract contract = this.contractService.get(contractId);
        Precondition.checkSqdsArguement(contract != null, "数据错误，请重试！");
        contract.setStatus(1);
        this.contractService.save(contract);

        Response response = new Response();
        response.setCode("1111");
        Family family = contract.getFamily();
        //保存动作记录
        String operateType = "合同数据撤销上报";
        this.actionInfoService.saveActionInfo(family,operateType);
        return response;
    }

    /**
     * 合同信息备案列表
     * @param request
     * @return
     */
    @RequestMapping("checkList")
    public void checkList(HttpServletRequest request,ModelMap modelMap){
        PageInfo<Contract> pageInfo = new PageInfo<>();
        Servlets.initPageInfo(request,pageInfo);
        pageInfo = this.contractService.baList(pageInfo);
        modelMap.put("pageInfo",pageInfo);
    }

    /**
     * 备案管理
     * @param request
     * @return
     */
    @RequestMapping("checkForm")
    public void checkForm(HttpServletRequest request,ModelMap modelMap){
        Integer contractId = ParamUtils.getInt(request, "contractId", 0);
        Contract contract = this.contractService.get(contractId);
        modelMap.addAttribute("contract",contract);
    }

    /**
     * 备案查看
     * @param request
     * @return
     */
    @RequestMapping("mainView")
    public void mainView(HttpServletRequest request,ModelMap modelMap){
        Integer contractId = ParamUtils.getInt(request, "contractId", 0);
        Contract contract = this.contractService.get(contractId);

        Family family = contract.getFamily();

        modelMap.addAttribute("contract",contract);
        modelMap.addAttribute("family",family);
    }

    /**
     * 合同数据锁定
     * @param request
     * @return
     */
    @RequestMapping("dataHandUp")
    @ResponseBody
    public Response dataHandUp(HttpServletRequest request, ModelMap modelMap){
        Integer contractId = ParamUtils.getInt(request, "contractId", 0);
        Contract contract = this.contractService.get(contractId);
        Precondition.checkSqdsArguement(contract != null, "数据错误，请重试！");

        contract.setStatus(3);
        this.contractService.save(contract);

        Response response = new Response();
        response.setCode("1111");
        Family family = contract.getFamily();
        //保存动作记录
        String operateType = "合同数据锁定";
        this.actionInfoService.saveActionInfo(family,operateType);
        return response;
    }

    /**
     * 合同数据退回
     * @param request
     * @return
     */
    @RequestMapping("backData")
    @ResponseBody
    public Response backData(HttpServletRequest request,ModelMap modelMap,String reason){
        Integer contractId = ParamUtils.getInt(request, "contractId", 0);
        Contract contract = this.contractService.get(contractId);
        Precondition.checkSqdsArguement(contract != null, "数据错误，请重试！");

        contract.setStatus(4);
        contract.setReason(reason);
        this.contractService.save(contract);

        Response response = new Response();
        response.setCode("1111");
        Family family = contract.getFamily();
        //保存动作记录
        String operateType = "合同数据退回";
        this.actionInfoService.saveActionInfo(family,operateType);
        return response;
    }

    /**
     * 合同登记选楼号展示房屋信息
     * @param request
     * @return
     */
    @RequestMapping("getHouse")
    @ResponseBody
    public Map getHouse(HttpServletRequest request,ModelMap modelMap){
        Integer houseId = ParamUtils.getInt(request, "houseId", 0);
        House house = this.houseService.get(houseId);
        Precondition.checkSqdsArguement(house != null, "数据错误，请重试！");

        String buildNum = house.getBuildNum();//楼号
        String unitNum = house.getUnitNum();//单元
        String houseNum = house.getHouseNum();//房号
        BigDecimal buildArea = house.getBuildArea();//建筑面积
        Integer houseType = house.getHouseType();//居室
        BigDecimal price = house.getPrice();//销售价格
        String scale = house.getScale();//产权比例

        HashMap<String,String> map = Maps.newHashMap();
        map.put("buildNum",buildNum);
        map.put("unitNum",unitNum);
        map.put("houseNum",houseNum);
        map.put("buildArea",buildArea.toString());
        map.put("houseType",String.valueOf(houseType));
        if(price != null){
            map.put("price",price.toString());
        }
        map.put("scale",scale);


        return map;
    }

    //批量导入合同
    @RequestMapping("plContract")
    public void plContract(){}

    /**
     * 合同批量上传
     * @param request
     * @throws IOException
     */
    @RequestMapping("plContractSave")
    public String plContractSave(HttpServletRequest request) throws Exception {
        //上传文件
        byte[] filePath = Servlets.uploadFile(request,"file");
        InputStream excelInputStream = new ByteArrayInputStream(filePath);
        List list = ReadExcel.read(excelInputStream,0,true);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        for (int i = 0; i < list.size() ; i++) {
            if (i > 0){
                List row = (List) list.get(i);
                if (!"".equals((String)row.get(0))) {
                    Contract contract =  new Contract();

                    String familyCode = (String)row.get(1);       //申请编号
                    String contractCode = (String) row.get(2);                //合同编号
                    String name = (String) row.get(3);              //产权人姓名
                    String idCard = (String) row.get(4);            //产权人身份证号
                    String signDate = (String) row.get(5);          //合同签订日期
                    String person = (String) row.get(6);            //经办人
                    String propertyRight = (String) row.get(7);     //产权比例
                    String price = (String) row.get(8);             //销售价格
                    String memo = (String) row.get(9);              //备注
                    String projectName = (String) row.get(10);            //项目名称
                    //查询项目
                    Project project = this.projectService.getProject(projectName);

                    String buildNum = (String) row.get(11);            //楼号
                    String unit = (String) row.get(12);            //单元
                    String houseNum = (String) row.get(13);            //房号

                    //验证家庭信息是否存在
                    Family family = this.familyService.findOneByProperty("familyCode", familyCode);
                    if(family != null){
                        //验证房源信息
                        House house = this.houseService.getUniHouse(project.getId(), buildNum, unit, houseNum);
                        if(house != null){
                            contract.setFamilyCode(familyCode);
                            contract.setContractCode(contractCode);
                            contract.setName(name);
                            contract.setIdCard(idCard);
                            if(signDate != null && !signDate.equals("")){
                                if(signDate.contains("/")){
                                    signDate = signDate.replace("/", "-");
                                }
                                contract.setSignDate(sdf.parse(signDate));
                            }
                            contract.setPerson(person);
                            contract.setPropertyRight(propertyRight);
                            if(price != null && !price.equals("")){
                                contract.setPrice(new BigDecimal(price));
                            }
                            contract.setMemo(memo);

                            //设置家庭为已签约
                            family.setSignStatus(2);
                            contract.setFamily(family);
                            //设置房源为已分配
                            house.setStatus(2);
                            contract.setHouse(house);
                            //设置项目
                            contract.setProject(project);
                            //设置合同为未签约
                            contract.setStatus(1);
                            //保存
                            this.contractService.save(contract);
                        }else{
                            throw new SqdsException("请核对房源信息！");
                        }
                    }else{
                        throw new SqdsException("请核对家庭信息！");
                    }
                }
            }
        }
        return "redirect:list";
    }

}
