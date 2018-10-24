package com.app.cq.exception;

import com.sqds.exception.SqdsException;

/**
 * 封装异常处理
 */
public class Precondition {

    public static final void checkSqdsArguement(boolean expression,String msg){
        if (!expression) {
            throw new SqdsException(msg);
        }
    }


    public static final void checkAjaxArguement(boolean expression,String code,String message){
        if (!expression) {
            throw new AjaxException(code,message);
        }
    }
}
