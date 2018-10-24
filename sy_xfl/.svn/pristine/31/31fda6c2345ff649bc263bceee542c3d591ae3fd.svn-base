package com.app.cq.web.cq;

import com.app.common.model.DataDict;
import com.app.common.service.DataDictService;
import com.app.cq.map.FamilyExcelMap;
import com.app.cq.model.Family;
import com.app.cq.model.FamilyPerson;
import com.app.cq.service.FamilyPersonService;
import com.app.cq.service.FamilyService;
import com.app.cq.service.StatisticsService;
import com.app.cq.utils.GetCurrentUser;
import com.app.cq.utils.RedirectAttributesExcel;
import com.app.permission.model.User;
import com.google.common.collect.Lists;
import com.sqds.exception.SqdsException;
import com.sqds.page.PageInfo;
import com.sqds.utils.DateUtils;
import com.sqds.utils.StringUtils;
import com.sqds.web.ParamUtils;
import com.sqds.web.Servlets;
import jxl.Workbook;
import jxl.format.Alignment;
import jxl.format.BorderLineStyle;
import jxl.format.VerticalAlignment;
import jxl.write.*;
import jxl.write.Number;
import org.apache.commons.beanutils.BeanUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.lang.reflect.InvocationTargetException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 统计
 *
 * @author tsg
 * @date 2017/11/19
 */
@Controller
@RequestMapping("/cq/statistics/*")
public class StaticController {
    private Logger logger = LoggerFactory.getLogger(StaticController.class);

    @Autowired
    private FamilyService familyService;
    @Autowired
    private FamilyPersonService familyPersonService;
    @Autowired
    private DataDictService dataDictService;
    @Autowired
    private StatisticsService statisticsService;

    /**
     * 综合查询导出
     *
     * @param request
     * @param modelMap
     */
    @RequestMapping("main")
    public void main(HttpServletRequest request, ModelMap modelMap) {
        Map<String, String> signMap = this.dataDictService.getMapByParentAttributeNameForName("签约状态");
        Map<String, String> jfMap = this.dataDictService.getMapByParentAttributeNameForName("交房状态");
        Map<String, String> handStateMap = this.dataDictService.getMapByParentAttributeNameForName("上报状态");
        Map<String, String> checkStateMap = this.dataDictService.getMapByParentAttributeNameForName("审核状态");
        Map<String, String> groupMap = this.dataDictService.getMapByParentAttributeNameForName("组别");
        Map<String, String> ccMap = this.dataDictService.getMapByParentAttributeNameForName("拆除状态");
        Map<String, String> jsMap = this.dataDictService.getMapByParentAttributeNameForName("结算状态");
        Map<String, String> groupMapForValue = this.dataDictService.getMapByParentAttributeNameForValue("组别");
        Map<String, String> azMap = this.dataDictService.getMapByParentAttributeNameForName("安置类型");

        modelMap.addAttribute("signMap", signMap);
        modelMap.addAttribute("handStateMap", handStateMap);
        modelMap.addAttribute("checkStateMap", checkStateMap);
        modelMap.addAttribute("jfMap", jfMap);
        modelMap.addAttribute("groupMap", groupMap);
        modelMap.addAttribute("ccMap", ccMap);
        modelMap.addAttribute("jsMap", jsMap);
        modelMap.addAttribute("azMap", azMap);
        modelMap.addAttribute("groupMapForValue", groupMapForValue);

        User user = GetCurrentUser.getLoginUser(request);
        modelMap.addAttribute("departmentCode", user.getDepartment().getDepartmentCode());
    }

    /**
     * 查询
     */
    @RequestMapping("result")
    public void result(HttpServletRequest request, ModelMap modelMap) {
        PageInfo<Family> pageInfo = new PageInfo<Family>();
        Servlets.initPageInfo(request, pageInfo);
        pageInfo = this.statisticsService.getListForCompositeSearch(pageInfo, request);
        modelMap.addAttribute("postValue", pageInfo.getPostValue());
        modelMap.addAttribute("pageInfo", pageInfo);
    }

