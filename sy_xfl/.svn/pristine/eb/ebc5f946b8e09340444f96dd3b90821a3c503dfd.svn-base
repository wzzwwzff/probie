package com.app.cq.utils;

import freemarker.template.SimpleNumber;
import freemarker.template.TemplateMethodModelEx;
import freemarker.template.TemplateModelException;

import java.math.BigDecimal;
import java.util.List;

/**
 * freemarkder 人数大写转换
 */
public class FreeMarkerPersonUtils implements TemplateMethodModelEx {
    public Object exec(List list) throws TemplateModelException {
        Object object = list.get(0);
        if(object instanceof SimpleNumber){
            return NewPersonUtils.numberPersonUnit(new BigDecimal(object.toString()));
        }else{
            return "";
        }
    }
}

