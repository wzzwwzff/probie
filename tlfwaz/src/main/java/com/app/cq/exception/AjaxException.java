package com.app.cq.exception;

/**
 * ajax异常处理
 */
public class AjaxException extends RuntimeException{
    private String code;
    private String message;

    public AjaxException(String code, String message){
        this.code = (code == null ? "0000" : code);
        this.message = message;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMessage()
    {
        return this.message;
    }

    public void setMessage(String message)
    {
        this.message = message;
    }
}
