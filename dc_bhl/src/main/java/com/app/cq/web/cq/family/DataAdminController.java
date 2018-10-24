package com.app.cq.web.cq.family;

import com.app.cq.en.Type;
import com.app.cq.model.Family;
import com.app.cq.model.FamilyHouse;
import com.app.cq.model.FamilyHousePerson;
import com.app.cq.model.FamilyPerson;
import com.app.cq.service.FamilyHousePersonService;
import com.app.cq.service.FamilyHouseService;
import com.app.cq.service.FamilyPersonService;
import com.app.cq.service.FamilyService;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.sqds.page.PageInfo;
import com.sqds.web.ParamUtils;
import com.sqds.web.Servlets;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * 管理员基础数据维护
 * Created by ZYK on 2018/5/11.
 */
@Controller
@RequestMapping("/cq/family/dataAdmin/*")
public class DataAdminController {

    @Autowired
    private FamilyService familyService;
    @Autowired
    private FamilyPersonService familyPersonService;
    @Autowired
    private FamilyHouseService familyHouseService;
    @Autowired
    private FamilyHousePersonService familyHousePersonService;

    /**
     * 入户家庭列表
     * @param request
     * @param modelMap
     */
    @RequestMapping("list")
    public void list(HttpServletRequest request, ModelMap modelMap){
        PageInfo<Family> pageInfo = new PageInfo<>();
        Servlets.initPageInfo(request,pageInfo);
        pageInfo = this.familyService.getAllFamilyList(pageInfo);
        modelMap.addAttribute("pageInfo",pageInfo);
    }

    /**
     * 家庭信息登记
     * @param request
     * @param modelMap
     */
    @RequestMapping("form")
    public void form(HttpServletRequest request,ModelMap modelMap){
        Integer familyId = ParamUtils.getInt(request,"familyId",0);
        Family family = this.familyService.get(familyId);
        List<FamilyPerson> familyPersonList1 = Lists.newArrayList();
        List<FamilyPerson> familyPersonList2 = Lists.newArrayList();
        familyPersonList1 = this.familyPersonService.getPersonListByFamilyId(family.getId(), Type.YES.getIndex());
        familyPersonList2 = this.familyPersonService.getPersonListByFamilyId(family.getId(), Type.NO.getIndex());
        modelMap.addAttribute("family",family);
        modelMap.addAttribute("familyPersonList1",familyPersonList1);
        modelMap.addAttribute("familyPersonList2",familyPersonList2);
        modelMap.addAttribute("pageName","form");
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
        Integer familyId = ParamUtils.getInt(request, "familyId", 0);
        Family family = this.familyService.checkRepeat(familyCode, familyId);
        if (family != null) {
            return false;
        } else {
            return true;
        }
    }

    /**
     * 入户家庭信息保存
     * @param request
     * @return
     */
    @RequestMapping("familySave")
    @ResponseBody
    public Map<String,String> familySave(HttpServletRequest request){
        Map<String,String> map = Maps.newHashMap();
        Integer familyId = this.familyService.familySave(request);
        //计算方法
        map.put("success","true");
        map.put("message","保存成功！");
        return map;
    }

    /**
     * 评估数据修改
     * @param request
     * @param modelMap
     */
    @RequestMapping("pgForm")
    public void pgForm(HttpServletRequest request,ModelMap modelMap){
        Integer familyId = ParamUtils.getInt(request,"familyId",0);
        Family family = this.familyService.get(familyId);
        modelMap.addAttribute("family",family);
        modelMap.addAttribute("family",family);
        modelMap.addAttribute("pageName","pgForm");
    }

    /**
     * 家庭单表通用保存
     * @param request
     * @return
     */
    @RequestMapping("commonSave")
    @ResponseBody
    public synchronized Map<String,String> commonSave(HttpServletRequest request){
        Map<String,String> map = Maps.newHashMap();
        Integer familyId = ParamUtils.getInt(request,"familyId",0);
        Family family = this.familyService.get(familyId);
        Servlets.bind(request,family);
        this.familyService.save(family);
        map.put("success","true");
        map.put("message","保存成功！");
        return map;
    }

    /**
     * 标准自建房登记页面
     * @param request
     * @param modelMap
     */
    @RequestMapping("familyHouseForm")
    public void familyHouseForm(HttpServletRequest request,ModelMap modelMap){
        Integer familyId = ParamUtils.getInt(request,"familyId",0);
        Integer familyHouseId = ParamUtils.getInt(request,"familyHouseId",0);
        Family family = this.familyService.get(familyId);
        List<FamilyHouse> familyHouseList = Lists.newArrayList();
        List<FamilyHousePerson> familyHousePersonList = Lists.newArrayList();
        familyHouseList = this.familyHouseService.getFamilyHouseListByFamilyId(family.getId());
        FamilyHouse familyHouse = this.familyHouseService.get(familyHouseId);
        //从列表进入
        if (familyHouse == null){
            //该家庭还没有登记过标准自建
            if (familyHouseList.size() == 0){
                familyHouse = new FamilyHouse();
            }else {     //该家庭登记过标准自建，初始为第一个
                familyHouse = familyHouseList.get(0);
                familyHousePersonList = this.familyHousePersonService.getFamilyHousePersonListByFamilyId(familyHouse.getId());
            }
        }else {
            familyHousePersonList = this.familyHousePersonService.getFamilyHousePersonListByFamilyId(familyHouse.getId());
        }
        modelMap.addAttribute("family",family);
        modelMap.addAttribute("familyHouseList",familyHouseList);
        modelMap.addAttribute("familyHouse",familyHouse);
        modelMap.addAttribute("familyHousePersonList",familyHousePersonList);
    }

    /**
     * 标准自建房增加
     * @param request
     * @param modelMap
     */
    @RequestMapping("familyHouseAdd")
    public void familyHouseAdd(HttpServletRequest request,ModelMap modelMap){
        Integer familyId = ParamUtils.getInt(request,"familyId",0);
        Family family = this.familyService.get(familyId);
        List<FamilyHouse> familyHouseList = Lists.newArrayList();
        familyHouseList = this.familyHouseService.getFamilyHouseListByFamilyId(family.getId());
        FamilyHouse familyHouse = new FamilyHouse();
        modelMap.addAttribute("familyHouse",familyHouse);
        modelMap.addAttribute("family",family);
        modelMap.addAttribute("familyHouseList",familyHouseList);
    }

    /**
     * 标准自建房保存
     * @param request
     * @return
     */
    @RequestMapping("familyHouseSave")
    @ResponseBody
    public Map<String,String> familyHouseSave(HttpServletRequest request){
        Map<String,String> map = Maps.newHashMap();
        map = this.familyHouseService.familyHouseSave(request);
        return map;
    }

    /**
     * 标准自建房保存
     * @param request
     * @return
     */
    @RequestMapping("deleteFamilyHouse")
    @ResponseBody
    public Map<String,String> deleteFamilyHouse(HttpServletRequest request){
        Map<String,String> map = Maps.newHashMap();
        this.familyHouseService.deleteFamilyHouse(request);
        map.put("success","true");
        map.put("message","删除成功！");
        return map;
    }
}
