package com.app.cq.web.cq;

import com.app.common.model.DataDict;
import com.app.common.service.DataDictService;
import com.app.cq.en.CheckState;
import com.app.cq.model.Family;
import com.app.cq.model.FamilyPerson;
import com.app.cq.service.ActionInfoService;
import com.app.cq.service.FamilyPersonService;
import com.app.cq.service.FamilyService;
import com.app.cq.utils.*;
import com.app.cq.utils.DateUtils;
import com.app.cq.vo.Response;
import com.app.permission.model.User;
import com.app.permission.utils.UserSession;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.sqds.exception.SqdsException;
import com.sqds.page.PageInfo;
import com.sqds.utils.*;
import com.sqds.utils.pdf.PdfDocumentGenerator;
import com.sqds.web.ParamUtils;
import com.sqds.web.Servlets;
import jxl.Workbook;
import jxl.format.Alignment;
import jxl.format.BorderLineStyle;
import jxl.format.VerticalAlignment;
import jxl.write.*;
import jxl.write.Number;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.*;

/**
 * 家庭协议综合
 * @author tsg
 * @date 2017/11/10
 */
@Controller
@RequestMapping("/cq/family/*")
public class FamilyController {
    private Logger logger = LoggerFactory.getLogger(FamilyController.class);

    @Autowired
    private FamilyService familyService;
    @Autowired
    private FamilyPersonService familyPersonService;
    @Autowired
    private DataDictService dataDictService;
    @Resource
    private ActionInfoService actionInfoService;

    /**
     * 列表显示
     * @param request
     * @param modelMap
     */
    @RequestMapping("list")
    public void list(HttpServletRequest request,ModelMap modelMap){
        PageInfo<Family> pageInfo = new PageInfo<>();
        Servlets.initPageInfo(request,pageInfo);

        User user = GetCurrentUser.getLoginUser(request);
        pageInfo.addParameter("search_like_string_f.groupCode",user.getDepartment().getDepartmentCode());
        pageInfo = familyService.familyList(pageInfo);

        modelMap.put("pageInfo",pageInfo);
    }


    /**
     * 拆迁公司经理复核上报
     * @param request
     * @param modelMap
     */
    @RequestMapping("cqCheckList")
    public void cqCheckList(HttpServletRequest request,ModelMap modelMap){
       this.list(request,modelMap);
    }


    /**
     * 编号重复验证
     * @param request
     * @return
     */
    @RequestMapping("checkRepeat")
    @ResponseBody
    public boolean  checkRepeat(ServletRequest request){
        String familyCode = ParamUtils.getString(request,"familyCode","");
        Integer familyId = ParamUtils.getInt(request,"familyId",0);

        logger.debug(familyCode);
        logger.debug(familyId+"");

        Family family = familyService.checkRepeat(familyCode, familyId);
        if (family != null) {
            return false;
        }else {
            return true;
        }

    }

    @RequestMapping("validateManager")
    @ResponseBody
    public String validateManager(HttpServletRequest request, ModelMap modelMap) {
        String jyArea = ParamUtils.getString(request, "jyArea", "0");
        String tctyfFee = ParamUtils.getString(request, "tctyfFee", "0");
        String isBussess = ParamUtils.getString(request, "isBussess", "1");
        String isDutyFree = ParamUtils.getString(request, "isDutyFree", "1");
        String isLandFee = ParamUtils.getString(request, "isLandFee", "1");
        String flag = "true";

        if (isBussess.equals("2") && isDutyFree.equals("1")) {
            DataDict dataDict = dataDictService.getDataDict("不免税停产停业补助费");
            BigDecimal tctyf = new BigDecimal(dataDict.getAttributeValue());
            BigDecimal tctyfMoney = BigDecimalUtils.getBigDecimalAndBigDecimalMultiply(new BigDecimal(jyArea), tctyf).setScale(2, BigDecimal.ROUND_DOWN);
            if (new BigDecimal(tctyfFee).compareTo(tctyfMoney) == 1) {
                flag = "false";
            }
        }
        return flag;
    }

   /* *//**
     * 身份证号重复验证
     * @param request
     * @return
     *//*
    @RequestMapping("checkIdCardRepeat")
    @ResponseBody
    public boolean  checkIdCardRepeat(ServletRequest request){
        String idCard = ParamUtils.getString(request,"idCard","");
        Integer familyId = ParamUtils.getInt(request,"familyId",0);


        Family family = familyService.checkIdCardRepeat(idCard, familyId);
        if (family != null) {
            return false;
        }else {
            return true;
        }

    }*/

    /**
     * 基础数据表单页面
     * @param request
     * @param modelMap
     */
    @RequestMapping("form")
    public void form(HttpServletRequest request,ModelMap modelMap){
        Integer familyId = ParamUtils.getInt(request,"familyId",0);
        Integer flag = ParamUtils.getInt(request,"flag",0);

        Family family = familyService.get(familyId);
        User user = UserSession.getUserFromSession(request);


        if (family == null) {
            family = new Family();
            family.setAddDate(new Date());
        }

        List<FamilyPerson> familyPersonList = Lists.newArrayList();
        if (family.getId() != null) {
            familyPersonList = familyPersonService.listByFamilyId(family.getId());
        }

        logger.debug("familyPersonList.size="+familyPersonList.size());

        modelMap.put("flag",flag);
        modelMap.put("family",family);
        modelMap.put("familyPersonList",familyPersonList);
        modelMap.put("departmentCode", user.getDepartment().getDepartmentCode());

    }

