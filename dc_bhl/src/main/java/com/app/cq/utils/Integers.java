package com.app.cq.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by wsb on 2017/10/25.
 */
public class Integers {

    /**
     * 空值处理
     *
     * @param integer
     * @return
     */
    public static Integer getNotNull(Integer integer) {
        return integer == null ? 0 : integer;
    }

    public static String getNotNullStr(Integer integer) {
        return (integer == null || integer <= 0) ? "/" : integer.toString();
    }

    /**
     * 判断一个字符串是否全是数字
     * @param str
     * @return
     */
    public static boolean validateNumber(String str) {
        Pattern pattern = Pattern.compile("-?[0-9]+(\\.[0-9]+)?");
        Matcher isNum = pattern.matcher(str);
        if (!isNum.matches()) {
            return false;
        }
        return true;
    }
}
