package com.app.cq.web.cq;

import com.app.cq.model.Family;
import com.app.cq.service.ActionInfoService;
import com.app.cq.service.FamilyService;
import com.app.cq.utils.GetCurrentUser;
import com.app.cq.utils.Precondition;
import com.app.cq.vo.Response;
import com.app.permission.model.User;
import com.google.common.collect.Maps;
import com.sqds.exception.SqdsException;
import com.sqds.page.PageInfo;
import com.sqds.utils.pdf.PdfDocumentGenerator;
import com.sqds.web.ParamUtils;
import com.sqds.web.Servlets;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

/**
 * Created by lsh on 2018/2/4.
 */
@Controller
@RequestMapping("/cq/finance/*")
public class FinanceController {
    @Autowired
    private FamilyService familyService;
    @Resource
    private ActionInfoService actionInfoService;

    /**
     * 财务结算管理列表
     * @param request
     * @param modelMap
     */
    @RequestMapping("list")
    public void list(HttpServletRequest request, ModelMap modelMap){
        PageInfo<Family> pageInfo = new PageInfo<>();
        Servlets.initPageInfo(request,pageInfo);
        User user = GetCurrentUser.getLoginUser(request);

        pageInfo.addParameter("search_like_string_f.groupCode", user.getDepartment().getDepartmentCode());
        pageInfo.addParameter("search_eq_integer_f.jfState", 2);

        pageInfo = familyService.familyList(pageInfo);
        modelMap.put("pageInfo",pageInfo);
    }

    @RequestMapping("setJsState")
    @ResponseBody
    public Response setJsState(HttpServletRequest request, ModelMap modelMap){
        Integer familyId = ParamUtils.getInt(request,"familyId",0);
        Family family = familyService.get(familyId);

        Precondition.checkAjaxArguement(family!= null,"1004","");
        if (family.getJsState() == 1){
            family.setJsState(2);
            family.setJsDate(new Date());
            family.setJsPerson(GetCurrentUser.getLoginUser(request).getUsername());
            String operateType = "标记为已结算";
            actionInfoService.saveActionInfo(family,operateType);
        }
        familyService.save(family);
        return new Response();
    }

    @RequestMapping("cancelJsState")
    @ResponseBody
    public Response cancelJsState(HttpServletRequest request, ModelMap modelMap){
        Integer familyId = ParamUtils.getInt(request,"familyId",0);
        Family family = familyService.get(familyId);

        Precondition.checkAjaxArguement(family!= null,"1004","");
        if (family.getJsState() == 2){
            family.setJsState(1);
            family.setJsDate(null);
            family.setJsPerson(null);
            String operateType = "撤销已结算";
            actionInfoService.saveActionInfo(family,operateType);
        }
        familyService.save(family);
        return new Response();
    }

    /**
     * 打印会签单
     * @param request
     * @param modelMap
     */
    @RequestMapping("financePrint")
    public void financePrint(HttpServletRequest request, ModelMap modelMap){
        Integer familyId = ParamUtils.getInt(request,"familyId",0);
        Family family = familyService.get(familyId);
        Precondition.checkSqdsArguement(family!=null,"数据出错，请重试");
        modelMap.addAttribute("family",family);
    }

    /**
     * 打印会签单
     * @param request
     * @param response
     */
    @RequestMapping("print")
    public void print(HttpServletRequest request, HttpServletResponse response){

        Integer familyId = ParamUtils.getInt(request, "familyId", 0);
        Family family = familyService.get(familyId);
        String template = null;
        if (family == null) {
            throw new SqdsException("家庭信息不存在！");
        } else {

            Date date=new Date();
            Map map = Maps.newHashMap();
            map.put("family",family);
            template = "financePrint.html";
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
}
