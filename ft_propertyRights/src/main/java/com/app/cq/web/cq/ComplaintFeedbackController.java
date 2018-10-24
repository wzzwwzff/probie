package com.app.cq.web.cq;


import com.app.cq.exception.Precondition;
import com.app.cq.model.ComplaintFeedback;
import com.app.cq.service.ComplaintFeedbackService;
import com.app.permission.utils.UserSession;
import com.sqds.page.PageInfo;
import com.sqds.web.ParamUtils;
import com.sqds.web.Servlets;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by jmdf on 2018/8/9.
 */
@Controller
@RequestMapping("/cq/complaint/*")
public class ComplaintFeedbackController {
    @Autowired
    private ComplaintFeedbackService complaintFeedbackService;

    /**
     * 申诉信息列表
     * @param request
     * @param modelMap
     */
    @RequestMapping("list")
    public void list(HttpServletRequest request, ModelMap modelMap){
        PageInfo<ComplaintFeedback> pageInfo = new PageInfo<>();
        Servlets.initPageInfo(request, pageInfo);
        pageInfo.addParameter("search_eq_integer_dataType",1);

        pageInfo = this.complaintFeedbackService.list(pageInfo);
        modelMap.addAttribute("pageInfo", pageInfo);
    }

    /**
     * 申诉信息表单
     */
    @RequestMapping("form")
    public void form(HttpServletRequest request, ModelMap modelMap) {
        Integer complainId = ParamUtils.getInt(request, "complainId", 0);
        ComplaintFeedback  complaintFeedback = this.complaintFeedbackService.get(complainId);

        if (complaintFeedback == null) {
            complaintFeedback = new ComplaintFeedback();
        }
        modelMap.addAttribute("complaintFeedback", complaintFeedback);
    }

    /**
     * 申诉信息保存
     * @param request
     * @return
     */
    @RequestMapping("save")
    public String save(HttpServletRequest request){
        Integer complainId = ParamUtils.getInt(request, "complainId", 0);
        ComplaintFeedback  complaintFeedback = this.complaintFeedbackService.get(complainId);

        if (complaintFeedback == null) {
            complaintFeedback = new ComplaintFeedback();
        }
        Servlets.bind(request,complaintFeedback);
        this.complaintFeedbackService.save(complaintFeedback);

        return "redirect:list?" +"&"+request.getAttribute("searchParams");
    }

    /**
     * 投诉信息列表
     * @param request
     * @param modelMap
     */
    @RequestMapping("appealList")
    public void appealList(HttpServletRequest request, ModelMap modelMap){
        PageInfo<ComplaintFeedback> pageInfo = new PageInfo<>();
        Servlets.initPageInfo(request, pageInfo);
        pageInfo.addParameter("search_eq_integer_dataType",2);

        pageInfo = this.complaintFeedbackService.list(pageInfo);
        modelMap.addAttribute("pageInfo", pageInfo);
    }

    /**
     * 投诉信息表单
     */
    @RequestMapping("appealForm")
    public void appealForm(HttpServletRequest request, ModelMap modelMap) {
        this.form(request, modelMap);
    }

    /**
     * 投诉信息保存
     * @param request
     * @return
     */
    @RequestMapping("appealSave")
    public String appealSave(HttpServletRequest request){
        Integer complainId = ParamUtils.getInt(request, "complainId", 0);
        ComplaintFeedback  complaintFeedback = this.complaintFeedbackService.get(complainId);

        if (complaintFeedback == null) {
            complaintFeedback = new ComplaintFeedback();
        }
        Servlets.bind(request,complaintFeedback);
        this.complaintFeedbackService.save(complaintFeedback);

        return "redirect:appealList?" +"&"+request.getAttribute("searchParams");
    }

    /**
     * 反馈管理列表
     * @param request
     * @param modelMap
     */
    @RequestMapping("feedBackList")
    public void feedBackList(HttpServletRequest request, ModelMap modelMap){
        PageInfo<ComplaintFeedback> pageInfo = new PageInfo<>();
        Servlets.initPageInfo(request, pageInfo);

        pageInfo = this.complaintFeedbackService.list(pageInfo);
        modelMap.addAttribute("pageInfo", pageInfo);
    }

    /**
     * 反馈管理表单
     */
    @RequestMapping("feedBackForm")
    public void feedBackForm(HttpServletRequest request, ModelMap modelMap) {
        Integer complainId = ParamUtils.getInt(request, "complainId", 0);
        ComplaintFeedback  complaintFeedback = this.complaintFeedbackService.get(complainId);
        Precondition.checkSqdsArguement(complaintFeedback != null, "数据错误，请重试！");
        complaintFeedback.setRunDate(new Date());

        modelMap.addAttribute("complaintFeedback", complaintFeedback);
        modelMap.addAttribute("person", UserSession.getUserFromSession(request).getRealName());
    }

    /**
     * 反馈管理保存
     * @param request
     * @return
     */
    @RequestMapping("feedBackSave")
    public String feedBackSave(HttpServletRequest request){
        Integer complainId = ParamUtils.getInt(request, "complainId", 0);
        ComplaintFeedback  complaintFeedback = this.complaintFeedbackService.get(complainId);
        Precondition.checkSqdsArguement(complaintFeedback != null, "数据错误，请重试！");

        Servlets.bind(request,complaintFeedback);
        this.complaintFeedbackService.save(complaintFeedback);

        return "redirect:feedBackList?" +"&"+request.getAttribute("searchParams");
    }

    /**
     * 反馈信息查看
     */
    @RequestMapping("view")
    public void view(HttpServletRequest request, ModelMap modelMap) {
       this.appealForm(request, modelMap);
    }

    /**
     * 删除
     * @param request
     * @return
     */
    @RequestMapping("delete")
    @ResponseBody
    public Map<String,String> delete(ServletRequest request){
        Integer complainId = ParamUtils.getInt(request,"complainId",0);
        ComplaintFeedback  complaintFeedback = this.complaintFeedbackService.get(complainId);
        Precondition.checkSqdsArguement(complaintFeedback != null, "数据错误，请重试！");
        this.complaintFeedbackService.delete(complaintFeedback.getId());
        Map<String,String> map = new HashMap<String, String>();
        map.put("success","true");
        return map;
    }
}
