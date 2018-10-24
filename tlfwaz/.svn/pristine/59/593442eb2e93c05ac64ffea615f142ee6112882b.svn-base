package com.app.cq.utils;

import java.math.BigDecimal;
import java.text.DecimalFormat;

/**
 * Created by ZYK on 2018/6/29.
 */
public class BigDecimals {

    /**
     * 处理空值(BigDecimal)
     * @param value
     * @return
     */
    public static BigDecimal getNotNull(BigDecimal value) {
        return value == null ? new BigDecimal("0") : value;
    }

    public static String getNotNullStr(BigDecimal value) {
        return value == null || value.compareTo(new BigDecimal("0")) == 0 ? "/" : value.toString();
    }

    /**
     * 计算求和
     *
     * @param values
     * @return
     */
    public static BigDecimal getSum(BigDecimal... values) {
        BigDecimal result = new BigDecimal("0");
        if (values != null && values.length > 0) {
            for (BigDecimal v : values) {
                result = result.add(getNotNull(v));
            }
        }
        return result;
    }


    /**
     * 计算差
     *
     * @param b1
     * @param b2
     * @return
     */
    public static BigDecimal getBigAndBigSub(BigDecimal b1,BigDecimal b2) {
        return getNotNull(b1).subtract(getNotNull(b2));
    }

    /**
     * 计算bigDecimal*integer数值
     * @param b
     * @param i
     * @return
     */
    public static BigDecimal getBigAndIntMul(BigDecimal b,Integer i){
        return getNotNull(b).multiply(new BigDecimal(Integers.getNotNull(i)));
    }

    /**
     * 计算bigDecimal*bigDecimal数值
     * @param b1
     * @param b2
     * @return
     */
    public static BigDecimal getBigAndBigMul(BigDecimal b1,BigDecimal b2){
        return getNotNull(b1).multiply(getNotNull(b2));
    }

    /**
     * 用于协议对钱展示的处理
     * @param value
     * @return
     */
    public static String getBigStr(BigDecimal value) {
        if (value == null || value.compareTo(new BigDecimal(0)) <= 0) {
            return "/";
        } else {
            DecimalFormat df2 = new DecimalFormat("#.##");
            String temp2 = df2.format(value);
            return temp2;
        }
    }
}
