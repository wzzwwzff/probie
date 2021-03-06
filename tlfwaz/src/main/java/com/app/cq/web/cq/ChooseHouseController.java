package com.app.cq.web.cq;

import com.app.common.model.DataDict;
import com.app.common.service.DataDictService;
import com.app.cq.en.SpecialStatus;
import com.app.cq.exception.Precondition;
import com.app.cq.exception.Response;
import com.app.cq.model.*;
import com.app.cq.service.AzProjectService;
import com.app.cq.service.FamilyPersonService;
import com.app.cq.service.FamilyService;
import com.app.cq.service.HouseService;
import com.app.cq.utils.BigDecimals;
import com.app.cq.utils.GetCurrentUser;
import com.app.cq.utils.NewMoneyUtils;
import com.app.cq.utils.Strings;
import com.google.common.collect.Maps;
import com.sqds.page.PageInfo;
import com.sqds.utils.Collections3;
import com.sqds.utils.DateUtils;
import com.sqds.utils.StringUtils;
import com.sqds.utils.pdf.PdfDocumentGenerator;
import com.sqds.web.ParamUtils;
import com.sqds.web.Servlets;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 选房管理
 * Created by jmdf on 2018/9/5.
 */
@Controller
@RequestMapping("/cq/chooseHouse/*")
public class ChooseHouseController {

    @Resource
    private FamilyService familyService;
    @Resource
    private HouseService houseService;
    @Resource
    private AzProjectService azProjectService;
    @Resource
    private DataDictService dataDictService;
    @Resource
    private FamilyPersonService familyPersonService;

    /**
     * 选房入口
     * @param request
     * @param modelMap
     */
    @RequestMapping("chooseHouseList")
    public void chooseHouseList(HttpServletRequest request, ModelMap modelMap) {
        PageInfo<Family> pageInfo = new PageInfo<>();
        Servlets.initPageInfo(request,pageInfo);
        String departmentCode = GetCurrentUser.getLoginUser(request).getDepartment().getDepartmentCode();
        if (!departmentCode.equals("110")){
            pageInfo.addParameter("search_eq_string_bd",departmentCode);
        }
        //pageInfo.addParameter("search_eq_integer_rhStatus", DataStatus.LOCK.getIndex());
        pageInfo = familyService.familyList(pageInfo);
        modelMap.addAttribute("pageInfo",pageInfo);
        modelMap.addAttribute("departmentCode",departmentCode);
    }

    /**
     * 已选房源列表
     * @param request
     * @param modelMap
     */
    @RequestMapping("choosedHouseList")
    public void choosedHouseList(HttpServletRequest request, ModelMap modelMap) {
        PageInfo<Family> pageInfo = new PageInfo<>();
        Servlets.initPageInfo(request,pageInfo);
        String departmentCode = GetCurrentUser.getLoginUser(request).getDepartment().getDepartmentCode();
        if (!departmentCode.equals("110")){
            pageInfo.addParameter("search_eq_string_bd",departmentCode);
        }
        pageInfo = familyService.getChooseHouseList(pageInfo);
        Map<Integer, List<House>> houseListMap = Maps.newLinkedHashMap();
        for (Family family : pageInfo.getResult()) {
            Integer familyUuid = family.getId();
            List houseList = this.houseService.getHouseListByFamilyId(familyUuid);
            houseListMap.put(familyUuid, houseList);
        }

        modelMap.addAttribute("pageInfo",pageInfo);
        modelMap.addAttribute("houseListMap",houseListMap);
        modelMap.addAttribute("departmentCode",departmentCode);
    }

