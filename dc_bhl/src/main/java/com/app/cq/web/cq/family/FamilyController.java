package com.app.cq.web.cq.family;

import com.alibaba.fastjson.JSON;
import com.app.common.model.DataDict;
import com.app.common.service.DataDictService;
import com.app.cq.en.CheckState;
import com.app.cq.en.DataInfo;
import com.app.cq.en.IsValid;
import com.app.cq.en.Type;
import com.app.cq.model.*;
import com.app.cq.service.*;
import com.app.cq.utils.*;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.sqds.exception.SqdsException;
import com.sqds.page.PageInfo;
import com.sqds.spring.UploadInfo;
import com.sqds.utils.Collections3;
import com.sqds.utils.pdf.PdfDocumentGenerator;
import com.sqds.web.ParamUtils;
import com.sqds.web.Servlets;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by ZYK on 2018/5/7.
 */
@Controller
@RequestMapping("/cq/family/rh/*")
public class FamilyController {

    @Autowired
    private FamilyService familyService;
    @Autowired
    private FamilyPersonService familyPersonService;
    @Autowired
    private HistoryInfoService historyInfoService;
    @Autowired
    private FamilyHouseService familyHouseService;
    @Autowired
    private FamilyHousePersonService familyHousePersonService;
    @Autowired
    private DataDictService dataDictService;
    @Autowired
    private OperationInfoService operationInfoService;
    @Value("#{configProperties['url']}")
    private String url;

    /**
     * 公共列表
     * @param request
     * @param modelMap
     */
    private void commonList(HttpServletRequest request, ModelMap modelMap){
        PageInfo<Family> pageInfo = new PageInfo<>();
        Servlets.initPageInfo(request,pageInfo);
        pageInfo = this.familyService.getFamilyList(pageInfo);
        modelMap.addAttribute("pageInfo",pageInfo);
    }

    /**
     * 入户家庭列表
     * @param request
     * @param modelMap
     */
    @RequestMapping("list")
    public void list(HttpServletRequest request,ModelMap modelMap){
        this.commonList(request,modelMap);
    }

    /**
     * 入户家庭查看列表
     * @param request
     * @param modelMap
     */
    @RequestMapping("viewList")
    public void viewList(HttpServletRequest request,ModelMap modelMap){
        this.commonList(request,modelMap);
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
        if (family == null){
            family = new Family();
        }else {
            familyPersonList1 = this.familyPersonService.getPersonListByFamilyId(family.getId(), Type.YES.getIndex());
            familyPersonList2 = this.familyPersonService.getPersonListByFamilyId(family.getId(), Type.NO.getIndex());
        }
            //修改编号一次性方法
//        Integer b = 1;
//        Integer h = 1;
//        Integer l = 1;
//        String bs = "";
//        String hs = "";
//        String ls = "";
//
//        List<Family> families = this.familyService.listAll();
//        for (int i = 0; i <families.size() ; i++) {
//            Family family1 = families.get(i);
//
//            if (l == 100){
//                h++;
//                l = 1;
//            }
//            if (h == 100){
//                b++;
//                h = 1;
//            }
//
//            bs = "" + b;
//            hs = "" + h;
//            ls = "" + l;
//
//            if (b<10){
//                bs = "0" + b;
//            }
//            if (h<10){
//                hs = "0" + h;
//            }
//            if (l<10){
//                ls = "0" + l;
//            }
//
//            String familyCode = "BH-" + bs + "-" + hs + "-" + ls;
//            family1.setFamilyCode(familyCode);
//            familyService.save(family1);
//            l++;
//        }

        modelMap.addAttribute("family",family);
        modelMap.addAttribute("familyPersonList1",familyPersonList1);
        modelMap.addAttribute("familyPersonList2",familyPersonList2);
    }

    /**
     * 分指地块查询
     * @param request
     * @return
     */
    @RequestMapping("getGroupByArea")
    @ResponseBody
    public List<String> getGroupByArea(ServletRequest request) {
        String bdCode = ParamUtils.getString(request, "bdCode", "");
        List<String> groupList = this.familyService.getGroupByBd(bdCode);
        return groupList;
    }

