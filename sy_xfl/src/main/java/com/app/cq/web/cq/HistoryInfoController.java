package com.app.cq.web.cq;

import com.alibaba.fastjson.JSON;
import com.app.cq.model.Family;
import com.app.cq.model.FamilyPerson;
import com.app.cq.model.HistoryInfo;
import com.app.cq.service.FamilyPersonService;
import com.app.cq.service.FamilyService;
import com.app.cq.service.HistoryInfoService;
import com.app.cq.utils.GetCurrentUser;
import com.app.permission.model.User;
import com.app.permission.utils.UserSession;
import com.google.common.collect.Lists;
import com.sqds.page.PageInfo;
import com.sqds.web.ParamUtils;
import com.sqds.web.Servlets;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.validation.constraints.Max;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 历史记录
 * @author tsg
 * @date 2017/12/4
 */
@Controller
@RequestMapping("/cq/history/*")
public class HistoryInfoController {
    @Autowired
    private HistoryInfoService historyInfoService;
    @Autowired
    private FamilyPersonService familyPersonService;
    @Autowired
    private FamilyService familyService;


    /**
     * 列表显示
     * @param request
     * @param modelMap
     */
    @RequestMapping("list")
    public void list(HttpServletRequest request,ModelMap modelMap){
        PageInfo<Family> pageInfo = new PageInfo<>();
        Servlets.initPageInfo(request,pageInfo);
        User user = GetCurrentUser.getLoginUser(request);
        pageInfo.addParameter("search_like_string_f.groupCode",user.getDepartment().getDepartmentCode());
        pageInfo = familyService.familyList(pageInfo);
        modelMap.put("pageInfo",pageInfo);
    }

    /**
     * 列表显示
     * @param request
     * @param modelMap
     */
    @RequestMapping("view")
    public void view(HttpServletRequest request, ModelMap modelMap){
        int historyInfoId = ParamUtils.getInt(request,"historyInfoId",0);
        String name = familyService.get(historyInfoService.get(historyInfoId).getFamilyId()).getName();
        HistoryInfo historyInfo = historyInfoService.get(historyInfoId);//历史表
        List<FamilyPerson> familyPersonList = Lists.newArrayList();//历史表家庭成员信息
        Object historyFamily = null;//历史表家庭信息
        try {
            historyFamily = JSON.parseObject(historyInfo.getData(), Family.class);
            familyPersonList = JSON.parseObject(historyInfo.getPersonData(),List.class);
        } catch (Exception e){
            System.out.println("家庭原始数据解析失败：家庭Id" + historyInfo.getFamilyId());
        }
        modelMap.put("historyInfo",historyInfo);
        modelMap.put("family",historyFamily);
        modelMap.put("name",name);
        modelMap.put("familyPersonList",familyPersonList);
    }


    /**
     * 查看
     * @param request
     * @param modelMap
     */
    @RequestMapping("viewTableList")
    public void viewTableList(HttpServletRequest request,ModelMap modelMap){
        int familyId = ParamUtils.getInt(request,"familyId",0);
        PageInfo<HistoryInfo> pageInfo = new PageInfo<>();
        Servlets.initPageInfo(request,pageInfo);
        pageInfo = historyInfoService.listByFamilyId(pageInfo,familyId);
        modelMap.addAttribute("pageInfo", pageInfo);
        modelMap.addAttribute("familyId",familyId);
    }


}