    /**
     * 基础数据保存
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping("save")
    public String save(HttpServletRequest request,ModelMap modelMap){
        Integer familyId = ParamUtils.getInt(request,"familyId",0);
        Family family = familyService.get(familyId);
        String addDate = ParamUtils.getString(request,"addDate","0");

        if (family == null) {
            family = new Family();
        }else{
            this.familyPersonService.deleteByFamilyId(family.getId());
        }

        Servlets.bind(request,family);

        User user = UserSession.getUserFromSession(request);
        String ip = GetCurrentUser.getIpAddr(request);

        familyService.saveFamily(request, family,user.getUsername(),ip);
        Family family1 = familyService.get(family.getId());
        CalcUtils.calc(family1);

        String status = "rhStatus";

        this.toWebFamilyData(family,status);
//        String familyCode = family.getFamilyCode();
//        String familyName = family.getName();
//        try {
//         familyService.updateRHStatus(familyCode,familyName);
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }

        return "redirect:list?" +"&"+request.getAttribute("searchParams");
    }

    /**
     * 删除family及familyPerson
     * @param request
     * @return
     */
    @RequestMapping("delete")
    @ResponseBody
    public Map<String,String> delete(ServletRequest request){
        int id = ParamUtils.getInt(request,"familyId",0);
        familyService.deleteByFamilyId(id);

        Map<String,String> map = new HashMap<String, String>();
        map.put("success","true");
        return map;
    }

    /***************************
     * 测绘经理复核上报
     * @param request
     * @param modelMap
     */
    @RequestMapping("chCheckList")
    public void chCheckList(HttpServletRequest request,ModelMap modelMap){
        this.list(request,modelMap);
    }

    /***************************
     * 测绘数据
     * @param request
     * @param modelMap
     */
    @RequestMapping("chList")
    public void chList(HttpServletRequest request,ModelMap modelMap){
        this.list(request,modelMap);
    }

    /************************************
     * 测绘数据
     * @param request
     * @param modelMap
     */
    @RequestMapping("chForm")
    public void chForm(HttpServletRequest request,ModelMap modelMap){
        this.form(request,modelMap);
    }

    /**
     * 测绘数据保存
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping("chSave")
    public String chSave(HttpServletRequest request,ModelMap modelMap){
        Integer familyId = ParamUtils.getInt(request,"familyId",0);
        Family family = familyService.get(familyId);

        Servlets.bind(request,family);

        User user = UserSession.getUserFromSession(request);
        String ip = GetCurrentUser.getIpAddr(request);

        familyService.savechFamily(family,user.getUsername(),ip);
        CalcUtils.calc(family);
        return "redirect:chList?" +"&"+request.getAttribute("searchParams");
    }

    /**
     * 测绘信息查看
     * @param request
     * @param modelMap
     */
    @RequestMapping("chView")
    public void chView(HttpServletRequest request, ModelMap modelMap) {
        this.form(request,modelMap);
    }

    /********************************************
     * 测绘复核
     * @param request
     * @param modelMap
     */
    @RequestMapping("chCheck")
    public  void chCheck(HttpServletRequest request,ModelMap modelMap){
        this.chForm(request,modelMap);
    }


     /***************************88
     * 评估经理复核上报
     * @param request
     * @param modelMap
     */
    @RequestMapping("pgCheckList")
    public void pgCheckList(HttpServletRequest request,ModelMap modelMap){
        this.list(request,modelMap);
    }

    /***************************88
     * 评估数据导出
     * @param request
     * @param modelMap
     */
    @RequestMapping("pgExcel")
    public void pgExcel(HttpServletRequest request,ModelMap modelMap){
        PageInfo<Family> pageInfo = new PageInfo<>();
        Servlets.initPageInfo(request,pageInfo);
        pageInfo.setPageSize(Integer.MAX_VALUE);
        User user = GetCurrentUser.getLoginUser(request);
        pageInfo.addParameter("search_like_string_f.groupCode",user.getDepartment().getDepartmentCode());
        pageInfo = familyService.familyList(pageInfo);

        modelMap.put("pageInfo",pageInfo);
    }

    /***************************88
     * 评估数据
     * @param request
     * @param modelMap
     */
    @RequestMapping("pgList")
    public void pgList(HttpServletRequest request,ModelMap modelMap){
        this.list(request,modelMap);
    }

    /************************************
     * 评估数据
     * @param request
     * @param modelMap
     */
    @RequestMapping("pgForm")
    public void pgForm(HttpServletRequest request,ModelMap modelMap){
        this.form(request,modelMap);
    }

    /**
     * 评估数据保存
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping("pgSave")
    public String pgSave(HttpServletRequest request,ModelMap modelMap){
        Integer familyId = ParamUtils.getInt(request,"familyId",0);
        Family family = familyService.get(familyId);

        Servlets.bind(request,family);

        User user = UserSession.getUserFromSession(request);
        String ip = GetCurrentUser.getIpAddr(request);

        familyService.savepgFamily(family,user.getUsername(),ip);
        CalcUtils.calc(family);
        return "redirect:pgList?" +"&"+request.getAttribute("searchParams");
    }

    /**
     * 评估信息查看
     * @param request
     * @param modelMap
     */
    @RequestMapping("pgView")
    public void pgView(HttpServletRequest request, ModelMap modelMap) {
        this.form(request,modelMap);
    }