    /**
     * 进入选房详情页面
     * @param request
     * @param modelMap
     * @throws IllegalAccessException
     * @throws NoSuchMethodException
     * @throws InvocationTargetException
     */
    @RequestMapping("chooseHouse")
    public void chooseHouse(HttpServletRequest request,ModelMap modelMap) throws IllegalAccessException,NoSuchMethodException,InvocationTargetException {
        Integer familyId = ParamUtils.getInt(request, "familyId",0);
        Family family = this.familyService.get(familyId);
        Precondition.checkSqdsArguement(family != null,"数据错误！");

        //所有项目
        List<AzProject> azProjectList = this.azProjectService.getAzProjectList();
        modelMap.addAttribute("azProjectList", azProjectList);

        //Map<projectId,List<BuildNum>>
        Map<Integer, List<String>> projectBuildNumMap =  this.houseService.getBuildNum();

        //选房限制信息待定...
        //String message = "";

        modelMap.addAttribute("family",family);
        modelMap.addAttribute("projectBuildNumMap", projectBuildNumMap);
        modelMap.addAttribute("searchParams",request.getAttribute("searchParams"));
    }

    /**
     * 详情页面已选房源信息
     * @param request
     * @param modelMap
     */
    @RequestMapping("selectHouseInfo")
    public void selectHouseInfo(HttpServletRequest request,ModelMap modelMap){
        Integer familyId = ParamUtils.getInt(request, "familyId", 0);
        Family family = this.familyService.get(familyId);
        List<House> houseList = this.houseService.getHouseListByFamilyId(family.getId());

        //已选房总面积
        /*BigDecimal totalArea = new BigDecimal("0");
        for(House house:houseList){
            BigDecimal buildArea = house.getBuildArea();
            totalArea = totalArea.add(buildArea);
        }*/
        //modelMap.addAttribute("totalArea", totalArea);

        modelMap.addAttribute("houseList", houseList);
        modelMap.addAttribute("family", family);
    }

    /**
     * 电子选房加载楼盘图
     * @param request
     * @param modelMap
     */
    @RequestMapping("housePicChoose")
    public void housePicChoose(HttpServletRequest request, ModelMap modelMap) throws InvocationTargetException, IllegalAccessException, NoSuchMethodException {
        Integer projectUuid = ParamUtils.getInt(request, "projectUuid",0);//项目id
        String buildNum = ParamUtils.getString(request, "buildNum","");
        Integer familyUuid = ParamUtils.getInt(request, "familyUuid",0);//家庭id
        Family family = this.familyService.get(familyUuid);

        Map<String, String> houseTypeDataDictMap = this.dataDictService.getMapByParentAttributeNameForValue("户型");

        //单元  房号  居室
        Map<String, Map<String, String>> houseTypeMap = this.houseService.getHouseTypeByProjectIdAndBuildNum(projectUuid, buildNum);

        List<String> unitList = this.houseService.distinctUnit(projectUuid, buildNum);// 获取所有单元
        // 各个单元的最大房号<单元号，最大房号>
        Map<String, String> maxRoomByUnitMap = this.houseService.getMaxRoomByUnit(projectUuid, buildNum);
        // 最大楼层
        int maxFloor = this.houseService.getMaxFloor(projectUuid, buildNum);
        // 所有房源
        List<House> houseList = this.houseService.listHouse(projectUuid, buildNum);
        Map<String, House> houseMap = new HashMap<String, House>();// <单元-房号:house>
        if (Collections3.isNotEmpty(houseList) && houseList.size() > 0) {
            for (House house : houseList) {
                String code = house.getUnitNum() + "-" + house.getHouseNum();
                houseMap.put(code, house);
            }
        }
        List<DataDict> flagList = dataDictService.getDataDictList("房屋状态");
        List<DataDict> typeList = dataDictService.getDataDictList("户型");
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

        //查询已选房源
        List<House> choosedHouseList = this.houseService.getHouseListByFamilyId(family.getId());

        modelMap.addAttribute("unitList", unitList);
        modelMap.addAttribute("family", family);
        modelMap.addAttribute("maxRoomByUnitMap", maxRoomByUnitMap);
        modelMap.addAttribute("maxFloor", maxFloor);
        modelMap.addAttribute("houseMap", houseMap);
        modelMap.addAttribute("houseTypeMap", houseTypeMap);
        modelMap.addAttribute("houseTypeDataDictMap", houseTypeDataDictMap);
        modelMap.addAttribute("flagMap", flagMap);
        modelMap.addAttribute("typeMap", typeMap);
        modelMap.addAttribute("choosedHouseList", choosedHouseList);
    }