    /**
     * 查询所有分指
     * @param request
     * @return
     */
    @RequestMapping("getBdList")
    @ResponseBody
    public List<String> getBdList(ServletRequest request) {
        List<DataDict> bdList = dataDictService.getDataDictList("分指");
        List<String> bdCodeList = new ArrayList<>();
        for (int i = 0; i <bdList.size() ; i++) {
            String bdCode = bdList.get(i).getAttributeValue();
            bdCodeList.add(bdCode);
        }
        return bdCodeList;
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
    public String familySave(HttpServletRequest request){
        Integer familyId = this.familyService.familySave(request);
        //计算方法
        return "redirect:list?" + request.getAttribute("searchParams");
    }

    /**
     * 删除家庭（假删）
     * @param request
     * @return
     */
    @RequestMapping("deleteFamily")
    @ResponseBody
    public synchronized Map<String,String> deleteFamily(HttpServletRequest request){
        Integer familyId = ParamUtils.getInt(request,"familyId",0);
        Map<String,String> map = Maps.newHashMap();
        Family family = this.familyService.get(familyId);
        if (family == null){
            map.put("success","false");
            map.put("message","数据错误，删除失败！");
            return map;
        }else {
            Integer orderFlag = 1;
            List<HistoryInfo> historyInfoList = historyInfoService.listByFamilyId(family.getId());
            if(historyInfoList.size() > 0){
                orderFlag = historyInfoList.size() + 1;
            }

            HistoryInfo historyInfo = new HistoryInfo();
            historyInfo.setType(DataInfo.DELETE.getName());   //删除数据
            List<FamilyPerson> familyPersonList = this.familyPersonService.getPersonListByFamilyId(family.getId());
            // 保存家庭信息之前，先保存修改记录（保存的数据是修改之前的数据）
            historyInfo.setFamilyId(family.getId());//家庭表Id
            historyInfo.setData(JSON.toJSONString(family));//家庭表信息
            historyInfo.setFamilyPersonData(JSON.toJSONString(familyPersonList));
            historyInfo.setOperateDate(new Date());
            historyInfo.setOperatePerson(GetCurrentUser.getLoginUser(request).getUsername());//操作人姓名
            historyInfo.setComputerId(GetCurrentUser.getIpAddr(request));//操作人IP地址
            historyInfo.setOrderFlag(orderFlag);
            this.historyInfoService.save(historyInfo);
        }

        family.setIsValid(IsValid.NO.getIndex());   //设置为无效
        this.familyService.save(family);
        map.put("success","true");
        map.put("message","删除成功！");
        return map;
    }

    @RequestMapping("dataSureList")
    public void dataSureList(HttpServletRequest request, ModelMap modelMap){
        Integer familyId = ParamUtils.getInt(request, "familyId", 0);
        Family family = this.familyService.get(familyId);
        Precondition.checkSqdsArguement(family != null,"未找到数据");
        List<FamilyPerson> familyPersonList1 =   null;
        List<FamilyPerson> familyPersonList2 =null;
        List<FamilyHouse> familyHouseList = null;
        List<FamilyHousePerson> familyHousePersonList = null;
        Map<Integer,List<FamilyHousePerson>> familyHousePersonMap = null;
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

    @RequestMapping("dataSureChList")
    public void dataSureChList(HttpServletRequest request, ModelMap modelMap){
        this.dataSureList(request,modelMap);
    }

    @RequestMapping("dataSurePgList")
    public void dataSurePgList(HttpServletRequest request, ModelMap modelMap){
        this.dataSureList(request,modelMap);
    }

    /**
     * 数据确认锁定
     */
    @RequestMapping("sureData")
    @ResponseBody
    public void sureData(HttpServletRequest request, ModelMap modelMap) {
        Integer familyId = ParamUtils.getInteger(request, "familyId", 0);
        String type = ParamUtils.getString(request, "type", "");
        Family family = this.familyService.get(familyId);
        Precondition.checkSqdsArguement(family != null, "数据错误，请重试！");
        String typeName = "";
        if (type.equals("cc")){
            family.setSureStatus(2);
            typeName = "拆迁";
        }else if (type.equals("ch")){
            family.setSureChStatus(2);
            typeName = "测绘";
        }else if (type.equals("pg")){
            family.setSurePgStatus(2);
            typeName = "评估";
        }
        this.familyService.save(family);

        //保存动作记录
        OperationInfo operationInfo = new OperationInfo();
        operationInfo.setFamilyId(familyId);
        operationInfo.setOperatePerson(GetCurrentUser.getLoginUser(request).getUsername());
        operationInfo.setOperateDate(new Date());
        operationInfo.setMemo(typeName+"数据确认锁定");
    }
    /**
     * 撤销数据确认锁定
     */
    @RequestMapping("cancleData")
    @ResponseBody
    public void cancleData(HttpServletRequest request, ModelMap modelMap) {
        Integer familyId = ParamUtils.getInteger(request, "familyId", 0);
        String type = ParamUtils.getString(request, "type", "");
        Family family = this.familyService.get(familyId);
        Precondition.checkSqdsArguement(family != null, "数据错误，请重试！");
        String typeName = "";
        if (type.equals("cc")){
            family.setSureStatus(1);
            typeName = "拆迁";
        }else if (type.equals("ch")){
            family.setSureChStatus(1);
            typeName = "测绘";
        }else if (type.equals("pg")){
            family.setSurePgStatus(1);
            typeName = "评估";
        }
        this.familyService.save(family);

        //保存动作记录
        OperationInfo operationInfo = new OperationInfo();
        operationInfo.setFamilyId(familyId);
        operationInfo.setOperatePerson(GetCurrentUser.getLoginUser(request).getUsername());
        operationInfo.setOperateDate(new Date());
        operationInfo.setMemo(typeName+"数据撤销锁定");
        operationInfoService.save(operationInfo);
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

    /**
     * 评估数据登记
     * @param request
     * @param modelMap
     */
    @RequestMapping("pgList")
    public void pgList(HttpServletRequest request,ModelMap modelMap){
        this.commonList(request,modelMap);
    }

    /**
     * 评估数据录入
     * @param request
     * @param modelMap
     */
    @RequestMapping("pgForm")
    public void pgForm(HttpServletRequest request,ModelMap modelMap){
        Integer familyId = ParamUtils.getInt(request,"familyId",0);
        Family family = this.familyService.get(familyId);
        modelMap.addAttribute("family",family);
    }

    /**
     * 评估数据保存
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping("pgSave")
    public synchronized String pgSave(HttpServletRequest request,ModelMap modelMap){
        Integer familyId = ParamUtils.getInt(request,"familyId",0);
        Family family = this.familyService.get(familyId);
        Servlets.bind(request,family);
        //生成预分方案（算账）
        CalUtils.calc(family,null);
        this.familyService.save(family);
        return "redirect:pgList?" + request.getAttribute("searchParams");
    }

    /**
     * 测绘数据登记
     * @param request
     * @param modelMap
     */
    @RequestMapping("chList")
    public void chList(HttpServletRequest request,ModelMap modelMap){
        this.commonList(request,modelMap);
    }

    /**
     * 测绘表单界面
     */
    @RequestMapping("chForm")
    public void chForm(HttpServletRequest request,ModelMap modelMap){this.pgForm(request,modelMap);}

    /**
     * 测绘数据保存
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping("chSave")
    public synchronized String chSave(HttpServletRequest request,ModelMap modelMap){
        Integer familyId = ParamUtils.getInt(request,"familyId",0);
        Family family = this.familyService.get(familyId);
        Servlets.bind(request,family);
        //生成预分方案（算账）
        CalUtils.calc(family,null);
        this.familyService.save(family);
        return "redirect:chList?" + request.getAttribute("searchParams");
    }

    /**
     * 打印参考单列表
     * @param request
     * @param modelMap
     */
    @RequestMapping("printAccountList")
    public void printAccountList(HttpServletRequest request,ModelMap modelMap){
        this.commonList(request,modelMap);
    }

    /**
     * 参考单打印
     * @param request
     * @param modelMap
     */
    @RequestMapping("printAccount")
    public void printAccount(HttpServletRequest request,ModelMap modelMap){
        Integer familyId = ParamUtils.getInt(request,"familyId",0);
        String type = ParamUtils.getString(request,"type","back");
        Family family = this.familyService.get(familyId);
        //计算方法
        modelMap.addAttribute("family",family);
        modelMap.addAttribute("type",type);
    }

    /**
     * 参考单pdf
     * 2018-05-24
     * @param request
     */
    @RequestMapping("printAccountPDF")
    public void printAccountPDF(HttpServletRequest request,HttpServletResponse response){
        Integer familyId = ParamUtils.getInt(request,"familyId",0);
        String type = ParamUtils.getString(request,"type","back");
        String view = ParamUtils.getString(request,"view","");
        Family family = this.familyService.get(familyId);
        if (family == null) {
            throw new SqdsException("数据错误！");
        }

        String typeAccount = null;
        String template = "";
        if (view.equals("rh")){//入户窗口进入查看
            if (type.equals("back")){
                template = "printBackAccount.html";   //就地安置参考单模板
                typeAccount = "back";
            }else if (type.equals("money")){
                template = "printMoneyAccount.html";     //货币补偿参考单模板
                typeAccount = "money";
            }else if (type.equals("out")){
                template = "printOutAccount.html";       //就地安置+异地奖励房源参考单模板
                typeAccount = "out";
            }
        }else {//终审窗口进入查看
            if (family.getBcType() == 1){
                template = "printBackAccount.html";   //就地安置参考单模板
            }else if (family.getBcType() == 2){
                template = "printMoneyAccount.html";     //货币补偿参考单模板
            }else if (family.getBcType() == 3){
                template = "printOutAccount.html";     //就地安置+异地奖励房源参考单模板
            }
        }


        Map map = Maps.newHashMap();
        String path = "";
        //如果审计初审未审核通过，加上查看中
        if (family.getFirstCheckStatus() != null && family.getFirstCheckStatus() == Type.YES.getIndex()){
            path = url;
        }

        List<DataDict> houseTypeList = dataDictService.getDataDictList("房屋产别");
        String fwcb = "";//房屋产别
        for (int i = 0; i <houseTypeList.size() ; i++) {
            if (houseTypeList.get(i).getAttributeValue().equals(family.getHouseType().toString())){
                fwcb = houseTypeList.get(i).getAttributeName();
            }
        }

        List<DataDict> houseStyleList = dataDictService.getDataDictList("房屋类型");
        String fwlx = "";//房屋类型
        for (int i = 0; i <houseStyleList.size() ; i++) {
            if (houseStyleList.get(i).getAttributeValue().equals(family.getHouseStyle().toString())){
                fwlx = houseStyleList.get(i).getAttributeName();
            }
        }

        CalUtils.calc(family,typeAccount);
        Map<String, String> bzMap = Maps.newHashMap();
        bzMap = dataDictService.getMapByParentAttributeNameForName("协议费用标准");

        BigDecimal qysd = new BigDecimal(250000);//签约速度奖（最大）
        BigDecimal gcphFee = new BigDecimal(bzMap.get("工程配合奖"));
        BigDecimal gcph = BigDecimalUtils.getBigAndBigMul(gcphFee,family.getBuildArea());//工程配合奖（最大）
//        BigDecimal xzqy = new BigDecimal(300000);//小组签约比例奖（最大）

        BigDecimal scjg = new BigDecimal(bzMap.get("标准房屋市场价格"));

        BigDecimal total1 = BigDecimalUtils.getSum(family.getBqMoney(),family.getKtFee(),family.getRsqFee(),family.getTvFee(),family.getKdFee(),family.getDhFee(),
                    family.getDnqFee(), family.getTctyFee(),family.getZhknMoney(), family.getSfpfFee(), family.getShknFee(), qysd, gcph);   //就地安置参考单合计

        String azfy = familyService.getJdaz(family);

        FreeMarkerMoneyUtils freeMarkerMoneyUtils = new FreeMarkerMoneyUtils();
        FreeMarkerBigDecimalUtils freeMarkerBigDecimalUtils = new FreeMarkerBigDecimalUtils();

        //货币补偿参考单 货币+异地补偿匡选单总计
        BigDecimal total2 = BigDecimalUtils.getSum(total1, family.getHouseMoney(), family.getHbbcMoney());

        String azfy1 = familyService.getYdaz(family);
        int personSize = familyPersonService.getPersonListByFamilyId(familyId).size();

        map.put("total1",total1);
        map.put("personSize",personSize);
        map.put("total2",total2);
        map.put("bigDecimalUtils",freeMarkerBigDecimalUtils);
        map.put("moneyUtils",freeMarkerMoneyUtils);
//        map.put("bcfs",bcfs);
//        map.put("wqMoney",wqMoney);
        map.put("azfy1",azfy1);
        map.put("azfy",azfy);
        map.put("scjg",scjg);
        map.put("qysd",qysd);
        map.put("gcph",gcph);
//        map.put("xzqy",xzqy);
        map.put("fwcb",fwcb);
        map.put("fwlx",fwlx);
        map.put("path",path);
        map.put("family",family);
        map.put("strings",new Strings());

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
                response.reset();
            } catch (Exception e) {

            }
        }
    }

    /**
     * 评估报告列表
     * @param request
     * @param modelMap
     */
    @RequestMapping("pgbgList")
    public void pgbgList(HttpServletRequest request, ModelMap modelMap){
        PageInfo<Family> pageInfo = new PageInfo<>();
        Servlets.initPageInfo(request,pageInfo);
        pageInfo = familyService.getFamilyList(pageInfo);
        modelMap.addAttribute("pageInfo",pageInfo);
    }

    /**
     * 评估报告查看
     * @param request
     * @param modelMap
     */
    @RequestMapping("pgbgForm")
    public void pgbgForm(HttpServletRequest request, ModelMap modelMap){
        int familyId = ParamUtils.getInt(request, "familyId", 0);
        Family family = familyService.get(familyId);
        modelMap.addAttribute("family",family);
    }

    /**
     * 上传
     *
     * @param request
     * @return
     */
    @RequestMapping("uploadify")
    @ResponseBody
    public Map uploadify(HttpServletRequest request) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd"); // 定义路径,该路径便于文件拷贝
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMddHHmmssSSS"); // 定义文件名

        //缩略图宽高
        int width = ParamUtils.getInt(request, "width", 0);
        int height = ParamUtils.getInt(request, "height", 0);

        String path = "/uploads/pgbg/" + sdf.format(new Date());// 路径
        String parameterName = sdf1.format(new Date());// 文件名称
        DecimalFormat decimalFormat = new DecimalFormat("0000");
        parameterName += decimalFormat.format((Math.random() * 10000));

        UploadInfo uploadInfo = UploadInfoUtil.uploadFile(request, path, "Filedata", parameterName, width, height);
        Map<String, String> jsonMap = new HashMap<String, String>();
        String filePath=uploadInfo.getSaveFilename();

        System.out.println("^^^^^^^^^^^^^^^^^^^"+filePath);
        jsonMap.put("filePath", filePath);
        return jsonMap;
    }

