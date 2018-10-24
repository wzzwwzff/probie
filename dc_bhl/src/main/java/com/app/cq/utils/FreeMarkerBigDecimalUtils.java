package com.app.cq.utils;

import com.sqds.utils.StringUtils;
import freemarker.template.SimpleNumber;
import freemarker.template.TemplateMethodModelEx;
import freemarker.template.TemplateModelException;

import java.math.BigDecimal;
import java.util.List;

public class FreeMarkerBigDecimalUtils implements TemplateMethodModelEx {

    public Object exec(List list) throws TemplateModelException {
        Object object = list.get(0);
        if(object instanceof SimpleNumber){
            return StringUtils.getNotNullDecimal(new BigDecimal(object.toString()));
        }else{
            return "/";
        }
    }
}
