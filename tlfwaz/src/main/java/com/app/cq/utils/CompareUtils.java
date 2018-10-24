package com.app.cq.utils;

/**
 * 用于处理两项对比是否显示
 * Created by jmdf on 2018/9/6.
 */
public class CompareUtils {
    //是否显示
    public static boolean show(Object now,Object pre){
        boolean flag = true;
        if (now == null && pre == null) {
            flag = false;
        } else if (now != null && pre != null) {
            if (now.equals(pre)) {
                flag = false;
            }
        }
        return flag;
    }
}