    @RequestMapping("resultExcel")
    public String resultExcel(HttpServletRequest request, RedirectAttributes redirectAttributes) throws IllegalAccessException, NoSuchMethodException, InvocationTargetException {
        Map<String, String> signMap = this.dataDictService.getMapByParentAttributeNameForValue("签约状态");
        Map<String, String> jfMap = this.dataDictService.getMapByParentAttributeNameForValue("交房状态");
        Map<String, String> checkStateMap = this.dataDictService.getMapByParentAttributeNameForValue("审核状态");
        Map<String, String> groupMap = this.dataDictService.getMapByParentAttributeNameForValue("组别");
        Map<String, String> ccMap = this.dataDictService.getMapByParentAttributeNameForValue("拆除状态");
        Map<String, String> jsMap = this.dataDictService.getMapByParentAttributeNameForValue("结算状态");
        Map<String, String> azMap = this.dataDictService.getMapByParentAttributeNameForValue("安置类型");
        Map<String, String> isMap = this.dataDictService.getMapByParentAttributeNameForValue("是否");
        Map<String, String> pgMap = this.dataDictService.getMapByParentAttributeNameForValue("评估公司");
        Map<String, String> sbMap = this.dataDictService.getMapByParentAttributeNameForValue("上报状态");
        Map<String, String> sexMap = this.dataDictService.getMapByParentAttributeNameForValue("性别");

        PageInfo<Family> pageInfo = new PageInfo<Family>();
        Servlets.initPageInfo(request, pageInfo);
        pageInfo.setPageSize(Integer.MAX_VALUE);
        pageInfo = this.statisticsService.getListForCompositeSearch(pageInfo, request);
        List dataList = Lists.newArrayList();
        //存储列名
        List<String> theadsList = new ArrayList<String>();
        //存储字段名
        List<String> nameList = new ArrayList<String>();
        String familyPerson = "";

        if (pageInfo.getTotalCount() > 0) {
            Enumeration<String> param = request.getParameterNames();
            while (param.hasMoreElements()) {
                String name = param.nextElement();
                //当不是查询条件时
                if (name.indexOf("search_") == -1) {
                    String thead = FamilyExcelMap.excelMap().get(name).toString();
                    theadsList.add(thead);
                    nameList.add(name);
                    if (name.equals("familyPerson")) {
                        familyPerson = "familyPerson";
                    }
                }
            }

            Map<Integer, List<FamilyPerson>> familyPersonMap = familyPersonService.getFamilyPersonMap();

            for (Family family : (List<Family>) pageInfo.getResult()) {
                //合同编号
                List list = new ArrayList();
                for (int i = 0; i < nameList.size(); i++) {
                    String value = "";
                    String property = nameList.get(i);
                    List<FamilyPerson> familyPersonList = null;
                    if (property.equals("familyPerson")) {
                        familyPersonList = familyPersonMap.get(family.getId());
                        if (familyPersonList == null) {
                            familyPersonList = new ArrayList<FamilyPerson>();
                        }
                        if (familyPersonList.size() == 0) {
                            familyPersonList.add(new FamilyPerson());
                        }
                        list.add(familyPersonList);
                    } else {
                        value = BeanUtils.getProperty(family, property);
                    }

                    if (value != null && (value.equals("0.00") || value.equals("0"))) {
                        value = "";
                    }
                    if (property.equals("groupCode")) {
                        value = groupMap.get(value) == null ? "" : groupMap.get(value);
                    }
                    if (property.equals("qyState") || property.equals("bcxyState")) {
                        value = signMap.get(value) == null ? "" : signMap.get(value);
                    }
                    if (property.equals("jfState")) {
                        value = jfMap.get(value) == null ? "" : jfMap.get(value);
                    }
                    if (property.equals("ccState")) {
                        value = ccMap.get(value) == null ? "" : ccMap.get(value);
                    }
                    if (property.equals("jsState")) {
                        value = jsMap.get(value) == null ? "" : jsMap.get(value);
                    }
                    if (property.equals("checkState")) {
                        value = checkStateMap.get(value) == null ? "" : checkStateMap.get(value);
                    }
                    if (property.equals("isBussess") || property.equals("isDutyFree") || property.equals("isGiveup") || property.equals("isLandFee")){
                        value = isMap.get(value) == null ? "" : isMap.get(value);
                    }
                    if (property.equals("pgState") || property.equals("cqState") || property.equals("chState")){
                        value = sbMap.get(value) == null ? "" : sbMap.get(value);
                    }

                    if (property.equals("pgCompany")){
                        value = pgMap.get(value) == null ? "":pgMap.get(value);
                    }
                    if (property.endsWith("Date") && value != null && !value.trim().equals("")) {
                        value = value.substring(0, 10);
                    }
                    if (property.equals("type")) {
                        value = azMap.get(value) == null ? "" : azMap.get(value);
                    }
                    if (property.equals("sex")) {
                        value = sexMap.get(value) == null ? "" : sexMap.get(value);
                    }
                    if (property.equals("jfNumberDateMillisecond")){
                        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年MM月dd日 HH时mm分ss.SSS秒");
                        Date date =new Date(value);
                        value = simpleDateFormat.format(date);
                    }

                    if (!property.equals("familyPerson")) {
                        list.add(value);
                    }
                }
                dataList.add(list);
            }
        }
        RedirectAttributesExcel.addFlashAttribute(redirectAttributes, "家庭信息台账", "家庭信息台账", theadsList.toArray(new String[theadsList.size()]), dataList, familyPerson);
        return "redirect:/cq/excel/excel";
    }

