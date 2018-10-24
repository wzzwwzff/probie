package com.app.cq.web.cq;

import com.app.cq.exception.Precondition;
import com.app.cq.model.Contract;
import com.app.cq.model.Family;
import com.app.cq.model.FamilyPerson;
import com.app.cq.service.*;
import com.app.cq.vo.Response;
import com.sqds.exception.SqdsException;
import com.sqds.page.PageInfo;
import com.sqds.web.ParamUtils;
import com.sqds.web.Servlets;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * Created by jmdf on 2018/8/1.
 */
@Controller
@RequestMapping("/cq/family/*")
public class FamilyController {

    @Autowired
    private FamilyService familyService;
    @Autowired
    private FamilyPersonService familyPersonService;
    @Autowired
    private ActionInfoService actionInfoService;
    @Autowired
    private EducationService educationService;
    @Autowired
    private ContractService contractService;

    /**
     * 本市户籍家庭列表显示
     * @param request
     * @param modelMap
     */
    @RequestMapping("list")
    public void list(HttpServletRequest request, ModelMap modelMap){
        PageInfo<Family> pageInfo = new PageInfo<>();
        Servlets.initPageInfo(request, pageInfo);

        pageInfo = this.familyService.listThisCity(pageInfo, request);
        modelMap.addAttribute("pageInfo", pageInfo);
    }

    /**
     * 持有效证家庭信息列表显示
     * @param request
     * @param modelMap
     */
    @RequestMapping("holdList")
    public void holdList(HttpServletRequest request,ModelMap modelMap){
        PageInfo<Family> pageInfo = new PageInfo<Family>();
        Servlets.initPageInfo(request,pageInfo);
        pageInfo = this.familyService.listHold(pageInfo,request);
        modelMap.addAttribute("pageInfo",pageInfo);
    }

    /**
     *复核上报
     */
    @RequestMapping("checkHoldForm")
    public void checkHoldForm(HttpServletRequest request,ModelMap modelMap){
        this.checkForm(request,modelMap);
    }


    /**
     * 持有效证家庭信息列表显示
     * @param request
     * @param modelMap
     */
    @RequestMapping("holdForm")
    public void holdForm(HttpServletRequest request,ModelMap modelMap){
        this.form(request,modelMap);
    }


    /**
     * 数据上报
     */
    @RequestMapping("holdHandUp")
    @ResponseBody
    public Response holdHandUp(HttpServletRequest request, ModelMap modelMap) {
        Integer familyId = ParamUtils.getInteger(request, "familyId", 0);
        Family family = this.familyService.get(familyId);
        Precondition.checkSqdsArguement(family != null, "数据错误，请重试！");
        family.setDataStatus(2);
        this.familyService.save(family);

        //保存动作记录
        String operateType = "家庭数据上报";
        this.actionInfoService.saveActionInfo(family,operateType);
        return new Response();
    }


    /**
     * 保存表单
     */
    @RequestMapping("holdSave")
    public String holdSave(HttpServletRequest request, ModelMap modelMap) {
        Integer familyId = ParamUtils.getInt(request, "familyId", 0);
        String familyType = ParamUtils.getString(request, "familyType", "");
        Family family = familyService.get(familyId);
        if (family == null) {
            family = new Family();
        }
        family.setFamilyType(Integer.valueOf(familyType));
        Servlets.bind(request,family);
        this.familyService.saveFamily(request,family);
        return "redirect:holdList?" + request.getAttribute("searchParams");
    }

    /**
     * 查看页面
     * @param request
     * @param modelMap
     */
    @RequestMapping("view")
    public void view(HttpServletRequest request, ModelMap modelMap) {
        Integer familyId = ParamUtils.getInt(request, "familyId", 0);
        Family family = this.familyService.get(familyId);
        Precondition.checkSqdsArguement(family != null,"未找到数据");
        //家庭成员列表
        List<FamilyPerson> familyPersonList = this.familyPersonService.listByFamilyId(familyId);
        int count = familyPersonList.size();
        family.setCount(String.valueOf(count));
        Integer familyType = family.getFamilyType();
        modelMap.addAttribute("familyType", familyType);
        modelMap.addAttribute("family", family);
        modelMap.addAttribute("familyPersonList", familyPersonList);
    }


