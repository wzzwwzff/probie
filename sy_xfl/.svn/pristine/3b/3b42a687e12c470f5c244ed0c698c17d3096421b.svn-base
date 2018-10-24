package com.app.cq.web.cq;

import com.alibaba.fastjson.JSON;
import com.app.cq.en.CheckState;
import com.app.cq.model.ActionInfo;
import com.app.cq.model.BackInfo;
import com.app.cq.model.Family;
import com.app.cq.model.FamilyPerson;
import com.app.cq.service.ActionInfoService;
import com.app.cq.service.BackInfoService;
import com.app.cq.service.FamilyPersonService;
import com.app.cq.service.FamilyService;
import com.app.cq.utils.BigDecimalUtils;
import com.app.cq.utils.CalcUtils;
import com.app.cq.utils.GetCurrentUser;
import com.app.cq.utils.Precondition;
import com.app.cq.vo.Response;
import com.app.permission.model.User;
import com.sqds.page.PageInfo;
import com.sqds.utils.StringUtils;
import com.sqds.web.ParamUtils;
import com.sqds.web.Servlets;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 审核管理
 * Created by zhaisj on 2018/1/2.
 */
@Controller
@RequestMapping("/cq/check/*")
public class CheckController {
    @Resource
    private FamilyService familyService;
    @Resource
    private FamilyPersonService familyPersonService;
    @Resource
    private BackInfoService backInfoService;
    @Resource
    private ActionInfoService actionInfoService;

    /*****************************************************************88
     * 初审
     * @param request
     * @param modelMap
     */
    @RequestMapping("list")
    public void  list(HttpServletRequest request, ModelMap modelMap){
        PageInfo<Family> pageInfo = new PageInfo<Family>();
        Servlets.initPageInfo(request, pageInfo);
        User user = GetCurrentUser.getLoginUser(request);

        pageInfo.addParameter("search_like_string_f.groupCode", user.getDepartment().getDepartmentCode());

        pageInfo = this.familyService.familyList(pageInfo);
        modelMap.addAttribute("pageInfo", pageInfo);
        modelMap.addAttribute("departmentCode", GetCurrentUser.getLoginUser(request).getDepartment().getDepartmentCode());
    }

    /********************************************************
     * 初审
     * @param request
     * @param modelMap
     */
    @RequestMapping("form")
    public void form(HttpServletRequest request,ModelMap modelMap){
        Integer familyId = ParamUtils.getInt(request,"familyId",0);
        Family family = familyService.get(familyId);

        Precondition.checkSqdsArguement(family != null, "数据错误，请重试！");

        BigDecimal pgTotal=BigDecimalUtils.getSum(family.getInqwFee(),family.getOutqwFee(),family.getFswFee(),family.getRealZxbzFee(),family.getFhbcfFee(),family.getKtjFee());

        List<FamilyPerson> familyPersonList = familyPersonService.listByFamilyId(familyId);
        String personStr = familyPersonService.getPersonStr(familyPersonList);
        String personOne = familyPersonService.getPersonOneStr(familyPersonList);
        String personNo = familyPersonService.getPersonNoStr(familyPersonList);
        String personPregnancy = familyPersonService.getPersonPregnancyStr(familyPersonList);


        modelMap.put("family",family);
        modelMap.put("familyPersonList",familyPersonList);
        modelMap.put("pgMoney",pgTotal);
        modelMap.put("personStr",personStr);
        modelMap.put("personOne",personOne);
        modelMap.put("personNo",personNo);
        modelMap.put("personPregnancy",personPregnancy);
    }

    /**
     * 初审、预审数据通过
     */
    @RequestMapping("handUp")
    @ResponseBody
    public Response handUp(HttpServletRequest request, ModelMap modelMap) {
        Integer familyId = ParamUtils.getInteger(request, "familyId", 0);
        String type = ParamUtils.getString(request, "type", "");
        Family family = this.familyService.get(familyId);

        Precondition.checkSqdsArguement(family != null, "数据错误，请重试！");
        if(type.equals("first")){
            String operateType = "";

            operateType = "数据初审通过";

            //初审数据通过
            family.setCheckState(CheckState.FIRSTCHECK.getIndex());
            //拆评测数据设置为已审核
            family.setCqState(3);
            family.setChState(3);
            family.setPgState(3);
            actionInfoService.saveActionInfo(family,operateType);
        }
        if(type.equals("sec")){
            String operateType = "";
            operateType = "数据预审通过";
            //预审数据通过
            family.setCheckState(CheckState.SECONDCHECK.getIndex());
            actionInfoService.saveActionInfo(family,operateType);
        }

        this.familyService.save(family);
        return new Response();
    }

    /**
     * 初审退回
     */
    @RequestMapping("formFirst")
    public void formFirst(HttpServletRequest request, ModelMap modelMap) {
        Integer familyId = ParamUtils.getInteger(request, "familyId", 0);
        Family family = this.familyService.get(familyId);
        Precondition.checkSqdsArguement(family != null, "该数据不存在！");
        modelMap.addAttribute("family", family);
        //每次新添加一条退回记录
    }

    /**
     * 初审退回
     */
    @RequestMapping("backData")
    @ResponseBody
    public Response backData(HttpServletRequest request, ModelMap modelMap) {
        Response response = new Response();
        backInfoService.saveBackData(request);
        return response;
    }




    /*****************************************************************88
     * 预审
     * @param request
     * @param modelMap
     */
    @RequestMapping("finaList")
    public void  finaList(HttpServletRequest request, ModelMap modelMap){
        this.list(request,modelMap);
    }

    /*********************************************
     * 预审
     * @param request
     * @param modelMap
     */
    @RequestMapping("finalForm")
    public void finalForm(HttpServletRequest request,ModelMap modelMap){
        this.form(request,modelMap);

    }

    /**
     * 预审退回
     */
    @RequestMapping("backDataSec")
    @ResponseBody
    public Response backDataSec(HttpServletRequest request, ModelMap modelMap) {
        Response response = new Response();
        this.backInfoService.saveBackDataSec(request);
        return new Response();
    }



}
