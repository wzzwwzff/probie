package com.app.cq.utils;

import java.math.BigDecimal;

/**
 * Created by wsb on 2017/10/25.
 */
public class BigDecimalUtils {

    /**
     * 处理空值(BigDecimal)
     * @param value
     * @return
     */
    public static BigDecimal getNotNull(BigDecimal value) {
        return value == null ? new BigDecimal("0") : value;
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
     * 计算bigDecimal*integer数值
     * @param b
     * @param i
     * @return
     */
    public static BigDecimal getBigDecimalAndIntegerMultiply(BigDecimal b,Integer i){
        return getNotNull(b).multiply(new BigDecimal(Integers.getNotNull(i)));
    }

    /**
     * 计算bigDecimal*bigDecimal数值
     * @param b1
     * @param b2
     * @return
     */
    public static BigDecimal getBigDecimalAndBigDecimalMultiply(BigDecimal b1,BigDecimal b2){
        return getNotNull(b1).multiply(getNotNull(b2));
    }

    /**
     * 提供（相对）精确的除法运算。当发生除不尽的情况时，由scale参数指 定精度，以后的数字四舍五入。
     *
     * @param v1
     *            被除数
     * @param v2
     *            除数
     * @param scale
     *            表示表示需要精确到小数点以后几位。
     * @return 两个参数的商
     */
    public static double div(BigDecimal v1, double v2, int scale) {
        if (scale < 0) {
            throw new IllegalArgumentException("The scale must be a positive integer or zero");
        }
        BigDecimal b1 = v1;
        BigDecimal b2 = new BigDecimal(Double.toString(v2));
        return b2.divide(b1, scale, BigDecimal.ROUND_HALF_UP).doubleValue();
    }

    /**
     * 提供精确的小数位四舍五入处理。
     *
     * @param v
     *            需要四舍五入的数字
     * @param scale
     *            小数点后保留几位
     * @return 四舍五入后的结果
     */
    public static BigDecimal round(BigDecimal v, int scale) {
        if (scale < 0) {
            throw new IllegalArgumentException(
                    "The scale must be a positive integer or zero");
        }
        BigDecimal one = new BigDecimal("1");
        return v.divide(one, scale, BigDecimal.ROUND_HALF_UP);
    }

    /**
     * 减法
     */
    public static BigDecimal jian(BigDecimal bigDecimal1,BigDecimal bigDecimal2){
        if (bigDecimal1 == null){
            bigDecimal1 = new BigDecimal(0);
        }
        if (bigDecimal2 == null){
            bigDecimal2 = new BigDecimal(0);
        }
        BigDecimal subtract = bigDecimal1.subtract(bigDecimal2);
        return subtract;
    }

}
