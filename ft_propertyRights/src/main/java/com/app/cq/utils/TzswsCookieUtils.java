package com.app.cq.utils;

import com.app.permission.model.Role;
import com.app.permission.model.User;
import com.app.permission.service.RoleService;
import com.app.permission.service.UserService;
import com.sqds.utils.AESCipher;
import com.sqds.utils.CookieUtils;
import com.sqds.web.Servlets;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Vector;

/**
 * Created by tsg on 2017/7/28.
 */
public class TzswsCookieUtils {
    private static String cookieId = "memberCookieId";
    private static String aesKey = "Jmdf2017Jmdf2017";

    public static String getCookieValue(HttpServletRequest request){
        String cookieValue =  CookieUtils.getCookieValue(request,cookieId);
        try {
            cookieValue = AESCipher.aesDecryptString(cookieValue,aesKey);
        } catch (Exception e) {
            cookieValue = null;
        }
        return cookieValue;
    }

    public static void setCookieValue(HttpServletResponse response, String cookieValue){
        try {
            cookieValue = AESCipher.aesEncryptString(cookieValue, aesKey);
        } catch (Exception e) {
            cookieValue =  null;
        }
        CookieUtils.setCookie(response, cookieId, cookieValue);
    }

    public static void deleteCookieValue(HttpServletResponse response){
        CookieUtils.deleteCookie(response,cookieId);
    }


    /**
     * 从当前session中取得用户信息，如果用户未登录，则返回null
     *
     * @return
     */
    public static User getUserFromSession(HttpServletRequest request) {
        //用户登录时将userId保存到cookie中
        String userIdStr = getCookieValue(request);
        if (userIdStr == null) {
            userIdStr = "0";
        }
        int userId = 0;
        try {
            userId = Integer.parseInt(userIdStr);
        } catch (Exception e) {
        }
        //从spring中取得bean
        UserService userService = (UserService) Servlets.getBean(request,"userService");
        RoleService roleService = (RoleService) Servlets.getBean(request,"roleService");

        User user = userService.getUserAndDepartmentInfo(userId);
        if (user == null) {
            return null;
        }

        List<Role> roles = roleService.listByUser(user.getId());
        user.setRoles(roles);
        if (user.getRoles() == null) {
            user.setRoles(new Vector<Role>());
        }
        return user;
    }
}
