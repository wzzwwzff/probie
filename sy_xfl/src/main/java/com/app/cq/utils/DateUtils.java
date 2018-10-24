package com.app.cq.utils;

import java.util.Calendar;
import java.util.Date;

/**
 * Created by zs on 2017/10/25.
 *
 * @author zhang sen
 */
public class DateUtils {

    /**
     * 计算两个日期之间相差天数
     * @param startDate
     * @param endDate
     * @return
     */
    public static long betweenDays(Date startDate, Date endDate) {
        return betweenTime(startDate,endDate)/(1000*60*60*24);
    }

    /**
     * 计算两个日期之间相差的时间
     * @param startDate
     * @param endDate
     * @return
     */
    public static long betweenTime(Date startDate, Date endDate) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(startDate);
        long startTime = cal.getTimeInMillis();
        cal.setTime(endDate);
        long endTime = cal.getTimeInMillis();

        return endTime - startTime;
    }
}