    //签约情况统计
    @RequestMapping("qyqkStatistics")
    public void qyqkSignStatistics(HttpServletRequest request, ModelMap modelMap) {
        String date = ParamUtils.getString(request, "date", "");
        if (date == null || date.equals("")) {
            date = DateUtils.date2string(new Date());
        }
        Map<String,Map<String, Map<String, String>>> map = statisticsService.qyqkSignMap(date);
        modelMap.addAttribute("map", map);
        List<DataDict> dataDictList1 = dataDictService.getDataDictList("组别");
        List<DataDict> dataDictList2 = dataDictService.getDataDictList("安置类型");
        modelMap.addAttribute("dataDictList1", dataDictList1);
        modelMap.addAttribute("dataDictList2", dataDictList2);
        modelMap.addAttribute("date", date);
    }

    //交房情况统计
    @RequestMapping("jfqkStatistics")
    public void jfqkSignStatistics(HttpServletRequest request, ModelMap modelMap) {
        String date = ParamUtils.getString(request, "date", "");
        if (date == null || date.equals("")) {
            date = DateUtils.date2string(new Date());
        }
        Map<String, Map<String, String>> map = statisticsService.jfqkSignMap(date);
        modelMap.addAttribute("map", map);
        List<DataDict> dataDictList1 = dataDictService.getDataDictList("组别");
        modelMap.addAttribute("dataDictList1", dataDictList1);
        modelMap.addAttribute("date", date);
    }

    //拆除情况统计
    @RequestMapping("ccqkStatistics")
    public void ccqkSignStatistics(HttpServletRequest request, ModelMap modelMap) {
        String date = ParamUtils.getString(request, "date", "");
        if (date == null || date.equals("")) {
            date = DateUtils.date2string(new Date());
        }
        Map<String, Map<String, String>> map = statisticsService.ccqkSignMap(date);
        modelMap.addAttribute("map", map);
        List<DataDict> dataDictList1 = dataDictService.getDataDictList("组别");
        modelMap.addAttribute("dataDictList1", dataDictList1);
        modelMap.addAttribute("date", date);
    }

