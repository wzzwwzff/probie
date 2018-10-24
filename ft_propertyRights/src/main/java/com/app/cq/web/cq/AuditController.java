package com.app.cq.web.cq;

import com.app.cq.exception.Precondition;
import com.app.cq.exception.Response;
import com.app.cq.model.Education;
import com.app.cq.model.Family;
import com.app.cq.model.FileInfo;
import com.app.cq.service.EducationService;
import com.app.cq.service.FamilyService;
import com.app.cq.service.FileUploadService;
import com.sqds.page.PageInfo;
import com.sqds.utils.Collections3;
import com.sqds.utils.StringUtils;
import com.sqds.web.ParamUtils;
import com.sqds.web.Servlets;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 审核、复核控制层
 * Created by jmdf on 2018/8/13.
 */
@Controller
@RequestMapping("/cq/audit/*")
public class AuditController {
    @Autowired
    private FamilyService familyService;
    @Autowired
    private EducationService educationService;
    @Autowired
    private FileUploadService fileUploadService;

    /**
     * 审核列表
     * @param request
     * @param modelMap
     */
    @RequestMapping("auditList")
    public void auditList(HttpServletRequest request, ModelMap modelMap){
        PageInfo<Family> pageInfo = new PageInfo<>();
        Servlets.initPageInfo(request,pageInfo);
        pageInfo = familyService.listForHand(pageInfo);
        modelMap.put("pageInfo",pageInfo);
    }

    /**
     * 资格核验列表
     * @param request
     * @param modelMap
     */
    @RequestMapping("list")
    public void list(HttpServletRequest request, ModelMap modelMap){
        this.auditList(request,modelMap);
    }

    /**
     * 批量导入审核状态
     */
    @RequestMapping("batchStatus")
    public void batchStatus(){

    }

    /**
     * 批量导入审核状态
     *
     * @return
     */
    @RequestMapping("batchStatusSave")
    @ResponseBody
    public Response batchStatusSave(HttpServletRequest request) throws InvocationTargetException, IllegalAccessException, NoSuchMethodException {
        String content = ParamUtils.getString(request, "content", "");
        Map<String,Family> familyMap = familyService.getFamilyMap();
        int i = 0;
        if (StringUtils.isNotEmpty(content)) {
            String[] rowStrs = content.split("\n");
            for (String row : rowStrs) {
                String[] colStrs = row.split("\t");
                String familyCode = colStrs[0].trim().toUpperCase();
                Integer houseStatus = Integer.valueOf(colStrs[1].trim());
                Integer socialStatus = Integer.valueOf(colStrs[2].trim());
                Integer marriageStatus = Integer.valueOf(colStrs[3].trim());
                Integer ageStatus = Integer.valueOf(colStrs[4].trim());

                Family family = familyMap.get(familyCode);
                if (family != null) {
                    family.setHouseStatus(houseStatus);
                    family.setSocialStatus(socialStatus);
                    family.setMarriageStatus(marriageStatus);
                    family.setAgeStatus(ageStatus);
                    familyService.save(family);
                    i++;
                }
            }
        }
        Response response = new Response();
        response.setCode("1111");
        response.setMessage("本次共更新了"+ i + "条数据！");

        return response;
    }

    /**
     * 申请家庭信息复核
     * @param request
     * @param modelMap
     */
    @RequestMapping("reviewList")
    public void reviewList(HttpServletRequest request,ModelMap modelMap){
       this.auditList(request, modelMap);
    }

    /**
     * 学历复核查询
     * @param request
     * @param modelMap
     */
    @RequestMapping("educationQuery")
    public void educationQuery(HttpServletRequest request,ModelMap modelMap){
        Integer familyId = ParamUtils.getInt(request, "familyId", 0);
        Family family = this.familyService.get(familyId);
        Precondition.checkSqdsArguement(family != null,"未找到家庭数据");
        List<FileInfo> fileInfoList = fileUploadService.getFileInfoByFamilyId(familyId);
        //查询的学历图片路径封装在map中
        Map<String,String> map = new HashMap<String, String>();
        if (Collections3.isNotEmpty(fileInfoList)){
            for(FileInfo fileInfo : fileInfoList){
                String filePath = fileInfo.getFilePath();
                map.put(String.valueOf(fileInfo.getId()),filePath);
            }
        }
        modelMap.addAttribute("map",map);
        modelMap.addAttribute("family", family);
    }

