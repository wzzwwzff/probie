package com.app.cq.web.cq.caiWu;

import com.app.cq.model.Family;
import com.app.cq.model.OperationInfo;
import com.app.cq.service.FamilyService;
import com.app.cq.service.OperationInfoService;
import com.app.cq.utils.BigDecimalUtils;
import com.app.cq.utils.CalUtils;
import com.app.cq.utils.GetCurrentUser;
import com.google.common.collect.Maps;
import com.sqds.exception.SqdsException;
import com.sqds.page.PageInfo;
import com.sqds.web.ParamUtils;
import com.sqds.web.Servlets;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Map;

@Controller
@RequestMapping("/cq/caiWu/*")
public class CaiWuController {
    @Autowired
    private FamilyService familyService;
    @Autowired
    private OperationInfoService operationInfoService;


    /**
     * 财务结算列表
     * @param request
     * @param modelMap
     */
    @RequestMapping("list")
    public void list(HttpServletRequest request, ModelMap modelMap){
        PageInfo<Family> pageInfo = new PageInfo<>();
        Servlets.initPageInfo(request,pageInfo);
        pageInfo = this.familyService.getCaiWuList(pageInfo);
        modelMap.addAttribute("pageInfo",pageInfo);
    }

    /**
     * 财务结算
     * @param request
     * @return
     */
    @RequestMapping("settle")
    @ResponseBody
    public Map settle(HttpServletRequest request) {
        Integer familyId = ParamUtils.getInt(request, "familyId", 0);
        Family family = this.familyService.get(familyId);
        CalUtils.calc(family,null);
        Map map = Maps.newHashMap();
        if (family != null){
            try {
                if (family.getSettleStatus() != 2){
                    BigDecimal jsMoney = BigDecimalUtils.getBigAndBigSub(family.getBcTotalMoney(), family.getGfTotalMoney());
                    family.setJsMoney(jsMoney);
                    family.setSettleStatus(2);
                    map.put("success", "true");
                    map.put("message", "结算成功!");
                }else {
                    map.put("success", "false");
                    map.put("message", "结算失败请核验数据!");
                }
                //保存动作记录
                OperationInfo operationInfo = new OperationInfo();
                operationInfo.setFamilyId(familyId);
                operationInfo.setOperatePerson(GetCurrentUser.getLoginUser(request).getUsername());
                operationInfo.setOperateDate(new Date());
                operationInfo.setMemo("财务结算");
                operationInfoService.save(operationInfo);
            } catch (Exception e) {
                e.printStackTrace();
                map.put("success", "false");
                map.put("message", "操作失败！");
            }
        }else {
            throw new SqdsException("数据错误请核查");
        }
        familyService.save(family);
        return map;
    }
}