    //签约台账
    @RequestMapping("signList")
    public void signList(HttpServletRequest request,ModelMap modelMap){
        PageInfo<Family> pageInfo  = new PageInfo<>();
        Servlets.initPageInfo(request,pageInfo);
        User user = GetCurrentUser.getLoginUser(request);
        pageInfo.addParameter("search_like_string_f.groupCode",user.getDepartment().getDepartmentCode());
        pageInfo.addParameter("search_eq_integer_f.qyState",2);
        commonList(pageInfo,modelMap);
    }

    //签约台账导出
    @RequestMapping("signExcel")
    public void signExcel(HttpServletRequest request,ModelMap modelMap){
        PageInfo<Family> pageInfo  = new PageInfo<>();
        Servlets.initPageInfo(request,pageInfo);
        User user = GetCurrentUser.getLoginUser(request);
        pageInfo.setPageSize(Integer.MAX_VALUE);
        pageInfo.addParameter("search_like_string_f.groupCode",user.getDepartment().getDepartmentCode());
        pageInfo.addParameter("search_eq_integer_f.qyState",2);
        commonList(pageInfo,modelMap);
    }

    public void commonList(PageInfo<Family> pageInfo,ModelMap modelMap){
        pageInfo = familyService.familyList(pageInfo);
        List<Family> familyList = pageInfo.getResult();
        Map<Integer,List<FamilyPerson>> map = new HashMap<>();
        if (familyList != null && familyList.size() > 0) {
            String familyIds = "";
            for (Family family:familyList){
                familyIds = familyIds+"'"+family.getId()+"',";
            }
            familyIds = familyIds.substring(0,familyIds.length()-1);
            List<FamilyPerson> familyPersonList = familyPersonService.listFamilyPerson(familyIds);
            for (FamilyPerson familyPerson:familyPersonList){
                List<FamilyPerson> valueList  = map.get(familyPerson.getFamily().getId()) == null?new ArrayList<FamilyPerson>():map.get(familyPerson.getFamily().getId());
                valueList.add(familyPerson);
                map.put(familyPerson.getFamily().getId(),valueList);
            }
        }
        modelMap.addAttribute("pageInfo",pageInfo);
        modelMap.addAttribute("map",map);
    }

    //未签约台账
    @RequestMapping("noSignList")
    public void noSignList(HttpServletRequest request,ModelMap modelMap){
        PageInfo<Family> pageInfo  = new PageInfo<>();
        Servlets.initPageInfo(request,pageInfo);
        User user = GetCurrentUser.getLoginUser(request);
        pageInfo.addParameter("search_like_string_f.groupCode",user.getDepartment().getDepartmentCode());
        pageInfo.addParameter("search_eq_integer_f.qyState",1);
        commonList(pageInfo,modelMap);

    }

    //未签约导出
    @RequestMapping("noSignExcel")
    public void noSignExcel(HttpServletRequest request,ModelMap modelMap){
        PageInfo<Family> pageInfo  = new PageInfo<>();
        Servlets.initPageInfo(request,pageInfo);
        User user = GetCurrentUser.getLoginUser(request);
        pageInfo.setPageSize(Integer.MAX_VALUE);
        pageInfo.addParameter("search_like_string_f.groupCode",user.getDepartment().getDepartmentCode());
        pageInfo.addParameter("search_eq_integer_f.qyState",1);
        commonList(pageInfo,modelMap);
    }

    //未交房台账
    @RequestMapping("wjfList")
    public void wjfList(HttpServletRequest request,ModelMap modelMap){
        PageInfo<Family> pageInfo  = new PageInfo<>();
        Servlets.initPageInfo(request,pageInfo);
        User user = GetCurrentUser.getLoginUser(request);
        pageInfo.addParameter("search_like_string_f.groupCode",user.getDepartment().getDepartmentCode());
        pageInfo.addParameter("search_eq_integer_f.jfState",1);
        commonList(pageInfo,modelMap);
    }

