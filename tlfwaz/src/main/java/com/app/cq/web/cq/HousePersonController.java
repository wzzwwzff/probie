package com.app.cq.web.cq;

import com.app.common.model.DataDict;
import com.app.common.service.DataDictService;
import com.app.cq.exception.Precondition;
import com.app.cq.model.Family;
import com.app.cq.model.FamilyPerson;
import com.app.cq.model.House;
import com.app.cq.service.FamilyPersonService;
import com.app.cq.service.FamilyService;
import com.app.cq.service.HouseService;
import com.app.cq.utils.BigDecimals;
import com.app.cq.utils.NewMoneyUtils;
import com.app.cq.utils.RoundUtils;
import com.app.cq.utils.Strings;
import com.google.common.collect.Maps;
import com.sqds.page.PageInfo;
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
import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by lsh on 2018/3/1.
 */
@Controller
@RequestMapping("/cq/housePerson/*")
public class HousePersonController {
    @Resource
    private FamilyService familyService;
    @Resource
    private FamilyPersonService familyPersonService;
    @Resource
    private HouseService houseService;
    @Resource
    private DataDictService dataDictService;

    /**
     * 变更购房人入口
     */
    @RequestMapping("startList")
    public void startList(){

    }

    /**
     * 变更购房人管理列表
     *
     * @param request
     * @param modelMap
     */
    @RequestMapping("list")
    public void list(HttpServletRequest request, ModelMap modelMap) {
        PageInfo<Family> pageInfo = new PageInfo<>();
        Servlets.initPageInfo(request, pageInfo);
        pageInfo = this.familyService.getChooseHouseList(pageInfo);
        Map<Integer, List<House>> houseListMap = Maps.newLinkedHashMap();

        //是继承人的家庭成员信息
        Map<Integer, List<FamilyPerson>> familyPersonListMap = Maps.newLinkedHashMap();
        for (Family family : pageInfo.getResult()) {
            Integer familyUuid = family.getId();
            List houseList = this.houseService.getHouseListByFamilyId(familyUuid);
            houseListMap.put(familyUuid, houseList);
            List familyPersonList = this.familyPersonService.listByFamilyIdAndInheritType(familyUuid);
            familyPersonListMap.put(familyUuid, familyPersonList);
        }

        modelMap.addAttribute("pageInfo",pageInfo);
        modelMap.addAttribute("houseListMap",houseListMap);
        modelMap.addAttribute("familyPersonListMap",familyPersonListMap);
    }

    /**
     * 变更购房人信息管理
     * @param request
     * @param modelMap
     */
    @RequestMapping("form")
    public void form(HttpServletRequest request, ModelMap modelMap) {
        Integer familyId = ParamUtils.getInt(request,"familyId",0);
        Family family = this.familyService.get(familyId);
        Precondition.checkSqdsArguement(family != null,"数据错误！");
        modelMap.addAttribute("family", family);
        //申请人
        List<FamilyPerson> familyPersonList = this.familyPersonService.listByFamilyId(family.getId());
        modelMap.addAttribute("familyPersonList", familyPersonList);
        //实际安置选房信息
        List<House> houseList = this.houseService.getChooseHouseById(family.getId());
        modelMap.addAttribute("houseList", houseList);
    }

    /**
     * 变更购房人信息管理
     * @param request
     * @param modelMap
     */
    @RequestMapping("choosePeople")
    public void choosePeople(HttpServletRequest request, ModelMap modelMap) {
        Integer familyId = ParamUtils.getInt(request,"familyId",0);
        Integer houseId = ParamUtils.getInt(request,"houseId",0);
        Family family = this.familyService.get(familyId);
        Precondition.checkSqdsArguement(family != null,"数据错误！");
        modelMap.addAttribute("family", family);
        //申请人
        List<FamilyPerson> familyPersonList = this.familyPersonService.listByFamilyId(family.getId());
        modelMap.addAttribute("familyPersonList", familyPersonList);
        //实际安置选房信息
        House house = this.houseService.get(houseId);
        modelMap.addAttribute("house", house);
        modelMap.addAttribute("searchParams", request.getAttribute("searchParams"));
    }

    /**
     * 修改家庭成员信息
     * @param request
     * @param modelMap
     */
    @RequestMapping("addPeople")
    public void addPeople(HttpServletRequest request, ModelMap modelMap) {
        Integer familyId = ParamUtils.getInt(request,"familyId",0);
        Integer houseId = ParamUtils.getInt(request,"houseId",0);
        Family family = this.familyService.get(familyId);
        Precondition.checkSqdsArguement(family != null,"数据错误！");
        modelMap.addAttribute("family", family);
        //申请人
        List<FamilyPerson> familyPersonList = this.familyPersonService.listByFamilyId(family.getId());
        modelMap.addAttribute("familyPersonList", familyPersonList);
        modelMap.addAttribute("houseId", houseId);
        modelMap.addAttribute("searchParams", request.getAttribute("searchParams"));
    }

