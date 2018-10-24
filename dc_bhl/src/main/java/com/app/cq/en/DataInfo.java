package com.app.cq.en;

/**
 * Created by ZYK on 2018/5/8.
 */
public enum DataInfo {

    ADD("1"), ALERT("2"), DELETE("3");

    // 成员变量
    private String name;

    // 构造方法
    private DataInfo(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
