package com.app.cq.utils;

import java.math.BigDecimal;
import java.text.DecimalFormat;

public class RoundUtils {
    /**
     * 四舍五入保留到整数位
     * @param ddd
     * @return
     */
    public static BigDecimal sswrzs(BigDecimal ddd){
        if(ddd==null){
            return new BigDecimal("0");
        }
        DecimalFormat df2 = new DecimalFormat("0");
        String temp2 = df2.format(ddd);
        return new BigDecimal(temp2);
    }

    public static BigDecimal sswr1(BigDecimal bbb){
        if (bbb == null){
            return new BigDecimal(0);
        }
        BigDecimal bigDecimal = bbb.setScale(0, BigDecimal.ROUND_HALF_UP);
        return bigDecimal;
    }
}
