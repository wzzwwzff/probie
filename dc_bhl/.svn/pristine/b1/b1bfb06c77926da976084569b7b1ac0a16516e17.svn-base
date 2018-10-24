package com.app.cq.web.cq.family;

import com.alibaba.fastjson.JSON;
import com.app.cq.model.Family;
import com.app.cq.model.FamilyPerson;
import com.app.cq.model.HistoryInfo;
import com.app.cq.model.OperationInfo;
import com.app.cq.service.FamilyPersonService;
import com.app.cq.service.FamilyService;
import com.app.cq.service.HistoryInfoService;
import com.app.cq.service.OperationInfoService;
import com.google.common.collect.Lists;
import com.sqds.page.PageInfo;
import com.sqds.web.ParamUtils;
import com.sqds.web.Servlets;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 历史修改记录与操作记录查看
 * Created by ZYK on 2018/5/9.
 */
@Controller
@RequestMapping("/cq/family/historyInfo/*")
public class HistoryInfoController {

    @Autowired
    private HistoryInfoService historyInfoService;
    @Autowired
    private OperationInfoService operationInfoService;
    @Autowired
    private FamilyService familyService;
    @Autowired
    private FamilyPersonService familyPersonService;

    /**
     * 已入户家庭/已删除家庭
     * @param request
     * @param modelMap
     */
    @RequestMapping("list")
    public void list(HttpServletRequest request, ModelMap modelMap){
        Integer isValid = ParamUtils.getInt(request,"isValid",1);
        PageInfo<Family> pageInfo = new PageInfo<>();
        Servlets.initPageInfo(request,pageInfo);
        pageInfo = this.familyService.getFamilyList(pageInfo,isValid);
        modelMap.addAttribute("pageInfo",pageInfo);
        modelMap.addAttribute("isValid",isValid);
    }

    /**
     * 查看修改记录列表
     * @param request
     * @param modelMap
     */
    @RequestMapping("viewHistoryInfoList")
    public void viewHistoryInfoList(HttpServletRequest request,ModelMap modelMap){
        Integer familyId = ParamUtils.getInt(request,"familyId",0);
        Family family = this.familyService.get(familyId);
        List<HistoryInfo> historyInfoList = this.historyInfoService.listByFamilyId(familyId);
        modelMap.addAttribute("historyInfoList",historyInfoList);
        modelMap.addAttribute("family",family);
    }

    /**
     * 历史信息查看
     * @param request
     * @param modelMap
     */
    @RequestMapping("viewHistoryInfo")
    public void viewHistoryInfo(HttpServletRequest request,ModelMap modelMap){
        Integer historyInfoId = ParamUtils.getInt(request, "historyInfoId", 0);
        HistoryInfo historyInfo = historyInfoService.get(historyInfoId);
        List<FamilyPerson> familyPersonList = Lists.newArrayList();
        Object family = null;
        if (historyInfo != null) {
            try {
                family = JSON.parseObject(historyInfo.getData(), Family.class);
                familyPersonList = JSON.parseObject(historyInfo.getFamilyPersonData(), List.class);
            } catch (Exception e) {
                System.out.println("家庭原始数据解析失败：家庭Id" + historyInfo.getFamilyId());
            }
        }
        List<FamilyPerson> preFamilyPersonList = Lists.newArrayList();
        Object preFamily = null;
        Integer orderFlag = historyInfo.getOrderFlag() == null ? 1 : historyInfo.getOrderFlag();
        if (orderFlag == 1) {
            preFamily = family;
            preFamilyPersonList = familyPersonList;
        } else {
            orderFlag = orderFlag - 1;
            HistoryInfo historyInfo1 = historyInfoService.getByOrderFlag(historyInfo.getFamilyId(), orderFlag);
            if (historyInfo1 == null) {
                preFamily = new Family();
            } else {
                try {
                    preFamily = JSON.parseObject(historyInfo1.getData(), Family.class);
                    preFamilyPersonList = JSON.parseObject(historyInfo1.getFamilyPersonData(), List.class);
                } catch (Exception e) {
                    System.out.println("家庭原始数据解析失败：家庭Id" + historyInfo.getFamilyId());
                }
            }
        }
        modelMap.put("family",family);
        modelMap.put("preFamily",preFamily);
        modelMap.put("familyPersonList",familyPersonList);
        modelMap.put("preFamilyPersonList",preFamilyPersonList);
    }

    /**
     * 查看操作记录列表
     * @param request
     * @param modelMap
     */
    @RequestMapping("viewOperationInfoList")
    public void viewOperationInfoList(HttpServletRequest request,ModelMap modelMap){
        Integer familyId = ParamUtils.getInt(request,"familyId",0);
        Family family = this.familyService.get(familyId);
        List<OperationInfo> operationInfoList = Lists.newArrayList();
        operationInfoList = this.operationInfoService.getListByFamilyId(family.getId());
        modelMap.addAttribute("family",family);
        modelMap.addAttribute("operationInfoList",operationInfoList);
    }
}