    /**
     * 保存家庭成员信息
     * @param request
     * @return
     */
    @RequestMapping("save")
    public String save(HttpServletRequest request) {
        Integer familyId = ParamUtils.getInt(request, "familyId",0);
        Integer houseId = ParamUtils.getInt(request, "houseId",0);
        Family family = this.familyService.get(familyId);
        Precondition.checkSqdsArguement(family != null,"数据错误！");
        this.familyService.saveFamily(request,family);
        return "redirect:choosePeople?familyId=" + familyId +"&houseId="+houseId;
    }

    /**
     * 保存变更购房人信息
     * @param request
     * @return
     */
    @RequestMapping("change")
    public String change(HttpServletRequest request) {
        Integer familyId = ParamUtils.getInt(request, "familyId",0);
        Integer houseId = ParamUtils.getInt(request, "houseId",0);
        String params=ParamUtils.getString(request,"params","");
        String type = "变更购房人";
        this.houseService.saveChangePerson(request,familyId,houseId,params,type);
        return "redirect:form?familyId=" + familyId;
    }

    /**
     * 保存变更继承人信息
     * @param request
     * @return
     */
    @RequestMapping("changeInheritType")
    @ResponseBody
    public Map changeInheritType(HttpServletRequest request) {
        Integer familyId = ParamUtils.getInt(request, "familyId",0);
        Integer houseId = ParamUtils.getInt(request, "houseId",0);
        String params=ParamUtils.getString(request,"params","");
        String type = "变更继承人";
        Map map = this.houseService.saveChangePerson(request, familyId, houseId, params, type);
        return map;
    }

    /**
     * 变更购房人信息导出
     * @param request
     * @param modelMap
     */
    @RequestMapping("export")
    public void export(HttpServletRequest request, ModelMap modelMap) {
        PageInfo<Family> pageInfo = new PageInfo<>();
        Servlets.initPageInfo(request, pageInfo);
        pageInfo.setPageSize(Integer.MAX_VALUE);
        pageInfo = familyService.getChooseHouseList(pageInfo);
        Map<Integer, List<House>> houseListMap = Maps.newLinkedHashMap();
        for (Family family : pageInfo.getResult()) {
            Integer familyUuid = family.getId();
            List houseList = this.houseService.getHouseListByFamilyId(familyUuid);
            houseListMap.put(familyUuid, houseList);
        }

        modelMap.addAttribute("pageInfo",pageInfo);
        modelMap.addAttribute("houseListMap",houseListMap);
    }