    /**
     * 学历复核状态修改
     */
    @RequestMapping("updateEducationStatus")
    @ResponseBody
    public String updateEducationStatus(HttpServletRequest request, ModelMap modelMap) {
        Integer familyId = ParamUtils.getInteger(request, "familyId", 0);
        Integer type = ParamUtils.getInteger(request, "type", 0);
        Family family = this.familyService.get(familyId);
        family.setEducationStatus(2);
        Precondition.checkSqdsArguement(family != null, "数据错误，请重试！");
        this.familyService.save(family);

        //保存动作记录
        return "redirect:/reviewList";
    }

    /**
     * 撤销其他复核状态已审核
     */
    @RequestMapping("cancelStatus")
    @ResponseBody
    public com.app.cq.vo.Response cancelStatus(HttpServletRequest request, ModelMap modelMap) {
        Integer familyId = ParamUtils.getInteger(request, "familyId", 0);
        Family family = this.familyService.get(familyId);
        Precondition.checkSqdsArguement(family != null, "数据错误，请重试！");
        family.setOtherStatus(3);
        this.familyService.save(family);

        return new com.app.cq.vo.Response();
    }

    /**
     * 更改其他复核状态已审核
     */
    @RequestMapping("handleStatus")
    @ResponseBody
    public com.app.cq.vo.Response handleStatus(HttpServletRequest request, ModelMap modelMap) {
        Integer familyId = ParamUtils.getInteger(request, "familyId", 0);
        Family family = this.familyService.get(familyId);
        Precondition.checkSqdsArguement(family != null, "数据错误，请重试！");
        family.setOtherStatus(2);
        this.familyService.save(family);

        return new com.app.cq.vo.Response();
    }

    /**
     * 撤销住房审核状态
     */
    @RequestMapping("houseCancel")
    @ResponseBody
    public com.app.cq.vo.Response houseCancel(HttpServletRequest request, ModelMap modelMap) {
        Integer familyId = ParamUtils.getInteger(request, "familyId", 0);
        Family family = this.familyService.get(familyId);
        Precondition.checkSqdsArguement(family != null, "数据错误，请重试！");
        family.setHouseStatus(3);
        this.familyService.save(family);

        return new com.app.cq.vo.Response();
    }

    /**
     * 更改住房审核状态已审核
     */
    @RequestMapping("houseHandle")
    @ResponseBody
    public com.app.cq.vo.Response houseHandle(HttpServletRequest request, ModelMap modelMap) {
        Integer familyId = ParamUtils.getInteger(request, "familyId", 0);
        Family family = this.familyService.get(familyId);
        Precondition.checkSqdsArguement(family != null, "数据错误，请重试！");
        family.setHouseStatus(2);
        this.familyService.save(family);

        return new com.app.cq.vo.Response();
    }
    /**
     * 撤销社保审核状态
     */
    @RequestMapping("socialCancel")
    @ResponseBody
    public com.app.cq.vo.Response socialCancel(HttpServletRequest request, ModelMap modelMap) {
        Integer familyId = ParamUtils.getInteger(request, "familyId", 0);
        Family family = this.familyService.get(familyId);
        Precondition.checkSqdsArguement(family != null, "数据错误，请重试！");
        family.setSocialStatus(3);
        this.familyService.save(family);

        return new com.app.cq.vo.Response();
    }

    /**
     * 更改社保审核状态已审核
     */
    @RequestMapping("socialHandle")
    @ResponseBody
    public com.app.cq.vo.Response socialHandle(HttpServletRequest request, ModelMap modelMap) {
        Integer familyId = ParamUtils.getInteger(request, "familyId", 0);
        Family family = this.familyService.get(familyId);
        Precondition.checkSqdsArguement(family != null, "数据错误，请重试！");
        family.setSocialStatus(2);
        this.familyService.save(family);

        return new com.app.cq.vo.Response();
    }
    /**
     * 撤销婚姻审核状态
     */
    @RequestMapping("marryCancel")
    @ResponseBody
    public com.app.cq.vo.Response marryCancel(HttpServletRequest request, ModelMap modelMap) {
        Integer familyId = ParamUtils.getInteger(request, "familyId", 0);
        Family family = this.familyService.get(familyId);
        Precondition.checkSqdsArguement(family != null, "数据错误，请重试！");
        family.setMarriageStatus(3);
        this.familyService.save(family);

        return new com.app.cq.vo.Response();
    }

