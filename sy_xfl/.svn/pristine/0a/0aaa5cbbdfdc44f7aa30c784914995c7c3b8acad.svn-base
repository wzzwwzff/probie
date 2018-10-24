package com.app.cq.web.cq;

import com.alibaba.fastjson.JSON;
import com.app.cq.model.ActionInfo;
import com.app.cq.model.BackInfo;
import com.app.cq.model.Family;
import com.app.cq.model.FamilyPerson;
import com.app.cq.service.ActionInfoService;
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
@RequestMapping("/cq/actionInfo/*")
public class ActionInfoController {
    @Autowired
    private ActionInfoService actionInfoService;
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
        PageInfo<ActionInfo> pageInfo = new PageInfo<>();
        Servlets.initPageInfo(request,pageInfo);
        pageInfo = actionInfoService.listByFamilyId(pageInfo,familyId);
        modelMap.addAttribute("pageInfo",pageInfo);
        modelMap.addAttribute("familyId",familyId);
    }


}
