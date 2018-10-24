package com.app.cq.web.cq;

import com.app.cq.model.ActionInfo;
import com.app.cq.model.Family;
import com.app.cq.service.ActionInfoService;
import com.app.cq.service.FamilyService;
import com.sqds.page.PageInfo;
import com.sqds.web.ParamUtils;
import com.sqds.web.Servlets;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by jmdf on 2018/8/10.
 */
@Controller
@RequestMapping("/cq/actionInfo/*")
public class ActionInfoController {
    @Resource
    private FamilyService familyService;
    @Resource
    private ActionInfoService actionInfoService;

    /**
     * 列表显示
     * @param request
     * @param modelMap
     */
    @RequestMapping("list")
    public void list(HttpServletRequest request, ModelMap modelMap){
        PageInfo<Family> pageInfo = new PageInfo<>();
        Servlets.initPageInfo(request,pageInfo);
        pageInfo = familyService.list(pageInfo);
        modelMap.put("pageInfo",pageInfo);
    }

    /**
     * 查看
     * @param request
     * @param modelMap
     */
    @RequestMapping("viewList")
    public void viewList(HttpServletRequest request,ModelMap modelMap){
        int familyId = ParamUtils.getInt(request,"familyId",0);
        PageInfo<ActionInfo> pageInfo = new PageInfo<>();
        Servlets.initPageInfo(request,pageInfo);
        pageInfo = actionInfoService.listByFamilyId(pageInfo,familyId);
        modelMap.addAttribute("pageInfo",pageInfo);
        modelMap.addAttribute("familyId",familyId);
    }
}
