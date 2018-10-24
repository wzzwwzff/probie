package com.app.cq.web.cq;

import com.app.cq.model.Family;
import com.app.cq.model.FamilyPerson;
import com.app.cq.service.FamilyPersonService;
import com.app.cq.service.FamilyService;
import com.app.cq.utils.GetCurrentUser;
import com.app.cq.vo.Response;
import com.app.permission.model.User;
import com.app.permission.utils.UserSession;
import com.sqds.page.PageInfo;
import com.sqds.web.ParamUtils;
import com.sqds.web.Servlets;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by lsh on 2018/2/5.
 * 管理员数据维护
 */
@Controller
@RequestMapping("/cq/dataAdmin/*")
public class DataAdminController {

    @Autowired
    private FamilyService familyService;
    @Autowired
    private FamilyPersonService familyPersonService;

    @RequestMapping("list")
    public void list(HttpServletRequest request, ModelMap modelMap){
        PageInfo<Family> pageInfo = new PageInfo<Family>();
        Servlets.initPageInfo(request,pageInfo);
        String departmentCode = GetCurrentUser.getLoginUser(request).getDepartment().getDepartmentCode();
        pageInfo.addParameter("search_like_string_f.groupCode",departmentCode);
        pageInfo = this.familyService.familyList(pageInfo);
        modelMap.addAttribute("pageInfo",pageInfo);
    }

    /**
     * 入户修改
     * @param request
     * @param modelMap
     */
    @RequestMapping("rhForm")
    public void rhForm(HttpServletRequest request, ModelMap modelMap){
        Integer familyId = ParamUtils.getInt(request,"familyId",0);
        Family family = familyService.get(familyId);
        List<FamilyPerson> familyPersonList = this.familyPersonService.listByFamilyId(family.getId());
        User user =  GetCurrentUser.getLoginUser(request);
        modelMap.addAttribute("family",family);
        modelMap.addAttribute("familyPersonList",familyPersonList);
        modelMap.addAttribute("departmentCode", user.getDepartment().getDepartmentCode());
        modelMap.addAttribute("pageName","rhForm");
    }


    /**
     * 测绘修改
     * @param request
     * @param modelMap
     */
    @RequestMapping("chForm")
    public void chForm(HttpServletRequest request, ModelMap modelMap){
        Integer familyId = ParamUtils.getInt(request,"familyId",0);
        Family family = familyService.get(familyId);
        User user =  GetCurrentUser.getLoginUser(request);
        modelMap.addAttribute("family",family);
        modelMap.addAttribute("departmentCode", user.getDepartment().getDepartmentCode());
        modelMap.addAttribute("pageName","chForm");
    }

    /**
     * 评估修改
     * @param request
     * @param modelMap
     */
    @RequestMapping("pgForm")
    public void pgForm(HttpServletRequest request, ModelMap modelMap){
        Integer familyId = ParamUtils.getInt(request,"familyId",0);
        Family family = familyService.get(familyId);
        User user =  GetCurrentUser.getLoginUser(request);
        modelMap.addAttribute("family",family);
        modelMap.addAttribute("departmentCode", user.getDepartment().getDepartmentCode());
        modelMap.addAttribute("pageName","pgForm");
    }


    /**
     * 方案修改
     * @param request
     * @param modelMap
     */
    @RequestMapping("faForm")
    public void faForm(HttpServletRequest request, ModelMap modelMap){
        Integer familyId = ParamUtils.getInt(request,"familyId",0);
        Family family = familyService.get(familyId);
        User user =  GetCurrentUser.getLoginUser(request);
        modelMap.addAttribute("family",family);
        modelMap.addAttribute("departmentCode", user.getDepartment().getDepartmentCode());
        modelMap.addAttribute("pageName","faForm");
    }

    @RequestMapping("rhSave")
    @ResponseBody
    public synchronized Response rhSave(HttpServletRequest request){
        Integer familyId = ParamUtils.getInt(request,"familyId",0);
        Family family = familyService.get(familyId);
        User user = UserSession.getUserFromSession(request);
        String ip = GetCurrentUser.getIpAddr(request);
        Servlets.bind(request,family);
        this.familyService.saveFamily(request,family,user.getUsername(),ip);
        return new Response();
    }

    @RequestMapping("chSave")
    @ResponseBody
    public synchronized Response chSave(HttpServletRequest request){
        Integer familyId = ParamUtils.getInt(request,"familyId",0);
        Family family = familyService.get(familyId);
        User user = GetCurrentUser.getLoginUser(request);
        String ip = GetCurrentUser.getIpAddr(request);
        Servlets.bind(request,family);
        this.familyService.savechFamily(family,user.getUsername(),ip);
        return new Response();
    }

    @RequestMapping("pgSave")
    @ResponseBody
    public synchronized Response pgSave(HttpServletRequest request){
        Integer familyId = ParamUtils.getInt(request,"familyId",0);
        Family family = familyService.get(familyId);
        User user = GetCurrentUser.getLoginUser(request);
        String ip = GetCurrentUser.getIpAddr(request);
        Servlets.bind(request,family);
        this.familyService.savepgFamily(family,user.getUsername(),ip);
        return new Response();
    }

    @RequestMapping("faSave")
    @ResponseBody
    public synchronized Response faSave(HttpServletRequest request){
        Integer familyId = ParamUtils.getInt(request,"familyId",0);
        Family family = familyService.get(familyId);
        User user = GetCurrentUser.getLoginUser(request);
        String ip = GetCurrentUser.getIpAddr(request);
        Servlets.bind(request,family);
        this.familyService.saveSchemeFamily(family,user.getUsername(),ip);
        return new Response();
    }
}