    /**
     * 表单
     */
    @RequestMapping("form")
    public void form(HttpServletRequest request, ModelMap modelMap) {
        Integer familyId = ParamUtils.getInt(request, "familyId", 0);
        Family family = this.familyService.get(familyId);
        family = family == null ? new Family() : family;
        List<FamilyPerson> familyPersonList = this.familyPersonService.listByFamilyId(familyId);

        modelMap.addAttribute("family", family);
        modelMap.addAttribute("familyPersonList", familyPersonList);
    }

    /**
     * 保存表单
     */
    @RequestMapping("save")
    public String save(HttpServletRequest request, ModelMap modelMap) {
        Integer familyId = ParamUtils.getInt(request, "familyId", 0);
        Family family = familyService.get(familyId);
        if (family == null) {
            family = new Family();
        }
        Servlets.bind(request,family);
        this.familyService.saveFamily(request,family);
        return "redirect:list?" + request.getAttribute("searchParams");
    }

    /**
     * 删除family及familyPerson
     * @param request
     * @return
     */
    @RequestMapping("delete")
    @ResponseBody
    public Map<String,String> delete(ServletRequest request){
        Map<String,String> map = new HashMap<String, String>();
        int id = ParamUtils.getInt(request,"familyId",0);
        Contract contract = this.contractService.getContractByfamilyid(id);
        if (contract != null){
            map.put("success","failed");
            map.put("message","此家庭有合同信息，不可删除");
            return map;
        }

        familyService.deleteByFamilyId(id);
        map.put("success","true");
        return map;
    }

    /**
     * 上报界面
     */
    @RequestMapping("checkForm")
    public void checkForm(HttpServletRequest request,ModelMap modelMap){
        this.form(request,modelMap);
    }

    /**
     * 数据上报
     */
    @RequestMapping("handUp")
    @ResponseBody
    public Response handUp(HttpServletRequest request, ModelMap modelMap) {
        Integer familyId = ParamUtils.getInteger(request, "familyId", 0);
        Family family = this.familyService.get(familyId);
        Precondition.checkSqdsArguement(family != null, "数据错误，请重试！");
        family.setDataStatus(2);
        this.familyService.save(family);

        //保存动作记录
        String operateType = "家庭数据上报";
        this.actionInfoService.saveActionInfo(family,operateType);
        return new Response();
    }


    /**
     * 撤销上报
     */
    @RequestMapping("cancelCheck")
    @ResponseBody
    public Response cancelCheck(HttpServletRequest request, ModelMap modelMap) {
        Integer familyId = ParamUtils.getInteger(request, "familyId", 0);
        Family family = this.familyService.get(familyId);
        Precondition.checkSqdsArguement(family != null, "数据错误，请重试！");
        family.setDataStatus(1);
        this.familyService.save(family);

        //保存动作记录
        String operateType = "家庭数据撤销上报";
        this.actionInfoService.saveActionInfo(family,operateType);
        return new Response();
    }


    /**
     * 驻京现役军人或武警家庭信息列表
     * @param request
     * @param modelMap
     */
    @RequestMapping("armyList")
    public void armyList(HttpServletRequest request,ModelMap modelMap){
        PageInfo<Family> pageInfo = new PageInfo<Family>();
        Servlets.initPageInfo(request,pageInfo);
        pageInfo = this.familyService.listArmy(pageInfo,request);
        modelMap.addAttribute("pageInfo",pageInfo);
    }

    /**
     *复核上报
     */
    @RequestMapping("checkArmyForm")
    public void checkArmyForm(HttpServletRequest request,ModelMap modelMap){
        this.checkForm(request,modelMap);
    }


    /**
     * 驻京现役军人或武警家庭信息列表
     * @param request
     * @param modelMap
     */
    @RequestMapping("armyForm")
    public void armyForm(HttpServletRequest request,ModelMap modelMap){
        this.form(request,modelMap);
    }