    /**
     * 保存上传的附件
     *
     * @param request
     */
    @RequestMapping("saveFileItem")
    @ResponseBody
    public Map saveFileItem(HttpServletRequest request) {
        Integer familyId = ParamUtils.getInt(request, "familyId", 0);//家庭id
        String filePath = ParamUtils.getString(request, "filePath", "");// 上传文件路径
        try {
            Family family = familyService.get(familyId);
            family.setPgFilePath(filePath);
            this.familyService.save(family);
        } catch (Exception e) {
        }
        String fileName = filePath.substring(0, filePath.lastIndexOf("/")) + "/" + "s_" + filePath.substring(filePath.lastIndexOf("/") + 1);
        Map<String, String> map = new HashMap<String, String>();
        map.put("imgSrc", fileName);
        return map;
    }

    /**
     * 撤销签约图片列表
     * @param request
     * @param modelMap
     */
    @RequestMapping("cancelPgbgList")
    public void cancelPgbgList(HttpServletRequest request, ModelMap modelMap){
        PageInfo<Family> pageInfo = new PageInfo<>();
        Servlets.initPageInfo(request,pageInfo);
        pageInfo = this.familyService.getPgbgList(pageInfo);
        modelMap.addAttribute("pageInfo",pageInfo);
    }

    /**
     * 撤销评估报告图片
     *
     * @param request
     * @return
     */
    @RequestMapping("cancelPgbg")
    @ResponseBody
    public Map cancelPgbg(HttpServletRequest request) {
        Integer familyId = ParamUtils.getInt(request, "familyId", 0);
        Family family = this.familyService.get(familyId);
        Map map = Maps.newHashMap();
        try {
            family.setPgFilePath(null);
            familyService.save(family);
            map.put("success", "true");
            map.put("message", "撤销成功！");
            //保存动作记录
            OperationInfo operationInfo = new OperationInfo();
            operationInfo.setFamilyId(familyId);
            operationInfo.setOperatePerson(GetCurrentUser.getLoginUser(request).getUsername());
            operationInfo.setOperateDate(new Date());
            operationInfo.setMemo("撤销评估报告文件");
            operationInfoService.save(operationInfo);
        } catch (Exception e) {
            map.put("success", "false");
            map.put("message", "操作失败！");
        }
        return map;
    }