    /********************************************
     * 评估数据f复核
     * @param request
     * @param modelMap
     */
    @RequestMapping("pgCheck")
    public  void pgCheck(HttpServletRequest request,ModelMap modelMap){
        this.pgForm(request,modelMap);
    }

    /***************************88
     * 方案数据
     * @param request
     * @param modelMap
     */
    @RequestMapping("schemeList")
    public void schemeList(HttpServletRequest request,ModelMap modelMap){
        this.list(request,modelMap);
    }


    /**
     * 测绘、评估、方案数据上报
     */
    @RequestMapping("handUp")
    @ResponseBody
    public Response handUp(HttpServletRequest request, ModelMap modelMap) {
        Integer familyId = ParamUtils.getInteger(request, "familyId", 0);
        String type = ParamUtils.getString(request, "type", "");
        Family family = this.familyService.get(familyId);
        Precondition.checkSqdsArguement(family != null, "数据错误，请重试！");
        String operateType = "";
        if(type.equals("pg")){
            //修改评估状态为上报
            family.setPgState(2);
            operateType = "评估数据改为已上报";
        }
        if(type.equals("cq")){
            //修改方案状态为上报
            family.setCqState(2);
            operateType = "拆迁数据改为已上报";
        }
        if(type.equals("ch")){
            //修改测绘状态为上报
            family.setChState(2);
            operateType = "测绘数据改为已上报";
        }
        actionInfoService.saveActionInfo(family,operateType);
        this.familyService.save(family);
        return new Response();
    }

    /**
     * 测绘、评估、方案数据上报
     */
    @RequestMapping("cancelCheck")
    @ResponseBody
    public Response cancelCheck(HttpServletRequest request, ModelMap modelMap) {
        Integer familyId = ParamUtils.getInteger(request, "familyId", 0);
        String type = ParamUtils.getString(request, "type", "");
        Family family = this.familyService.get(familyId);
        Precondition.checkSqdsArguement(family != null, "数据错误，请重试！");
        String operateType = "";
        if(type.equals("pg")){
            //撤销评估上报
            Precondition.checkSqdsArguement(family.getPgState() == 2,"审核状态有误，请刷新页面后重试");
            family.setPgState(1);
            operateType = "评估数据撤销复核上报";
        }
        if(type.equals("cq")){
            Precondition.checkSqdsArguement(family.getCqState() == 2,"审核状态有误，请刷新页面后重试");
            //撤销拆迁上报
            family.setCqState(1);
            operateType = "拆迁数据撤销复核上报";
        }
        if(type.equals("ch")){
            Precondition.checkSqdsArguement(family.getChState() == 2,"审核状态有误，请刷新页面后重试");
            //撤销测绘上报
            family.setChState(1);
            operateType = "评估数据撤销复核上报";
        }
        actionInfoService.saveActionInfo(family,operateType);
        this.familyService.save(family);
        return new Response();
    }

    /************************************
     * 方案数据
     * @param request
     * @param modelMap
     */
    @RequestMapping("schemeForm")
    public void schemeForm(HttpServletRequest request,ModelMap modelMap){
        Integer familyId = ParamUtils.getInt(request,"familyId",0);
        Family family = familyService.get(familyId);

        Precondition.checkSqdsArguement(family != null, "数据错误，请重试！");

        BigDecimal pgTotal=BigDecimalUtils.getSum(family.getInqwFee(),family.getOutqwFee(),family.getFswFee(),family.getRealZxbzFee(),family.getFhbcfFee(),family.getKtjFee());

        CalcUtils.calc(family);

        List<FamilyPerson> familyPersonList = familyPersonService.listByFamilyId(familyId);
        String personStr = familyPersonService.getPersonStr(familyPersonList);
        String personOne = familyPersonService.getPersonOneStr(familyPersonList);
        String personNo = familyPersonService.getPersonNoStr(familyPersonList);
        String personPregnancy = familyPersonService.getPersonPregnancyStr(familyPersonList);

        modelMap.put("family",family);
        modelMap.put("pgMoney",pgTotal);
        modelMap.put("personStr",personStr);
        modelMap.put("personOne",personOne);
        modelMap.put("personNo",personNo);
        modelMap.put("personPregnancy",personPregnancy);
        modelMap.put("familyPersonList",familyPersonList);
    }

    /**
     * 评估数据保存
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping("schemeSave")
    public String schemeSave(HttpServletRequest request,ModelMap modelMap){
        Integer familyId = ParamUtils.getInt(request,"familyId",0);
        Family family = familyService.get(familyId);

        Servlets.bind(request,family);

        User user = UserSession.getUserFromSession(request);
        String ip = GetCurrentUser.getIpAddr(request);

        familyService.saveSchemeFamily(family,user.getUsername(),ip);

        return "redirect:schemeList?" +"&"+request.getAttribute("searchParams");
    }


    /*****************************************88
     * 方案数据查看
     * @param request
     * @param modelMap
     */
    @RequestMapping("schemeCheck")
    public  void schemeCheck(HttpServletRequest request,ModelMap modelMap){
        this.schemeForm(request,modelMap);
    }

    /**
     * 选房结果单打印框架
     * @param request
     * @param modelMap
     */
    @RequestMapping("printFrame")
    public void printFrame(HttpServletRequest request,ModelMap modelMap){
        Integer familyId = ParamUtils.getInt(request,"familyId",0);
        modelMap.put("familyId",familyId);
    }

