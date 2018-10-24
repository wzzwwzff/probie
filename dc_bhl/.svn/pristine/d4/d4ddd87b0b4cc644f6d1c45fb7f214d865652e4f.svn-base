package com.app.cq.utils;

import freemarker.template.SimpleNumber;
import freemarker.template.TemplateMethodModelEx;
import freemarker.template.TemplateModelException;

import java.math.BigDecimal;
import java.util.List;

/**
 * freemarkder 金额大写转换
 * Created by ccj on 2017/2/9.
 */
public class FreeMarkerMoneyUtils implements TemplateMethodModelEx {
    public Object exec(List list) throws TemplateModelException {
        Object object = list.get(0);
        if(object instanceof SimpleNumber){
            return NewMoneyUtils.number2CNMontrayUnit(new BigDecimal(object.toString()));
        }else{
            return "";
        }
    }
}
