package com.app.cq.utils;

import com.app.permission.exception.NoLoginException;
import com.app.permission.model.Role;
import com.app.permission.model.User;
import com.app.permission.utils.UserSession;
import com.google.common.collect.Lists;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.List;

public class GetCurrentUser {
    private static Logger logger = LoggerFactory.getLogger(GetCurrentUser.class);
    //全局变量
    private static User user = null;

    /**
     * 获取当前登录用户
     *
     * @param request
     * @return
     */
    public static User getLoginUser(HttpServletRequest request) {
        user = UserSession.getUserFromSession(request);
        if (user == null) {//未登录用户
            throw new NoLoginException();
        }
        return user;
    }

    /**
     * 得到当前用户ip
     * @param request
     * @return
     */
    public static String getIpAddr(HttpServletRequest request) {
        String ipAddress = request.getHeader("x-forwarded-for");
        if(ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("Proxy-Client-IP");
        }
        if(ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("WL-Proxy-Client-IP");
        }
        if(ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getRemoteAddr();
            if(ipAddress.equals("127.0.0.1") || ipAddress.equals("0:0:0:0:0:0:0:1")){
                //根据网卡取本机配置的IP
                InetAddress inet=null;
                try {
                    inet = InetAddress.getLocalHost();
                } catch (UnknownHostException e) {
                }
                ipAddress= inet.getHostAddress();
            }
        }
        //对于通过多个代理的情况，第一个IP为客户端真实IP,多个IP按照','分割
        if(ipAddress!=null && ipAddress.length()>15){ //"***.***.***.***".length() = 15
            if(ipAddress.indexOf(",")>0){
                ipAddress = ipAddress.substring(0,ipAddress.indexOf(","));
            }
        }
        return ipAddress;
    }

    /**
     * 获取用户角色所描述的内容
     * @param request
     * @return
     */
    public static String getUserRole(HttpServletRequest request){
        List<Role> roleList = UserSession.getUserFromSession(request).getRoles();
        List<String> roleDesList = Lists.newArrayList();
        for (Role role : roleList) {
            roleDesList.add(role.getRoleDescription());
        }
        return roleDesList.toString().trim();
    }
}
