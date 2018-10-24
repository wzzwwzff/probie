package com.app.cq.web.cq.historyFamily;

import com.app.cq.model.HistoryFamily;
import com.app.cq.model.HistoryFamilyHouse;
import com.app.cq.model.HistoryFamilyPerson;
import com.app.cq.service.HistoryFamilyHouseService;
import com.app.cq.service.HistoryFamilyPersonService;
import com.app.cq.service.HistoryFamilyService;
import com.google.common.collect.Lists;
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
import java.util.List;
import java.util.Map;

/**
 * 历史签约管理
 * Created by ZYK on 2018/5/8.
 */
@Controller
@RequestMapping("/cq/historyFamily/*")
public class HistoryFamilyController {

    @Autowired
    private HistoryFamilyService historyFamilyService;
    @Autowired
    private HistoryFamilyPersonService historyFamilyPersonService;
    @Autowired
    private HistoryFamilyHouseService historyFamilyHouseService;

    /**
     * 公共列表
     * @param request
     * @param modelMap
     */
    private void commonList(HttpServletRequest request, ModelMap modelMap){
        PageInfo<HistoryFamily> pageInfo = new PageInfo<>();
        Servlets.initPageInfo(request, pageInfo);
        pageInfo = this.historyFamilyService.getFamilyList(pageInfo);
        modelMap.addAttribute("pageInfo", pageInfo);
    }

    /**
     * 历史签约家庭信息列表
     *
     * @param request
     * @param modelMap
     */
    @RequestMapping("list")
    public void list(HttpServletRequest request, ModelMap modelMap) {
        this.commonList(request,modelMap);
    }

    /**
     * 历史签约家庭信息查看列表
     *
     * @param request
     * @param modelMap
     */
    @RequestMapping("viewList")
    public void viewList(HttpServletRequest request, ModelMap modelMap) {
        this.commonList(request,modelMap);
    }

    /**
     * 历史签约家庭表单页面
     *
     * @param request
     * @param modelMap
     */
    @RequestMapping("form")
    public void form(HttpServletRequest request, ModelMap modelMap) {
        Integer historyFamilyId = ParamUtils.getInt(request, "historyFamilyId", 0);
        HistoryFamily historyFamily = historyFamilyService.get(historyFamilyId);
        List<HistoryFamilyPerson> historyFamilyPersonList = Lists.newArrayList();
        List<HistoryFamilyHouse> historyFamilyHouseList = Lists.newArrayList();
        if (historyFamily == null) {
            historyFamily = new HistoryFamily();
        }else {
            historyFamilyPersonList = this.historyFamilyPersonService.getPersonListByHistoryFamilyId(historyFamily.getId());
            historyFamilyHouseList = this.historyFamilyHouseService.getHouseListByHistoryFamilyId(historyFamily.getId());
        }
        modelMap.put("historyFamily", historyFamily);
        modelMap.put("historyFamilyPersonList", historyFamilyPersonList);
        modelMap.put("historyFamilyHouseList", historyFamilyHouseList);
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
        Integer historyFamilyId = ParamUtils.getInt(request, "historyFamilyId", 0);
        HistoryFamily historyFamily = this.historyFamilyService.checkRepeat(familyCode, historyFamilyId);
        if (historyFamily != null) {
            return false;
        } else {
            return true;
        }
    }

    /**
     * 历史签约家庭数据查看页面
     *
     * @param request
     * @param modelMap
     */
    @RequestMapping("view")
    public void view(HttpServletRequest request, ModelMap modelMap) {
        Integer historyFamilyId = ParamUtils.getInt(request, "historyFamilyId", 0);
        HistoryFamily historyFamily = historyFamilyService.get(historyFamilyId);
        List<HistoryFamilyPerson> historyFamilyPersonList = Lists.newArrayList();
        List<HistoryFamilyHouse> historyFamilyHouseList = Lists.newArrayList();
        historyFamilyPersonList = this.historyFamilyPersonService.getPersonListByHistoryFamilyId(historyFamily.getId());
        historyFamilyHouseList = this.historyFamilyHouseService.getHouseListByHistoryFamilyId(historyFamily.getId());
        modelMap.put("historyFamily", historyFamily);
        modelMap.put("historyFamilyPersonList", historyFamilyPersonList);
        modelMap.put("historyFamilyHouseList", historyFamilyHouseList);
    }

    /**
     * 历史签约数据保存
     *
     * @param request
     * @return
     */
    @RequestMapping("save")
    public String save(HttpServletRequest request){
        this.historyFamilyService.historyFamilySave(request);
        return "redirect:list?" + request.getAttribute("searchParams");
    }

    /**
     * 删除信息
     *
     * @param request
     * @return
     */
    @RequestMapping("deleteHistoryFamily")
    @ResponseBody
    public Map<String, String> deleteHistoryFamily(HttpServletRequest request) {
        Integer historyFamilyId = ParamUtils.getInt(request, "historyFamilyId", 0);
        HistoryFamily historyFamily = this.historyFamilyService.get(historyFamilyId);
        Map<String, String> map = Maps.newHashMap();
        try{
            this.historyFamilyPersonService.deletePersonByFamilyId(historyFamily.getId());
            this.historyFamilyService.delete(historyFamily.getId());
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
        PageInfo<HistoryFamily> pageInfo = new PageInfo<>();
        Servlets.initPageInfo(request, pageInfo);
        pageInfo = this.historyFamilyService.getFamilyList(pageInfo);
        Map<Integer,List<HistoryFamilyPerson>> historyFamilyPersonList = this.historyFamilyPersonService.getFamilyPersonList();
        modelMap.addAttribute("pageInfo", pageInfo);
        modelMap.addAttribute("historyFamilyPersonList", historyFamilyPersonList);
    }
}
