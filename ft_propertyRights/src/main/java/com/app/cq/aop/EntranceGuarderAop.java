package com.app.cq.aop;

import com.app.cq.exception.AjaxException;
import com.app.cq.exception.Response;
import com.sqds.exception.SqdsException;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

/**
 * 异常统一处理
 */
@Component
@Aspect
public class EntranceGuarderAop {

//    /**
//     * 获取进入页面前的路径（针对返回操作）
//     *
//     * @param jp
//     * @throws ServletException
//     * @throws IOException
//     */
//    @Before("execution(* com.app.xfxj.web..*(..))")
//    public void validation(JoinPoint jp) throws ServletException, IOException {
//        HttpServletRequest request = Servlets.getRequest();
//        if (request != null) {
//            request.setAttribute("BACK_URL", request.getHeader("Referer"));
//        }
//    }

    /**
     * 捕获异常并进行相应处理
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
