package com.app.cq.en;

import java.util.HashMap;
import java.util.Map;

/**
 * 审核变量
 * Created by wcf-pc on 2016/11/7.
 */
public enum CheckState {

    FIRSTBACK("初审退回", 0),NOCHECK("未审核",1),FIRSTCHECK("初审通过",2);

    // 成员变量
    private String name;
    private int index;

    // 构造方法
    private CheckState(String name, int index) {
        this.name = name;
        this.index = index;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }


    private static Map<Integer, String> map = new HashMap<Integer, String>() {
        {
            for (CheckState item : CheckState.values()) {
                put(item.index, item.name);
            }
        }
    };

    public static String getNameByIndex(Integer index) {
        return map.get(index);
    }
}
