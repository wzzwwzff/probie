package com.app.cq.web.cq;

import com.alibaba.fastjson.JSON;
import com.app.cq.model.Family;
import com.app.cq.model.FamilyPerson;
import com.app.cq.model.HistoryInfo;
import com.app.cq.model.House;
import com.app.cq.service.FamilyService;
import com.app.cq.service.HistoryInfoService;
import com.app.cq.utils.CompareUtils;
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
 * Created by jmdf on 2018/9/6.
 */
@Controller
@RequestMapping("/cq/history/*")
public class HistoryInfoController {

    @Autowired
    private HistoryInfoService historyInfoService;
    @Autowired
    private FamilyService familyService;

    /**
     * 家庭信息列表
     */
    @RequestMapping("list")
    public void list(HttpServletRequest request, ModelMap modelMap) {
        PageInfo<Family> pageInfo = new PageInfo<>();
        Servlets.initPageInfo(request, pageInfo);
        pageInfo = familyService.familyList(pageInfo);
        modelMap.put("pageInfo", pageInfo);
    }

    /**
     * 历史记录列表
     */
    @RequestMapping("historyList")
    public void historyList(HttpServletRequest request, ModelMap modelMap) {
        PageInfo<HistoryInfo> pageInfo = new PageInfo<HistoryInfo>();
        pageInfo.setPageSize(Integer.MAX_VALUE);
        Servlets.initPageInfo(request, pageInfo);
        Integer familyId = ParamUtils.getInt(request, "familyId", 0);
        pageInfo = historyInfoService.listByFamilyId(pageInfo,familyId);
        modelMap.addAttribute("pageInfo", pageInfo);
        modelMap.addAttribute("familyId", familyId);
    }

    /**
     *  公用查看页面
     */
    @RequestMapping("view")
    public void view(HttpServletRequest request, ModelMap modelMap) {
        Integer historyInfoId = ParamUtils.getInt(request, "historyInfoId", 0);
        Integer datePhase = ParamUtils.getInt(request, "datePhase", 0);
        HistoryInfo history = historyInfoService.get(historyInfoId);
        Object historyInfo = null;
        try {
            historyInfo = JSON.parseObject(history.getData(), Family.class);
        } catch (Exception e) {
            System.out.println("家庭原始数据解析失败：家庭Id" + history.getFamilyId());
        }
        modelMap.put("family", historyInfo);
        modelMap.put("historyInfoId", historyInfoId);
        modelMap.put("datePhase", datePhase);
    }

    /**
     *  查看对比
     */
    @RequestMapping("contrast")
    public void contrast(HttpServletRequest request, ModelMap modelMap) {
        Integer historyInfoId = ParamUtils.getInt(request, "historyInfoId", 0);
        HistoryInfo historyInfo = historyInfoService.get(historyInfoId);
        List<FamilyPerson> familyPersonList = Lists.newArrayList();
        List<House> houseList = Lists.newArrayList();

        Object history = null;
        if (historyInfo != null) {
            try {
                history = JSON.parseObject(historyInfo.getData(), Family.class);
                familyPersonList = JSON.parseObject(historyInfo.getFamilyPersonData(), List.class);
                houseList = JSON.parseObject(historyInfo.getHouseData(), List.class);
            } catch (Exception e) {
                System.out.println("家庭原始数据解析失败：家庭Id" + historyInfo.getFamilyId());
            }

        }

        Object family1 = null;
        List<House> houseList1 = Lists.newArrayList();
        Integer orderFlag = historyInfo.getOrderFlag() == null ? 1 : historyInfo.getOrderFlag();
        if (orderFlag == 1) {
            family1 = history;
        } else {
            orderFlag = orderFlag - 1;
            HistoryInfo historyInfo1 = historyInfoService.getHistoryByOrderFlag(historyInfo.getFamilyId(), orderFlag);
            if (historyInfo1 == null) {
                family1 = new Family();
            } else {
                try {
                    family1 = JSON.parseObject(historyInfo1.getData(), Family.class);
                    houseList1 = JSON.parseObject(historyInfo1.getHouseData(), List.class);
                } catch (Exception e) {
                    System.out.println("家庭原始数据解析失败：家庭Id" + historyInfo.getFamilyId());
                }
            }
        }

        modelMap.put("family", history);
        modelMap.put("family1", family1);
        modelMap.put("familyPersonList", familyPersonList);
        modelMap.put("houseList", houseList);
        modelMap.put("houseList1", houseList1);
        CompareUtils compareUtils = new CompareUtils();
        modelMap.addAttribute("compareUtils",compareUtils);
    }

    /**
     * 选房信息查看
     */
    @RequestMapping("houseView")
    public void houseView(HttpServletRequest request, ModelMap modelMap) {
        this.contrast(request,modelMap);
    }

    /**
     * 财务结算查看
     */
    @RequestMapping("financeView")
    public void financeView(HttpServletRequest request, ModelMap modelMap) {
        this.contrast(request,modelMap);
    }
}
