package com.app.cq.web.cq;

import com.app.cq.model.NotFamily;
import com.app.cq.service.NotFamilyService;
import com.app.cq.utils.GetCurrentUser;
import com.app.permission.model.User;
import com.app.permission.utils.UserSession;
import com.sqds.exception.SqdsException;
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
import com.app.cq.vo.Response;

@Controller
@RequestMapping("/cq/notFamily/*")
public class NotFamilyController {

    @Autowired
    private NotFamilyService notFamilyService;

    /**
     * 列表显示
     * @param request
     * @param modelMap
     */
    @RequestMapping("list")
    public void list(HttpServletRequest request, ModelMap modelMap){
        PageInfo<NotFamily> pageInfo = new PageInfo<>();
        Servlets.initPageInfo(request,pageInfo);

        User user = GetCurrentUser.getLoginUser(request);
        pageInfo.addParameter("search_like_string_f.groupCode",user.getDepartment().getDepartmentCode());
        pageInfo = notFamilyService.familyList(pageInfo);

        modelMap.put("pageInfo",pageInfo);
    }

    /**
     * 非宅数据表单页面
     * @param request
     * @param modelMap
     */
    @RequestMapping("form")
    public void form(HttpServletRequest request,ModelMap modelMap){
        Integer notFamilyId = ParamUtils.getInt(request,"notFamilyId",0);

        NotFamily notFamily = notFamilyService.get(notFamilyId);
        User user = UserSession.getUserFromSession(request);

        if (notFamily == null) {
            notFamily = new NotFamily();
        }

        modelMap.put("notFamily",notFamily);
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
        Integer notFamilyId = ParamUtils.getInt(request,"notFamilyId",0);
        NotFamily notFamily = notFamilyService.get(notFamilyId);
        if (notFamily == null) {
            notFamily = new NotFamily();
        }
        Servlets.bind(request,notFamily);
        User user = UserSession.getUserFromSession(request);
        String ip = GetCurrentUser.getIpAddr(request);
        notFamily.setOperatePerson(user.getRealName());
        notFamilyService.saveNotFamily(request, notFamily,user.getUsername(),ip);

        return "redirect:list?" +"&"+request.getAttribute("searchParams");
    }

    /**
     * 非宅信息查看
     * @param request
     * @return
     */
    @RequestMapping("view")
    public void view(HttpServletRequest request,ModelMap modelMap){
        Integer notFamilyId = ParamUtils.getInt(request,"notFamilyId",0);
        NotFamily notFamily = this.notFamilyService.get(notFamilyId);
        if (notFamily == null){
            throw new SqdsException("无此数据");
        }

        modelMap.put("notFamily",notFamily);
    }
    /**
     * 非宅信息删除
     * @param request
     * @return
     */
    @RequestMapping("delNotFamily")
    @ResponseBody
    public Response delNotFamily(HttpServletRequest request,ModelMap modelMap){
        Integer notFamilyId = ParamUtils.getInt(request,"notFamilyId",0);
        NotFamily notFamily = this.notFamilyService.get(notFamilyId);
        if (notFamily == null){
            throw new SqdsException("无此数据");
        }
        notFamily.setDelState(2);
        this.notFamilyService.save(notFamily);

        return new Response();
    }


    /**
     * 删除列表显示
     * @param request
     * @param modelMap
     */
    @RequestMapping("delList")
    public void delList(HttpServletRequest request, ModelMap modelMap){
        PageInfo<NotFamily> pageInfo = new PageInfo<>();
        Servlets.initPageInfo(request,pageInfo);

        User user = GetCurrentUser.getLoginUser(request);
        pageInfo.addParameter("search_like_string_f.groupCode",user.getDepartment().getDepartmentCode());
        pageInfo = notFamilyService.delFamilyList(pageInfo);

        modelMap.put("pageInfo",pageInfo);
    }

    /**
     * 非宅数据表单页面
     * @param request
     * @param modelMap
     */
    @RequestMapping("delForm")
    public void delForm(HttpServletRequest request,ModelMap modelMap){
        this.form(request,modelMap);
    }


    /**
     * 基础数据保存
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping("delSave")
    public String delSave(HttpServletRequest request,ModelMap modelMap){
        Integer notFamilyId = ParamUtils.getInt(request,"notFamilyId",0);
        NotFamily notFamily = notFamilyService.get(notFamilyId);
        if (notFamily == null) {
            notFamily = new NotFamily();
        }
        Servlets.bind(request,notFamily);
        User user = UserSession.getUserFromSession(request);
        String ip = GetCurrentUser.getIpAddr(request);
        notFamily.setOperatePerson(user.getRealName());
        notFamilyService.saveNotFamily(request, notFamily,user.getUsername(),ip);

        return "redirect:delList?" +"&"+request.getAttribute("searchParams");
    }

    /**
     * 非宅信息撤销删除
     * @param request
     * @return
     */
    @RequestMapping("backDelNotFamily")
    @ResponseBody
    public Response backDelNotFamily(HttpServletRequest request,ModelMap modelMap){
        Integer notFamilyId = ParamUtils.getInt(request,"notFamilyId",0);
        NotFamily notFamily = this.notFamilyService.get(notFamilyId);
        if (notFamily == null){
            throw new SqdsException("无此数据");
        }
        notFamily.setDelState(1);
        this.notFamilyService.save(notFamily);

        return new Response();
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
        Integer notFamilyId = ParamUtils.getInt(request,"notFamilyId",0);

        NotFamily notFamily = notFamilyService.checkRepeat(familyCode, notFamilyId);
        if (notFamily != null) {
            return false;
        }else {
            return true;
        }
    }
}
