package com.app.cq.utils;

import com.sqds.utils.StringUtils;
import freemarker.template.SimpleNumber;
import freemarker.template.TemplateMethodModelEx;
import freemarker.template.TemplateModelException;

import java.util.List;

/**
 * 处理字符串为空或者""
 * Created by ZYK on 2018/3/16.
 */
public class FreeMarkerStringUtils implements TemplateMethodModelEx {

    public Object exec(List list) throws TemplateModelException {
        Object object = list.get(0);
        String result = "/";
            if (object != null && !String.valueOf(object).trim().equals("")){
                result = String.valueOf(object);
            }
        return result;
    }
}
