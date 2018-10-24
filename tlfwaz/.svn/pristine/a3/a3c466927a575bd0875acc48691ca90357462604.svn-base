package com.app.cq.web.cq.common;

import com.app.cq.exception.Precondition;
import com.app.cq.model.Family;
import com.app.cq.model.FamilyPerson;
import com.app.cq.model.House;
import com.app.cq.service.FamilyPersonService;
import com.app.cq.service.FamilyService;
import com.app.cq.service.HouseService;
import com.sqds.web.ParamUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 公共查看管理
 * Created by jmdf on 2018/9/9.
 */
@Controller
@RequestMapping("/cq/common/view/*")
public class AllViewController {

    @Autowired
    private FamilyService familyService;
    @Autowired
    private FamilyPersonService familyPersonService;
    @Autowired
    private HouseService houseService;

    /**
     * 查看主页面
     * @param request
     * @param modelMap
     */
    @RequestMapping("main")
    public void main(HttpServletRequest request, ModelMap modelMap) {
        Integer familyId = ParamUtils.getInt(request, "familyId", 0);
        Family family = this.familyService.get(familyId);
        Precondition.checkSqdsArguement(family != null,"未找到数据");
        //家庭成员列表
        List<FamilyPerson> familyPersonList = this.familyPersonService.listByFamilyId(familyId);

        modelMap.addAttribute("family", family);
        modelMap.addAttribute("familyPersonList", familyPersonList);

        //实际安置选房信息
        List<House> houseList = this.houseService.getChooseHouseById(family.getId());
        modelMap.addAttribute("houseList", houseList);

    }

    /**
     * 基础信息查看
     */
    @RequestMapping("view")
    public void view(HttpServletRequest request, ModelMap modelMap) {
        this.main(request,modelMap);
    }

    /**
     * 选房信息查看
     */
    @RequestMapping("houseView")
    public void houseView(HttpServletRequest request, ModelMap modelMap) {
        this.main(request,modelMap);
    }

    /**
     * 认购协议查看
     */
    @RequestMapping("agreementView")
    public void agreementView(HttpServletRequest request, ModelMap modelMap) {
        this.main(request,modelMap);
    }

    /**
     * 财务信息查看
     */
    @RequestMapping("financeView")
    public void financeView(HttpServletRequest request, ModelMap modelMap) {
        this.main(request,modelMap);
    }
}