    //以下四个方法为一次性方法！！！
    @RequestMapping("innerExcelIndex")
    public void innerExcelIndex(HttpServletRequest request,ModelMap modelMap){
    }

    /**
     * 家庭信息上传
     * @param request
     * @param map
     * @return
     * @throws IOException
     */
    @Transactional
    @RequestMapping("comparison")
    public String comparison(HttpServletRequest request , ModelMap map) throws Exception {
        //上传文件
        byte[] filePath = Servlets.uploadFile(request,"file");
        InputStream excelInputStream = new ByteArrayInputStream(filePath);
        List list = ReadExcel.read(excelInputStream,0,true);

        for (int i = 0; i < list.size() ; i++) {
            if (i > 0){
                List row = (List) list.get(i);
                if (!"".equals((String)row.get(0))) {
                    Family family = new Family();
                    String familyCode = (String) row.get(3);
                    String bdCode = (String)row.get(4);
                    String groupCode = (String) row.get(5);
                    String name = (String) row.get(7);
                    String idCard = (String) row.get(8);
                    String tel = (String) row.get(9);
                    String marryStatusName = (String) row.get(10);
                    String address = (String) row.get(11);
                    String houseTypeName = (String) row.get(13);
                    String houseCompany = (String) row.get(14);
                    String houseStyleName = (String) row.get(15);
                    BigDecimal houseNum = new BigDecimal(row.get(16).toString());
                    BigDecimal useArea = new BigDecimal(row.get(17).toString());
                    BigDecimal buildArea = new BigDecimal(row.get(18).toString());
                    String houseUseName = (String) row.get(19);
                    String businessCode = (String) row.get(20);
                    BigDecimal zjHouseNum = new BigDecimal(row.get(21).toString());
                    BigDecimal zjHouseArea = new BigDecimal(row.get(22).toString());
//                    String armyType1 = (String) row.get(24);
                    Integer hjNum = Integer.valueOf(row.get(25).toString());
                    Integer hjPersonNum = Integer.valueOf(row.get(26).toString());
                    Integer livePersonNum = Integer.valueOf(row.get(27).toString());
                    Integer dbNum = Integer.valueOf(row.get(28).toString());
                    Integer cjNum = Integer.valueOf(row.get(29).toString());
                    Integer dhNum = Integer.valueOf(row.get(33).toString());
                    Integer ktNum = Integer.valueOf(row.get(34).toString());
                    Integer yxNum = Integer.valueOf(row.get(35).toString());
                    Integer kdNum = Integer.valueOf(row.get(36).toString());
                    Integer rsqNum = Integer.valueOf(row.get(37).toString());
                    String summary = (String) row.get(38);

                    family.setFamilyCode(familyCode);
                    family.setBdCode(bdCode);
                    family.setGroupCode(groupCode);
                    family.setName(name);
                    family.setIdCard(idCard);
                    family.setTel(tel);
                    List<DataDict> marryList = this.dataDictService.getDataDictList("婚姻状况");
                    Integer marryStatus = 0;
                    for (DataDict dataDict:marryList) {
                        if (dataDict.getAttributeName().equals(marryStatusName)){
                            marryStatus = Integer.valueOf(dataDict.getAttributeValue());
                        }
                    }
                    family.setMarryStatus(marryStatus);
                    family.setAddress(address);
                    List<DataDict> houseTypeList = this.dataDictService.getDataDictList("房屋产别");
                    Integer houseType = 0;
                    for (DataDict dataDict:houseTypeList) {
                        if (dataDict.getAttributeName().equals(houseTypeName)){
                            houseType = Integer.valueOf(dataDict.getAttributeValue());
                        }
                    }
                    family.setHouseType(houseType);
                    family.setHouseCompany(houseCompany);
                    List<DataDict> houseStyleList = this.dataDictService.getDataDictList("房屋类型");
                    Integer houseStyle = 0;
                    for (DataDict dataDict:houseStyleList) {
                        if (dataDict.getAttributeName().equals(houseStyleName)){
                            houseStyle = Integer.valueOf(dataDict.getAttributeValue());
                        }
                    }
                    family.setHouseStyle(houseStyle);
                    family.setHouseNum(houseNum);
                    family.setUseArea(useArea);
                    family.setBuildArea(buildArea);
                    List<DataDict> houseUseList = this.dataDictService.getDataDictList("住宅房屋用途");
                    Integer houseUse = 0;
                    for (DataDict dataDict:houseUseList) {
                        if (dataDict.getAttributeName().equals(houseUseName)){
                            houseUse = Integer.valueOf(dataDict.getAttributeValue());
                        }
                    }
                    family.setHouseUse(houseUse);
                    family.setBusinessCode(businessCode);
                    family.setZjHouseNum(zjHouseNum);
                    family.setZjHouseArea(zjHouseArea);
                    family.setHjNum(hjNum);
                    family.setHjPersonNum(hjPersonNum);
                    family.setLivePersonNum(livePersonNum);
                    family.setDbNum(dbNum);
                    family.setCjNum(cjNum);
                    family.setDhNum(dhNum);
                    family.setKtNum(ktNum);
                    family.setYxNum(yxNum);
                    family.setKdNum(kdNum);
                    family.setRsqNum(rsqNum);
                    family.setSummary(summary);
                    Integer houseStatus = 2;
                    if (zjHouseNum.compareTo(new BigDecimal(0)) > 0){
                        houseStatus = 1;
                    }
                    family.setHouseStatus(houseStatus);
                    familyService.save(family);
                }
            }
        }
        return "redirect:/cq/family/rh/innerExcelIndex";
    }