    /**
     * 更改婚姻审核状态已审核
     */
    @RequestMapping("marryHandle")
    @ResponseBody
    public com.app.cq.vo.Response marryHandle(HttpServletRequest request, ModelMap modelMap) {
        Integer familyId = ParamUtils.getInteger(request, "familyId", 0);
        Family family = this.familyService.get(familyId);
        Precondition.checkSqdsArguement(family != null, "数据错误，请重试！");
        family.setMarriageStatus(2);
        this.familyService.save(family);

        return new com.app.cq.vo.Response();
    }
    /**
     * 撤销年龄审核状态
     */
    @RequestMapping("ageCancel")
    @ResponseBody
    public com.app.cq.vo.Response ageCancel(HttpServletRequest request, ModelMap modelMap) {
        Integer familyId = ParamUtils.getInteger(request, "familyId", 0);
        Family family = this.familyService.get(familyId);
        Precondition.checkSqdsArguement(family != null, "数据错误，请重试！");
        family.setAgeStatus(3);
        this.familyService.save(family);

        return new com.app.cq.vo.Response();
    }

    /**
     * 更改年龄审核状态已审核
     */
    @RequestMapping("ageHandle")
    @ResponseBody
    public com.app.cq.vo.Response ageHandle(HttpServletRequest request, ModelMap modelMap) {
        Integer familyId = ParamUtils.getInteger(request, "familyId", 0);
        Family family = this.familyService.get(familyId);
        Precondition.checkSqdsArguement(family != null, "数据错误，请重试！");
        family.setAgeStatus(2);
        this.familyService.save(family);

        return new com.app.cq.vo.Response();
    }
    /**
     * 撤销定期资格审核状态
     */
    @RequestMapping("seniorityCancel")
    @ResponseBody
    public com.app.cq.vo.Response seniorityCancel(HttpServletRequest request, ModelMap modelMap) {
        Integer familyId = ParamUtils.getInteger(request, "familyId", 0);
        Family family = this.familyService.get(familyId);
        Precondition.checkSqdsArguement(family != null, "数据错误，请重试！");
        family.setSeniorityStatus(3);
        this.familyService.save(family);

        return new com.app.cq.vo.Response();
    }

    /**
     * 更改定期资格审核已审核
     */
    @RequestMapping("seniorityHandle")
    @ResponseBody
    public com.app.cq.vo.Response seniorityHandle(HttpServletRequest request, ModelMap modelMap) {
        Integer familyId = ParamUtils.getInteger(request, "familyId", 0);
        Family family = this.familyService.get(familyId);
        Precondition.checkSqdsArguement(family != null, "数据错误，请重试！");
        family.setSeniorityStatus(2);
        this.familyService.save(family);

        return new com.app.cq.vo.Response();
    }


    /**
     * 批量导入其他复核状态
     */
    @RequestMapping("otherStatus")
    public void otherStatus(){

    }

    /**
     * 批量导入其他复核状态
     *
     * @return
     */
    @RequestMapping("otherStatusSave")
    @ResponseBody
    public Response otherStatusSave(HttpServletRequest request) throws InvocationTargetException, IllegalAccessException, NoSuchMethodException {
        String content = ParamUtils.getString(request, "content", "");
        Map<String,Family> familyMap = familyService.getFamilyMap();
        int i = 0;
        if (StringUtils.isNotEmpty(content)) {
            String[] rowStrs = content.split("\n");
            for (String row : rowStrs) {
                String[] colStrs = row.split("\t");
                String familyCode = colStrs[0].trim().toUpperCase();
                Integer otherStatus = Integer.valueOf(colStrs[1].trim());

                Family family = familyMap.get(familyCode);
                if (family != null) {
                    family.setOtherStatus(otherStatus);
                    familyService.save(family);
                    i++;
                }
            }
        }
        Response response = new Response();
        response.setCode("1111");
        response.setMessage("本次共更新了"+ i + "条数据！");

        return response;
    }

