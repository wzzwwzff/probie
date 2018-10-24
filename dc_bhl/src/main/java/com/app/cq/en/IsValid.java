package com.app.cq.en;

/**
 * Created by ZYK on 2018/1/30.
 */
public enum IsValid {

    YES("有效", 1), NO("无效", 2);

    // 成员变量
    private String name;
    private int index;

    // 构造方法
    private IsValid(String name, int index) {
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