    @RequestMapping("innerExcelIndex1")
    public void innerExcelIndex1(HttpServletRequest request,ModelMap modelMap){
    }

    /**
     * 家庭成员信息上传
     * @param request
     * @param map
     * @return
     * @throws IOException
     */
    @Transactional
    @RequestMapping("comparison1")
    public String comparison1(HttpServletRequest request , ModelMap map) throws Exception {
        //上传文件
        byte[] filePath = Servlets.uploadFile(request,"file");
        InputStream excelInputStream = new ByteArrayInputStream(filePath);
        List list = ReadExcel.read(excelInputStream,0,true);

        for (int i = 0; i < list.size() ; i++) {
            if (i > 0){
                List row = (List) list.get(i);
                if (!"".equals((String)row.get(0))) {
                    String familyCode = (String) row.get(3);
                    String personSubList = (String) row.get(23);

                    Family family = this.familyService.getFamilyByFamilyCode(familyCode);
                    if (personSubList != null || !personSubList.equals("")){
                        if (personSubList.contains("，")){
                            String[] personSplits = personSubList.split("，");
                            for (int j = 0; j <personSplits.length ; j++) {
                                String[] splits = personSplits[j].split(" ");
                                String[] strings = splits[0].split("：");
                                Integer personAge = null;
                                if (splits.length > 1 && (splits[1] != null && !splits[1].equals(" "))){
                                    personAge = Integer.valueOf(splits[1].trim());
                                }
                                String personrelation = strings[0];
                                String personName = "";
                                if (strings.length > 1){
                                    personName = strings[1];
                                }
                                FamilyPerson familyPerson = new FamilyPerson();
                                familyPerson.setFamily(family);
                                familyPerson.setAge(personAge);
                                familyPerson.setType(1);
                                familyPerson.setRelation(personrelation);
                                familyPerson.setName(personName);
                                familyPersonService.save(familyPerson);
                            }
                        }else {
                            String[] splits = personSubList.split(" ");
                            String[] strings = splits[0].split("：");
                            Integer personAge = null;
                            if (splits.length > 1){
                                personAge = Integer.valueOf(splits[1]);
                            }
                            String personrelation = strings[0];
                            String personName = "";
                            if (strings.length > 1){
                                personName = strings[1];
                            }
                            FamilyPerson familyPerson = new FamilyPerson();
                            familyPerson.setFamily(family);
                            familyPerson.setAge(personAge);
                            familyPerson.setType(1);
                            familyPerson.setRelation(personrelation);
                            familyPerson.setName(personName);
                            familyPersonService.save(familyPerson);
                        }
                    }
                }
            }
        }
        return "redirect:/cq/family/rh/innerExcelIndex1";
    }

}