    //未交房导出
    @RequestMapping("wjfExcel")
    public void wjfExcel(HttpServletRequest request,ModelMap modelMap){
        PageInfo<Family> pageInfo  = new PageInfo<>();
        Servlets.initPageInfo(request,pageInfo);
        User user = GetCurrentUser.getLoginUser(request);
        pageInfo.setPageSize(Integer.MAX_VALUE);
        pageInfo.addParameter("search_like_string_f.groupCode",user.getDepartment().getDepartmentCode());
        pageInfo.addParameter("search_eq_integer_f.jfState",1);
        commonList(pageInfo,modelMap);
    }

    //未签约情况统计
    @RequestMapping("wqyCx")
    public void wqyCx(HttpServletRequest request, ModelMap modelMap) {
        String date = ParamUtils.getString(request, "date", "");
        if (date == null || date.equals("")) {
            date = DateUtils.date2string(new Date());
        }
        Map<String, Map<String, String>> map = statisticsService.wqyCx(date);
        modelMap.addAttribute("map", map);
        List<DataDict> dataDictList1 = dataDictService.getDataDictList("组别");
        modelMap.addAttribute("dataDictList1", dataDictList1);
        modelMap.addAttribute("date", date);
    }

    //未交房情况统计
    @RequestMapping("wjfCx")
    public void wjfCx(HttpServletRequest request, ModelMap modelMap) {
        String date = ParamUtils.getString(request, "date", "");
        if (date == null || date.equals("")) {
            date = DateUtils.date2string(new Date());
        }
        Map<String, Map<String, String>> map = statisticsService.wjfCx(date);
        modelMap.addAttribute("map", map);
        List<DataDict> dataDictList1 = dataDictService.getDataDictList("组别");
        modelMap.addAttribute("dataDictList1", dataDictList1);
        modelMap.addAttribute("date", date);
    }

    //综合情况统计
    @RequestMapping("zhTj")
    public void zhTj(HttpServletRequest request, ModelMap modelMap) {
        String date = ParamUtils.getString(request, "date", "");
        if (date == null || date.equals("")) {
            date = DateUtils.date2string(new Date());
        }
        Map<String, Map<String, String>> map = statisticsService.zhTj(date);
        modelMap.addAttribute("map", map);
        List<DataDict> dataDictList1 = dataDictService.getDataDictList("组别");
        modelMap.addAttribute("dataDictList1", dataDictList1);
        modelMap.addAttribute("date", date);
    }

    //签约日报表
    @RequestMapping("dailySignStatistics")
    public void dailySignStatistics(HttpServletRequest request,ModelMap modelMap){
        Map<String, Map<String, Map<String, Integer>>> map = statisticsService.dailySign();
        List list = statisticsService.getSignList();
        modelMap.addAttribute("map",map);
        List<DataDict> dataDictList1 = dataDictService.getDataDictList("组别");
        modelMap.addAttribute("dataDictList1",dataDictList1);
        modelMap.addAttribute("list",list);
        modelMap.addAttribute("date",DateUtils.date2string("yyyy年MM月dd日",new Date()));
    }

    //签约、交房、拆除情况统计
    @RequestMapping("qkTj")
    public void qkTj(HttpServletRequest request, ModelMap modelMap) {
        String date = ParamUtils.getString(request, "date", "");
        if (date == null || date.equals("")) {
            date = DateUtils.date2string(new Date());
        }
        Map<String, Map<String, String>> map = statisticsService.qkTj(date);
        modelMap.addAttribute("map", map);
        List<DataDict> dataDictList1 = dataDictService.getDataDictList("组别");
        modelMap.addAttribute("dataDictList1", dataDictList1);
        modelMap.addAttribute("date", date);
    }
}