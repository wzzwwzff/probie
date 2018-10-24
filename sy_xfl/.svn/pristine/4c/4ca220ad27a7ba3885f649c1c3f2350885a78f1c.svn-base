package com.app.cq.web.cq;

import com.alibaba.fastjson.JSON;
import com.app.cq.model.BackInfo;
import com.app.cq.model.Family;
import com.app.cq.model.FamilyPerson;
import com.app.cq.service.BackInfoService;
import com.app.cq.service.FamilyPersonService;
import com.app.cq.service.FamilyService;
import com.app.cq.utils.GetCurrentUser;
import com.app.permission.model.User;
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
 * 历史记录
 * @author yby
 * @date 2017/12/4
 */
@Controller
@RequestMapping("/cq/backInfo/*")
public class BackInfoController {
    @Autowired
    private BackInfoService backInfoService;
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
     * 查看
     * @param request
     * @param modelMap
     */
    @RequestMapping("viewTableList")
    public void viewTableList(HttpServletRequest request,ModelMap modelMap){
        int familyId = ParamUtils.getInt(request,"familyId",0);
        PageInfo<BackInfo> pageInfo = new PageInfo<>();
        Servlets.initPageInfo(request,pageInfo);
        pageInfo  = backInfoService.listByFamilyId(pageInfo,familyId);
        modelMap.addAttribute("pageInfo",pageInfo);
        modelMap.addAttribute("familyId",familyId);
    }

    /**
     * 列表显示
     * @param request
     * @param modelMap
     */
    @RequestMapping("view")
    public void view(HttpServletRequest request, ModelMap modelMap){
        int backInfoId = ParamUtils.getInt(request,"backInfoId",0);
        BackInfo backInfo = backInfoService.get(backInfoId);//历史表
        String name = backInfo.getName();
        List<FamilyPerson> familyPersonList = Lists.newArrayList();//历史表家庭成员信息
        Object backInfoFamily = null;//历史表家庭信息
        try {
            backInfoFamily = JSON.parseObject(backInfo.getData(), Family.class);
            familyPersonList = JSON.parseObject(backInfo.getPersonData(),List.class);
        } catch (Exception e){
            System.out.println("家庭原始数据解析失败：家庭Id" + backInfo.getFamily().getId());
        }
        modelMap.put("backInfo",backInfo);
        modelMap.put("family",backInfoFamily);
        modelMap.put("name",name);
        modelMap.put("familyPersonList",familyPersonList);
    }





}