    /**
     * 房源信息弹出框
     * @param request
     * @param modelMap
     */
    @RequestMapping("houseInfo")
    public void houseInfo(HttpServletRequest request,ModelMap modelMap){
        Integer houseId = ParamUtils.getInt(request, "houseId", 0);//房源id
        House house = this.houseService.get(houseId);
        modelMap.addAttribute("house",house);
    }

    /**
     * 保存所选房源
     * @param request
     * @return
     */
    @RequestMapping("saveBuildInfo")
    @ResponseBody
    public synchronized Response saveBuildInfo(HttpServletRequest request){
        Integer familyId = ParamUtils.getInt(request, "familyUuid", 0);//家庭id
        Family family = this.familyService.get(familyId);
        Precondition.checkAjaxArguement(family != null,"1111","数据错误！");
        this.houseService.saveBuildInfo(request);
        return new Response();
    }

    @RequestMapping("setXfStatus")
    @ResponseBody
    public Response setXfStatus(HttpServletRequest request){
        Integer familyId = ParamUtils.getInt(request,"familyId",0);
        Family family = familyService.get(familyId);
        Precondition.checkAjaxArguement(family!=null,"1111","家庭数据有误");
        family.setXfStatus(2);
        familyService.save(family);
        return new Response();
    }

    /**
     * 入口加载下拉信息
     * @param request
     * @param response
     */
    @RequestMapping("ajaxFamilyInfo")
    @ResponseBody
    public void ajaxFamilyInfo(HttpServletRequest request,HttpServletResponse response) {
        String query = ParamUtils.getString(request,"query","");
        //List<Family> list = this.familyService.listByParam(query);
        //根据选房顺序号查家庭列表
        List<Family> list = this.familyService.listByXfNum(query);
        if (list == null || list.size() == 0) {
            return;
        }
        StringBuffer jsonstr = new StringBuffer();
        jsonstr.append("{query:'" + query + "',suggestions:[");
        int index = list.size();
        int i = 0;
        for (Family family : list) {
            String str = StringUtils.getNotNullString(family.getArea().getAreaName()) + "   "
                    + StringUtils.getNotNullString(family.getName())+ "    "
                    +StringUtils.getNotNullString(family.getFamilyCode())+"   "
                    +StringUtils.getNotNullString(String.valueOf(family.getXfNum()));
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
        if (family == null) {
            status = 2;
            message = "找不到该户数据，请检查输入内容是否正确";
        }

        if (family.getIsSpecialFamily() == SpecialStatus.YES1.getIndex()){
            status = 4;
            message = "该户为特殊家庭且已锁定，请联系管理员";
        }

        if (status == 1) {
            familyId = family.getId();
        }

        Map map = new HashMap();
        map.put("status", status);
        map.put("message", message);
        map.put("familyId", familyId);
        return map;
    }

    /**
     * 打印协议时间
     * @param request
     */
    @RequestMapping("getXyPrintDate")
    public void getXyPrintDate(HttpServletRequest request){
        Integer familyId = ParamUtils.getInt(request, "familyId", 0);//家庭id
        Family family = this.familyService.get(familyId);
        //保存协议第一次打印时间
        if(family.getXyPrintDate() == null){
            family.setXyPrintDate(new Date());
        }
        familyService.save(family);
    }
    /**
     * 打印认购协议
     * @param request
     * @param modelMap
     */
    @RequestMapping("printAgreement")
    public void printAgreement(HttpServletRequest request,ModelMap modelMap){
        Integer familyId = ParamUtils.getInt(request, "familyId", 0);//家庭id
        Family family = this.familyService.get(familyId);
        //计算实测面积下的购房款
        this.houseService.calculateHouseMoney(family.getId());
        modelMap.addAttribute("family",family);
    }

    /**
     * 打印认购协议
     *
     * @param request
     * @param response
     * @throws InvocationTargetException
     * @throws NoSuchMethodException
     * @throws NoSuchFieldException
     * @throws IllegalAccessException
     */
    @RequestMapping("printAgreementPDF")
    public void printAgreementPDF(HttpServletRequest request, HttpServletResponse response) throws InvocationTargetException, NoSuchMethodException, NoSuchFieldException, IllegalAccessException {
        Integer familyId = ParamUtils.getInt(request, "familyId", 0);//家庭id
        Family family = this.familyService.get(familyId);
        Precondition.checkAjaxArguement(family!=null,"1111","家庭数据有误");


        //将补偿协议展示的数据进行空值处理并封装到map中去
        List<House> houseList = this.houseService.getHouseListByFamilyId(family.getId());
        Map<String, String> houseTypeMap = this.dataDictService.getMapByParentAttributeNameForValue("户型");
        //实际选房购房款合计
        String totalHouseMoneyStr = NewMoneyUtils.number2CNMontrayUnit(BigDecimals.getNotNull(family.getTotalHouseMoney()));
        //协议房源购房款合计
        String gfMoneyStr = NewMoneyUtils.number2CNMontrayUnit(BigDecimals.getNotNull(family.getGfMoney()));
        //计算保存购房的平均价格
        BigDecimal averageHouseMoney = new BigDecimal("0.00");
        averageHouseMoney = BigDecimals.div(BigDecimals.getNotNull(family.getTotalHouseMoney()),BigDecimals.getNotNull(family.getAzArea()),2);
        family.setAverageHouseMoney(averageHouseMoney);
        this.familyService.save(family);

        Map<String, String> houseAreaMap = this.dataDictService.getMapByParentAttributeNameForValue("原始房屋面积");

        System.out.println(houseAreaMap.get(1780+"-"));
        //协议编号
        String agreementCode = "DHY-" + Strings.getNotNull(family.getSortCode());


        Map map = Maps.newHashMap();
        map.put("family",family);
        map.put("houseList", houseList);
        map.put("houseTypeMap", houseTypeMap);
        map.put("totalHouseMoneyStr", totalHouseMoneyStr);
        map.put("gfMoneyStr", gfMoneyStr);
        map.put("strings", new Strings());
        map.put("agreementCode", agreementCode);
        map.put("houseAreaMap", houseAreaMap);


        List<DataDict> contextList = this.dataDictService.getDataDictList("文本单据");

        String template = "";   //东河沿认购协议
        for (DataDict dataDict : contextList) {
            if (dataDict.getAttributeName().equals("东河沿认购协议")){
                template = dataDict.getAttributeValue();
            }
        }

        PdfDocumentGenerator pdfDocumentGenerator = new PdfDocumentGenerator();
        OutputStream outputStream = null;
        try {
            response.setHeader("Expires", "0");
            response.setHeader("Cache-Control", "must-revalidate, post-check=0, pre-check=0");
            outputStream = response.getOutputStream();
            pdfDocumentGenerator.generate(template, map, outputStream);
        } catch (IOException e) {

        } finally {

        }
    }

    /***********************************
     * 平移补助打印
     * @param request
     * @param response
     * @throws InvocationTargetException
     * @throws NoSuchMethodException
     * @throws NoSuchFieldException
     * @throws IllegalAccessException
     */
    @RequestMapping("printMovePDF")
    public void printMovePDF(HttpServletRequest request, HttpServletResponse response) throws InvocationTargetException, NoSuchMethodException, NoSuchFieldException, IllegalAccessException {
        Integer familyId = ParamUtils.getInt(request, "familyId", 0);//家庭id
        Family family = this.familyService.get(familyId);
        Precondition.checkAjaxArguement(family!=null,"1111","家庭数据有误");




        //协议编号
        String agreementCode = "DHY-" + Strings.getNotNull(family.getSortCode());

        //将补偿协议展示的数据进行空值处理并封装到map中去
        List<House> moveHouseList = this.houseService.getHouseListByMoveFamilyId(family.getId());
        BigDecimal area=new BigDecimal(0);
        BigDecimal houseFee=new BigDecimal(0);
        Map<String, String> movePriceMap = new HashMap<>();
        Map<String, String> moneyMap = new HashMap<>();
        if(moveHouseList!=null&&moveHouseList.size()>0){
            Map<String, String> moveMap = this.dataDictService.getMapByParentAttributeNameForValue("平移补助");
            for(House house : moveHouseList){
                if(StringUtils.isNotEmpty(house.getHouseNumAll())){
                    String[] str=house.getHouseNumAll().split("-");
                    String moveHouse=moveMap.get(str[0]+"-"+house.getBuildNum());
                    area=area.add(house.getBuildArea());
                    movePriceMap.put(house.getHouseNumAll() ,moveMap.get(str[0]+"-"+house.getBuildNum()));
                    String money=BigDecimals.getAreaNotZero(house.getBuildArea().multiply(new BigDecimal(moveHouse)).setScale(2,BigDecimal.ROUND_HALF_UP)) ;
                    moneyMap.put(house.getHouseNumAll() ,money);
                    houseFee=houseFee.add(new BigDecimal(money));
                    house.setMoveSubsidyFee(new BigDecimal(money));
                    this.houseService.save(house);
                }

            }
        }
        family.setMoveSubsidyFee(houseFee);
        this.familyService.save(family);


        Map map = Maps.newHashMap();
        map.put("family",family);
        map.put("strings", new Strings());
        map.put("agreementCode", agreementCode);
        map.put("movePrice", movePriceMap);
        map.put("moneyMap", moneyMap);
        map.put("moveHouseList", moveHouseList);
        map.put("total", moveHouseList.size());
        map.put("houseFee", BigDecimals.getAreaNotZero(houseFee));
        map.put("area", area);


        List<DataDict> contextList = this.dataDictService.getDataDictList("文本单据");

        String template = "";   //东河沿认购协议
        for (DataDict dataDict : contextList) {
            if (dataDict.getAttributeName().equals("平移补助通知")){
                template = dataDict.getAttributeValue();
            }
        }

        PdfDocumentGenerator pdfDocumentGenerator = new PdfDocumentGenerator();
        OutputStream outputStream = null;
        try {
            response.setHeader("Expires", "0");
            response.setHeader("Cache-Control", "must-revalidate, post-check=0, pre-check=0");
            outputStream = response.getOutputStream();
            pdfDocumentGenerator.generate(template, map, outputStream);
        } catch (IOException e) {

        } finally {

        }
    }


    /**
     * 设置签约状态
     * @param request
     * @return
     */
    @RequestMapping("setSignStatus")
    @ResponseBody
    public synchronized Response setSignStatus(HttpServletRequest request){
        Integer familyId = ParamUtils.getInt(request, "familyId", 0);
        Family family = this.familyService.get(familyId); //获取家庭

        Response response = new Response();
        if (family.getSignNum() != null) {
            response.setCode("1111");
            response.setMessage("该家庭已经获取了签约顺序号:请勿重复获取。");
            return response;
        }

        synchronized (this) {
            try {
                this.familyService.getSignNum(familyId,request);
                response.setCode("0000");
            } catch (Exception e) {
                response.setCode("2222");
                response.setMessage("获取顺序号出错!");
            }
            return response;
        }
    }

    /**
     * 删除已选房源
     */
    @RequestMapping("delHouseInfo")
    @ResponseBody
    public synchronized Response delHouseInfo(HttpServletRequest request){
        this.houseService.delHouseInfo(request);
        return new Response();
    }

    /**
     * 改选房源前，撤销选房状态
     */
    @RequestMapping("cancelXfStatus")
    @ResponseBody
    public Response cancelXfStatus(HttpServletRequest request){
        this.houseService.delHouseInfo(request);
        return new Response();
    }

    /**
     * 补录表单
     * @param request
     * @param modelMap
     */
    @RequestMapping("addForm")
    public void addForm(HttpServletRequest request, ModelMap modelMap){
        Integer familyId = ParamUtils.getInt(request, "familyId", 0);
        Family family = familyService.familyForm(familyId);
        Precondition.checkSqdsArguement(family!=null,"数据错误，请刷新重试！");

        //认购协议通讯地址
        String cAddress = null;
        //查询已选房源
        List<House> choosedHouseList = this.houseService.getHouseListByFamilyId(family.getId());
        if(Collections3.isNotEmpty(choosedHouseList)){
            House house = choosedHouseList.get(0);
            cAddress = StringUtils.getNotNullString(house.getAzProject().getProjectName()) + StringUtils.getNotNullString(house.getBuildNum()) + "号楼" + StringUtils.getNotNullString(house.getUnitNum()) + "单元" + StringUtils.getNotNullString(house.getHouseNum());
        }

        modelMap.addAttribute("family", family);
        modelMap.addAttribute("cAddress", cAddress);
    }

    /**
     * 保存补录表单
     */
    @RequestMapping("addSave")
    @ResponseBody
    public Response addSave(HttpServletRequest request) {
        Integer familyId = ParamUtils.getInt(request, "familyId", 0);
        String agreementCode = ParamUtils.getString(request, "agreementCode", "");
        String phone = ParamUtils.getString(request, "phone", "");
        String address = ParamUtils.getString(request, "address", "");
        String currentAddress = ParamUtils.getString(request, "currentAddress", "");
        Family family = familyService.get(familyId);
        Precondition.checkSqdsArguement(family!=null,"数据错误，请刷新重试！");
        family.setCurrentAddress(currentAddress);
        family.setAddress(address);
        family.setAgreementCode(agreementCode);
        family.setPhone(phone);
        this.familyService.save(family);
        return new Response();
    }

    /**
     * 计算方法(预测)
     */
    @RequestMapping("calcMethod")
    public String calcMethod(HttpServletRequest request) {
        PageInfo<Family> pageInfo = new PageInfo<>();
        Servlets.initPageInfo(request,pageInfo);
        pageInfo.setPageSize(Integer.MAX_VALUE);
        String departmentCode = GetCurrentUser.getLoginUser(request).getDepartment().getDepartmentCode();
        if (!departmentCode.equals("110")){
            pageInfo.addParameter("search_eq_string_bd",departmentCode);
        }
        pageInfo = familyService.getChooseHouseList(pageInfo);
        for (Family family : pageInfo.getResult()) {
            Integer familyUuid = family.getId();
            this.houseService.jmCalcHouseMoney(familyUuid);
        }

        return "redirect:choosedHouseList";
    }

    /**
     * 计算方法(实测)
     */
    @RequestMapping("scCalcMethod")
    public String scCalcMethod(HttpServletRequest request) {
        PageInfo<Family> pageInfo = new PageInfo<>();
        Servlets.initPageInfo(request,pageInfo);
        pageInfo.setPageSize(Integer.MAX_VALUE);
        String departmentCode = GetCurrentUser.getLoginUser(request).getDepartment().getDepartmentCode();
        if (!departmentCode.equals("110")){
            pageInfo.addParameter("search_eq_string_bd",departmentCode);
        }
        pageInfo = familyService.getChooseHouseList(pageInfo);
        for (Family family : pageInfo.getResult()) {
            Integer familyUuid = family.getId();
            List<House> moveHouseList = this.houseService.getHouseListByMoveFamilyId(family.getId());
            BigDecimal houseFee= new BigDecimal(0);
            for(House house:moveHouseList  ){
                 houseFee=houseFee.add(house.getMoveSubsidyFee());
            }

            family.setMoveSubsidyFee(houseFee);
            this.familyService.save(family);
        }

        return "redirect:choosedHouseList";
    }

    /**************************8
     * 2018023前签约平移家庭补助合计
     * @param request
     * @return
     */
    @RequestMapping("moveCalcMethod")
    public String moveCalcMethod(HttpServletRequest request) {
        PageInfo<Family> pageInfo = new PageInfo<>();
        Servlets.initPageInfo(request,pageInfo);
        pageInfo.setPageSize(Integer.MAX_VALUE);

        pageInfo.addParameter("search_eq_string_signStatus",2);
        pageInfo.addParameter("search_eq_string_isSpecial",1);

        pageInfo = familyService.getChooseHouseList(pageInfo);
        for (Family family : pageInfo.getResult()) {
            Integer familyUuid = family.getId();
            this.houseService.calculateHouseMoney(familyUuid);
        }

        return "redirect:choosedHouseList";
    }

    /**
     * 平移房源
     */
    /*@RequestMapping("changeHouseInfo")
    @ResponseBody
    public synchronized Response changeHouseInfo(HttpServletRequest request){
        this.houseService.changeHouseInfo(request);
        return new Response();
    }*/

    /**
     * 打印选房结果单
     */
    @RequestMapping("printChooseHouseResult")
    public void printChooseHouseResult(HttpServletRequest request,ModelMap modelMap){
        Integer familyId = ParamUtils.getInt(request, "familyId", 0);//家庭id
        Family family = this.familyService.get(familyId);
        modelMap.addAttribute("family",family);
    }

    /**
     * 选房结果单打印
     */
    @RequestMapping("chooseHouseResultPDF")
    public void chooseHouseResultPDF(HttpServletRequest request, HttpServletResponse response) throws InvocationTargetException, NoSuchMethodException, NoSuchFieldException, IllegalAccessException {
        Integer familyId = ParamUtils.getInt(request, "familyId", 0);//家庭id
        Family family = this.familyService.get(familyId);
        //将补偿协议展示的数据进行空值处理并封装到map中去
        List<House> houseList = this.houseService.getHouseListByFamilyId(family.getId());
        Integer index = houseList.size() + 9;
        Map<String, String> houseTypeMap = this.dataDictService.getMapByParentAttributeNameForValue("户型");
        Map map = Maps.newHashMap();
        map.put("family",family);
        map.put("chooseHouseDate", DateUtils.date2string("yyyy年MM月dd日",family.getXfDate()));
        map.put("houseList", houseList);
        map.put("houseTypeMap", houseTypeMap);
        map.put("index", index);
        List<DataDict> contextList = this.dataDictService.getDataDictList("文本单据");

        String template = "";   //选房结果单模板
        for (DataDict dataDict : contextList) {
            if (dataDict.getAttributeName().equals("东河沿选房结果单")){
                template = dataDict.getAttributeValue();
            }
        }

        PdfDocumentGenerator pdfDocumentGenerator = new PdfDocumentGenerator();
        OutputStream outputStream = null;
        try {
            response.setHeader("Expires", "0");
            response.setHeader("Cache-Control", "must-revalidate, post-check=0, pre-check=0");
            outputStream = response.getOutputStream();
            pdfDocumentGenerator.generate(template, map, outputStream);
        } catch (IOException e) {

        } finally {

        }
    }

    /**
     * 修改家庭成员信息
     * @param request
     * @param modelMap
     */
    @RequestMapping("addPeople")
    public void addPeople(HttpServletRequest request, ModelMap modelMap) {
        Integer familyId = ParamUtils.getInt(request,"familyId",0);
        Family family = this.familyService.get(familyId);
        Precondition.checkSqdsArguement(family != null,"数据错误！");
        modelMap.addAttribute("family", family);
        //申请人
        List<FamilyPerson> familyPersonList = this.familyPersonService.listByFamilyId(family.getId());
        modelMap.addAttribute("familyPersonList", familyPersonList);
        modelMap.addAttribute("searchParams", request.getAttribute("searchParams"));
    }

    /**
     * 保存家庭成员信息
     */
    @RequestMapping("save")
    public String save(HttpServletRequest request) {
        Integer familyId = ParamUtils.getInt(request, "familyId",0);
        Family family = this.familyService.get(familyId);
        Precondition.checkSqdsArguement(family != null,"数据错误！");
        this.familyService.saveFamily(request,family);
        return "redirect:chooseHouseList";
    }

}
