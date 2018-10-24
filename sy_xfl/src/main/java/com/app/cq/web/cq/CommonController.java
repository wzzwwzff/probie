package com.app.cq.web.cq;


import com.app.cq.model.Family;
import com.app.cq.model.FamilyPerson;
import com.app.cq.service.FamilyPersonService;
import com.app.cq.service.FamilyService;
import com.app.cq.utils.CalcUtils;
import com.app.cq.utils.Precondition;
import com.google.common.collect.Maps;
import com.sqds.utils.Collections3;
import com.sqds.web.ParamUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * 公共视图控制器
 * Created by zhaisj on 2018/1/2.
 */
@Controller
@RequestMapping("/cq/common/view/*")
public class CommonController {
    @Resource
    private FamilyService familyService;
    @Resource
    private FamilyPersonService familyPersonService;


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
        CalcUtils.calc(family);
        //家庭成员列表
        List<FamilyPerson> familyPersonList = this.familyPersonService.listByFamilyId(familyId);

        String personStr = familyPersonService.getPersonStr(familyPersonList);
        String personOne = familyPersonService.getPersonOneStr(familyPersonList);
        String personNo = familyPersonService.getPersonNoStr(familyPersonList);
        String personPregnancy = familyPersonService.getPersonPregnancyStr(familyPersonList);

        modelMap.put("personStr",personStr);
        modelMap.put("personOne",personOne);
        modelMap.put("personNo",personNo);
        modelMap.put("personPregnancy",personPregnancy);

        modelMap.addAttribute("family", family);
        modelMap.addAttribute("familyPersonList", familyPersonList);
    }
}