    /**
     * 数据上报
     */
    @RequestMapping("armyHandUp")
    @ResponseBody
    public Response armyHandUp(HttpServletRequest request, ModelMap modelMap) {
        Integer familyId = ParamUtils.getInteger(request, "familyId", 0);
        Family family = this.familyService.get(familyId);
        Precondition.checkSqdsArguement(family != null, "数据错误，请重试！");
        family.setDataStatus(2);
        this.familyService.save(family);

        //保存动作记录
        String operateType = "家庭数据上报";
        this.actionInfoService.saveActionInfo(family,operateType);
        return new Response();
    }


    /**
     * 保存表单
     */
    @RequestMapping("armySave")
    public String armySave(HttpServletRequest request, ModelMap modelMap) {
        Integer familyId = ParamUtils.getInt(request, "familyId", 0);
        String familyType = ParamUtils.getString(request, "familyType", "");
        Family family = familyService.get(familyId);
        if (family == null) {
            family = new Family();
        }
        family.setFamilyType(Integer.valueOf(familyType));
        Servlets.bind(request,family);
        this.familyService.saveFamily(request,family);
        return "redirect:armyList?" + request.getAttribute("searchParams");
    }



    /**
     * 驻京现役军人或武警家庭信息列表
     * @param request
     * @param modelMap
     */
    @RequestMapping("socialList")
    public void socialList(HttpServletRequest request,ModelMap modelMap){
        PageInfo<Family> pageInfo = new PageInfo<Family>();
        Servlets.initPageInfo(request,pageInfo);
        pageInfo = this.familyService.listSocial(pageInfo,request);
        modelMap.addAttribute("pageInfo",pageInfo);
    }

    /**
     *复核上报
     */
    @RequestMapping("checkSocialForm")
    public void checkSocialForm(HttpServletRequest request,ModelMap modelMap){
        this.checkForm(request,modelMap);
    }


    /**
     * 驻京现役军人或武警家庭信息列表
     * @param request
     * @param modelMap
     */
    @RequestMapping("socialForm")
    public void socialForm(HttpServletRequest request,ModelMap modelMap){
        this.form(request,modelMap);
    }


    /**
     * 数据上报
     */
    @RequestMapping("socialHandUp")
    @ResponseBody
    public Response socialHandUp(HttpServletRequest request, ModelMap modelMap) {
        Integer familyId = ParamUtils.getInteger(request, "familyId", 0);
        Family family = this.familyService.get(familyId);
        Precondition.checkSqdsArguement(family != null, "数据错误，请重试！");
        family.setDataStatus(2);
        this.familyService.save(family);

        //保存动作记录
        String operateType = "家庭数据上报";
        this.actionInfoService.saveActionInfo(family,operateType);
        return new Response();
    }


    /**
     * 保存表单
     */
    @RequestMapping("socialSave")
    public String socialSave(HttpServletRequest request, ModelMap modelMap) {
        Integer familyId = ParamUtils.getInt(request, "familyId", 0);
        String familyType = ParamUtils.getString(request, "familyType", "");
        Family family = familyService.get(familyId);
        if (family == null) {
            family = new Family();
        }
        family.setFamilyType(Integer.valueOf(familyType));
        Servlets.bind(request,family);
        this.familyService.saveFamily(request,family);
        return "redirect:socialList?" + request.getAttribute("searchParams");
    }


    /**
     * 驻京现役军人或武警家庭信息列表
     * @param request
     * @param modelMap
     */
    @RequestMapping("personalList")
    public void personalList(HttpServletRequest request,ModelMap modelMap){
        PageInfo<Family> pageInfo = new PageInfo<Family>();
        Servlets.initPageInfo(request,pageInfo);
        pageInfo = this.familyService.listPersonal(pageInfo,request);
        modelMap.addAttribute("pageInfo",pageInfo);
    }

    /**
     *复核上报
     */
    @RequestMapping("checkPersonalForm")
    public void checkPersonalForm(HttpServletRequest request,ModelMap modelMap){
        this.checkForm(request,modelMap);
    }


    /**
     * 驻京现役军人或武警家庭信息列表
     * @param request
     * @param modelMap
     */
    @RequestMapping("personalForm")
    public void personalForm(HttpServletRequest request,ModelMap modelMap){
        this.form(request,modelMap);
    }


