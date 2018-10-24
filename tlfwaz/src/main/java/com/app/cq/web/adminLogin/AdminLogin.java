package com.app.cq.web.adminLogin;

import com.app.common.service.DataDictService;
import com.app.permission.model.User;
import com.app.permission.service.UserService;
import com.sqds.utils.CookieUtils;
import com.sqds.web.ParamUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by zyk on 2017/3/30.
 */
@Controller
@RequestMapping("/adminLogin/*")
public class AdminLogin {

    @Resource
    private DataDictService dataDictService;
    @Resource
    private UserService userService;

    /**
     * 后台登录页面
     *
     * @param request
     * @param modelMap
     */
    @RequestMapping("login")
    public void login(HttpServletRequest request, ModelMap modelMap) {

        Map<String, String> map = this.dataDictService.getMapByParentAttributeNameForName("系统配置");
        modelMap.addAttribute("map", map);
    }

    /**
     * 登录验证
     *
     * @param request
     * @param httpServletResponse
     */
    @RequestMapping("adminCheckLogin")
    @ResponseBody
    public Map adminCheckLogin(HttpServletRequest request,HttpServletResponse httpServletResponse) {

        //得到用户名和密码
        String username = ParamUtils.getString(request, "username", "");
        String password = ParamUtils.getString(request, "password", "");
        Integer status = 0;
        //验证是否正确后转发至主界面
        Map map = new HashMap();
        User user = this.userService.getUserByUsername(username);
        if (user.getPassword().equals(password)) {
            CookieUtils.setCookie(httpServletResponse, "userId", user.getId().intValue() + "");
            status = 9;
        }
        map.put("status",status+"");
        return map;
    }
}
