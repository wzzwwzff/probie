package com.app.cq.web.cq.family;

import com.app.cq.en.Type;
import com.app.cq.model.*;
import com.app.cq.service.FamilyHousePersonService;
import com.app.cq.service.FamilyHouseService;
import com.app.cq.service.FamilyPersonService;
import com.app.cq.service.FamilyService;
import com.app.cq.utils.Precondition;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.sqds.utils.Collections3;
import com.sqds.web.ParamUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by ZYK on 2018/5/8.
 */
@Controller
@RequestMapping("/cq/family/common/view/*")
public class ViewMainController {

    @Autowired
    private FamilyService familyService;
    @Autowired
    private FamilyPersonService familyPersonService;
    @Autowired
    private FamilyHouseService familyHouseService;
    @Autowired
    private FamilyHousePersonService familyHousePersonService;

    @RequestMapping("main")
    public void main(HttpServletRequest request, ModelMap modelMap){
        Integer familyId = ParamUtils.getInt(request, "familyId", 0);
        Family family = this.familyService.get(familyId);
        Precondition.checkSqdsArguement(family != null,"未找到数据");
        List<FamilyPerson> familyPersonList1 = Lists.newArrayList();
        List<FamilyPerson> familyPersonList2 = Lists.newArrayList();
        List<FamilyHouse> familyHouseList = Lists.newArrayList();
        List<FamilyHousePerson> familyHousePersonList = Lists.newArrayList();
        Map<Integer,List<FamilyHousePerson>> familyHousePersonMap = Maps.newHashMap();
        //家庭成员列表
        familyPersonList1 = this.familyPersonService.getPersonListByFamilyId(family.getId(), Type.YES.getIndex());  //在本址
        familyPersonList2 = this.familyPersonService.getPersonListByFamilyId(family.getId(), Type.NO.getIndex());   //不在本址

        //如果该家庭存在标准自建房
        if (family.getHouseStatus() != null && family.getHouseStatus() == Type.YES.getIndex()){
            familyHouseList = this.familyHouseService.getFamilyHouseListByFamilyId(family.getId());   //标准自建房列表
            if (Collections3.isNotEmpty(familyHouseList)){
                for (FamilyHouse familyHouse : familyHouseList){
                    familyHousePersonList = this.familyHousePersonService.getFamilyHousePersonListByFamilyId(familyHouse.getId());
                    familyHousePersonMap.put(familyHouse.getId(),familyHousePersonList);
                }
            }
        }

        modelMap.addAttribute("family", family);
        modelMap.addAttribute("familyPersonList1", familyPersonList1);
        modelMap.addAttribute("familyPersonList2", familyPersonList2);
        modelMap.addAttribute("familyHouseList", familyHouseList);
        modelMap.addAttribute("familyHousePersonMap", familyHousePersonMap);
    }

    /**
     * 匡选单查看
     * @param request
     * @param modelMap
     */
    public void accountView(HttpServletRequest request,ModelMap modelMap){
        this.main(request,modelMap);
    }
    /**
     * 补偿协议查看
     * @param request
     * @param modelMap
     */
    public void bcxyView(HttpServletRequest request,ModelMap modelMap){
        this.main(request,modelMap);
    }
    /**
     * 匡选单查看
     * @param request
     * @param modelMap
     */
    public void buChongView(HttpServletRequest request,ModelMap modelMap){
        this.main(request,modelMap);
    }
}