    /**
     * 打印认购协议
     * @param request
     * @param modelMap
     */
    @RequestMapping("printAgreement")
    public void printAgreement(HttpServletRequest request,ModelMap modelMap){
        Integer familyId = ParamUtils.getInt(request, "familyId", 0);//家庭id
        Integer houseId = ParamUtils.getInt(request, "houseId", 0);//房源id
        Family family = this.familyService.get(familyId);
        modelMap.addAttribute("family",family);
        modelMap.addAttribute("houseId",houseId);
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
        Integer houseId = ParamUtils.getInt(request, "houseId", 0);//房源id
        Family family = this.familyService.get(familyId);
        Precondition.checkAjaxArguement(family!=null,"1111","家庭数据有误");

        //将补偿协议展示的数据进行空值处理并封装到map中去
        House house = this.houseService.get(houseId);
        Precondition.checkAjaxArguement(house!=null,"1111","房源数据有误");

        Map<String, String> houseTypeMap = this.dataDictService.getMapByParentAttributeNameForValue("户型");
        BigDecimal totalHouseMoney = new BigDecimal("0.00");
        //购房款四舍五入取整
        List<House> houseList = houseService.getHouseListByFamilyId(familyId);
        int houseListSize = houseList.size();

        totalHouseMoney = RoundUtils.sswrzs(BigDecimals.getBigAndBigMul(BigDecimals.getNotNull(family.getAverageHouseMoney()),BigDecimals.getNotNull(house.getSjBuildArea())));
        for (int i = 0; i <houseList.size() ; i++) {
            if (houseList.get(houseListSize - 1).getId().equals(houseId)){//如果是最后一个房子
                BigDecimal total = new BigDecimal(0);
                for (House house1:houseList) {
                    total = BigDecimals.getSum(house1.getPrice(),total);
                }
                totalHouseMoney = BigDecimals.getBigAndBigSub(BigDecimals.getNotNull(family.getTotalHouseSjMoney()),total);
            }
        }
        //保存到房源信息里
        house.setPrice(totalHouseMoney);
        this.houseService.save(house);
        //实际选房购房款合计
        String totalHouseMoneyStr = NewMoneyUtils.number2CNMontrayUnit(totalHouseMoney);
        String size = null;
        if (houseListSize > 1){
            size = "-" + houseListSize;
        }
        //协议编号
        String agreementCode = "DHY-" + Strings.getNotNull(family.getSortCode()) + size;

        //处理多个人的联系电话
        String phone ="";
        String hPerson = house.gethPerson() == null ? "" : house.gethPerson();

        if(hPerson.equals(StringUtils.getNotNullString(family.getName()))){//如果是本人的话，电话号码是基础信息里的电话
            phone = StringUtils.getNotNullString(family.getPhone());
        }else {//否则电话是家庭成员的联系电话的组合
            List<String> personNameList = new ArrayList<>();
            if (hPerson.contains(",")){
                String[] hPersonListSplit = hPerson.split(",");
                for (int i = 0; i <hPersonListSplit.length ; i++) {
                    personNameList.add(hPersonListSplit[i]);
                }
            }else {
                personNameList.add(hPerson);
            }
            //申请人
            List<FamilyPerson> familyPersonList = this.familyPersonService.listByFamilyId(family.getId());
            List<FamilyPerson> personList = new ArrayList<>();
            if (!hPerson.equals("")){
                for (String personName:personNameList) {
                    for (int i = 0; i <familyPersonList.size() ; i++) {
                        if (familyPersonList.get(i).getpName().equals(personName)){
                            phone = phone + " " + (familyPersonList.get(i).getpPhone());
                        }
                    }
                }
            }
        }

        Map map = Maps.newHashMap();
        map.put("family",family);
        map.put("house", house);
        map.put("houseTypeMap", houseTypeMap);
        map.put("totalHouseMoneyStr", totalHouseMoneyStr);
        map.put("totalHouseMoney", totalHouseMoney);
        map.put("strings", new Strings());
        map.put("agreementCode", agreementCode);
        map.put("phone", phone);


        List<DataDict> contextList = this.dataDictService.getDataDictList("文本单据");

        String template = "";   //东河沿认购协议
        for (DataDict dataDict : contextList) {
            if (dataDict.getAttributeName().equals("东河沿认购协议（变更后购房人）")){
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
     * 打印变更购房人结果单
     * @param request
     * @param modelMap
     */
    @RequestMapping("printResult")
    public void printResult(HttpServletRequest request,ModelMap modelMap){
        Integer familyId = ParamUtils.getInt(request, "familyId", 0);//家庭id
        Integer houseId = ParamUtils.getInt(request, "houseId", 0);//房源id
        Family family = this.familyService.get(familyId);
        modelMap.addAttribute("family",family);
        modelMap.addAttribute("houseId",houseId);
    }

    /**
     * 打印变更购房人结果单
     *
     * @param request
     * @param response
     * @throws InvocationTargetException
     * @throws NoSuchMethodException
     * @throws NoSuchFieldException
     * @throws IllegalAccessException
     */
    @RequestMapping("printResultPDF")
    public void printResultPDF(HttpServletRequest request, HttpServletResponse response) throws InvocationTargetException, NoSuchMethodException, NoSuchFieldException, IllegalAccessException {
        Integer familyId = ParamUtils.getInt(request, "familyId", 0);//家庭id
        Integer houseId = ParamUtils.getInt(request, "houseId", 0);//房源id
        Family family = this.familyService.get(familyId);
        Precondition.checkAjaxArguement(family!=null,"1111","家庭数据有误");


        //将补偿协议展示的数据进行空值处理并封装到map中去
        House house = this.houseService.get(houseId);
        Precondition.checkAjaxArguement(house!=null,"1111","房源数据有误");

        Map<String, String> houseTypeMap = this.dataDictService.getMapByParentAttributeNameForValue("户型");

        Map map = Maps.newHashMap();
        map.put("family",family);
        map.put("house", house);
        map.put("houseTypeMap", houseTypeMap);
        map.put("strings", new Strings());


        List<DataDict> contextList = this.dataDictService.getDataDictList("文本单据");

        String template = "";   //东河沿认购协议
        for (DataDict dataDict : contextList) {
            if (dataDict.getAttributeName().equals("东河沿变更购房人结果通知单")){
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
     * 打印变更购房人申请书
     * @param request
     * @param modelMap
     */
    @RequestMapping("printApply")
    public void printApply(HttpServletRequest request,ModelMap modelMap){
        Integer familyId = ParamUtils.getInt(request, "familyId", 0);//家庭id
        Integer houseId = ParamUtils.getInt(request, "houseId", 0);//房源id
        Family family = this.familyService.get(familyId);
        modelMap.addAttribute("family",family);
        modelMap.addAttribute("houseId",houseId);
    }

    /**
     * 打印变更购房人申请书
     *
     * @param request
     * @param response
     * @throws InvocationTargetException
     * @throws NoSuchMethodException
     * @throws NoSuchFieldException
     * @throws IllegalAccessException
     */
    @RequestMapping("printApplyPDF")
    public void printApplyPDF(HttpServletRequest request, HttpServletResponse response) throws InvocationTargetException, NoSuchMethodException, NoSuchFieldException, IllegalAccessException {
        Integer familyId = ParamUtils.getInt(request, "familyId", 0);//家庭id
        Integer houseId = ParamUtils.getInt(request, "houseId", 0);//房源id
        Family family = this.familyService.get(familyId);
        Precondition.checkAjaxArguement(family!=null,"1111","家庭数据有误");


        //将补偿协议展示的数据进行空值处理并封装到map中去
        House house = this.houseService.get(houseId);
        Precondition.checkAjaxArguement(house!=null,"2222","房源数据有误");
        List<String> personNameList = new ArrayList<>();
        List<FamilyPerson> familyPersonList = this.familyPersonService.listByFamilyId(family.getId());
        Precondition.checkAjaxArguement(familyPersonList!=null,"3333","家庭成员信息有误");

        String hPerson = house.gethPerson() == null ? "" : house.gethPerson();

        //双方关系
        String pRelation = "";
        if(hPerson.equals(Strings.getNotNull(family.getName()))){//如果变更购房人后的产权人为本人
            pRelation = "本人";
        }else {
            //处理变更后是多个人的情况
            if (hPerson.contains(",")){
                String[] hPersonListSplit = hPerson.split(",");
                for (int i = 0; i <hPersonListSplit.length ; i++) {
                    personNameList.add(hPersonListSplit[i]);
                }
            }else {
                personNameList.add(hPerson);
            }
            if (!hPerson.equals("")){
                for (String personName:personNameList) {
                    for (int i = 0; i <familyPersonList.size() ; i++) {
                        if (familyPersonList.get(i).getpName().equals(personName)){
                            pRelation = pRelation + " " + StringUtils.getNotNullString(familyPersonList.get(i).getpRelation()) ;
                        }
                    }
                }
            }
        }

        Map<String, String> houseTypeMap = this.dataDictService.getMapByParentAttributeNameForValue("户型");

        Map map = Maps.newHashMap();
        map.put("family",family);
        map.put("house", house);
        map.put("houseTypeMap", houseTypeMap);
        map.put("strings", new Strings());
        map.put("pRelation", pRelation);


        List<DataDict> contextList = this.dataDictService.getDataDictList("文本单据");

        String template = "";   //东河沿认购协议
        for (DataDict dataDict : contextList) {
            if (dataDict.getAttributeName().equals("东河沿变更购房人申请书")){
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
     * 打印变更购房人申请书(继承)
     * @param request
     * @param modelMap
     */
    @RequestMapping("printApply2")
    public void printApply2(HttpServletRequest request,ModelMap modelMap){
        Integer familyId = ParamUtils.getInt(request, "familyId", 0);//家庭id
        Integer houseId = ParamUtils.getInt(request, "houseId", 0);//房源id
        Family family = this.familyService.get(familyId);
        modelMap.addAttribute("family",family);
        modelMap.addAttribute("houseId",houseId);
    }

    /**
     * 打印变更购房人申请书(继承)
     *
     * @param request
     * @param response
     * @throws InvocationTargetException
     * @throws NoSuchMethodException
     * @throws NoSuchFieldException
     * @throws IllegalAccessException
     */
    @RequestMapping("printApply2PDF")
    public void printApply2PDF(HttpServletRequest request, HttpServletResponse response) throws InvocationTargetException, NoSuchMethodException, NoSuchFieldException, IllegalAccessException {
        Integer familyId = ParamUtils.getInt(request, "familyId", 0);//家庭id
        Integer houseId = ParamUtils.getInt(request, "houseId", 0);//房源id
        Family family = this.familyService.get(familyId);
        Precondition.checkAjaxArguement(family!=null,"1111","家庭数据有误");


        //将补偿协议展示的数据进行空值处理并封装到map中去
        House house = this.houseService.get(houseId);
        Precondition.checkAjaxArguement(house!=null,"1111","房源数据有误");

        Map<String, String> houseTypeMap = this.dataDictService.getMapByParentAttributeNameForValue("户型");

        List familyPersonList = this.familyPersonService.listByFamilyIdAndInheritType(family.getId());
        Precondition.checkAjaxArguement(familyPersonList.size() != 0,"1111","家庭成员信息有误");


        Map map = Maps.newHashMap();
        map.put("family",family);
        map.put("house", house);
        map.put("familyPersonList", familyPersonList);
        map.put("houseTypeMap", houseTypeMap);
        map.put("strings", new Strings());


        List<DataDict> contextList = this.dataDictService.getDataDictList("文本单据");

        String template = "";   //东河沿认购协议
        for (DataDict dataDict : contextList) {
            if (dataDict.getAttributeName().equals("东河沿变更购房人申请书（继承）")){
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
     * 变更购房人审核列表
     *
     * @param request
     * @param modelMap
     */
    @RequestMapping("inheritList")
    public void inheritList(HttpServletRequest request, ModelMap modelMap) {
        this.list(request,modelMap);
    }

    /**
     * 变更继承人审核表单
     * @param request
     * @param modelMap
     */
    @RequestMapping("inheritForm")
    public void inheritForm(HttpServletRequest request, ModelMap modelMap) {
        Integer familyId = ParamUtils.getInt(request,"familyId",0);
        Integer houseId = ParamUtils.getInt(request,"houseId",0);
        Family family = this.familyService.get(familyId);
        Precondition.checkSqdsArguement(family != null,"数据错误！");
        modelMap.addAttribute("family", family);

        //实际安置选房信息
        House house = this.houseService.get(houseId);
        Precondition.checkSqdsArguement(house != null,"房源数据错误，请重试！");
        String hPerson = house.gethPerson() == null ? "" : house.gethPerson();
        List<String> personNameList = new ArrayList<>();
        if (hPerson.contains(",")){
            String[] hPersonListSplit = hPerson.split(",");
            for (int i = 0; i <hPersonListSplit.length ; i++) {
                personNameList.add(hPersonListSplit[i]);
            }
        }else {
            personNameList.add(hPerson);
        }
        //申请人
        List<FamilyPerson> familyPersonList = this.familyPersonService.listByFamilyId(family.getId());
        List<FamilyPerson> personList = new ArrayList<>();
        if (!hPerson.equals("")){
            for (String personName:personNameList) {
                for (int i = 0; i <familyPersonList.size() ; i++) {
                    if (familyPersonList.get(i).getpName().equals(personName)){
                        personList.add(familyPersonList.get(i));
                    }
                }
            }
        }
        modelMap.addAttribute("house", house);
        modelMap.addAttribute("personList", personList);
        modelMap.addAttribute("searchParams", request.getAttribute("searchParams"));
    }

    /**
     * 变更继承人审核
     */
    @RequestMapping("checkPassword")
    @ResponseBody
    public Map checkPassword(HttpServletRequest request) {
        Integer familyId = ParamUtils.getInt(request,"familyId",0);
        Integer houseId = ParamUtils.getInt(request,"houseId",0);
        String reasonCs = ParamUtils.getString(request,"passwordText","");
        Family family = this.familyService.get(familyId);
        Precondition.checkSqdsArguement(family != null,"数据错误！");
        House house = this.houseService.get(houseId);
        Precondition.checkSqdsArguement(house != null,"数据错误！");

        Map<String,String> map = new HashMap<>();
        if (house.getInheritPassword().equals(reasonCs.trim())){
            house.setInheritStatus(1);
            houseService.save(house);
            map.put("success","true");
            map.put("message","审核通过");
        }else {
            map.put("success","false");
            map.put("message","密码错误请核验");
        }

        return map;
    }

    /**
     * 协议打印跳转
     * @param request
     * @param modelMap
     */
    @RequestMapping("printContracts")
    public void printContracts(HttpServletRequest request,ModelMap modelMap){
        Integer familyId = ParamUtils.getInt(request,"familyId",0);
        Integer houseId = ParamUtils.getInt(request,"houseId",0);

        Family family = this.familyService.get(familyId);
        House house = this.houseService.get(houseId);

        Precondition.checkSqdsArguement(family!= null , "数据有误");
        //Precondition.checkSqdsArguement(house!= null , "数据有误");
        modelMap.addAttribute("family",family);
        modelMap.addAttribute("house",house);
    }

}
