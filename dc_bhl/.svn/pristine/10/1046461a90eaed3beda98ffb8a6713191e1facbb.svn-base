package com.app.cq.web.cq.nonFamily;

import com.app.cq.model.Family;
import com.app.cq.model.NonFamily;
import com.app.cq.service.NonFamilyService;
import com.google.common.collect.Maps;
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
import java.util.Map;

/**
 * Created by lsh on 2018/5/7.
 * 非宅控制层
 */
@Controller
@RequestMapping("/cq/nonFamily/*")
public class NonFamilyController {

    @Autowired
    private NonFamilyService nonFamilyService;

    /**
     * 公共列表
     * @param request
     * @param modelMap
     */
    private void commonList(HttpServletRequest request,ModelMap modelMap){
        PageInfo<NonFamily> pageInfo = new PageInfo<>();
        Servlets.initPageInfo(request, pageInfo);
        pageInfo = nonFamilyService.getFamilyList(pageInfo);
        modelMap.addAttribute("pageInfo", pageInfo);
    }

    /**
     * 非宅信息列表
     *
     * @param request
     * @param modelMap
     */
    @RequestMapping("list")
    public void list(HttpServletRequest request, ModelMap modelMap) {
        this.commonList(request,modelMap);
    }

    /**
     * 非宅信息查看列表
     *
     * @param request
     * @param modelMap
     */
    @RequestMapping("viewList")
    public void viewList(HttpServletRequest request, ModelMap modelMap) {
        this.commonList(request,modelMap);
    }

    /**
     * 非宅数据表单页面
     *
     * @param request
     * @param modelMap
     */
    @RequestMapping("form")
    public void form(HttpServletRequest request, ModelMap modelMap) {
        Integer nonFamilyId = ParamUtils.getInt(request, "nonFamilyId", 0);
        NonFamily nonFamily = nonFamilyService.get(nonFamilyId);
        if (nonFamily == null) {
            nonFamily = new NonFamily();
        }
        modelMap.put("nonFamily", nonFamily);
    }

    /**
     * 家庭编号查重
     * @param request
     * @return
     */
    @RequestMapping("checkRepeat")
    @ResponseBody
    public boolean checkRepeat(ServletRequest request) {
        String familyCode = ParamUtils.getString(request, "familyCode", "");
        Integer nonFamilyId = ParamUtils.getInt(request, "nonFamilyId", 0);
        NonFamily family = this.nonFamilyService.checkRepeat(familyCode, nonFamilyId);
        if (family != null) {
            return false;
        } else {
            return true;
        }
    }

    /**
     * 非宅数据查看页面
     *
     * @param request
     * @param modelMap
     */
    @RequestMapping("view")
    public void view(HttpServletRequest request, ModelMap modelMap) {
        Integer nonFamilyId = ParamUtils.getInt(request, "nonFamilyId", 0);
        NonFamily nonFamily = nonFamilyService.get(nonFamilyId);
        modelMap.put("nonFamily", nonFamily);
    }

    /**
     * 非宅数据保存
     *
     * @param request
     * @return
     */
    @RequestMapping("save")
    public String save(HttpServletRequest request){
        Integer nonFamilyId = ParamUtils.getInt(request, "nonFamilyId", 0);
        NonFamily nonFamily = nonFamilyService.get(nonFamilyId);
        if (nonFamily == null) {
            nonFamily = new NonFamily();
        }
        Servlets.bind(request, nonFamily);
        this.nonFamilyService.save(nonFamily);
        return "redirect:list?" + request.getAttribute("searchParams");
    }

    /**
     * 删除信息
     *
     * @param request
     * @return
     */
    @RequestMapping("deleteNonFamily")
    @ResponseBody
    public Map<String, String> deleteNonFamily(HttpServletRequest request) {
        Integer nonFamilyId = ParamUtils.getInt(request, "nonFamilyId", 0);
        Map<String, String> map = Maps.newHashMap();
        try{
            this.nonFamilyService.delete(nonFamilyId);
            map.put("success","true");
            map.put("message","删除成功！");
        }catch (Exception e){
            map.put("success","false");
            map.put("message","删除失败！");
        }
        return map;
    }


    @RequestMapping("export")
    public void export(HttpServletRequest request,ModelMap modelMap) {
        PageInfo<NonFamily> pageInfo = new PageInfo<>();
        Servlets.initPageInfo(request, pageInfo);
        pageInfo = nonFamilyService.getFamilyList(pageInfo);
        modelMap.addAttribute("pageInfo", pageInfo);
    }
}
