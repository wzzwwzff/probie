package com.app.cq.en;

import java.util.HashMap;
import java.util.Map;

/**
 * 公示变量
 * Created by zsj on 2018/29/7.
 */
public enum ShowState {

   UNDISPLAY("不公示", 1),DISPLAY("公示",2);

    // 成员变量
    private String name;
    private int index;

    // 构造方法
    private ShowState(String name, int index) {
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
            for (ShowState item : ShowState.values()) {
                put(item.index, item.name);
            }
        }
    };

    public static String getNameByIndex(Integer index) {
        return map.get(index);
    }
}
