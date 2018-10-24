package com.app.cq.aop;

import com.app.common.service.DataDictService;
import com.app.cq.utils.AjaxException;
import com.app.cq.vo.Response;
import com.sqds.exception.SqdsException;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * 异常统一处理
 */
@Component
@Aspect
public class EntranceGuarderAop {

    @Resource
    private DataDictService dataDictService;

    /**
     * 获取进入页面前的路径（针对返回操作）
     *
     * @param jp
     */
//    @Before("execution(* com.app.cysh.web..*(..))")
//    public void validation(JoinPoint jp) {
//        Map<String, String> ipLimintMap = this.dataDictService.getMapByParentAttributeNameForName("系统访问IP开关");
//        String offOrOn = ipLimintMap.get("开关");
//        if (offOrOn==null||offOrOn.equals("off")) {//ip限制关闭
//            return;
//        }
//        HttpServletRequest request = Servlets.getRequest();
//        if (request == null) {
//            throw new NoPermissionException();
//        }
//
//        User user = UserSession.getUserFromSession(request);
//        if (user == null || user.getId() == null) {
//            return;
//        }
//        if (user.getEmail() != null && user.getEmail().equals("2")) {//访问不受限制
//            return;
//        }
//        String ip = GetCurrentUser.getIpAddr(request);
//        String url = request.getRequestURI();
//
//        Map<String, String> noRecordMap = this.dataDictService.getMapByParentAttributeNameForValue("访问地址不受限");
//        if (!Collections3.isEmpty(noRecordMap)) {//该地址不受限制
//            for (String uri : noRecordMap.keySet()) {
//                if (uri.indexOf(url) >= 0) {
//                    return;
//                }
//            }
//        }
//        Map<String, String> map = this.dataDictService.getMapByParentAttributeNameForName("系统访问IP地址");
//        if (map.get(ip) == null) {//不在可访问的权限范围内
//            throw new SqdsException("不在系统可以访问的范围，请与系统技术支持联系！");
//        }
//    }

    /**
     * 捕获异常并进行相应处理
     *
     * @param joinPoint
     * @return
     * @throws Throwable
     */
//    @Around("execution(* com.app.cq.web..*(..))")
    public Object around(ProceedingJoinPoint joinPoint) throws Throwable {
        String methodName = joinPoint.getSignature().getName();
        Object ret = null;
        try {
            ret = joinPoint.proceed(joinPoint.getArgs());
        } catch (AjaxException e) {
            Response response = new Response();
            response.setCode(e.getCode());
            response.setMessage(e.getMessage());
            response.setData(null);
            response.setError(e + "");
            return response;
        } catch (SqdsException e) {
            throw e;
        } catch (IllegalArgumentException e) {
            throw new SqdsException("操作失败");
        } catch (Exception e) {
            String save = "save", delete = "delete", update = "update";
            if (methodName.startsWith(save) || methodName.startsWith(delete) || methodName.startsWith(update)) {
                Response response = new Response();
                response.setCode("9999");
                response.setMessage("操作失败");
                response.setData(null);
                response.setError(e + "");
                return response;
            } else {
                throw new SqdsException("操作失败");
            }
        } finally {

        }
        return ret;
    }
}