    /**
     * 打印协议
     * @param request
     */
    @RequestMapping("print")
    public void print(HttpServletRequest request, HttpServletResponse response) throws Exception {

        Integer familyId = ParamUtils.getInt(request,"familyId",0);
        Family family = familyService.get(familyId);
        String template = null;
        if (family == null) {
            throw new SqdsException("家庭信息不存在！");
        }else {
            CalcUtils.calc(family);
            List<FamilyPerson> persons=familyPersonService.listByFamilyId(family.getId());//所有安置人
            String personStr = familyPersonService.getPersonStr(persons);
            Family family1 = VirtualCalcUtils.calc(family,1);
            Family family2 = VirtualCalcUtils.calc(family,2);

            BigDecimal bzjlTatal1 = family1.getBcSumTatal().subtract(BigDecimalUtils.getNotNull(family1.getInqwFee())).subtract(BigDecimalUtils.getNotNull(family1.getOutqwFee())).subtract(BigDecimalUtils.getNotNull(family1.getFswFee())).subtract(BigDecimalUtils.getNotNull(family1.getFhbcfFee()));
            BigDecimal bzjlTatal2 = family2.getBcSumTatal().subtract(BigDecimalUtils.getNotNull(family2.getInqwFee())).subtract(BigDecimalUtils.getNotNull(family2.getOutqwFee())).subtract(BigDecimalUtils.getNotNull(family2.getFswFee())).subtract(BigDecimalUtils.getNotNull(family2.getFhbcfFee()));
            BigDecimal total =  BigDecimalUtils.getSum(family.getQwMoney(),family.getFhbcfFee(),
                    family.getFswFee(), family.getRealZxbzFee(),family.getBjbzFee(),
                    family.getYjfSumFee(),family.getKtjFee(),family.getRybzFee(),family.getConfirmFee(),family.getTqbjfFee());


            BigDecimal noMoney = BigDecimalUtils.getSum(family.getTqbjfFee(),family.getConfirmFee(),family.getTdbzFee(),family.getAzfbzFee(),family.getRybzFee(),family.getShbzFee(),family.getOnlyFee(),family.getShknMoney(),family.getZfknFee());
            template = "printCal.html";
            Map map = Maps.newHashMap();

            FreeMarkerMoneyUtils freeMarkerMoneyUtils = new FreeMarkerMoneyUtils();
            FreeMarkerBigDecimalUtils freeMarkerBigDecimalUtils = new FreeMarkerBigDecimalUtils();

            String url1 = "";
            DataDict dataDict = dataDictService.getDataDict("访问地址");
            if (family.getCheckState() != CheckState.SECONDCHECK.getIndex()) {
                url1 = dataDict.getAttributeValue() + "/static/image/bg.jpg";//添加水印
            }
            BigDecimal gzphFee= new BigDecimal(100000);
            if(family.getFamilyCode().equals("521-1")||family.getFamilyCode().equals("218-1")||family.getFamilyCode().equals("308-1")||family.getFamilyCode().equals("205-1")){
                gzphFee= new BigDecimal(0);
            }
            if (family.getFamilyCode().equals("205-1")){
                family1.setAzfbzFee(new BigDecimal(80000));
                family1.setShbzFee(new BigDecimal(20000));
            }
            //前12项和（人均50）
            BigDecimal total1 = RoundUtils.sswrzs(BigDecimalUtils.getSum(total,family1.getAzfbzFee(), family1.getShbzFee()));
            //前12项和（70%）
            BigDecimal total2 = RoundUtils.sswrzs(BigDecimalUtils.getSum(total,family2.getAzfbzFee(),family2.getShbzFee()));

            map.put("url1", url1);
            map.put("gzphFee", gzphFee);
            map.put("bzjlTatal1",bzjlTatal1);
            map.put("bzjlTatal2",bzjlTatal2);
            map.put("noMoney",noMoney);
            map.put("personStr", personStr);
            map.put("family", family);
            map.put("family1", family1);
            map.put("family2", family2);
            map.put("total1", total1);
            map.put("total2", total2);
            map.put("moneyUtils", freeMarkerMoneyUtils);
            map.put("bigDecimalUtils", freeMarkerBigDecimalUtils);

            PdfDocumentGenerator pdfDocumentGenerator = new PdfDocumentGenerator();
            OutputStream outputStream = null;
            try {
                outputStream = response.getOutputStream();
                pdfDocumentGenerator.generate(template, map, outputStream);
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                try {
                    outputStream.flush();
                    outputStream.close();
//                    response.reset();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }

    /****************************************************8888
     * 云平台同步数据
     * @param family
     */
    @Value("#{configProperties[\'web-url\']}")
    private String url;

    public synchronized void toWebFamilyData(Family family,String status) {
        StringBuffer param = null;
        RestTemplate restTemplate = new RestTemplate();

        String requestWebUrl = url;
        if (requestWebUrl.contains("pm.bjjmdf.com")) {
            param = new StringBuffer("");
            param.append("?projectCode=").append("402897815ebbfb02015ebc00a4ac0001");
            param.append("&familyCode=").append(family.getFamilyCode());
            param.append("&name=").append(family.getName());
            if (status == "qyStatus") {
                param.append("&qyStatus=").append(family.getQyState());
                System.out.println("这是" + status + "状态过来的--------------------------------");
            }
            if (status == "jfStatus") {
                param.append("&jfStatus=").append(family.getJfState());
                System.out.println("这是" + status + "状态过来的--------------------------------");
            }
            if (status == "cxqyStatus") {
                param.append("&cxqyStatus=").append(family.getQyState());
                System.out.println("这是" + status + "状态过来的--------------------------------");
            }
            requestWebUrl += param.toString();
            System.out.println(requestWebUrl);
            String result = restTemplate.getForObject(requestWebUrl, String.class);
            System.out.println("家庭编号：" + family.getFamilyCode() + ",姓名：" + family.getName() + ",坐落：" + family.getHouseAddress() + "状态：" + result);
            if (result.equals("no")) {
                System.out.println("更新失败家庭：" + family.getFamilyCode() + "***********" + family.getName());
            }
        }
    }


    /**
     * 入户信息导出 tsg
     * @param request
     * @param response
     */
    @RequestMapping("listExcel")
    public void listExcel(HttpServletRequest request,HttpServletResponse response){
        PageInfo<Family> pageInfo = new PageInfo<Family>();
        Servlets.initPageInfo(request,pageInfo);
        pageInfo.setPageSize(Integer.MAX_VALUE);
        pageInfo.setOrderBy("id");
        pageInfo.setOrder("ASC");
        pageInfo = this.familyService.list(pageInfo);

        List<Family> list = pageInfo.getResult();

        //家庭成员信息
        List<FamilyPerson> familyPersonList = familyPersonService.allList();

        Map<Integer,List<FamilyPerson>> familyPersonMap = new HashMap<Integer, List<FamilyPerson>>();
        for(FamilyPerson familyPerson : familyPersonList){
            List<FamilyPerson> innerFamilyPerson = familyPersonMap.get(familyPerson.getFamily().getId());
            if(innerFamilyPerson==null){
                innerFamilyPerson = new Vector<FamilyPerson>();
            }
            innerFamilyPerson.add(familyPerson);
            familyPersonMap.put(familyPerson.getFamily().getId(),innerFamilyPerson);
        }

        String templateName = "family.xls";
        String excelFileName = "入户信息台账";
        String rootPath = request.getSession().getServletContext().getRealPath("/");
        String filePath = rootPath + "/WEB-INF/excelTemplates/" + templateName;

        Map<String,DataDict> dataDictMap = dataDictService.getDataDictMap("组别");
        Map<String,DataDict> dataDictMap1 = dataDictService.getDataDictMap("安置方式");
        Map<String,DataDict> dataDictMap2 = dataDictService.getDataDictMap("房屋产别");
       // Map<String,DataDict> dataDictMap3 = dataDictService.getDataDictMap("是否存在特殊情况");
        Map<String,DataDict> dataDictMap4 = dataDictService.getDataDictMap("是否抵押");
        Map<String,DataDict> dataDictMap5 = dataDictService.getDataDictMap("是否租赁");
        Map<String,DataDict> dataDictMap6 = dataDictService.getDataDictMap("是否经营");

        try {
            response.setContentType("application/zip");
            response.setHeader("Content-Disposition", "attachment; filename="+ URLEncoder.encode(excelFileName,"UTF-8") + ".xls");
            //读取excel模板
            File file1 = new File(filePath);

            Workbook workbook = Workbook.getWorkbook(file1);
            //设定目标excel
            WritableWorkbook w = Workbook.createWorkbook(response.getOutputStream(),workbook);

            //通过循环取得数据，并写入相应的sheet
            WritableSheet writableSheet = w.getSheet(0);
            int titleRows = 1;


            WritableCellFormat format = new WritableCellFormat();
            format.setAlignment(Alignment.CENTRE);
            format.setVerticalAlignment(VerticalAlignment.CENTRE);
            format.setBorder(jxl.format.Border.ALL, BorderLineStyle.THIN);
            format.setFont(new WritableFont(WritableFont.createFont("宋体"),9));


            WritableCellFormat formatx = new WritableCellFormat();
            formatx.setAlignment(Alignment.CENTRE);
            //是否自动换行
            formatx.setWrap(true);
            formatx.setVerticalAlignment(VerticalAlignment.CENTRE);
            formatx.setBorder(jxl.format.Border.ALL, BorderLineStyle.THIN);
            formatx.setFont(new WritableFont(WritableFont.createFont("宋体"),9));

            NumberFormat numberFormat = new NumberFormat("0.00");
            WritableCellFormat numberCellFormat = new WritableCellFormat(numberFormat);
            numberCellFormat.setAlignment(Alignment.CENTRE);
            numberCellFormat.setVerticalAlignment(VerticalAlignment.CENTRE);
            numberCellFormat.setBorder(jxl.format.Border.ALL, BorderLineStyle.THIN);
            numberCellFormat.setFont(new WritableFont(WritableFont.createFont("宋体"),9));

            NumberFormat integerNumberFormat = new NumberFormat("#");
            WritableCellFormat integerNumberCellFormat = new WritableCellFormat(integerNumberFormat);
            integerNumberCellFormat.setAlignment(Alignment.CENTRE);
            integerNumberCellFormat.setVerticalAlignment(VerticalAlignment.CENTRE);
            integerNumberCellFormat.setBorder(jxl.format.Border.ALL, BorderLineStyle.THIN);
            integerNumberCellFormat.setFont(new WritableFont(WritableFont.createFont("宋体"),9));

            for (int i = 0;i < list.size();i++){
                Family family = list.get(i);
                int contentRows = i + titleRows;
                writableSheet.setRowView(i + titleRows,380);
                int column = 0;
                //往sheet里面添加数据
                writableSheet.addCell(new Number(column++,contentRows, new Double((i+1)), integerNumberCellFormat));
                writableSheet.addCell(new Label(column++,contentRows,StringUtils.getNotNullString(family.getFamilyCode()),format));
                String dep = "";
                DataDict dataDict = dataDictMap.get(family.getGroupCode()+"");
                if (dataDict!=null){
                    dep = dataDict.getAttributeName();
                }
                writableSheet.addCell(new Label(column++,contentRows,dep,format));
                writableSheet.addCell(new Label(column++,contentRows, StringUtils.getNotNullString(family.getName()),format));
                writableSheet.addCell(new Label(column++,contentRows,StringUtils.getNotNullString(family.getIdCard()),format));
                writableSheet.addCell(new Label(column++,contentRows,StringUtils.getNotNullString(family.getUnit()),format));
                writableSheet.addCell(new Label(column++,contentRows,StringUtils.getNotNullString(family.getPhone()),format));
//                writableSheet.addCell(new Label(column++,contentRows,StringUtils.getNotNullString(family.getTel()),format));
                writableSheet.addCell(new Label(column++,contentRows,StringUtils.getNotNullString(family.getAddress()),format));
                writableSheet.addCell(new Label(column++,contentRows,StringUtils.getNotNullString(family.getContextAddress()),format));
                writableSheet.addCell(new Label(column++,contentRows,StringUtils.getNotNullString(family.getHouseAddress()),format));
//                writableSheet.addCell(new Label(column++,contentRows,StringUtils.getNotNullString(family.getGytdCode()),format));
//                writableSheet.addCell(new Label(column++,contentRows,StringUtils.getNotNullString(family.getProcedureName()),format));
//                writableSheet.addCell(new Label(column++,contentRows,StringUtils.getNotNullDecimal(family.getZzArea()),numberCellFormat));
                writableSheet.addCell(new Label(column++,contentRows,StringUtils.getNotNullDecimal(family.getConfirmArea()),numberCellFormat));
                writableSheet.addCell(new Label(column++,contentRows,StringUtils.getNotNullDecimal(family.getConfirmBuildArea()),numberCellFormat));
                String houseType = "";
//                DataDict dataDict2 = dataDictMap2.get(family.getHouseType()+"");
//                if (dataDict2!=null){
//                    houseType = dataDict2.getAttributeName();
//                }
                writableSheet.addCell(new Label(column++,contentRows,houseType,format));
//                writableSheet.addCell(new Label(column++,contentRows,StringUtils.getNotNullDecimal(family.getHouseNumber()),numberCellFormat));
                String guarantyFlag = "";
//                DataDict dataDict4 = dataDictMap4.get(family.getGuarantyFlag()+"");
//                if (dataDict4!=null){
//                    guarantyFlag = dataDict4.getAttributeName();
//                }
                writableSheet.addCell(new Label(column++,contentRows,guarantyFlag,format));
                String rentFlag = "";
//                DataDict dataDict5 = dataDictMap5.get(family.getRentFlag()+"");
//                if (dataDict5!=null){
//                    rentFlag = dataDict5.getAttributeName();
//                }
                writableSheet.addCell(new Label(column++,contentRows,rentFlag,format));
                String manageFlag = "";
//                DataDict dataDict6 = dataDictMap6.get(family.getManageFlag()+"");
//                if (dataDict6!=null){
//                    manageFlag = dataDict6.getAttributeName();
//                }
                writableSheet.addCell(new Label(column++,contentRows,manageFlag,format));
                writableSheet.addCell(new Label(column++,contentRows,StringUtils.getNotNullDecimal(family.getBussessArea()),numberCellFormat));
                writableSheet.addCell(new Label(column++,contentRows,StringUtils.getNotNullInt(family.getAirConditionerNum()),integerNumberCellFormat));
                writableSheet.addCell(new Label(column++,contentRows,StringUtils.getNotNullInt(family.getTelephoneNum()),integerNumberCellFormat));
                writableSheet.addCell(new Label(column++,contentRows,StringUtils.getNotNullInt(family.getBroadbandNum()),integerNumberCellFormat));
                writableSheet.addCell(new Label(column++,contentRows,StringUtils.getNotNullInt(family.getTvNum()),integerNumberCellFormat));
                writableSheet.addCell(new Label(column++,contentRows,StringUtils.getNotNullInt(family.getWaterHeaterNum()),integerNumberCellFormat));
                writableSheet.addCell(new Label(column++,contentRows,StringUtils.getNotNullInt(family.getDbNum()),integerNumberCellFormat));
                writableSheet.addCell(new Label(column++,contentRows,StringUtils.getNotNullInt(family.getCjNum()),integerNumberCellFormat));
                writableSheet.addCell(new Label(column++,contentRows,StringUtils.getNotNullInt(family.getDabNum()),integerNumberCellFormat));
                writableSheet.addCell(new Label(column++,contentRows,StringUtils.getNotNullInt(family.getFwczNum()),integerNumberCellFormat));

                writableSheet.addCell(new Label(column++,contentRows,StringUtils.getNotNullString(family.getYyzz()),format));
                writableSheet.addCell(new Label(column++,contentRows,StringUtils.getNotNullString(family.getZcgCode()),format));
                writableSheet.addCell(new Label(column++,contentRows,StringUtils.getNotNullString(family.getSummary()),format));
                writableSheet.addCell(new Label(column++,contentRows,StringUtils.getNotNullString(family.getPgCompany()),format));
                writableSheet.addCell(new Label(column++,contentRows,StringUtils.getNotNullString(family.getPgbgCode()),format));
                String state = "";
//                DataDict dataDict1 = dataDictMap1.get(family.getState()+"");
//                if (dataDict1!=null){
//                    state = dataDict1.getAttributeName();
//                }
                writableSheet.addCell(new Label(column++,contentRows,state,format));


//                writableSheet.addCell(new Label(column++,contentRows,StringUtils.getNotNullDecimal(family.getFwfsfFee()),numberCellFormat));
//                writableSheet.addCell(new Label(column++,contentRows,StringUtils.getNotNullDecimal(family.getZszxFee()),numberCellFormat));
                writableSheet.addCell(new Label(column++,contentRows,StringUtils.getNotNullDecimal(family.getTqbjfFee()),numberCellFormat));

//                writableSheet.addCell(new Label(column++,contentRows,StringUtils.getNotNullDecimal(family.getBqfFee()),numberCellFormat));
//                writableSheet.addCell(new Label(column++,contentRows,StringUtils.getNotNullDecimal(family.getLsazfFeeMonth()),numberCellFormat));
                writableSheet.addCell(new Label(column++,contentRows,StringUtils.getNotNullDecimal(family.getLsazfFee()),numberCellFormat));
                writableSheet.addCell(new Label(column++,contentRows,StringUtils.getNotNullDecimal(family.getYjfSumFee()),numberCellFormat));
                writableSheet.addCell(new Label(column++,contentRows,StringUtils.getNotNullDecimal(family.getOtherfFee()),numberCellFormat));
//                writableSheet.addCell(new Label(column++,contentRows,StringUtils.getNotNullString(family.getOtherfMemo()),format));

                writableSheet.addCell(new Label(column++,contentRows,StringUtils.getNotNullDecimal(family.getBcSumTatal()),numberCellFormat));


                String personInfo = "";
                List<FamilyPerson> familyPersonList1 = familyPersonMap.get(family.getId());
                if(familyPersonList1==null){
                    familyPersonList1 = new Vector<FamilyPerson>();
                }

                for(FamilyPerson familyPerson : familyPersonList1){
                    personInfo += StringUtils.getNotNullString(familyPerson.getPersonName());
                    personInfo += "（"+StringUtils.getNotNullString(familyPerson.getRelation())+"）";
                    personInfo += "（"+StringUtils.getNotNullString(familyPerson.getIdCard())+"）、";
                }
                if(personInfo.endsWith("、")){
                    personInfo = personInfo.substring(0,personInfo.length()-1);
                }
                writableSheet.addCell(new Label(column++,contentRows,personInfo,formatx));
            }
            w.write();
            w.close();

        } catch (Exception e){
            throw new SqdsException("Excel文件导出不成功。");
        }
    }

    /**
     * 方案界面点击安置方式时自动计算
     */
    @RequestMapping("calScheme")
    @ResponseBody
    public Map calScheme(HttpServletRequest request) {
        Integer familyId = ParamUtils.getInteger(request, "familyId", 0);
        String type = ParamUtils.getString(request, "type", "");
        Family family = this.familyService.get(familyId);
        Map map = new HashMap();
        String message = "";
        String code = "0000";
        if (family == null){
            message = "找不到对应数据";
            code = "0001";
        }else {
            //计算是否在奖励期之内
            Map<String, String> jlqMap = dataDictService.getMapByParentAttributeNameForName("奖励期时间");
            String endDate = jlqMap.get("签约结束时间");
            Date signDate = family.getQyDate() != null ? family.getQyDate() : new Date();

            Calendar endDateC = Calendar.getInstance();
            Calendar signDateC = Calendar.getInstance();

            endDateC.setTime(com.sqds.utils.DateUtils.string2date(endDate));
            signDateC.setTime(com.sqds.utils.DateUtils.string2date(com.sqds.utils.DateUtils.date2string(signDate)));

            Map<String, String> bzMap = dataDictService.getMapByParentAttributeNameForName("协议费用标准");
            //计算安置面积
            Integer personNo = Integers.getNotNull(family.getPersonNo());  //大龄未婚
            Integer personPregnancy = Integers.getNotNull(family.getPersonPregnancy());//怀孕人数
            Integer personNum = Integers.getNotNull(family.getPersonNum());//家庭成员总人数

            BigDecimal area = new BigDecimal(bzMap.get("安置房选房面积"));
            BigDecimal bili = new BigDecimal(bzMap.get("安置面积比例"));

            BigDecimal addArea1 = new BigDecimal(bzMap.get("未婚"));
            BigDecimal addArea2 = new BigDecimal(bzMap.get("怀孕"));

            BigDecimal houseArea = new BigDecimal("0");
            if (type.equals("1")) {
                houseArea = BigDecimalUtils.getBigDecimalAndIntegerMultiply(area, personNum).setScale(2, BigDecimal.ROUND_HALF_UP);
                BigDecimal houseAddArea1 = BigDecimalUtils.getBigDecimalAndIntegerMultiply(addArea1, personNo).setScale(2, BigDecimal.ROUND_HALF_UP);
                //去掉怀孕的安置面积
//                BigDecimal houseAddArea2 = BigDecimalUtils.getBigDecimalAndIntegerMultiply(addArea2, personPregnancy).setScale(2, BigDecimal.ROUND_HALF_UP);
//                houseArea = BigDecimalUtils.getSum(houseArea, houseAddArea1, houseAddArea2);
                houseArea = BigDecimalUtils.getSum(houseArea, houseAddArea1);
            } else {
                houseArea = BigDecimalUtils.getBigDecimalAndBigDecimalMultiply(family.getConfirmArea(), bili).setScale(2, BigDecimal.ROUND_HALF_UP);
            }

            //计算安置房补助
            BigDecimal azfbzMoney = new BigDecimal(bzMap.get("安置房补助"));
            BigDecimal azfbzFee=new BigDecimal(0);
            if(type.equals("1")){  //按人均50安置补偿
                azfbzFee=BigDecimalUtils.getBigDecimalAndBigDecimalMultiply(azfbzMoney,houseArea).setScale(2,BigDecimal.ROUND_HALF_UP);
                if(signDateC.compareTo(endDateC)>0){
                    azfbzFee=new BigDecimal(0);
                }
            }
            BigDecimal shbzMoney = new BigDecimal(bzMap.get("生活补助"));
            BigDecimal shbzFee=BigDecimalUtils.getBigDecimalAndBigDecimalMultiply(shbzMoney,houseArea).setScale(2,BigDecimal.ROUND_HALF_UP);
            if(signDateC.compareTo(endDateC)>0){//,人员安置补助费0
                shbzFee=new BigDecimal(0);
            }
            map.put("houseArea",houseArea);
            map.put("azfbzFee",azfbzFee);
            map.put("shbzFee",shbzFee);
        }
        map.put("code",code);
        map.put("message",message);
        return map;
    }


    /**
     * 补充协议修改表单页面
     * @param request
     * @param modelMap
     */
    @RequestMapping("buChongForm")
    public void buChongForm(HttpServletRequest request,ModelMap modelMap){
        Integer familyId = ParamUtils.getInt(request,"familyId",0);
        Integer flag = ParamUtils.getInt(request,"flag",0);

        Family family = familyService.get(familyId);
        User user = UserSession.getUserFromSession(request);
        if (family == null) {
            family = new Family();
            family.setAddDate(new Date());
        }
        List<FamilyPerson> familyPersonList = familyPersonService.listByFamilyId(familyId);
        String personStr = familyPersonService.getPersonStr(familyPersonList);
        String personOne = familyPersonService.getPersonOneStr(familyPersonList);
        modelMap.put("flag",flag);
        modelMap.put("personStr",personStr);
        modelMap.put("personOne",personOne);
        modelMap.put("family",family);
        modelMap.put("departmentCode", user.getDepartment().getDepartmentCode());
    }

    /**
     * 补充协议修改保存
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping("bcSave")
    public String bcSave(HttpServletRequest request,ModelMap modelMap){
        Integer familyId = ParamUtils.getInt(request,"familyId",0);
        Family family = familyService.get(familyId);

        if (family == null) {
            family = new Family();
        }

        Servlets.bind(request,family);

        if (family.getIsTcty() == 1){
            family.setTctyfFee(new BigDecimal(0));
        }
        if (family.getIsZfkn() == 1){
            family.setZfknFee(new BigDecimal(0));
        }

        User user = UserSession.getUserFromSession(request);
        String ip = GetCurrentUser.getIpAddr(request);

        familyService.saveFamily(request, family,user.getUsername(),ip);
        Family family1 = familyService.get(family.getId());
        CalcUtils.calc(family1);

        return "redirect:/cq/sign/bcList?" +"&" + request.getAttribute("searchParams");
    }

    /**
     * 安置人口表单页面
     * @param request
     * @param modelMap
     */
    @RequestMapping("azPersonForm")
    public void azPersonForm(HttpServletRequest request,ModelMap modelMap){
        Integer familyId = ParamUtils.getInt(request,"familyId",0);

        Family family = familyService.get(familyId);
        User user = UserSession.getUserFromSession(request);

        if (family == null) {
            family = new Family();
            family.setAddDate(new Date());
        }

        List<FamilyPerson> familyPersonList = Lists.newArrayList();
        if (family.getId() != null) {
            familyPersonList = familyPersonService.listByFamilyId(family.getId());
        }

        logger.debug("familyPersonList.size="+familyPersonList.size());

        modelMap.put("family",family);
        modelMap.put("familyPersonList",familyPersonList);
        modelMap.put("departmentCode", user.getDepartment().getDepartmentCode());

    }

    /**
     * 安置人口数据保存
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping("azPersonSave")
    public String azPersonSave(HttpServletRequest request,ModelMap modelMap){
        Integer familyId = ParamUtils.getInt(request,"familyId",0);
        Family family = familyService.get(familyId);
        String addDate = ParamUtils.getString(request,"addDate","0");

        if (family == null) {
            family = new Family();
        }

        Servlets.bind(request,family);

        User user = UserSession.getUserFromSession(request);
        String ip = GetCurrentUser.getIpAddr(request);

        familyService.saveFamily(request, family,user.getUsername(),ip);
        Family family1 = familyService.get(family.getId());
        CalcUtils.calc(family1);
        return "redirect:buChongForm?familyId="+ familyId + request.getAttribute("searchParams");
    }
}