    /**
     * 批量导入资格审核状态
     */
    @RequestMapping("seniorityStatus")
    public void seniorityStatus(){

    }

    /**
     * 批量导入资格审核状态
     *
     * @return
     */
    @RequestMapping("seniorityStatusSave")
    @ResponseBody
    public Response seniorityStatusSave(HttpServletRequest request) throws InvocationTargetException, IllegalAccessException, NoSuchMethodException {
        String content = ParamUtils.getString(request, "content", "");
        Map<String,Family> familyMap = familyService.getFamilyMap();
        int i = 0;
        if (StringUtils.isNotEmpty(content)) {
            String[] rowStrs = content.split("\n");
            for (String row : rowStrs) {
                String[] colStrs = row.split("\t");
                String familyCode = colStrs[0].trim().toUpperCase();
                Integer seniorityStatus = Integer.valueOf(colStrs[1].trim());

                Family family = familyMap.get(familyCode);
                if (family != null) {
                    family.setSeniorityStatus(seniorityStatus);
                    familyService.save(family);
                    i++;
                }
            }
        }
        Response response = new Response();
        response.setCode("1111");
        response.setMessage("本次共更新了"+ i + "条数据！");

        return response;
    }


    /**
     * 导出学历审核不通过家庭及原因
     */
    @RequestMapping("excelEducationTrouble")
    public void excelEducationTrouble(HttpServletRequest request, ModelMap modelMap) {
        PageInfo<Family> pageInfo = new PageInfo<Family>();
        pageInfo.setPageSize(Integer.MAX_VALUE);
        Servlets.initPageInfo(request, pageInfo);
        pageInfo = this.familyService.selectNoEducation(pageInfo);
        modelMap.addAttribute("pageInfo", pageInfo);
    }
    /**
     * 导出学历审核不通过家庭及原因
     */
    @RequestMapping("excelAuditTrouble")
    public void excelAuditTrouble(HttpServletRequest request, ModelMap modelMap) {
        PageInfo<Family> pageInfo = new PageInfo<Family>();
        Servlets.initPageInfo(request, pageInfo);
        pageInfo = this.familyService.selectNoAudit(pageInfo);
        pageInfo.setPageSize(Integer.MAX_VALUE);
        modelMap.addAttribute("pageInfo", pageInfo);
    }

    /**
     * 已签约家庭定期资格核验列表
     */
    @RequestMapping("signList")
    public void signList(HttpServletRequest request, ModelMap modelMap){
        PageInfo<Family> pageInfo = new PageInfo<>();
        Servlets.initPageInfo(request,pageInfo);
        pageInfo = familyService.signList(pageInfo);
        modelMap.put("pageInfo",pageInfo);
    }

    /**
     * 导出定期资格核验列表
     */
    @RequestMapping("excelNameList")
    public void excelNameList(HttpServletRequest request, ModelMap modelMap) {
        PageInfo<Family> pageInfo = new PageInfo<>();
        Servlets.initPageInfo(request, pageInfo);
        pageInfo = this.familyService.signList(pageInfo);
        pageInfo.setPageSize(Integer.MAX_VALUE);
        modelMap.addAttribute("pageInfo", pageInfo);
    }

    /**
     * 学历复核不通过及原因
     */
    @RequestMapping("backData")
    @ResponseBody
    public Response backData(HttpServletRequest request, ModelMap modelMap) {
        Response response = new Response();
        familyService.saveProblem(request);
        return response;
    }

    /**
     * 学历信息列表
     * @param request
     * @param modelMap
     */
    @RequestMapping("educationList")
    public void educationList(HttpServletRequest request,ModelMap modelMap){
        PageInfo<Education> pageInfo = new PageInfo<>();
        Servlets.initPageInfo(request, pageInfo);
        pageInfo = this.educationService.listEducation(pageInfo);
        modelMap.addAttribute("pageInfo", pageInfo);
    }

    /**
     * 学历信息查看页面
     * @param request
     * @param modelMap
     */
    @RequestMapping("educationView")
    public void educationView(HttpServletRequest request, ModelMap modelMap) {
        Integer educationId = ParamUtils.getInt(request, "educationId", 0);
        Education education = this.educationService.get(educationId);
        Precondition.checkSqdsArguement(education != null,"未找到数据");
        modelMap.addAttribute("education", education);
    }
}