    /**
     * 数据上报
     */
    @RequestMapping("personalHandUp")
    @ResponseBody
    public Response personalHandUp(HttpServletRequest request, ModelMap modelMap) {
        Integer familyId = ParamUtils.getInteger(request, "familyId", 0);
        Family family = this.familyService.get(familyId);
        Precondition.checkSqdsArguement(family != null, "数据错误，请重试！");
        family.setDataStatus(2);
        this.familyService.save(family);

        //保存动作记录
        String operateType = "家庭数据上报";
        this.actionInfoService.saveActionInfo(family,operateType);
        return new Response();
    }


    /**
     * 保存表单
     */
    @RequestMapping("personalSave")
    public String personalSave(HttpServletRequest request, ModelMap modelMap) {
        Integer familyId = ParamUtils.getInt(request, "familyId", 0);
        String familyType = ParamUtils.getString(request, "familyType", "");
        Family family = familyService.get(familyId);
        if (family == null) {
            family = new Family();
        }
        family.setFamilyType(Integer.valueOf(familyType));
        Servlets.bind(request,family);
        this.familyService.saveFamily(request,family);
        return "redirect:personalList?" + request.getAttribute("searchParams");
    }


    /**
     * 摇号结果查询信息列表
     * @param request
     * @param modelMap
     */
    @RequestMapping("searchList")
    public void searchList(HttpServletRequest request,ModelMap modelMap){
        PageInfo<Family> pageInfo = new PageInfo<Family>();
        Servlets.initPageInfo(request,pageInfo);
        pageInfo = this.familyService.listSearch(pageInfo,request);
        modelMap.addAttribute("pageInfo",pageInfo);
    }

    /**
     * 编号重复验证
     * @param request
     * @return
     */
    @RequestMapping("checkRepeat")
    @ResponseBody
    public boolean  checkRepeat(ServletRequest request){
        String familyCode = ParamUtils.getString(request,"familyCode","");
        Integer familyId = ParamUtils.getInt(request,"familyId",0);

        Family family = familyService.checkRepeat(familyCode, familyId);
        if (family != null) {
            return false;
        }else {
            return true;
        }
    }

    /**
     * 导出家庭
     */
    @RequestMapping("excelForm")
    public void excelForm(HttpServletRequest request, ModelMap modelMap) {
        PageInfo<Family> pageInfo = new PageInfo<Family>();
        pageInfo.setPageSize(Integer.MAX_VALUE);
        Servlets.initPageInfo(request, pageInfo);
        Integer familyType = ParamUtils.getInteger(request, "familyType", 0);
        if (familyType != null && familyType != 0){
            pageInfo = this.familyService.selectByFamilyType(pageInfo, familyType);
        }else {
            List<Family> families = this.familyService.listAll();
            pageInfo.setResult(families);
        }
        modelMap.addAttribute("pageInfo", pageInfo);
    }

    /**
     * 资格复核修改
     */
    @RequestMapping("checkStatusForm")
    public void checkStatusForm(HttpServletRequest request,ModelMap modelMap){
        this.form(request,modelMap);
    }

    /**
     * 资格复核保存表单
     */
    @RequestMapping("saveCheckStatus")
    public String saveCheckStatus(HttpServletRequest request, ModelMap modelMap) {
        Integer familyId = ParamUtils.getInt(request, "familyId", 0);
        Family family = familyService.get(familyId);
        if (family == null) {
            family = new Family();
        }
        Servlets.bind(request,family);
        this.familyService.saveFamily(request,family);
        return "redirect:/cq/audit/list?" + request.getAttribute("searchParams");
    }

    /**
     * 删除familyPerson
     */
    @RequestMapping("deleteFamilyPerson")
    public void deleteFamilyPerson(ServletRequest request){
        int familyPersonId = ParamUtils.getInt(request,"familyPersonId",0);
        if (familyPersonId == 0){
            throw new SqdsException("未找到此数据");
        }
        familyPersonService.delete(familyPersonId);
    }
}
