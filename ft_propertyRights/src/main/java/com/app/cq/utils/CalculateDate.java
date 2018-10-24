package com.app.cq.utils;

import com.app.cq.exception.Precondition;
import com.sqds.utils.DateUtils;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 计算两个日期之间的月份、天数（包含当天、当月）
 * 日期格式均为yyyy-MM-dd
 * Created by zyk on 2017/5/25.
 */
public class CalculateDate {

    /**
     * 返回两个日期之间的月数（包含本月,不含结束月）
     * 日期格式均为yyyy-MM-dd
     * @param startDate
     * @param endDate
     * @return
     */
    public static Integer getDatesForMonth(Date startDate,Date endDate){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Integer betweenMonth = 0;
        double result = 0;
        if (startDate != null && endDate != null){
            Calendar c1 = Calendar.getInstance();
            Calendar c2 = Calendar.getInstance();
            try {
                c1.setTime(sdf.parse(DateUtils.date2string(startDate)));
                c2.setTime(sdf.parse(DateUtils.date2string(endDate)));
                result = c2.get(Calendar.MONTH) - c1.get(Calendar.MONTH) + 1 + (c2.get(Calendar.YEAR) - c1.get(Calendar.YEAR)) * 12;
                if (result < 0){    //如果开始日期 > 截止日期 ，则之间的月份初始为0
                    result = 0;
                }
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        betweenMonth = (int) result;    //因为此项目结果不会大于127，所以在此我直接进行了强制转型为int，order by zyk
        Integer.valueOf(betweenMonth);
        return betweenMonth;
    }

    /**
     * 得到两个日期之间的天数（包含截止日，不含开始日）
     * 日期格式均为yyyy-MM-dd
     * @param startDate
     * @param endDate
     * @return
     */
    public static BigDecimal getDatesForDay(Date startDate,Date endDate){
        BigDecimal betweenDay = new BigDecimal("0");
        Calendar c1 = Calendar.getInstance();
        Calendar c2 = Calendar.getInstance();
        c1.setTime(startDate);
        c2.setTime(endDate);
        long time = c2.getTimeInMillis() - c1.getTimeInMillis();
        time = Math.abs(time);    //取绝对值
        int day = (int) (time / (1000 * 60 * 60 * 24));
        betweenDay = new BigDecimal(day);
        return betweenDay;
    }

    /**
     * 计算两个日期之间的天数
     * notice：天数跟时间无关（如2018-01-01 23：59：59.000 跟2018-01-02：00：00.000返回1）
     * startDate 须在endDate 之前
     *
     * @param startDate
     * @param endDate
     * @return
     * @throws ParseException
     */
    public static Integer getBetweenDays(Date startDate, Date endDate) throws ParseException {
        Integer day = 0;
        //非空判断
        if (startDate != null && endDate != null && !startDate.equals("") && !endDate.equals("")) {
            Precondition.checkAjaxArguement(!startDate.after(endDate),"0000","startDate须在endDate之前");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Calendar startTime = Calendar.getInstance();
            Calendar endTime = Calendar.getInstance();
            startTime.setTime(sdf.parse(sdf.format(startDate)));
            endTime.setTime(sdf.parse(sdf.format(endDate)));
            long betweenTime = endTime.getTimeInMillis() - startTime.getTimeInMillis();
            day = (int) betweenTime / (24 * 60 * 60 * 1000);
        }
        return day;
    }
}
