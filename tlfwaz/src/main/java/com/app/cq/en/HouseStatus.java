package com.app.cq.en;

/**
 * 房屋状态
 * Created by wcf-pc on 2016/11/5.
 */
public enum HouseStatus {
    ALLOW("可选", 1), SIGNED("已选", 2), PRETEND("伪选", 3) ;
    // 成员变量
    private String name;
    private int index;

    // 构造方法
    private HouseStatus(String name, int index) {
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
}
